<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="service.ServiceDTO"%>
<%@ page import="service.ServiceDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login_btn.css">
<link rel="stylesheet" href="css/CS_mtm_input.css">
<script type="text/javascript" src="js/login_btn.js"></script>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	//		boolean emailChecked = new UserDAO().getUserEmailChecked(userID); //이메일 인증 안될시
	//	if(emailChecked==false){
	//	PrintWriter script = response.getWriter();
	//		script.println("<script>");
	//		script.println("location.href = 'emailSendConfirm.jsp'");
	//		script.println("</script>");
	//		script.close();
	//		return;
	//	}
	%>
	<div id="wrapper">
		<header>
			<div class="head">
				<a href="index.html"><img src="images/모두의랭킹.png" alt=""></a>
				<h2>고객센터</h2>
				<div class="login">
					<%
					if (userID == null) {
					%>
					<button type="button" class="login_btn"
						onclick="location.href='CS_main.jsp'">고객센터</button>
					<button type="button" class="login_btn"
						onclick="location.href='login.jsp'">로그인</button>
					<button type="button" class="login_btn"
						onclick="location.href='join.jsp'">회원가입</button>
					<%
					} else {
					%>
					<button type="button" class="login_btn" id="login_btn">박창주
						님▼</button>
					<div id="profile_wrap">
						<div class="hello">
							박창주 님 안녕하세요
							<div class="profile_img">
								<img src="" alt="">
							</div>
							<a href="main_mypage.html" class="mypage">마이페이지</a> <a
								href="main_mypage.html" class="mypage">고객센터</a>
							<hr>
							<form action="logoutAction">
								<a href="#" class="logout">로그아웃</a>
							</form>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</header>

		<div id="wire">
			<form action="getCategori.jsp" method="post">
				<nav>
					<ul>
						<li class="c1"><a href="#" name="notice">공지사항</a></li>
						<li class="c2"><a class="c2_1" href="serviceCenter.jsp"
							value="1" name="question">문의사항</a>
							<ul>
								<li><a href="CS_QnA.html">자주 묻는 질문</a></li>
								<li><a href="CS_mtm_list.html">1:1 문의</a></li>
							</ul></li>
					</ul>
				</nav>
			</form>
			<section>
				<article class="main_contents">
					<form action="questionAction.jsp">
						<div class="notice_list">
							<ul>
								<li><h3>문의</h3></li>
								<li><button type="submit" name ="questions" value=1><a href="CS_QnA.html">자주 묻는 질문</a></button></li>
								<li><button type="submit" name ="QandA" value=2><a href="CS_mtm_list.html">1:1 문의</a></button></li>
							</ul>
						</div>
					</form>
					<div class="main_content">
						<div class="main_title">
							<h3>1:1문의</h3>
						</div>
						<form method="post" action="serviceAction.jsp">
							<div class="main_table">
								<table class="mtm">
									<tr>
										<th>제목</th>
										<td><input type="text" name="SCTitle" maxlength="50"
											autofocus /></td>
									</tr>
									<tr>
										<th>분류</th>
										<td><select class="" name="classified">
												<option value="계정 정보">계정 정보</option>
												<option value="사이트 이용">사이트 이용</option>
												<option value="건의사항">건의사항</option>
										</select></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea name="SCContent" rows="8" cols="80"
												maxlength="2048" autofocus /></textarea></td>
									</tr>
								</table>
								<div class="text_btn">
									<button class="btn_cancle" type="button" name="button"
										onclick="location.href='CS_mtm_list.html'">취소</button>
									<button class="btn_write" type="submit" name="button">저장</button>
								</div>
							</div>
						</form>
					</div>
				</article>
			</section>
		</div>
		<footer>
			<div class="footer">
				<div class="company">
					<a style=""><img src="images/WTP.jpg" width=50px;>
						<h2>What the Pork</h2></a>
				</div>
				<div class="detail">
					<b>주소</b> : 경기 수원시 팔달구 중부대로 100 3층 <br> <b>대표</b> : 박창주
				</div>
			</div>
		</footer>
	</div>
</body>
</html>