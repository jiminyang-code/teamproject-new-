package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FmlDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	static private FmlDao dao = new FmlDao();
	
	public static FmlDao getInstance() {
		return dao;
	}
	
	
	public FmlDao() {
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
	
	public int insertProperty(FmlDTO dto) {
		
		String sql = "INSERT INTO filming_location VALUES(?,?,?,?,?);";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getLocationID());
			pstmt.setString(2, dto.getLocationName());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getCountry());
			pstmt.setString(5, dto.getMovieName());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public String deleteProperty(FmlDTO dto) {
		
		String sql = "DELETE FROM filming_location WHERE location_name=? && movie_name=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDeleteLocation());
			pstmt.setString(2, dto.getDeleteMovie());
			pstmt.executeUpdate();
			
			return "0";
			
		} catch (SQLException e) {
			e.printStackTrace();
			//Can not issue data manipulation statements with executeQuery().
			//타입이 [Movie.ActorDTO]인 bean의 프로퍼티 [deleteName]에 대한 정보를 찾을 수 없습니다.
		}
		return "-1";
	}
	
	
	
	public ArrayList<String> getProperty(int id) {

		String sql = "SELECT * FROM filming_location where l_id=?";
		ArrayList<String> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//id번호 갱신기능
		public String modifyIdNumber(int number) {
			String sql = "ALTER TABLE FmlDao AUTO_INCREMENT = ?;";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.executeUpdate();
				return String.valueOf(pstmt.executeUpdate());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "-1";
		}

}
