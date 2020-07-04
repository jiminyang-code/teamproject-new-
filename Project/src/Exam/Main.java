package Exam;

import java.util.ArrayList;

public class Main {
	
	
	
	public static void main(String[] args) {
		ArrayList<Job> list = new ArrayList<>();
		list.add(new Programmer());
		list.add(new Teacher());
		list.add(new Dancer());
		
		for(Job job : list) {
			String str = job.skill();
			System.out.println(str);
		}
		
	}
}
