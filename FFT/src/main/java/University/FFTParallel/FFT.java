package University.FFTParallel;

public class FFT 
{
	// Fast Fourier Transformation
    public static void main( String[] args ) throws InterruptedException
    {
    	int n = 32;
        Complex[] x = new Complex[n];

        // original data
        for (int i = 0; i < n; i++) {
            x[i] = new Complex(i, 0);
            x[i] = new Complex(-2*Math.random() + 1, 0);
        }
        show(x, "x");

        // FFT of original data
        Complex[] y = fft(x);
        show(y, "y = fft(x)");
    	
    }
    
    public static Complex[] fft(Complex[] x) throws InterruptedException {
        int n = x.length;
        // base case
        if (n == 1) return new Complex[] { x[0] };

        // radix 2 Cooley-Tukey FFT
        if (n % 2 != 0) { throw new RuntimeException("n is not a power of 2"); }

        Complex[] y = new Complex[n];
        Complex[] evenMass = new Complex[n/2];
    	Complex[] oddMass = new Complex[n/2];
        ComputePart even = new ComputePart(n,x,2);
    	Thread tr1 = new Thread(even);
    	tr1.start();
    	ComputePart odd = new ComputePart(n,x,1);
    	Thread tr2 = new Thread(odd);
    	tr2.start();
    	tr1.join();
    	tr2.join();
    	evenMass = even.getResult();
    	oddMass = odd.getResult(); 	
    	
    	for (int j = 0;j<n/2; j++){
    		y[2*j] = evenMass[j];
    		y[2*j+1] = oddMass[j];
    		
    	}
        return y;
    }
    
    public static void show(Complex[] x, String title) {
        System.out.println(title);
        System.out.println("-------------------");
        for (int i = 0; i < x.length; i++) {
        	System.out.println(x[i]);
        }
        System.out.println();
    }
}
