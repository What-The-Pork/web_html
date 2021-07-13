<%@page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@page import="searchdao.commentsDAO"%>
<%@page import="searchdto.commentsVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	UserDAO userDAO = new UserDAO();
	String userid = null;
	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
		boolean emailChecked = new UserDAO().getUserEmailChecked(userid); //이메일 인증 안될시
		if (emailChecked == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'emailSendConfirm.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	}
	String profile = userDAO.getProfile(userid);
	String comment_inputs = request.getParameter("comment_inputs");
	String info_id = (String) session.getAttribute("info_id");
	commentsDAO comm = new commentsDAO();
	int result = comm.creatcomment(new commentsVO(info_id, profile, userid, comment_inputs, 0));
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("location.href = 'contents.jsp'");
		script.println("</script>");
		script.close();
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 등록 완료')");
		script.println("location.href = 'contents.jsp'");
		script.println("</script>");
		script.close();
	}
	%>
</body>
</html>