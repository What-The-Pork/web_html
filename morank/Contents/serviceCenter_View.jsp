<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="notice.NoticeDTO"%>
<%@ page import="notice.NoticeDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/CS_main.css">
<link rel="stylesheet" href="css/login_btn.css">
<script type="text/javascript" src="js/login_btn.js"></script>
</head>
<body>
	<%
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

	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.getuser(userid);
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> list = noticeDAO.getList();
	
	String noticeid = null;
	if (request.getParameter("noticeid") != null){
		noticeid = (String)request.getParameter("noticeid");
	}
	
	NoticeDAO play = new NoticeDAO();
	NoticeDTO show = play.getnotice(noticeid);
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
					<button type="button" class="login_btn" id="login_btn"><%= user.getNixname()+"▼" %></button>
					<div id="profile_wrap">
						<div class="hello">
							<%= user.getNixname() + " 님 안녕하세요" %>
							<div class="profile_img">
								<img src="<%=profile %>" alt="">
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
							<li><a href="#"><h3>공지사항</h3></a></li>
							<%
								for (int i=0; i<list.size(); i++){
									NoticeDTO notice = list.get(i);
								%>
									<li><a href="serviceCenter_View.jsp?noticeid=<%=notice.getNoticeid()%>"><%= notice.getNoticeTitle() %></a></li>								
								<%
								}
							%>
						</ul>
					</div>
					<div class="main_content">
						<div class="main_title">
							<h3><%=show.getNoticeTitle() %></h3>
						</div>
						<div class="main_text">
							<%= show.getNoticeContent() %>
						</div>
					</div>
				</article>
				<%
				if (user.getUserAvailable()==1){
				%>
				<button onclick="location.href='noticeWrite.jsp'">공지사항 작성</button>
				<%
				}
				%>
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