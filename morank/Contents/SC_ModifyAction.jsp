<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.ServiceDAO"%>
<%@ page import="java.io.PrintWriter"%>
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
	String scid = null;
	if (session.getAttribute("scid") != null) {
		scid = (String) session.getAttribute("scid");
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
	
	ServiceDAO serviceDAO = new ServiceDAO();
	int result = serviceDAO.QnA_modify(scTitle, scContent, serviceDAO.getDate(), classified, scid);
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
		outter.println("alert('수정완료')");
		outter.println("location.href = 'serviceQnA.jsp'");
		outter.println("</script>");
	}
	%>
</body>
</html>