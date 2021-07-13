package searchdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import notice.NoticeDTO;
import searchdto.informationVO;
import util.DatabaseUtil;

public class informationDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 검색어 입력시 카테고리 출력
	public ArrayList<informationVO> showcategory (String search) {
		ArrayList<informationVO> list = new ArrayList<informationVO>();
		String sql = "SELECT distinct SmallC_id, BigC_id FROM information WHERE keyword LIKE ?";
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ search +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				informationVO iVo = new informationVO();
				iVo.setSmallC_id(rs.getString(1));
				iVo.setBigC_id(rs.getString(2));
				list.add(iVo);
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
	
	// 카테고리 선택시 랭킹 리스트 출력
	public ArrayList<informationVO> showranklist (String select) {
		ArrayList<informationVO> list = new ArrayList<informationVO>();
		String sql = "select info_name, likeamount, info_id from information where CONCAT(SmallC_id,BigC_id) = ? order by likeamount desc";
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, select);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				informationVO iVo = new informationVO();
				iVo.setInfo_name(rs.getString(1));
				iVo.setLikeamount(rs.getInt(2));
				iVo.setInfo_id(rs.getString(3));
				list.add(iVo);
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
	
	public int likeplus(String info_id) {
		String sql = "update information set likeamount = likeamount + 1 where info_id = ? ";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info_id);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; 
		
	}
	
	public int likeminus(String info_id) {
		String sql = "update information set likeamount = likeamount - 1 where info_id = ? ";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info_id);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; 
		
	}
	
	// contents 페이지 에서 모든 정보를 출력
	public informationVO getinfo(String info_id) {
		String sql = "select info_id, info_name, likeamount, img_link, info_content from information where info_id =?";
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				informationVO cVo = new informationVO();
				cVo.setInfo_id(rs.getString(1));
				cVo.setInfo_name(rs.getString(2));
				cVo.setLikeamount(rs.getInt(3));
				cVo.setImg_link(rs.getString(4));
				cVo.setInfo_content(rs.getString(5));
				return cVo;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	// 다른 랭킹 보기
	public ArrayList<informationVO> getMiniRanks(String category) {
		ArrayList<informationVO> ArrtDto1 = new ArrayList<informationVO>();
		String sql = "SELECT info_id, img_link, info_name, likeamount FROM information WHERE CONCAT(SmallC_id,BigC_id) = ? ORDER BY likeamount DESC;";
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				informationVO iVo = new informationVO();
				iVo.setInfo_id(rs.getString(1));
				iVo.setImg_link(rs.getString(2));
				iVo.setInfo_name(rs.getString(3));
				iVo.setLikeamount(rs.getInt(4));

				ArrtDto1.add(iVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ArrtDto1;
	}

	
	public ArrayList<informationVO> getindexinfo(String BigC_id) {
		String SQL = "SELECT * FROM information WHERE BigC_id=? order by likeamount desc LIMIT 10";
		ArrayList<informationVO> arr = new ArrayList<informationVO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, BigC_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				informationVO infoVO = new informationVO(); 
				infoVO.setSmallC_id(rs.getString("SmallC_id"));
				infoVO.setInfo_id(rs.getString("info_id"));
				infoVO.setInfo_name(rs.getString("info_name"));
				infoVO.setLikeamount(rs.getInt("LIKEAMOUNT"));
				infoVO.setProducer(rs.getString("producer"));
				arr.add(infoVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return arr;
	}
	
	public int writeinfo(informationVO infoVO) {

		String SQL = "INSERT INTO information VALUES (?, ?, ?, ?, ?, ?, NULL, NULL, ?)";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, infoVO.getBigC_id());
			pstmt.setString(2, infoVO.getSmallC_id());
			pstmt.setString(3, infoVO.getInfo_id());
			pstmt.setString(4, infoVO.getInfo_name());
			pstmt.setString(5, infoVO.getKeyword());
			pstmt.setString(6, infoVO.getInfo_content());
			pstmt.setString(7, infoVO.getProducer());
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
	
	public ArrayList<informationVO> getallinfo() {
		String SQL = "SELECT * FROM information";
		ArrayList<informationVO> arr = new ArrayList<informationVO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				informationVO infoVO = new informationVO();
				infoVO.setBigC_id(rs.getString("BigC_id"));
				infoVO.setSmallC_id(rs.getString("SmallC_id"));
				infoVO.setInfo_id(rs.getString("info_id"));
				infoVO.setInfo_name(rs.getString("info_name"));
				infoVO.setKeyword(rs.getString("keyword"));
				infoVO.setInfo_content(rs.getString("info_content"));
				infoVO.setLikeamount(rs.getInt("LIKEAMOUNT"));
				infoVO.setImg_link(rs.getString("IMG_LINK"));
				infoVO.setProducer(rs.getString("producer"));
				arr.add(infoVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return arr;
	}
	
	public int getProfile(String IMG_LINK, String info_name) {
		String SQL = "UPDATE information SET IMG_LINK = ? WHERE info_name = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, IMG_LINK);
			pstmt.setString(2, info_name);
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
	
	public String bringProfile(String info_name) {
		String SQL = "SELECT IMG_LINK FROM information WHERE info_name = ?";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, info_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("IMG_LINK").equals("")) {
					return null;
				}
				return "http://localhost:8080/morank/upload/"+rs.getString("IMG_LINK");
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
		return null;
	}
}

