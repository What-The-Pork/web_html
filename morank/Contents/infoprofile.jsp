<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="searchdao.informationDAO"%>
<%@ page import="searchdto.informationVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String title = null;

if (request.getParameter("title") != null){
	title = request.getParameter("title");
}

String info_id = null;

if (request.getParameter("info_id") != null){
	info_id = request.getParameter("info_id");
}
String total = null;

if (request.getParameter("total") != null){
	total = request.getParameter("total");
}
session.setAttribute("title", title);
session.setAttribute("info_id", info_id);
session.setAttribute("total", total);
%>
	<form action="infoprofileAction.jsp" method="post" enctype="multipart/form-data">
	<h4>정보제목</h4>
	<input type="file" name="IMG_LINK" value="">
	
	<br>
	<input type="submit" class="edit_btn" name="" value="전송">
	</form>
</body>
</html>