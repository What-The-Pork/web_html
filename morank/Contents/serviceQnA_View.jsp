<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.ServiceDAO"%>
<%@ page import="service.ServiceDTO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login_btn.css">
<link rel="stylesheet" href="css/CS_mtm_ex.css">
<script type="text/javascript" src="js/login_btn.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
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
		script.println("</script>");
		script.close();
	}
	String scid = null;
	if (request.getParameter("scid") != null) {
		scid = (String) request.getParameter("scid");
	}
	session.setAttribute("scid", scid);
	ServiceDAO svDAO = new ServiceDAO();
	ServiceDTO svDTO = svDAO.getSC(scid);
	svDAO.good(scid);
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.getuser(userid);
	String profile = new UserDAO().getProfile(userid);
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
				<a href="index.jsp"><img src="images/모두의랭킹.png" alt=""></a>
				<h2>고객센터</h2>
				<div class="login">
					<%
					if (userid == null) {
					%>
					<button type="button" class="login_btn"
						onclick="location.href='serviceCenter.jsp'">고객센터</button>
					<button type="button" class="login_btn"
						onclick="location.href='login.jsp'">로그인</button>
					<button type="button" class="login_btn"
						onclick="location.href='join.jsp'">회원가입</button>
					<%
					} else {
					%>
					<button type="button" class="login_btn" id="login_btn"><%=user.getNixname() + "▼"%></button>
					<div id="profile_wrap">
						<div class="hello">
							<%=user.getNixname() + " 님 안녕하세요"%>
							<div class="profile_img">
								<img src="<%=profile%>" alt="">
							</div>
							<a href="mypageMain.jsp" class="mypage">마이페이지</a> <a
								href="serviceCenter.jsp" class="mypage">고객센터</a>
							<hr>
							<form action="logoutAction">
								<a href="logoutAction.jsp" class="logoutAction.jsp">로그아웃</a>
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
			<nav>
				<ul>
					<li class="c1"><a href="serviceCenter.jsp">공지사항</a></li>
					<li class="c2"><a class="c2_1" href="serviceQnA.jsp">문의사항</a>
						<ul>
							<li><a href="hitQuestion.jsp">자주 묻는 질문</a></li>
							<li><a href="serviceQnA.jsp">1:1 문의</a></li>
						</ul></li>
				</ul>
			</nav>
			<section>
				<article class="main_contents">
					<div class="notice_list">
						<ul>
							<li><h3>문의</h3></li>
							<li><a href="hitQuestion.jsp">자주 묻는 질문</a></li>
							<li><a href="serviceQnA.jsp">1:1 문의</a></li>
						</ul>
					</div>
					<div class="main_content">
						<div class="main_title">
							<h3>1:1문의</h3>
						</div>
						<div class="main_table">
							<table class="mtm">
								<tr>
									<th>제목</th>
									<td><%=svDTO.getScTitle()%></td>
								</tr>
								<tr>
									<th>분류</th>
									<td><%=svDTO.getClassified()%></td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><%=svDTO.getScDate().substring(2, 4) + "-" + svDTO.getScDate().substring(5, 7) + "-"
		+ svDTO.getScDate().substring(8, 10)%></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><%=svDTO.getScContent()%></td>
								</tr>
								<tr>
									<th>답변</th>
									<%
									if (svDTO.getStatused() == 0) {
									%>
									<td>진행중</td>

									<%
									} else if (svDTO.getStatused() == 1) {
									%>
									<td><%=svDTO.getScAnswer()%></td>
									<%
									}
									%>
								</tr>
							</table>
						</div>
						<%
						if (svDTO.getUserid().equals(userid)) {
						%>
						<div class="text_btn">
							<form action="SC_Modify.jsp" medhod="post">
								<button type="submit" class="edit_btn" name="button" onclick="">수정</button>
							</form>
							<form action="SC_Delect.jsp" medhod="post">
								<button type="submit" class="delete_btn" name="button"
									onclick="">삭제</button>
							</form>
						</div>

						<%
						}
						%>
						<%
						if (userid != null){
						if (user.getUserAvailable() == 1) {
						%>
						<button onclick="location.href='QnA_Answer.jsp'">답변 작성</button>
						<%
						}
						}
						%>
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