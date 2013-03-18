// z.blobSort.js - a depth-sensitive blob sorting algorithm
// by Zachary Seldess, KAUST, 2012/01/04

/*
Description:
	z.blobSort.js is similar to cv.jit.blobs.sort, but intended for use with 3D blob tracking (i.e. for the Kinect)
	
	As input, it expects a list of blob location data in multiples of 5 elements, as follows:
		pixel_x1 pixel_y1 x1 y1 z1 pixel_x2 pixel_y2 x2 y2 z2... etc.

	Blobs are automatically reordered nearest to farthest from camera (cartesian distance), and corresponding 
	labels, starting at 1, are inserted before each block of blob data (i.e. 1 Px1 Py1 x1 y1 z1 2 Px2 Py2...)
	
	Optionally, if tracking is enabled (tracking == 1):
	 
	For every blob identified in the current frame, the object tries to find a blob from the previous frame that 
	falls within the threshold distance. If a matching old blob is found within that threshold, the new blob is
	considered to be the same and it is given the old blob's label. If no corresponding blobs are found in the 
	previous frame, the new blob is given a new label.
	NOTE: This search is done from low to high, so the lowest match will always win.
	
	You can customize the blob/label memory via the buffer parameter, which defines the number of frames a blob's 
	coordinate/label will be remembered after that blob disappears from the frame.
	Examples: 
	- buffer == 0 --> when blob disappears, its location/label remembered for 0 frames (i.e. forgotten immediately). 
	- buffer == 10 --> when blob disappears, its location/lable remembered for 10 frames (i.e. label will not be assigned 
	to new blobs in other areas of the frame for 10 frames). 
	- buffer == -1 --> sets the memory to be infinite (i.e. when a blob disappears, its location/label remain indefinitely)
*/

inlets = 1;
outlets = 1;

setinletassist(0,"list of blob location data in multiples of 5 elements (Px Py x y z...)");
setoutletassist(0, "labeled and sorted list of blobs, in multiples of 6 elements (index Px Py x y z...)");

// tracking 1 --> attempt to keep labels attached to same blob 
var tracking = 300;

// when tracking == 1, threshold (default 0.1) sets the maximum allowed displacement
var threshold = 0.1;

// when tracking == 1, buffer (default 0) sets the number of frames a blobs location and label will be retained,
// set buffer to -1 for infinite retention of blob location/labels
// set buffer to 30-300 to allow blobs to disappear briefly and be correctly identified when reappearing
var buffer = 0;

// array to hold blob labels and x/y/z coords
var labelArray = new Array();

// array to hold number of frames each blob/label has been missing from scene
var labelMem = new Array();

// grab attributes
for (var i = 0; i < jsarguments.length; i++) {
	if (jsarguments[i] == "@tracking" && jsarguments.length >= i+1) {
		setTracking(jsarguments[i+1]);
	}
	else if (jsarguments[i] == "@threshold" && jsarguments.length >= i+1) {
		setThreshold(jsarguments[i+1]);
	}
	else if (jsarguments[i] == "@buffer" && jsarguments.length >= i+1) {
		setBuffer(jsarguments[i+1]);
	}
}

// set tracking
function setTracking(arg) {
	if (isNumber(arg)) {
		if (arg > 0) tracking = 1;
		else tracking = 0;
	}
	else tracking = 0;
}

// set threshold
function setThreshold(arg) {
	if (isNumber(arg) && arg > 0.01) {
		threshold = arg;
	}
	else threshold = 0.01;
}

// set frame buffer for labels/blobs
function setBuffer(arg) {
	if (isNumber(arg) && arg >= -1) {
		buffer = parseInt(arg);
	}
	else buffer = -1;
}

// clear labelArray, start sorting anew
function clear() {
	if (labelArray.length) {
		labelArray.splice(0, labelArray.length);
		labelMem.splice(0, labelMem.length);		
	}
}

// method for incrementing labelMem array, etc. during frames when no blobs present
function noBlobs() {
	if (buffer == 0) {
		clear();
	}
	else if (buffer == -1){
		// do nothing, infinite memory
	}
	else {
		for (var i = 0; i < labelArray.length; i++) {
			// if blob has been missing for >= equal to defined num of frames, null it out
			if (labelMem[i] >= buffer) labelArray[i] = null;
			// else, keep it and increment num of frames missing
			else labelMem[i]++;
		}
	}
}

// do it
function anything() {
    var mess = arrayfromargs(messagename, arguments);
	
	// check for correct message format
	if (mess.length % 5 == 0) {
		for (var i = 0; i < mess.length; i++) {
			if (!isNumber(mess[i])) {
				post("\nmessage must contain only numbers.");
				return;
			}
		}
		
		// store 5 element groups in 2D array
		var tArray = new Array(mess.length/5);		
		var k = 0;
		for (var i = 0; i < tArray.length; i++) {
			tArray[i] = new Array(5);
			for (var j = 0; j < 5; j++) {
				tArray[i][j] = mess[k+j];
			}
			k+=5;
		}
		
		// sort by cartesian depth of each blob
		tArray.sort(sortByDepth);
		
		var cArray = new Array();
		// populate sorted 2D tArray into 1D cArray, insert label before each blob
		for (var i = 0; i < tArray.length; i++) {
			cArray.push(i+1);
			for (var j = 0; j < tArray[i].length; j++) {
				cArray.push(tArray[i][j]);
			}
		}
		
		// try to keep labels attached
		if (tracking == 1) {
			// if empty, populate labelArray with cArray x/y/z data
			if (!labelArray.length) {
				for (var i = 0; i < cArray.length; i+=6) {
					labelArray.push(new Array(3));
					for (var k = 0; k < 3; k++) {
						labelArray[labelArray.length-1][k] = cArray[i+k+3];	
					}
					// set each label to indicate that is has been missing for 0 frames
					labelMem.push(0);
					//post("\nlabelArray" + (labelArray.length-1) + ": " + labelArray[labelArray.length-1]);
				}
			}
			// otherwise, go ahead and track blobs							
			else {
				// look for blob match between cArray and labelArray within threshold distance
				// first match found will cause index+1 of matching labelArray to be assigned to corresponding cArray label
				// if no match found, index+1 of unused old label in labelArray assigned to cArray label,
				// or if no unused old labels, new label created in labelArray and index+1 assigned to cArray label
				
				// foundList stores 0/1 at indices that match labelArray, indicating whether that label has been matched
				var foundList = new Array(labelArray.length);
				// initialize all elements to 0
				for (var i = 0; i < foundList.length; i++) {
					foundList[i] = 0;
				}
				
				for (var i = 0; i < cArray.length; i+=6) {
					var matched = false;
					for (var j = 0; j < labelArray.length; j++) {
						if (labelArray[j] != null) {
							var dist = Math.sqrt( ( (cArray[i+3]-labelArray[j][0])*(cArray[i+3]-labelArray[j][0]) ) + 
							( (cArray[i+4]-labelArray[j][1])*(cArray[i+4]-labelArray[j][1]) ) + 
							( (cArray[i+5]-labelArray[j][2])*(cArray[i+5]-labelArray[j][2]) ) );
				
							if (dist <= threshold) {
								//post("\n"+dist);	
								if (foundList[j] == 0) {
									cArray[i] = j+1;
									// store cArray x/y/z at corresponding index of labelArray
									for (var k = 0; k < 3; k++) {
										labelArray[j][k] = cArray[i+k+3]; 
									}
									foundList[j] = 1;
									labelMem[j] = 0;
									matched = true;
									break;	
								}
							}
						}
					}
					if (!matched) {
						// check for null elements of labelArray
						var nullIndex = -1;
						for (var j = 0; j < labelArray.length; j++) {
							if (labelArray[j] == null) {
								nullIndex = j;
								break;
							}
						}
						// use lowest null index of labelArray, if available
						if (nullIndex != -1) {
							labelArray[nullIndex] = new Array(3);
							for (var j = 0; j < 3; j++) {
								labelArray[nullIndex][j] = cArray[i+j+3]; 
							}
							foundList[nullIndex] = 1;
							labelMem[nullIndex] = 0;
							cArray[i] = nullIndex+1;
						}
						// if no null indices available, push new elements onto labelArray and foundList arrays
						else {
							labelArray.push(new Array(3));
							for (var j = 0; j < 3; j++) {
								labelArray[labelArray.length-1][j] = cArray[i+j+3]; 
							}
							foundList.push(1);
							labelMem.push(0);
							cArray[i] = labelArray.length;
						}			
					}
				}
				
				// clear contents of labelArray indices that are unmatched, unless disabled by buffer of -1
				if (buffer == -1) {
				}
				else {
					for (var i = 0; i < labelArray.length; i++) {
						if (foundList[i] == 0) {
							// if blob has been missing for >= equal to defined num of frames, null it out
							if (labelMem[i] >= buffer) labelArray[i] = null;
							// else, keep it and increment num of frames missing
							else labelMem[i]++;
	 					}
					}
					//post("\n"+foundList);
					//post("\n"+labelArray);
				}
			}
		}

		// output new sorted array
		outlet(0, cArray);
	}
	else {
		post("\nmessage length incorrect. must be multiple of 5.")
	}
}

// check if variable is a number
isNumber.local = 1;
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

// custom sorting function for use in sort()
// sorts by cartesian depth, calculated as result of x/y/z values in [2], [3], [4] or each array
sortByDepth.local = 1;
function sortByDepth(a, b) {
    var x = Math.sqrt((a[2] * a[2]) + (a[3] * a[3]) + (a[4] * a[4]));
    var y = Math.sqrt((b[2] * b[2]) + (b[3] * b[3]) + (b[4] * b[4]));
    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
}

autowatch = 1;
