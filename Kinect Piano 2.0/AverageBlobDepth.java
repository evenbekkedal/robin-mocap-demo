import com.cycling74.max.*;
import com.cycling74.jitter.*;

public class AverageBlobDepth extends MaxObject
{
	JitterMatrix depthMat = new JitterMatrix();
	JitterMatrix blobMat = new JitterMatrix();	
	boolean hasBlob = false;
	boolean hasDepth = false;
	
    public AverageBlobDepth(Atom[] args) {
		declareIO(2,1);
		setInletAssist(0, "jitter 1 plane char blob label matrix");
		setInletAssist(1, "jitter 1 plane float32 depth matrix");
		setOutletAssist(0, "list of average depth values for each blob, in ascending order");
		createInfoOutlet(false);
		post("AverageBlobDepth by Zachary Seldess. Build Dec 11 2011.");
		post("Copyright © 2011 King Abdullah University of Science and Technology. Some Rights Reserved.");		
    }
	
	public void blobCount(int count) {
		// size arrays to count
		int[] blobAmt = new int[count];
		float[] blobSum = new float[count];
		float[] blobAvg = new float[count];
		int i,j;

		if (hasDepth && hasBlob) {
			int[] offset = new int[]{0,0};
			int[] blobDim = blobMat.getDim();
			int[] blobRow = new int[blobDim[0]];
			float[] depthRow = new float[blobDim[0]];
			// store and evaluate blob label and depth matrices as arrays, one row at a time
			for (i = 0; i < blobDim[1]; i++) {
				offset[1] = i;
				blobMat.copyVectorToArrayPlanar(0, 0, offset, blobRow, blobDim[0], 0);
				depthMat.copyVectorToArrayPlanar(0, 0, offset, depthRow, blobDim[0], 0);
				// accumulate number of cells for each blob label, and sum of depth values for each blob
				for (j = 0; j < blobDim[0]; j++) {
					if (blobRow[j] != 0) {
						blobAmt[blobRow[j]-1]++;
						blobSum[blobRow[j]-1] += depthRow[j];
					}
				}
			}
			// find average depth for each blob
			for (i = 0; i < count; i++) {
				blobAvg[i] = blobSum[i] / (float)blobAmt[i];
			}	
			// output average depths as list, low blob to high blob
			outlet(0, blobAvg);
		}	
	}	

	public void jit_matrix(String inname) {		
		if (getInlet() == 1) {
			hasDepth = true;
			depthMat.frommatrix(inname);				
		}	
		else {
			hasBlob = true;			
			blobMat.frommatrix(inname);							
		}
	}
	
}




