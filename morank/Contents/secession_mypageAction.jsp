<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8"); //사용자에게 받은 데이터를 변경
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

	if (request.getParameter("pwd") != null) {
		pwd = request.getParameter("pwd");
	}

	if (request.getParameter("inputUserid") != null) {
		inputUserid = request.getParameter("inputUserid");
	}

	if (request.getParameter("repwd") != null) {
		repwd = request.getParameter("repwd");
	}

	
	if (!userid.equals(inputUserid) || !pwd.equals(repwd)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 정보가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}

	else {
		session.setAttribute("inputUserid", inputUserid);
		session.setAttribute("repwd", repwd);
		session.setAttribute("pwd", pwd);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'secession_mypageAction2.jsp'");
		script.println("</script>");
		script.close();
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>