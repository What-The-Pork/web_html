package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class ServiceDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;


	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "";

	}

	public int write(ServiceDTO svDTO) {

		String SQL = "INSERT INTO sc VALUES (NULL, ?, ?, ?, ?, ?, 0, 0,?,NULL)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, svDTO.getScTitle());
			pstmt.setString(2, svDTO.getUserid());
			pstmt.setString(3, svDTO.getScContent());
			pstmt.setInt(4, svDTO.getScAvailable());
			pstmt.setString(5, svDTO.getScDate());
			pstmt.setString(6, svDTO.getClassified());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public ArrayList<ServiceDTO> getList(String pageNumber) {
		String SQL = "SELECT * FROM sc WHERE scid > (SELECT MAX(scid) FROM sc) - ? AND scid <= (SELECT MAX(scid) FROM sc) - ? AND scAvailable = 1 ORDER BY scid DESC";
		ArrayList<ServiceDTO> list = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(pageNumber) * 8);
			pstmt.setInt(2, (Integer.parseInt(pageNumber) -1) * 8);
			rs = pstmt.executeQuery();
			list = new ArrayList<ServiceDTO>();
			while (rs.next()) {
				ServiceDTO sv = new ServiceDTO();
				sv.setScid(rs.getInt(1));
				sv.setScTitle(rs.getString(2));
				sv.setUserid(rs.getString(3));
				sv.setScContent(rs.getString(4));
				sv.setScAvailable(rs.getInt(5));
				sv.setScDate(rs.getString(6));
				sv.setStatused(rs.getInt(7));
				sv.setScGood(rs.getInt(8));
				sv.setClassified(rs.getString(9));
				sv.setScAnswer(rs.getString(10));
				list.add(sv);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public boolean nextPage(String pageNumber) {
		String SQL = "SELECT * FROM sc WHERE scid >= ? AND scAvailable = 1 ORDER BY scid DESC";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(pageNumber) * 8);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public ServiceDTO getSC(String scid) {
		String SQL = "SELECT * FROM sc WHERE scid=?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, scid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ServiceDTO sv = new ServiceDTO();
				sv.setScid(rs.getInt(1));
				sv.setScTitle(rs.getString(2));
				sv.setUserid(rs.getString(3));
				sv.setScContent(rs.getString(4));
				sv.setScAvailable(rs.getInt(5));
				sv.setScDate(rs.getString(6));
				sv.setStatused(rs.getInt(7));
				sv.setScGood(rs.getInt(8));
				sv.setClassified(rs.getString(9));
				sv.setScAnswer(rs.getString(10));
				return sv;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public int good(String scid) {

		String SQL = "UPDATE sc SET scGood = scgood + 1 WHERE scid = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, scid);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public int answer(String answer, String scid) {

		String SQL = "UPDATE sc SET scAnswer = ?, statused=1 WHERE scid = ?";
		try {
			ServiceDTO sv = new ServiceDTO();
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, answer);
			pstmt.setInt(2, Integer.parseInt(scid));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public ArrayList<ServiceDTO> gethitquestion() {
		String SQL = "SELECT * FROM sc WHERE scid  ORDER BY scGood  DESC LIMIT 8";
		ArrayList<ServiceDTO> list = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			list = new ArrayList<ServiceDTO>();
			while (rs.next()) {
				ServiceDTO sv = new ServiceDTO();
				sv.setScid(rs.getInt(1));
				sv.setScTitle(rs.getString(2));
				sv.setUserid(rs.getString(3));
				sv.setScContent(rs.getString(4));
				sv.setScAvailable(rs.getInt(5));
				sv.setScDate(rs.getString(6));
				sv.setStatused(rs.getInt(7));
				sv.setScGood(rs.getInt(8));
				sv.setClassified(rs.getString(9));
				sv.setScAnswer(rs.getString(10));
				list.add(sv);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int delectQnA (String userid, String scid) {
		String SQL = "DELETE FROM sc WHERE userid = ? and scid= ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			pstmt.setInt(2, Integer.parseInt(scid));
			pstmt.executeUpdate();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스 오류
	}
	
	public int QnA_modify(String scTitle, String scContent, String scDate, String classified , String scid) {

		String SQL = "UPDATE sc SET scTitle = ?, scContent = ?, scDate = ?, classified = ? WHERE scid = ?";
		try {
			ServiceDTO sv = new ServiceDTO();
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, scTitle);
			pstmt.setString(2, scContent);
			pstmt.setString(3, scDate);
			pstmt.setString(4, classified);
			pstmt.setInt(5, Integer.parseInt(scid));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
