<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/join3.css">
</head>
<body>
	<%
	String userid = null;
	if (session.getAttribute("userid") != null) {
		userid = (String) session.getAttribute("userid");
	}
	if (userid != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태 입니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("<script>");
		script.close();
	}
	%>
	<div id="wrapper">
		<div class="logo">
			<a href="index.jsp"><img src="images/모두의랭킹6.png" alt=""></a>
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