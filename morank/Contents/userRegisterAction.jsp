<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8"); //사용자에게 받은 데이터를 변경
	String userid=null;
	String pwd=null;
	String nixname=null;
	String email = null;
	String review = null;
	
	if (request.getParameter("userid") != null){
		userid = request.getParameter("userid");
	}
	if (request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	if (request.getParameter("nixname") != null){
		nixname = request.getParameter("nixname");
	}
	if (request.getParameter("review") != null){
		review = request.getParameter("review");
	}
	if (request.getParameter("email") != null){
		email = request.getParameter("email");
	}
	
	if (!pwd.equals(review)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	if (userid==null || pwd==null || nixname==null || email==null || review==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userid, pwd, nixname, email ,SHA256.getSHA256(email), false,0,null));
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	else {
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'join3.jsp'");
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