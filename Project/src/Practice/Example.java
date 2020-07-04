package Practice;

public class Example {

	public void method(boolean print) {
		if(print) {
			int insideIf = 10;
			System.out.println(insideIf);
		}
		
	}
	
	
	
	public static void main(String[] args) {
		//new Example().method(true);
	
		int[] array = {1,2,3,4,5,6};
		int[] array2 = {1,8,7};
		
		for(int i=0; i<array.length; i++) {
			System.out.println("출력"+i);
			System.out.println("제대로 출력"+i);
			for(int j=0; j<array2.length; j++) {
				
				if(array[i] == array2[j]) {
					System.out.println(array2[j]);
					System.out.println();
					break;
				}
			}
		}
		
	}
}
