package Movie;

import java.util.ArrayList;

public interface Crud {
	
	public ArrayList<String> getProperty(String var); //데이터 가져오기
	
	public int insertProperty(Object obj); //데이터 삽입

	public String updateProperty(); //데이터 갱신

	String deleteProperty(String name); //디버깅용 데이터삭제 메소드

	String deleteProperty(ActorDTO dto);

	
}
