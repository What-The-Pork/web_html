package searchdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import searchdto.rankingVO;
import util.DatabaseUtil;

public class rankingDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 카테고리 선택시 랭킹 리스트 출력
	public ArrayList<rankingVO> showranklist (String select) {
		ArrayList<rankingVO> list = new ArrayList<rankingVO>();
		String sql = "select info_name, COUNT(*) cnt from ranking where SmallC_id ||''|| BigC_id = ? Group by info_name order by cnt DESC";
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, select);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rankingVO rVo = new rankingVO();
				rVo.setInfo_name(rs.getString(1));
				rVo.setCnt(rs.getInt(2));
				list.add(rVo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list; 
	}
	
	
}
