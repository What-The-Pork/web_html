<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="user.UserDAO" %>
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
		String nixname = null;
		int resultNixname, resultProfile;
		String directory = application.getRealPath("/upload").replaceAll("\\\\","/");
		int maxSize = 1024*1024*100;
		String encoding ="UTF-8";
		boolean next1 = false;
		boolean next2 = false;
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String profile = multipartRequest.getOriginalFileName("profile");
		
		if (session.getAttribute("userid") != null) {
			userid = (String) session.getAttribute("userid");
		}
		if (request.getParameter("nixname") != null){
			nixname = request.getParameter("nixname");
		}
		
		if (nixname == null){
			next1 = false;
		}
		else{
			resultNixname = userDAO.modifyNixname(nixname, userid);
			if(resultNixname == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("</script>");
				script.close();
				return;
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('닉네임 변경 완료')");
				script.println("</script>");
				script.close();
				next1 = true;
				return;
			}
		}
		
		if (profile == null){
			next2 = false;
		}
		else {
			resultProfile = userDAO.upload(profile, userid);
			if (resultProfile == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("</script>");
				script.close();
				return;
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('프로필 변경 완료')");
				script.println("</script>");
				script.close();
				next2 = true;
				return;
			}
		}
		if (next1 ==true || next2 == true){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정보 변경 완료')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		else if (next1 ==false && next2 == false){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정보변경 사항이 없습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		
		
	%>


</body>
</html>