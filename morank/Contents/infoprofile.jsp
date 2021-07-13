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
<%String info_name = (String)session.getAttribute("info_name"); %>
	<form action="infoprofileAction.jsp" method="post" enctype="multipart/form-data">
	<h4>정보제목</h4>
	<input type="file" name="IMG_LINK" value="">
	<br>
	<button type="submit" class="edit_btn" name="button" value="">수정</button>
	</form>
</body>
</html>