package searchdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;


public class likeyDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public int likeinfo(String user_id, String info_id, String user_ip) {
		String sql = "insert into likey values (?,?,?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, info_id);
			pstmt.setString(3, user_ip);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		} 
		return -1;
	}
}
