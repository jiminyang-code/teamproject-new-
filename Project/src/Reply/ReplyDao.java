package Reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;

import Movie.UserDTO;

public class ReplyDao implements PrototypeReply{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static private ReplyDao dao = new ReplyDao();

	public ReplyDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/movie?"; //
			String dbID = "root"; //mysql 계정
			String dbPassword = "1234"; //mysql 비밀번호
			String driver = "org.gjt.mm.mysql.Driver";

			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	//싱글톤 객체 리턴
	public static ReplyDao getInstance() {
		return dao;
	}



	@Override
	public int replyCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	//댓글 입력하기
	@Override
	public String replyInsert(ReplyDTO dto) {
		String sql = "INSERT INTO reply_tb(USER_ID, REPLY_CONTENT, REPLY_DATE) VALUES(?, ?, NOW());"; //아이디, 댓글 입력
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());
		pstmt.setString(2, dto.getReplyContent());
		
			return String.valueOf(pstmt.executeUpdate());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "-1";
	}


	@Override
	public String replyInsert(ReplyDTO dto, String sessionID) {
		String sql = "INSERT INTO reply_tb(USER_ID,REPLY_CONTENT,BOARD_ID,REPLY_DATE) VALUES(?,?,?,NOW());"; //아이디, 댓글 입력
		 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionID);
		pstmt.setString(2, dto.getReplyContent());
		pstmt.setInt(3, dto.getBoardID());
		return String.valueOf(pstmt.executeUpdate());
		 } catch(Exception e) {
		return "-1";
		 }
	}



	//비회원용 댓글입력메소드
	public String replyInsert(ReplyUserDTO dto) {
		String sql = "INSERT INTO reply_user(USER_ID,USER_PW,REPLY_CONTENT,BOARD_ID,REPLY_DATE) VALUES(?,?,?,?,NOW());"; 
		//비회원 아이디, 비번,댓글 입력
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());
		pstmt.setString(2, dto.getUserPW());
		pstmt.setString(3, dto.getReplyContent());
		pstmt.setInt(4, dto.getBoardID());
		return String.valueOf(pstmt.executeUpdate());
		} catch(Exception e) {
			e.printStackTrace();
			return "-1";
		}
	}



	@Override
	public boolean replyUpdate(ReplyDTO dto) throws Exception {
		String sql = "UPDATE reply_tb SET REPLY_CONTENT=?" + "where USER_ID=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getReplyContent());
		pstmt.setString(2, dto.getUserID());
		boolean flag = false;

		if(pstmt.executeUpdate() == 2) //반영된 레코드개수가 리턴(여기서는 2개)
			flag = true;

		return flag;
	}


	//회원 댓글삭제
	@Override
	public String replyDelete(ReplyDTO dto) {
		String sql = "DELETE FROM reply_tb where USER_ID=?";
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserID());

			return String.valueOf(pstmt.executeUpdate());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "0";
	}
	
	//비회원 댓글 삭제
	public String replyDelete(ReplyUserDTO dto) {
		String sql = "DELETE FROM reply_user where board_ID=? && USER_PW=? && USER_ID=?";
		
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getBoardID());
		pstmt.setString(2, dto.getUserPW());
		pstmt.setString(3, dto.getUserID());

			return String.valueOf(pstmt.executeUpdate());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "0";
	}

	
	
	//댓글 리스트 가져오기
	@Override
	public ArrayList<ReplyDTO> replyList(int boardID) throws Exception {
	
		String sql = "SELECT reply_id, user_id,reply_content FROM reply_tb where board_id=?";
		ArrayList<ReplyDTO> list = new ArrayList<>();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardID);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
			ReplyDTO dto = new ReplyDTO();
			dto.setReplyID(rs.getInt(1));
			dto.setUserID(rs.getString(2));
			dto.setReplyContent(rs.getString(3));
			list.add(dto);
			
			} while(rs.next());
		}
		pstmt.close();
		return list;
	}



	//비회원 댓글 리스트 가져오기
	public ArrayList<ReplyUserDTO> replyList2(int boardID) throws Exception {
	
		String sql = "SELECT user_id,reply_content FROM reply_user where board_id=?";
	
		pstmt = conn.prepareStatement(sql);
		ArrayList<ReplyUserDTO> list = new ArrayList<>();
		pstmt.setInt(1, boardID);
		rs = pstmt.executeQuery();
		
		
		
		if(rs.next()) {
			do {
			ReplyUserDTO dto = new ReplyUserDTO(); //스코프 주의, 밖에있을경우 while문 마지막 데이터만 삽입됨
			dto.setUserID(rs.getString(1));
			dto.setReplyContent(rs.getString(2));
			list.add(dto);
			}
			while(rs.next());
		}
		pstmt.close();
		return list;
	}
	
	//통합 댓글리스트 가져오기
	public ArrayList<Object> replyList3(int boardID) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT user_id, reply_content,reply_date");
		sql.append("    FROM reply_tb WHERE board_id = ? UNION");
		sql.append("       SELECT user_id, reply_content,reply_date");
		sql.append("           FROM reply_user WHERE board_id = ?");
		sql.append("       ORDER BY reply_date ASC;");
		
		
		pstmt = conn.prepareStatement(String.valueOf(sql));
		ArrayList<Object> list = new ArrayList<>();
		pstmt.setInt(1, boardID);
		pstmt.setInt(2, boardID);
		
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			do {
			ReplyDTO dto = new ReplyDTO(); //스코프 주의, 밖에있을경우 while문 마지막 데이터만 삽입됨
			dto.setUserID(rs.getString(1));
			dto.setReplyContent(rs.getString(2));
			list.add(dto);
			}
			
			while(rs.next());
		}
		pstmt.close();
		return list;
	}
	
	
	
	//게시물의 댓글수 카운트
	public String getCount(int boardID) {
		try {
			ArrayList<Object> list = replyList3(boardID);
			int count = 0;
			for(int i=0; i<list.size(); i++) {
				count++;
			}
			return String.valueOf(count);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "-1";
	}

	public static void main(String[] args) {
		
		
		
		
		ReplyDao dao = ReplyDao.getInstance();
		
		System.out.println(dao.getCount(2));
		
//		int j = 0;
//		try {
//			ArrayList<Object> list = dao.replyList3(2);
//			for(int i=0; i<list.size(); i++) {
//				ReplyDTO dto = (ReplyDTO) list.get(i);
//				++j;
//				System.out.print(j +" "+ dto.getUserID()+" ");
//				System.out.println(dto.getReplyContent());
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
//		try {
//			ArrayList<ReplyDTO> list = dao.replyList(1);
//			for(ReplyDTO dto : list)
//			{
//				System.out.println(dto.getReplyID());
//				System.out.println(dto.getReplyContent());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	
	}
	//문자열 공백체크 기능
	public static boolean spaceCheck(String spaceCheck)
	{
	    for(int i = 0 ; i < spaceCheck.length(); i++)
	    {
	        if(spaceCheck.charAt(i) == ' ')
	            return true;
	    }
	    return false;
	}

}
	
