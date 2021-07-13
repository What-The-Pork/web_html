<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8"); //사용자에게 받은 데이터를 변경
	String userid=null;
	String userPassword=null;
	
	if (request.getParameter("userid") != null){
		userid = request.getParameter("userid");
	}
	if (request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	
//	if (userPassword != review) {
//		PrintWriter script = response.getWriter();
//		script.println("<script>");
//		script.println("alert('비밀번호가 일치하지 않습니다.')");
//		script.println("history.back()");
//		script.println("</script>");
//		script.close();
//		return;
//	}
	
	if (userid==null || userPassword==null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userid, userPassword);
	if (result == 1){
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
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
		script.println("alert('존재하지 않은 아이디 입니다.')");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div class="logo">
			<a href="index.html"><img src="images/모두의랭킹6.png" alt=""></a>
		</div>
		<div class="button">
			<img src="images/join_button_off.png" alt=""> <img
				src="images/join_button_off.png" alt=""> <img
				src="images/join_button.png" alt=""> <img
				src="images/join_button_off.png" alt="">
		</div>
		<p class="title">이메일 전송 안내</p>
		<hr>
		<div class="contents">
			<p>
				<a href="https://nid.naver.com/"><u>cj0369@naver.com</u></a>(으)로 인증
				메일이 발송되었습니다.
			</p>
		</div>
		<button type="button" class="email-check" name="button"
			onclick="location.href='http://www.naver.com'">메일 확인하러 가기</button>
		<div class="footer">
			메일을 받지 못하셨나요? <a href="#"> 다시 보내기 </a>
		</div>
	</div>
	<footer>Changju Co.</footer>
</body>
</html>