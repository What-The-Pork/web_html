<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	String userid = null;
	String pwd = null;
	String repwd = null;
	String inputUserid = null;
	if(session.getAttribute("userid") != null) {
		userid = (String)session.getAttribute("userid");
		boolean emailChecked = new UserDAO().getUserEmailChecked(userid); //이메일 인증 안될시
		if(emailChecked==false){
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
	
	if (session.getAttribute("inputUserid") != null) {
		inputUserid = (String) session.getAttribute("inputUserid");
	}
	if (session.getAttribute("repwd") != null) {
		repwd = (String) session.getAttribute("repwd");
	}
	if (session.getAttribute("pwd") != null) {
		pwd = (String) session.getAttribute("pwd");
	}
	
	if (pwd == null || repwd==null || inputUserid==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류')");
		script.println("location.href = 'login.jsp'");
		script.println("<script>");
		script.close();
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userid, pwd);
	if (result == 1) {
		int reslt = userDAO.delectUser(inputUserid);
		if (reslt == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원탈퇴에 성공 하였습니다.')");
			script.println("location.href = 'logoutAction.jsp'");
			script.println("</script>");
			script.close();
		}
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}

	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	%>
</body>
</html>