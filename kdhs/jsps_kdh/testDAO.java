package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class testDAO {

	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	
	public testDTO getinfo() {

		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "kdh", "kdh331");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from search_info_result where info_id =2");
			
			if (rs.next()) {
				testDTO tstDTO = new testDTO();
				tstDTO.setINFO_ID(rs.getInt(1));
				tstDTO.setINFO_TITLE(rs.getString(2));
				tstDTO.setLIKE_NUM(rs.getInt(3));
				tstDTO.setIMG_LINK(rs.getString(4));
				tstDTO.setRANK_INFO_ID(rs.getInt(5));
				tstDTO.setCOMMENT_NUM(rs.getInt(6));
				tstDTO.setCOMMENT_INFO(rs.getString(7));
				tstDTO.setINFO_CONTENT(rs.getString(8));
				return tstDTO;
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
				if (stmt != null)
					stmt.close();
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
	
	
	public ArrayList<testDTO> getcomments()
	{	
		ArrayList<testDTO> ArrtDto = new ArrayList<testDTO>();
		
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "kdh", "kdh331");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from commentss where comment_num=1");
		
		
		while (rs.next()) {
			testDTO tstDTO = new testDTO();
			tstDTO.setCOMMENT_NUM(rs.getInt(1));
			tstDTO.setCOMMENT_PROFILE(rs.getString(2));
			tstDTO.setCOMMENT_ID(rs.getString(3));
			tstDTO.setCOMMENT_INFO(rs.getString(4));
			tstDTO.setCOMMENT_LIKE(rs.getInt(5));
			ArrtDto.add(tstDTO);
		
			
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
			if (stmt != null)
				stmt.close();
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
	return ArrtDto;
	}
	
	
	public ArrayList<testDTO> getMiniRanks()
	{	
		ArrayList<testDTO> ArrtDto1 = new ArrayList<testDTO>();
		
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "kdh", "kdh331");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select img_link, info_title, like_num from search_info_result order by like_num DESC");
		
		
		while (rs.next()) {
			testDTO tstDTO = new testDTO();
			tstDTO.setIMG_LINK(rs.getString(1));
			tstDTO.setINFO_TITLE(rs.getString(2));
			tstDTO.setLIKE_NUM(rs.getInt(3));
			
			ArrtDto1.add(tstDTO);
		
			
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
			if (stmt != null)
				stmt.close();
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
	return ArrtDto1;
	}
	
	
}
