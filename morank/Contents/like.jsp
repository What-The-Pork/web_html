<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="searchdao.informationDAO" %>
<%@ page import="searchdto.informationVO" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String info_id = request.getParameter("info_id");
	informationDAO iDao = new informationDAO();
	String search = (String)session.getAttribute("search");
	String total = (String)session.getAttribute("total");
	
	int result1 = iDao.likeplus(info_id);
	PrintWriter script  = response.getWriter();
	script.println("<script>");
	script.println("location.href='ranking.jsp?showcate="+total+"'");
	script.println("</script>");
	script.close();
	
						
	
%>
</body>
</html>