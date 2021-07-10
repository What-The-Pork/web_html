<%@page import="java.sql.*"%>
<%@page import="test.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String comment_inputs = request.getParameter("comment_inputs");

	Connection con = null;
	PreparedStatement pstmt = null;

	String sql = "INSERT INTO COMMENTSS VALUES(?,?,?,?,?)";

	int n = 0;
	if (comment_inputs != null && comment_inputs != "") {

		try {
			con = DBConnection.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2,
			"https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/436/8142f53e51d2ec31bc0fa4bec241a919_crop.jpeg");
			pstmt.setString(3, "???");
			pstmt.setString(4, comment_inputs);
			pstmt.setInt(5, 0);
			n = pstmt.executeUpdate();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
			} catch (SQLException se) {
		System.out.println("se.getMessage()");
			}
		}
	}
	%>

	<script type="text/javascript">
		if (
	<%=n%>
		> 0) {
			alert("댓글 등록!!");
			location.href = "Search_info_test.jsp";
		} else {
			alert("실패");
			history.go(-1);
		}
	</script>

</body>
</html>