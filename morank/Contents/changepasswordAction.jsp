<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); //사용자에게 받은 데이터를 변경
	String userid=null;
	String pwd=null;
	String change=null;
	String rechange=null;
	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
	}
	
	if (request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	if (request.getParameter("change") != null){
		change = request.getParameter("change");
	}
	
	if (request.getParameter("rechange") != null){
		rechange = request.getParameter("rechange");
	} 
	
	
	if (pwd==null || change==null || rechange==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	if (!change.equals(rechange)){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경 하실 비밀번호가 일치 하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userid, pwd);
	if (result == 1){
		int reslt = userDAO.changepassword(userid, change);
		if (reslt == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 수정 완료 되었습니다. 다시 로그인 해주세요')");
			script.println("location.href = 'logoutAction.jsp'");
			script.println("</script>");
			script.close();
		}
	}
	else if (result==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	else if (result==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}

	else if (result==-2) {
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