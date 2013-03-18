// z.jsonio.js, 12/24/2011
// by Zachary Seldess, KAUST

// Parts of code plundered directly from Peter Nyboer and others on Cycling'74 forum. Thanks!
// Uses json2.js and minify.json.js

inlets = 1;
outlets = 4;

setoutletassist(0, "requested data");
setoutletassist(1, "object, etc. containing the data");
setoutletassist(2, "bang when finished reading or writing file");
setoutletassist(3, "bang when finished with get, set, or dump");

var jsonioName = "";

// create Globals, if non-existent
if (typeof znsjsonparent == 'undefined') {
	znsjsonparent = new Global("jsonioParent");
	znsjsontracker = new Global("jsonioTracker");
}

// determine name of context (if not provided as 1st arg, generate randomly)
if (jsarguments.length > 1) {
	jsonioName = jsarguments[1];
}
else {
	jsonioName = "znsjsonname_" + Math.floor(Math.random()*100000);
}

// initialize
init.local = 1;
function init() {
	// if namespace not extant, create it and set tracker to 1
	if (typeOf(znsjsonparent[jsonioName]) == "undefined") {
		znsjsonparent[jsonioName] = new Object();
		znsjsontracker[jsonioName] = 1;		
	}
	// otherwise, increment tracker
	else {
		znsjsontracker[jsonioName]++;		
	}
	// read and parse JSON file, if passed as 2nd arg	
	if (jsarguments.length > 2) {		
		read(jsarguments[2]);
	}
}

// init() called with small delay
var tsk = new Task(init, this);
tsk.schedule(100);

// if js object deleted, call decTracker()
notifydeleted.local = 1;
notifydeleted.immediate = 1;
function notifydeleted() {
	// decrement tracker
	decTracker();
}

// decrement tracker for this namespace
decTracker.local = 1;
decTracker.immediate = 1;
function decTracker() {
	znsjsontracker[jsonioName]--;
	//post("\nnumber of znsjsonparent[" + jsonioName + "] instances: " + znsjsontracker[jsonioName]);
	// if tracker indicates that there are no instances of namespace delete namespace and tracker
	if (znsjsontracker[jsonioName] <= 0) {
		//post("\ndeleting znsjsonparent[" + jsonioName + "]");
		znsjsonparent[jsonioName] = undefined;		
		znsjsontracker[jsonioName] = undefined;
	}
}

// ignore undefined messages
function anything() {
}

// link this object with the data from existing namespace
refer.immediate = 1;
function refer(arg) {
	if (typeOf(znsjsonparent[arg]) != "undefined") {
		// decrement old tracker
		decTracker();	
		// use referred namespace, increment tracker
		jsonioName = arg;
		znsjsontracker[jsonioName]++;	
	}
	else {
		post("\n'" + arg + "' does not exist");
	}
}

// output jsonio plus name of context (for copying to another z.jsonio)
bang.immediate = 1;
function bang() {
	var copyMess = ["jsonio", jsonioName];
	outlet(0, copyMess);
}

// copy contents of another z.jsonio to this context
jsonio.immediate = 1;
function jsonio(arg) {
	if (typeOf(znsjsonparent[arg]) != "undefined") {
		znsjsonparent[jsonioName] = znsjsonparent[arg];
	}
}

// delete contents of JSON object
clear.immediate = 1;
function clear() {
	znsjsonparent[jsonioName] = new Object();
	//post("\ncleared");
}

// read and parse JSON file
function read(p) {
	if (typeOf(p) != "undefined") {
		var maxchars = 800;
		var path = p;
		var memstr;
		var isLoaded;
		var f = new File(path, "read");
		try {
			f.open();
			if (f.isopen) {
				memstr = "";
				while (f.position < f.eof) {
					memstr += f.readstring(maxchars);
				}
				f.close();
				isLoaded = true;
				//post("\nJSON read: " + path);
			}
			else {
				isLoaded = false;
				post("\nfile not found: " + path);			
				return;
			}
		}
		catch(e) {
			post("\n" + e.name + " " + e.message);
		}
		if (isLoaded) {
			try {
				znsjsonparent[jsonioName] = JSON.parse(JSON.minify(memstr));
				outlet(2, "bang");
				//post("\nJSON parsed");			
			}
			catch(e) {
				post("\n" + jsonioName + ": error parsing JSON file: " + e.name + " " + e.message);
			}
		}
	}
	else {
		post("\nread: arg required (file name w or w/o full path)");
	}	
}

// get immediate child objects
getChildren.immediate = 1;
function getChildren() {
	var mess = arrayfromargs(arguments);
	var key = znsjsonparent[jsonioName];

	if (mess.length) {
		// convert '[' or ']' or ']['  or '].' into '.'
		var argMod = mess[0].replace(/(\]\[)|(\]\.)|(\[)|(\])/g, ".");
		// remove any trailing '.'s
		while (argMod.lastIndexOf(".") == argMod.length-1) {
			argMod = argMod.substring(0, argMod.lastIndexOf("."));		
		}
		// split string into array at each '.', generate key reference via subscript notation	
		var argArray = argMod.split(".");
		for (var i = 0; i < argArray.length; i++) {
			if(typeOf(key[argArray[i]]) != "undefined") key = key[argArray[i]];
			else return;
		}
	}
	else {
		mess[0] = jsonioName;	
	}

	if (typeOf(key) != "undefined") {
		var childNodes = new Array();
		var hasChild = false;
		if (typeOf(key) == "array") {
			//var arrayName = mess[0].substring(mess[0].lastIndexOf(".")+1, mess[0].length);
			for (var i in key) {		
				if (typeOf(key[i]) == "object") {
					var el = "[" + i + "]";
					childNodes.push(el);
					hasChild = true;
				}
			}			
		}
		else {
			for (var i in key) {		
				if (typeOf(key[i]) == "object") {
					childNodes.push(i);
					hasChild = true;
				}
			}
		}
		if (hasChild) {
			outlet(1, mess[0]);
			outlet(0, childNodes);
			outlet(3, "bang");
		}
	}
	else {
		//post("\nparent object '" + mess[0] + "' not defined");
	}	
}

// get object properties
get.immediate = 1;
function get(arg) {
	var isSuper
	var propName;
	var key = znsjsonparent[jsonioName];

	// convert '[' or ']' or ']['  or '].' into '.'
	var argMod = arg.replace(/(\]\[)|(\]\.)|(\[)|(\])/g, ".");
	// remove any trailing '.'s	
	while (argMod.lastIndexOf(".") == argMod.length-1) {
		argMod = argMod.substring(0, argMod.lastIndexOf("."));		
	}

	if (arg == "super") {
		isSuper = true;
	}
	else {
		isSuper = false;
		// split string into array at each '.', generate key reference via subscript notation			
		var argArray = argMod.split(".");
		for (var i = 0; i < argArray.length; i++) {
			if(typeOf(key[argArray[i]]) != "undefined") key = key[argArray[i]];
			else return;
		}
	}
	
	if (typeOf(key) != "undefined") {
		try {
			if (typeOf(key) == "object") {
				for (var i in key) {
					if (isSuper) {
						propName = i;				
					}
					else {
						propName = arg + "." + i;
					}
					// otherwise output propName and properties
					if (typeOf(key[i]) == "array") {
						// elements of arrays are interpreted as list of values
						var vals = new Array();
						for (var j = 0; j < key[i].length; j++) {
							// if contains an object, output "object" at element's location
							if (typeOf(key[i][j]) == "object") {
								vals.push("object");
							}
							// if contains an array, output "array" at element's location
							else if (typeOf(key[i][j]) == "array") {
								vals.push("array");
							}														
							else if (typeOf(key[i][j]) == "null") {
								vals.push("null");
							}
							else if (typeOf(key[i][j]) == "undefined") {
								vals.push("undefined");
							}							
							else {
								vals.push(key[i][j]);
							}
						}
						outlet(1, propName);
						outlet(0, vals);
					}
					else if (typeOf(key[i]) == "null") {
						outlet(1, propName);
						outlet(0, "null");
					}
					else if (typeOf(key[i]) == "object") {
						// do nothing
					}							
					else {
						outlet(1, propName);
						outlet(0, key[i]);	
					}
				}
			}
			else if (typeOf(key) != "undefined") {
				if (typeOf(key) == "array") {
					// elements of arrays are interpreted as list of values
					var vals = new Array();
					for (var i = 0; i < key.length; i++) {
						// if contains an object, output "object" at element's location
						if (typeOf(key[i]) == "object") {
							vals.push("object");
						}
						// if contains an array, output "array" at element's location
						else if (typeOf(key[i]) == "array") {
							vals.push("array");
						}						
						else if (typeOf(key[i]) == "null") {
							vals.push("null");
						}
						else if (typeOf(key[i]) == "undefined") {
							vals.push("undefined");
						}
						else {
							vals.push(key[i]);
						}
					}
					outlet(1, arg);
					outlet(0, vals);
				}				
				else if (typeOf(key) == "null") {
					outlet(1, arg);
					outlet(0, "null");
				}
				else {
					outlet(1, arg);
					outlet(0, key);
				}
			}
			outlet(3, "bang");	
		}
		catch(e) {
			//post("\n" + e.name + " " + e.message);
		}
	}
	else {
		//post("\nproperty '" + arg + "' not defined");
	}
}

// get object properties and properties of all children
dump.immediate = 1;
function dump() {
	var mess = arrayfromargs(arguments);
	var key = znsjsonparent[jsonioName];
	
	if (mess.length) {
		// convert '[' or ']' or ']['  or '].' into '.'
		var argMod = mess[0].replace(/(\]\[)|(\]\.)|(\[)|(\])/g, ".");
		// remove any trailing '.'s
		while (argMod.lastIndexOf(".") == argMod.length-1) {
			argMod = argMod.substring(0, argMod.lastIndexOf("."));		
		}
		// split string into array at each '.', generate key reference via subscript notation	
		var argArray = argMod.split(".");
		for (var i = 0; i < argArray.length; i++) {
			if(typeOf(key[argArray[i]]) != "undefined") key = key[argArray[i]];
			else return;
		}
	}
	else {
		mess[0] = "super";	
	}
	
	if (typeOf(key) != "undefined") {
		depthTraverse(key, mess[0]);
		outlet(3, "bang");
	}
	else {
		//post("\nparent object '" + mess[0] + "' not defined");
	}
}

depthTraverse.local = 1;
depthTraverse.immediate = 1;
function depthTraverse(obj, st) {
	var str = st;
	var tname;	
	if (typeOf(obj) == "object") {
		for (var i in obj) {
			if (typeOf(obj) == "array") {
				tname = str + "[" + i + "]";
			}
			else {
				if (str == "super") {
					tname = i;
				}
				else {
					tname = str + "." + i;
				}
			}
			// if an object or array, do recursion
			if (typeOf(obj[i]) == "object" || typeOf(obj[i]) == "array") {
				depthTraverse(obj[i], tname);
			}
			else if (typeOf(obj[i]) == "null") {
				outlet(1, tname);
				outlet(0, "null");
			}
			else {
				outlet(1, tname);
				outlet(0, obj[i]);	
			}
		}
	}
	else if (typeOf(obj) == "array") {
		// if the array has something in it...
		if (obj.length) {
			// elements of arrays are interpreted as list of properties
			var vals = new Array();
			var objEl = new Array(); // array storing index of object elements
			for (var i = 0; i < obj.length; i++) {
				// if contains an object, output "object" at element's location
				// and store index for recursion on objects after loop completes
				if (typeOf(obj[i]) == "object") {
					vals.push("object");
					objEl.push(i);
				}
				// if contains an array, output "array" at element's location
				// and store index for recursion on objects after loop completes			
				else if (typeOf(obj[i]) == "array") {
					vals.push("array");
					objEl.push(i);				
				}				
				else if (typeOf(obj[i]) == "null") {
					vals.push("null");
				}
				else if (typeOf(obj[i]) == "undefined") {
					vals.push("undefined");
				}
				else {
					vals.push(obj[i]);
				}
			}
			outlet(1, str);
			outlet(0, vals);
			// do recursion on any objects in the array
			for (var j = 0; j < objEl.length; j++) {
				depthTraverse(obj[objEl[j]], str + "[" + objEl[j] + "]");
			}
		}
	}	
	else if (typeOf(obj) != "undefined") {
		if (typeOf(obj) == "null") {
			outlet(1, str);
			outlet(0, "null");
		}
		else {
			outlet(1, str);
			outlet(0, obj);
		}
	}
}

// set/create property, also optionally set its value/s
set.immediate = 1;
function set() {
	var mess = arrayfromargs(arguments);
	var key = znsjsonparent[jsonioName];
	var isSuper;

	// check for correct message format	
	if (mess.length > 0) {
	}
	else {
		post("\nset usage: [parent object/array ending with property name] [property value/s (optional)]");
		post("\n\tIf only 1 arg, property will be set as 'null'.");	
		post("\n\tIf 2 or more args, property will be set to appropriate type.");						
		return;
	}
	
	// convert 1st argument to use "dot" syntax only
	// convert '[' or ']' or ']['  or '].' into '.'
	mess[0] = mess[0].replace(/(\]\[)|(\]\.)|(\[)|(\])/g, ".");
	// remove any trailing '.'s	
	while (mess[0].lastIndexOf(".") == mess[0].length-1) {
		mess[0] = mess[0].substring(0, mess[0].lastIndexOf("."));		
	}
	
	// split string into array at each '.', generate key reference via subscript notation			
	var argArray = mess[0].split(".");
	for (var i = 0; i < argArray.length-1; i++) {
		if(typeOf(key[argArray[i]]) != "undefined") key = key[argArray[i]];
		else return;
	}
	// ... but store property name in it's own variable
	var prop = argArray[argArray.length-1];
	
	// if no values provided, initialize property as 'null'
	if (mess.length == 1) {
		key[prop] = null;
	}
	
	// if single value listed, try to initialized property with it
	// a value of "object" will try create an object
	// a value of "array" will try to create an array
	if (mess.length == 2) {
		if (typeOf(key) != "undefined") {
			if (mess[1] == "object") {
				try {
					key[prop] = new Object();
				}
				catch(e) {
				}
			}
			else if (mess[1] == "array") {
				try {
					key[prop] = new Array();
				}
				catch(e) {
				}
			}				
			else {
				try {
					key[prop] = mess[1];
				}
				catch(e) {
				}
			}
		}
	}
	
	// if multiple values listed, try to initialize array with them
	if (mess.length > 2) {
		if (typeOf(key) != "undefined") {		
			// remove 1st arg from list
			mess.splice(0, 1);						
			key[prop] = new Array(mess.length);						
			for (var i = 0; i < mess.length; i++) {
				// a value of "object" will cause an object to be instantiated at that index			
				if (mess[i] == "object") {
					try {
						key[prop][i] = new Object();
					}
					catch(e) {
					}
				}
				// a value of "array" will cause an array to be instantiated at that index	
				else if (mess[i] == "array") {
					try {
						key[prop][i] = new Array();
					}
					catch(e) {
					}
				}
			
				else {
					try {
						key[prop][i] = mess[i];
					}
					catch(e) {
					}
				}
			}
		}
	}
}

// delete existing property (including objects)
remove.immediate = 1;
function remove() {
	var mess = arrayfromargs(arguments);
	var key = znsjsonparent[jsonioName];
	
	if (mess.length >= 1) {
	}
	else {
		post("\nremove usage: [parent object ending with property to delete]");
		return;
	}
	
	// convert 1st argument to use "dot" syntax only
	// convert '[' or ']' or ']['  or '].' into '.'
	mess[0] = mess[0].replace(/(\]\[)|(\]\.)|(\[)|(\])/g, ".");
	// remove any trailing '.'s	
	while (mess[0].lastIndexOf(".") == mess[0].length-1) {
		mess[0] = mess[0].substring(0, mess[0].lastIndexOf("."));		
	}
	
	// split string into array at each '.', generate key reference via subscript notation			
	var argArray = mess[0].split(".");
	for (var i = 0; i < argArray.length-1; i++) {
		if(typeOf(key[argArray[i]]) != "undefined") key = key[argArray[i]];
		else return;
	}
	// ... but store property name in it's own variable
	var prop = argArray[argArray.length-1];
	
	// if both parent object and property exists, try to delete property
	if (typeOf(key) == "object") {
		if (typeOf(key[prop]) != "undefined") {
			try {
				delete key[prop];
			}
			catch(e) {
			}
		}
		else {
			//post("\nobject/property '"+ mess[1] + "' does not exists");	
		}		
	}
	else {
		//post("\nparent object '"+ mess[0] + "' does not exist");
	}
}

// write data to JSON file
function write(p){
	if (typeOf(p) != "undefined") {
		var jase = JSON.stringify(znsjsonparent[jsonioName], null, 4);
		var path = p;
		var fout = new File(path, "write", "TEXT");
		if (fout.isopen) {
			fout.eof = 0;
			fout.writeline(jase);
			fout.close();
			post("\nsaved " + path);
		} else {
			post("\ncould not create json file: " + path);
		}
	}
	else {
		post("\nwrite usage: [filej name w or w/o full path]");
	}
}

typeOf.local = 1;
typeOf.immediate = 1;
function typeOf(el) {
	if (typeof(el) == "object") {
		if (el === null) return "null";
    	else if (el instanceof Array) return "array";		
    	//else if (el.length) return "array";
    	else return "object";
    } 
	else {
  		return typeof(el);
	}
}
		
autowatch = 1;


/*=======================================================================*/
/*
    http://www.JSON.org/json2.js
    2011-02-23

    Public Domain.

    NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.

    See http://www.JSON.org/js.html


    This code should be minified before deployment.
    See http://javascript.crockford.com/jsmin.html

    USE YOUR OWN COPY. IT IS EXTREMELY UNWISE TO LOAD CODE FROM SERVERS YOU DO
    NOT CONTROL.


    This file creates a global JSON object containing two methods: stringify
    and parse.

        JSON.stringify(value, replacer, space)
            value       any JavaScript value, usually an object or array.

            replacer    an optional parameter that determines how object
                        values are stringified for objects. It can be a
                        function or an array of strings.

            space       an optional parameter that specifies the indentation
                        of nested structures. If it is omitted, the text will
                        be packed without extra whitespace. If it is a number,
                        it will specify the number of spaces to indent at each
                        level. If it is a string (such as '\t' or '&nbsp;'),
                        it contains the characters used to indent at each level.

            This method produces a JSON text from a JavaScript value.

            When an object value is found, if the object contains a toJSON
            method, its toJSON method will be called and the result will be
            stringified. A toJSON method does not serialize: it returns the
            value represented by the name/value pair that should be serialized,
            or undefined if nothing should be serialized. The toJSON method
            will be passed the key associated with the value, and this will be
            bound to the value

            For example, this would serialize Dates as ISO strings.

                Date.prototype.toJSON = function (key) {
                    function f(n) {
                        // Format integers to have at least two digits.
                        return n < 10 ? '0' + n : n;
                    }

                    return this.getUTCFullYear()   + '-' +
                         f(this.getUTCMonth() + 1) + '-' +
                         f(this.getUTCDate())      + 'T' +
                         f(this.getUTCHours())     + ':' +
                         f(this.getUTCMinutes())   + ':' +
                         f(this.getUTCSeconds())   + 'Z';
                };

            You can provide an optional replacer method. It will be passed the
            key and value of each member, with this bound to the containing
            object. The value that is returned from your method will be
            serialized. If your method returns undefined, then the member will
            be excluded from the serialization.

            If the replacer parameter is an array of strings, then it will be
            used to select the members to be serialized. It filters the results
            such that only members with keys listed in the replacer array are
            stringified.

            Values that do not have JSON representations, such as undefined or
            functions, will not be serialized. Such values in objects will be
            dropped; in arrays they will be replaced with null. You can use
            a replacer function to replace those with JSON values.
            JSON.stringify(undefined) returns undefined.

            The optional space parameter produces a stringification of the
            value that is filled with line breaks and indentation to make it
            easier to read.

            If the space parameter is a non-empty string, then that string will
            be used for indentation. If the space parameter is a number, then
            the indentation will be that many spaces.

            Example:

            text = JSON.stringify(['e', {pluribus: 'unum'}]);
            // text is '["e",{"pluribus":"unum"}]'


            text = JSON.stringify(['e', {pluribus: 'unum'}], null, '\t');
            // text is '[\n\t"e",\n\t{\n\t\t"pluribus": "unum"\n\t}\n]'

            text = JSON.stringify([new Date()], function (key, value) {
                return this[key] instanceof Date ?
                    'Date(' + this[key] + ')' : value;
            });
            // text is '["Date(---current time---)"]'


        JSON.parse(text, reviver)
            This method parses a JSON text to produce an object or array.
            It can throw a SyntaxError exception.

            The optional reviver parameter is a function that can filter and
            transform the results. It receives each of the keys and values,
            and its return value is used instead of the original value.
            If it returns what it received, then the structure is not modified.
            If it returns undefined then the member is deleted.

            Example:

            // Parse the text. Values that look like ISO date strings will
            // be converted to Date objects.

            myData = JSON.parse(text, function (key, value) {
                var a;
                if (typeof value === 'string') {
                    a =
/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)Z$/.exec(value);
                    if (a) {
                        return new Date(Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4],
                            +a[5], +a[6]));
                    }
                }
                return value;
            });

            myData = JSON.parse('["Date(09/09/2001)"]', function (key, value) {
                var d;
                if (typeof value === 'string' &&
                        value.slice(0, 5) === 'Date(' &&
                        value.slice(-1) === ')') {
                    d = new Date(value.slice(5, -1));
                    if (d) {
                        return d;
                    }
                }
                return value;
            });


    This is a reference implementation. You are free to copy, modify, or
    redistribute.
*/

/*jslint evil: true, strict: false, regexp: false */

/*members "", "\b", "\t", "\n", "\f", "\r", "\"", JSON, "\\", apply,
    call, charCodeAt, getUTCDate, getUTCFullYear, getUTCHours,
    getUTCMinutes, getUTCMonth, getUTCSeconds, hasOwnProperty, join,
    lastIndex, length, parse, prototype, push, replace, slice, stringify,
    test, toJSON, toString, valueOf
*/


// Create a JSON object only if one does not already exist. We create the
// methods in a closure to avoid creating global variables.

var JSON;
if (!JSON) {
    JSON = {};
}

(function () {
    "use strict";

    function f(n) {
        // Format integers to have at least two digits.
        return n < 10 ? '0' + n : n;
    }

    if (typeof Date.prototype.toJSON !== 'function') {

        Date.prototype.toJSON = function (key) {

            return isFinite(this.valueOf()) ?
                this.getUTCFullYear()     + '-' +
                f(this.getUTCMonth() + 1) + '-' +
                f(this.getUTCDate())      + 'T' +
                f(this.getUTCHours())     + ':' +
                f(this.getUTCMinutes())   + ':' +
                f(this.getUTCSeconds())   + 'Z' : null;
        };

        String.prototype.toJSON      =
            Number.prototype.toJSON  =
            Boolean.prototype.toJSON = function (key) {
                return this.valueOf();
            };
    }

    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        gap,
        indent,
        meta = {    // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"' : '\\"',
            '\\': '\\\\'
        },
        rep;


    function quote(string) {

// If the string contains no control characters, no quote characters, and no
// backslash characters, then we can safely slap some quotes around it.
// Otherwise we must also replace the offending characters with safe escape
// sequences.

        escapable.lastIndex = 0;
        return escapable.test(string) ? '"' + string.replace(escapable, function (a) {
            var c = meta[a];
            return typeof c === 'string' ? c :
                '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
        }) + '"' : '"' + string + '"';
    }


    function str(key, holder) {

// Produce a string from holder[key].

        var i,          // The loop counter.
            k,          // The member key.
            v,          // The member value.
            length,
            mind = gap,
            partial,
            value = holder[key];

// If the value has a toJSON method, call it to obtain a replacement value.

        if (value && typeof value === 'object' &&
                typeof value.toJSON === 'function') {
            value = value.toJSON(key);
        }

// If we were called with a replacer function, then call the replacer to
// obtain a replacement value.

        if (typeof rep === 'function') {
            value = rep.call(holder, key, value);
        }

// What happens next depends on the value's type.

        switch (typeof value) {
        case 'string':
            return quote(value);

        case 'number':

// JSON numbers must be finite. Encode non-finite numbers as null.

            return isFinite(value) ? String(value) : 'null';

        case 'boolean':
        case 'null':

// If the value is a boolean or null, convert it to a string. Note:
// typeof null does not produce 'null'. The case is included here in
// the remote chance that this gets fixed someday.

            return String(value);

// If the type is 'object', we might be dealing with an object or an array or
// null.

        case 'object':

// Due to a specification blunder in ECMAScript, typeof null is 'object',
// so watch out for that case.

            if (!value) {
                return 'null';
            }

// Make an array to hold the partial results of stringifying this object value.

            gap += indent;
            partial = [];

// Is the value an array?

            if (Object.prototype.toString.apply(value) === '[object Array]') {

// The value is an array. Stringify every element. Use null as a placeholder
// for non-JSON values.

                length = value.length;
                for (i = 0; i < length; i += 1) {
                    partial[i] = str(i, value) || 'null';
                }

// Join all of the elements together, separated with commas, and wrap them in
// brackets.

                v = partial.length === 0 ? '[]' : gap ?
                    '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' :
                    '[' + partial.join(',') + ']';
                gap = mind;
                return v;
            }

// If the replacer is an array, use it to select the members to be stringified.

            if (rep && typeof rep === 'object') {
                length = rep.length;
                for (i = 0; i < length; i += 1) {
                    if (typeof rep[i] === 'string') {
                        k = rep[i];
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            } else {

// Otherwise, iterate through all of the keys in the object.

                for (k in value) {
                    if (Object.prototype.hasOwnProperty.call(value, k)) {
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            }

// Join all of the member texts together, separated with commas,
// and wrap them in braces.

            v = partial.length === 0 ? '{}' : gap ?
                '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' :
                '{' + partial.join(',') + '}';
            gap = mind;
            return v;
        }
    }

// If the JSON object does not yet have a stringify method, give it one.

    if (typeof JSON.stringify !== 'function') {
        JSON.stringify = function (value, replacer, space) {

// The stringify method takes a value and an optional replacer, and an optional
// space parameter, and returns a JSON text. The replacer can be a function
// that can replace values, or an array of strings that will select the keys.
// A default replacer method can be provided. Use of the space parameter can
// produce text that is more easily readable.

            var i;
            gap = '';
            indent = '';

// If the space parameter is a number, make an indent string containing that
// many spaces.

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

// If the space parameter is a string, it will be used as the indent string.

            } else if (typeof space === 'string') {
                indent = space;
            }

// If there is a replacer, it must be a function or an array.
// Otherwise, throw an error.

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                    (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('JSON.stringify');
            }

// Make a fake root object containing our value under the key of ''.
// Return the result of stringifying the value.

            return str('', {'': value});
        };
    }


// If the JSON object does not yet have a parse method, give it one.

    if (typeof JSON.parse !== 'function') {
        JSON.parse = function (text, reviver) {

// The parse method takes a text and an optional reviver function, and returns
// a JavaScript value if the text is a valid JSON text.

            var j;

            function walk(holder, key) {

// The walk method is used to recursively walk the resulting structure so
// that modifications can be made.

                var k, v, value = holder[key];
                if (value && typeof value === 'object') {
                    for (k in value) {
                        if (Object.prototype.hasOwnProperty.call(value, k)) {
                            v = walk(value, k);
                            if (v !== undefined) {
                                value[k] = v;
                            } else {
                                delete value[k];
                            }
                        }
                    }
                }
                return reviver.call(holder, key, value);
            }


// Parsing happens in four stages. In the first stage, we replace certain
// Unicode characters with escape sequences. JavaScript handles many characters
// incorrectly, either silently deleting them, or treating them as line endings.

            text = String(text);
            cx.lastIndex = 0;
            if (cx.test(text)) {
                text = text.replace(cx, function (a) {
                    return '\\u' +
                        ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }

// In the second stage, we run the text against regular expressions that look
// for non-JSON patterns. We are especially concerned with '()' and 'new'
// because they can cause invocation, and '=' because it can cause mutation.
// But just to be safe, we want to reject all unexpected forms.

// We split the second stage into 4 regexp operations in order to work around
// crippling inefficiencies in IE's and Safari's regexp engines. First we
// replace the JSON backslash pairs with '@' (a non-JSON character). Second, we
// replace all simple value tokens with ']' characters. Third, we delete all
// open brackets that follow a colon or comma or that begin the text. Finally,
// we look to see that the remaining characters are only whitespace or ']' or
// ',' or ':' or '{' or '}'. If that is so, then the text is safe for eval.

            if (/^[\],:{}\s]*$/
                    .test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
                        .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
                        .replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

// In the third stage we use the eval function to compile the text into a
// JavaScript structure. The '{' operator is subject to a syntactic ambiguity
// in JavaScript: it can begin a block or an object literal. We wrap the text
// in parens to eliminate the ambiguity.

                j = eval('(' + text + ')');

// In the optional fourth stage, we recursively walk the new structure, passing
// each name/value pair to a reviver function for possible transformation.

                return typeof reviver === 'function' ?
                    walk({'': j}, '') : j;
            }

// If the text is not JSON parseable, then a SyntaxError is thrown.

            throw new SyntaxError('JSON.parse');
        };
    }
}());
/*=======================================================================*/

/*=======================================================================*/
/* 
	JSON.minify()
	v0.1 (c) Kyle Simpson
	MIT License
*/

(function(global){
	if (typeof global.JSON == "undefined" || !global.JSON) {
		global.JSON = {};
	}
	
	global.JSON.minify = function(json) {
		
		var tokenizer = /"|(\/\*)|(\*\/)|(\/\/)|\n|\r/g,
			in_string = false,
			in_multiline_comment = false,
			in_singleline_comment = false,
			tmp, tmp2, new_str = [], ns = 0, from = 0, lc, rc
		;
		
		tokenizer.lastIndex = 0;
		
		while (tmp = tokenizer.exec(json)) {
			lc = RegExp.leftContext;
			rc = RegExp.rightContext;
			if (!in_multiline_comment && !in_singleline_comment) {
				tmp2 = lc.substring(from);
				if (!in_string) {
					tmp2 = tmp2.replace(/(\n|\r|\s)*/g,"");
				}
				new_str[ns++] = tmp2;
			}
			from = tokenizer.lastIndex;
			
			if (tmp[0] == "\"" && !in_multiline_comment && !in_singleline_comment) {
				tmp2 = lc.match(/(\\)*$/);
				if (!in_string || !tmp2 || (tmp2[0].length % 2) == 0) {	// start of string with ", or unescaped " character found to end string
					in_string = !in_string;
				}
				from--; // include " character in next catch
				rc = json.substring(from);
			}
			else if (tmp[0] == "/*" && !in_string && !in_multiline_comment && !in_singleline_comment) {
				in_multiline_comment = true;
			}
			else if (tmp[0] == "*/" && !in_string && in_multiline_comment && !in_singleline_comment) {
				in_multiline_comment = false;
			}
			else if (tmp[0] == "//" && !in_string && !in_multiline_comment && !in_singleline_comment) {
				in_singleline_comment = true;
			}
			else if ((tmp[0] == "\n" || tmp[0] == "\r") && !in_string && !in_multiline_comment && in_singleline_comment) {
				in_singleline_comment = false;
			}
			else if (!in_multiline_comment && !in_singleline_comment && !(/\n|\r|\s/.test(tmp[0]))) {
				new_str[ns++] = tmp[0];
			}
		}
		new_str[ns++] = rc;
		return new_str.join("");
	};
})(this);
/*=======================================================================*/
// EOF
