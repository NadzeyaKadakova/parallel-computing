package University.FFTParallel;

public class ComputePart implements Runnable{

	private Complex [] x;
	private int evOdd;
	private int n;
	private Complex [] res;
	public ComputePart(int initN, Complex [] initX, int EvOdd){
		this.x = initX;
		this.n = initN;
		this.evOdd = EvOdd;
		this.res = new Complex[n/2];
	}
	
	public  Complex [] getResult(){
		return this.res;
	}
	public void run() {
		
		if(this.evOdd ==2){
	      for (int k = 0; k < n/2; k++) {
	    	    Complex tempSum = new Complex(0,0);
	    	    for (int i = 0;i<n/2;i++){
	    	    	Complex temp;
	    	    	double w1Temp = -2 * k * Math.PI / n*2;
	    	    	Complex w1 = new Complex(Math.cos(Math.pow(w1Temp,k*i)), Math.sin(Math.pow(w1Temp,k*i)));
	    	    	temp = x[i].plus(x[i+n/2]);
	    	    	temp = temp.times(w1);
	    	    	tempSum = tempSum.plus(temp);
	    	    }
	          this.res[k] = tempSum; 		            
		}	
		}
		else{
			for (int k = 0; k < n/2; k++) {
	    	    Complex tempSum = new Complex(0,0);
	    	    for (int i = 0;i<n/2;i++){
	    	    	Complex temp;
	    	    	double w1Temp = -2 * k * Math.PI / n;
	    	    	double w2Temp = -2 * k * Math.PI / n*2;
	    	    	Complex w1 = new Complex(Math.cos(Math.pow(w1Temp,i)), Math.sin(Math.pow(w1Temp,i)));
	    	    	Complex w2 = new Complex(Math.cos(Math.pow(w2Temp,k*i)), Math.sin(Math.pow(w2Temp,k*i)));
	    	    	temp = x[i].minus(x[i+n/2]);
	    	    	temp = temp.times(w1);
	    	    	temp = temp.times(w2);
	    	    	tempSum = tempSum.plus(temp);
	    	    }
	          this.res[k] = tempSum; 		            
		}	
		}
	}
}
