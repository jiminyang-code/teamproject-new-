package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GenreDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	static private GenreDao dao = new GenreDao();

	public static GenreDao getInstance() {
		return dao;
	}

	public GenreDao() {
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

	
	public int insertProperty(GenreDTO dto) {

		String sql = "INSERT INTO genre VALUES(?,?,?,?,?,?,?,?,?);";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getReleasedYear());
			pstmt.setString(2, dto.getActionMovie());
			pstmt.setString(3, dto.getHorror());
			pstmt.setString(4, dto.getRomance());
			pstmt.setString(5, dto.getAnimation());
			pstmt.setString(6, dto.getComedy());
			pstmt.setString(7, dto.getMusical());
			pstmt.setString(8, dto.getFamily());
			pstmt.setString(9, dto.getDrama());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}




	public String deleteProperty(GenreDTO dto) {

		String sql = "DELETE FROM genre WHERE released_year=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getDeleteYear());
			pstmt.executeUpdate();
			
			return "0";

		} catch (SQLException e) {
			e.printStackTrace();
			//Can not issue data manipulation statements with executeQuery().
			//타입이 [Movie.ActorDTO]인 bean의 프로퍼티 [deleteName]에 대한 정보를 찾을 수 없습니다.
		}
		
		return "-1";
	}



	public ArrayList<String> getProperty(int year) {

		String sql = "SELECT * FROM genre where released_year=?";
		ArrayList<String> list = new ArrayList<>();


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
				list.add(rs.getString(6));
				list.add(rs.getString(7));
				list.add(rs.getString(8));
				list.add(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}
