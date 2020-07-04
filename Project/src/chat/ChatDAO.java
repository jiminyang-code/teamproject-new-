package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ChatDAO {
	
		DataSource dataSource;
//		private Connection conn = null;
//		private static ChatDAO dao = new ChatDAO();
//		
//		public static ChatDAO getInstance() {
//			return dao;
//		}

		public ChatDAO() {
			try {
				InitialContext initContext = new InitialContext();
				Context envContext = (Context) initContext.lookup("java:/comp/env");
				dataSource = (DataSource) envContext.lookup("jdbc/Project");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

//		public ChatDAO() {
//			try {
//				String dbURL = "jdbc:mysql://localhost:3306/movie?"; //
//				String dbID = "root"; //mysql 계정
//				String dbPassword = "1234"; //mysql 비밀번호
//				String driver = "org.gjt.mm.mysql.Driver";
//
//				Class.forName(driver);
//				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		
		public ArrayList<ChatDTO> getChatList(String fromID, String toID, String chatID) {
			
			ArrayList<ChatDTO> chatList = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append(" SELECT*FROM user_chat WHERE ((fromID = ? AND toID = ?) ");
			sql.append(" OR (fromID = ? AND toID = ?)) AND chatID > ? ORDER BY chatTime ");
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, toID);
				pstmt.setString(4, fromID); //순서를 뒤바꿔서 넣어줌.(자신이받든 보내든 항상 가져올수있도록)
				pstmt.setInt(5, Integer.parseInt(chatID));
				rs = pstmt.executeQuery();
				chatList = new ArrayList<ChatDTO>();
				
				while(rs.next()) {
					ChatDTO chat = new ChatDTO();
					chat.setChatID(rs.getInt("chatID"));
					chat.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")); //특수문자를 치환해주는 과정
					chat.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
					String timeType = "오전";
					if(chatTime>12) {
						timeType = "오후";
						chatTime -= 12;
						
					}
					chat.setChatTime(rs.getString("chatTime").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
					chatList.add(chat);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			finally {
//				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
//				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
//				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
//			}
//			return null;
			return chatList;
				
		}
		
		
		
		public ArrayList<ChatDTO> getChatListByRecent(String fromID, String toID, int number) {
			
			ArrayList<ChatDTO> chatList = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append(" SELECT*FROM user_chat WHERE ((fromID = ? AND toID = ?) ");
			sql.append(" OR (fromID = ? AND toID = ?)) AND chatID > (SELECT MAX(chatID) - ? FROM user_chat) ORDER BY chatTime	  ");
			
			
			try {
				conn = (Connection) dataSource.getConnection();
				pstmt = conn.prepareStatement(String.valueOf(sql));
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, toID);
				pstmt.setString(4, fromID); //순서를 뒤바꿔서 넣어줌.(자신이받든 보내든 항상 가져올수있도록)
				pstmt.setInt(5, number);
				rs= pstmt.executeQuery();
				chatList = new ArrayList<ChatDTO>();
				
				while(rs.next()) {
					ChatDTO dto = new ChatDTO();
					dto.setChatID(rs.getInt("chatID"));
					dto.setFromID(rs.getString("fromID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setToID(rs.getString("toID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					dto.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n", "<br>"));
					int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11, 13));
					String timeType = "오전";
					if(chatTime>12) {
						timeType = "오후";
						chatTime -= 12;
						
					}
					dto.setChatTime(rs.getString("chatTime").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16)+ "");
					chatList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
			}
			
			return chatList; //리스트 반환
			
		}
		
		
			public int submit(String fromID, String toID, String chatContent) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sql  = new StringBuffer();
			
			sql.append("INSERT INTO user_chat VALUES (NULL, ?, ?, ?, NOW())");
			//null값 넣으면 auto_increment 자동 증가
			
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(String.valueOf(sql));
				pstmt.setString(1, fromID);
				pstmt.setString(2, toID);
				pstmt.setString(3, chatContent);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if(conn!=null) conn.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(pstmt!=null) pstmt.close();} catch (Exception e2) {e2.printStackTrace();}
				try {if(rs!=null) rs.close();} catch (Exception e2) {e2.printStackTrace();}
			}
			
			return -1; //데이터베이스 오류
			
		}
			
		public static void method() {
		}
		public static void main(String[] args) {
//			Connection conn = null;
//		      try {
//		    	  String dbURL = "jdbc:mysql://localhost:3306/movie?"; //
//				String dbID = "root"; //mysql 계정
//					String dbPassword = "1234"; //mysql 비밀번호
//				String driver = "org.gjt.mm.mysql.Driver";
//
//				Class.forName(driver);
//				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			ArrayList<ChatDTO> list;
				list = new ChatDAO().getChatList("simazeri", "khm2456", "1");
				System.out.println(list);
				
			
		}
	}