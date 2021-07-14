<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	UserDAO userDAO = new UserDAO();
	request.setCharacterEncoding("UTF-8"); //사용자에게 받은 데이터를 변경
	String userid = null;
	String nixname = null;
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
	if (request.getParameter("nixname") != null){
		nixname = request.getParameter("nixname");
	}

	
	if (nixname != null){
		userDAO.modifyNixname(nixname, userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('닉네임 변경 완료')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	
	%>
</body>
</html>