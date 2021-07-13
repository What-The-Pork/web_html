package user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


import java.sql.Connection;
import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userid, String pwd) { // �α����� �õ����ִ� �޼ҵ�
		String SQL = "SELECT pwd FROM USER WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery(); //executeQuery: �����͸� ��ȸ
			if(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					return 1; //�α��� ����
				}
				else {
					return 0; // ��й�ȣ ����
				}
			}
			return -1; // ���̵� ����
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
		return -2; //��� ����
	}
	
	
	
	public int changepassword(String userid, String change) { // �α����� �õ����ִ� �޼ҵ�
		String SQL = "UPDATE USER SET pwd = ? WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, change);
			pstmt.setString(2, userid);
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
		return -1; //��� ����
	}
	
	public UserDTO getuser(String userid) {
		String SQL = "SELECT * FROM user WHERE userid=?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				UserDTO user = new UserDTO();
				user.setUserid(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setNixname(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setEmailhash(rs.getString(5));
				user.setEmailchecked(rs.getBoolean(6));
				user.setUserAvailable(rs.getInt(7));
				return user;
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
	
	public int join(UserDTO user) { // ȸ�������� ���ִ� �޼ҵ�
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,FALSE,0,NULL)";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getNixname());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getEmailhash());
			return pstmt.executeUpdate(); // executeUpdate : �����͸� ��ȯ
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
		return -1; //ȸ������ ����
	}
	
	public String getUserEmail(String userid) { // ���������� �۽��Ҷ� ������ �̸��� ������ �������� �޼ҵ�
		String SQL = "SELECT email FROM USER WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1);
			}
			
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
		return null; //�����ͺ��̽� ����
	}
	
	public boolean getUserEmailChecked(String userid) { // ������ �̸��� ���������� �Ϸ��ߴ��� Ȯ�� �ϴ� �޼ҵ�
		String SQL = "SELECT emailchecked FROM user WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getBoolean(1);
			}
			
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
		return false; //�����ͺ��̽� ����
	}
	

	public boolean setUserEmailChecked(String userID) { // ������� �̸��� ������ ���ִ� �޼ҵ�
		String SQL = "UPDATE user SET emailchecked = true WHERE userid =?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
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
			
		}
		return false; //�����ͺ��̽� ����
	}
	
	public int delectUser(String userid) {
		String SQL = "DELETE FROM USER WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
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
		return -1; //�����ͺ��̽� ����
	}
	
	public int upload(String profile, String userid) {
		String SQL = "UPDATE USER SET profile = ? WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, profile);
			pstmt.setString(2, userid);
			return pstmt.executeUpdate(); // return 1
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
		}
		return -1;
	}
	
	public int modifyNixname(String nixname, String userid) {
		String SQL = "UPDATE USER SET nixname = ? WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nixname);
			pstmt.setString(2, userid);
			return pstmt.executeUpdate(); // return 1
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
		}
		return -1;
	}
	
	public String getProfile(String userid) {
		String SQL = "SELECT profile FROM user WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("profile").equals("")) {
					return "http://localhost:8080/morank/images/user.png";
				}
				return "http://localhost:8080/morank/upload/"+rs.getString("profile");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
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
		}
		return "http://localhost:8080/morank/images/user.png";
	}
}
