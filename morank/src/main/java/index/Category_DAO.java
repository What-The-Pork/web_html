package index;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class Category_DAO {
	public ArrayList<Category_dto> getinfo_movie(){
		String sql = "select * from movie order by star desc";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Category_dto> mal = new ArrayList<Category_dto>();
		
		
		try {
			conn = DatabaseUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			res = stmt.executeQuery();
			while(res.next()) {
			Category_dto td = new Category_dto();
			td.setName(res.getString(1));
			td.setOpen(res.getInt(2));
			td.setGenre(res.getString(3));
			td.setCurture(res.getString(4));
			td.setProducer(res.getString(5));
			td.setStar(res.getInt(6));
			td.setUrl(res.getString(7));
			mal.add(td);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         try {
	             if (conn != null)
	                conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (stmt != null)
	                stmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (res != null)
	                res.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		return mal;
	}
	public ArrayList<Category_dto> getinfo_game(){
		String sql = "select * from game order by star desc";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Category_dto> mal = new ArrayList<Category_dto>();
		
		
		try {
			conn = DatabaseUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			res = stmt.executeQuery();
			while(res.next()) {
			Category_dto td = new Category_dto();
			td.setName(res.getString(1));
			td.setOpen(res.getInt(2));
			td.setGenre(res.getString(3));
			td.setCurture(res.getString(4));
			td.setProducer(res.getString(5));
			td.setStar(res.getInt(6));
			td.setUrl(res.getString(7));
			mal.add(td);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         try {
	             if (conn != null)
	                conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (stmt != null)
	                stmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (res != null)
	                res.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		return mal;
	}
	public ArrayList<Category_dto> getinfo_book(){
		String sql = "select * from book order by star desc";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Category_dto> mal = new ArrayList<Category_dto>();
		
		
		try {
			conn = DatabaseUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			res = stmt.executeQuery();
			while(res.next()) {
			Category_dto td = new Category_dto();
			td.setName(res.getString(1));
			td.setOpen(res.getInt(2));
			td.setGenre(res.getString(3));
			td.setCurture(res.getString(4));
			td.setProducer(res.getString(5));
			td.setStar(res.getInt(6));
			td.setUrl(res.getString(7));
			mal.add(td);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         try {
	             if (conn != null)
	                conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (stmt != null)
	                stmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (res != null)
	                res.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		return mal;
	}
	public ArrayList<Category_dto> getinfo_drama(){
		String sql = "select * from drama order by star desc";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Category_dto> mal = new ArrayList<Category_dto>();
		
		
		try {
			conn = DatabaseUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			res = stmt.executeQuery();
			while(res.next()) {
			Category_dto td = new Category_dto();
			td.setName(res.getString(1));
			td.setOpen(res.getInt(2));
			td.setGenre(res.getString(3));
			td.setCurture(res.getString(4));
			td.setProducer(res.getString(5));
			td.setStar(res.getInt(6));
			td.setUrl(res.getString(7));
			mal.add(td);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         try {
	             if (conn != null)
	                conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (stmt != null)
	                stmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (res != null)
	                res.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		return mal;
	}
	public ArrayList<Category_dto> getinfo_annie(){
		String sql = "select * from annie order by star desc";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Category_dto> mal = new ArrayList<Category_dto>();
		
		
		try {
			conn = DatabaseUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			res = stmt.executeQuery();
			while(res.next()) {
			Category_dto td = new Category_dto();
			td.setName(res.getString(1));
			td.setOpen(res.getInt(2));
			td.setGenre(res.getString(3));
			td.setCurture(res.getString(4));
			td.setProducer(res.getString(5));
			td.setStar(res.getInt(6));
			td.setUrl(res.getString(7));
			mal.add(td);
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         try {
	             if (conn != null)
	                conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (stmt != null)
	                stmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          try {
	             if (res != null)
	                res.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
		return mal;
	}	

}
