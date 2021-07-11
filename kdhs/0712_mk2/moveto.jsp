<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	Int moveinfonum = request.getParameter("moveinfonum");

	Connection con = null;
	PreparedStatement pstmt = null;


		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "kdh", "kdh331");
			PreparedStatement pstmt = conn.prepareStatement("select * from search_info_result where info_id =?");
			pstmt.setInt(1,moveinfonum);
			ResultSet rs = pstmt.executeQuery("select * from search_info_result where info_id =?");
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
	%>
	
</body>
</html>