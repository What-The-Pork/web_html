<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="user.UserDAO"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		String userid = null;
		int result = 0;
		String directory = application.getRealPath("/upload").replaceAll("\\\\","/");
		int maxSize = 1024*1024*100;
		String encoding ="UTF-8";
		
		if (session.getAttribute("userid") != null) {
			userid = (String) session.getAttribute("userid");
		}
		
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String profile = multipartRequest.getOriginalFileName("profile");
		
		
		
		if (profile == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력받은 프로필 정보가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		
		else {
			userDAO.upload(profile, userid);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('프로필 변경 완료')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
		}
	%>

</body>
</html>