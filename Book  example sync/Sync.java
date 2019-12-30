package name;

public class Sync {

	public static void main(String[] args) {
		
		int a[]= {1, 2, 3, 4, 5};
		
		new MyThread("Child #1", a);
		new MyThread("Child #2", a);
	}

}
