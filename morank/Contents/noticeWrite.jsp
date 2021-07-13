<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
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
	String userid = null;
	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
		boolean emailChecked = new UserDAO().getUserEmailChecked(userid); //이메일 인증 안될시
		if (emailChecked == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'join3.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	}
	if (userid == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요')");
		script.println("location.href = 'login.jsp'");
		script.println("<script>");
		script.close();
	}

	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.getuser(userid);
	if (user.getUserAvailable() != 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근 입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("<script>");
		script.close();
	}
	//		boolean emailChecked = new UserDAO().getUserEmailChecked(userID); //이메일 인증 안될시
	//	if(emailChecked==false){
	//	PrintWriter script = response.getWriter();
	//		script.println("<script>");
	//		script.println("location.href = 'emailSendConfirm.jsp'");
	//		script.println("</script>");
	//		script.close();
	//		return;
	//	}
	%>
	<form action="noticeWriteAction.jsp" medhod="post">
		<div>
			<h4>공지제목</h4>
			<input type="text" class="id" name="noticeTitle" placeholder="공지제목"
				maxlength="50">
			<h4>공지글</h4>
			<textarea name="noticeContent" rows="8" cols="80" maxlength="2048"
				autofocus /></textarea>
		</div>
		<input type="submit" class="confirm" value="확인">
		<button type="button" class="cancle" name="button"
			onclick="location.href='serviceCenter.jsp'">취소</button>
	</form>
</body>
</html>