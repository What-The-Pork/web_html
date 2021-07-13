<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.ServiceDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userid = null;
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
		script.println("</script>");
		script.close();
	}
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.getuser(userid);
	if (user.getUserAvailable()!=1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근 입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
	}
	String scid = null;
	if (session.getAttribute("scid") != null) {
		scid = (String) session.getAttribute("scid");
	}
	String answer = null;
	
	if (request.getParameter("answer") != null){
		answer = request.getParameter("answer");
	}
	
	ServiceDAO service = new  ServiceDAO();
	int result = service.answer(answer, scid);
	if (result == -1){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('데이터베이스 오류')");
		outter.println("history.back()");
		outter.println("</script>");
	}
	else {
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('답변 완료')");
		outter.println("location.href = 'serviceQnA.jsp'");
		outter.println("</script>");
	}
	%>
</body>
</html>