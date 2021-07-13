package user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


import java.sql.Connection;
import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userid, String pwd) { // 로그인을 시도해주는 메소드
		String SQL = "SELECT pwd FROM USER WHERE userid = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery(); //executeQuery: 데이터를 조회
			if(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					return 1; //로그인 성공
				}
				else {
					return 0; // 비밀번호 오류
				}
			}
			return -1; // 아이디 없음
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
		return -2; //디비 오류
	}
	
	
	
	public int changepassword(String userid, String change) { // 로그인을 시도해주는 메소드
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
		return -1; //디비 오류
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
	
	public int join(UserDTO user) { // 회원가입을 해주는 메소드
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
			return pstmt.executeUpdate(); // executeUpdate : 데이터를 반환
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
		return -1; //회원가입 실패
	}
	
	public String getUserEmail(String userid) { // 인증메일을 송신할때 유저의 이메일 정보를 가져오는 메소드
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
		return null; //데이터베이스 오류
	}
	
	public boolean getUserEmailChecked(String userid) { // 유저가 이메일 인정절차를 완료했는지 확인 하는 메소드
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
		return false; //데이터베이스 오류
	}
	

	public boolean setUserEmailChecked(String userID) { // 사용자의 이메일 전송을 해주는 메소드
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
		return false; //데이터베이스 오류
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
		return -1; //데이터베이스 오류
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
