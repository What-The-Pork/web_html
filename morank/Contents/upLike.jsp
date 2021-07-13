<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="searchdao.*"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	informationDAO tstDAO = new informationDAO();
	//String info_id = request.getParameter("info_id");
	informationDAO iDao = new informationDAO();
	String search = (String) session.getAttribute("search");
	String info_id = (String)session.getAttribute("info_id");

	
	String total = (String) session.getAttribute("total");

	int result = tstDAO.likeplus(info_id);

	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류')");
		script.println("location.href = 'contents.jsp'");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('추천 완료')");
		outter.println("location.href = 'contents.jsp?info_id="+info_id+"'");
		outter.println("</script>");
	}
	%>



</body>
</html>