<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="service.ServiceDAO"%>
<%@ page import="service.ServiceDTO"%>
<%@page import="user.UserDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
	String notice = request.getParameter("notice");
	String question = request.getParameter("question");
	
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
		script.println("alert('로그인하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
	}
	String scTitle = null;
	String scContent= null;
	String classified=null;
	
	if (request.getParameter("scTitle") != null){
		scTitle = request.getParameter("scTitle");
	}
	if (request.getParameter("scContent") != null){
		scContent = request.getParameter("scContent");
	}
	if (request.getParameter("classified") != null){
		classified = request.getParameter("classified");
	}
	
	if (scTitle == null || scContent == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	ServiceDAO ServiceDAO = new ServiceDAO();
	int result = ServiceDAO.write(new ServiceDTO(0, scTitle, userid, scContent, 1, ServiceDAO.getDate(), 0,0,classified,null));
	if (result == -1){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('글쓰기에 실패 했습니다.')");
		outter.println("history.back()");
		outter.println("</script>");
	}
	else {
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("location.href = 'serviceQnA.jsp'");
		outter.println("</script>");
	}
	
	%>
	
	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>