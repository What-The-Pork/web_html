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
	String checkPoint = request.getParameter("checkPoint");

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

	if (checkPoint == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('약관에 모두 동의해 주세요')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'secession_mypage_Input.jsp'");
		script.println("</script>");
		script.close();
	}
	%>
</body>
</html>