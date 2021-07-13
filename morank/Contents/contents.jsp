<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="searchdao.*"%>
<%@page import="searchdto.*"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
String userid = null;
if (session.getAttribute("userid") != null) {
	userid = (String) session.getAttribute("userid");
	boolean emailChecked = new UserDAO().getUserEmailChecked(userid); //이메일 인증 안될시
	if (emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
}

UserDAO userDAO = new UserDAO();
UserDTO user = userDAO.getuser(userid);
String profile = new UserDAO().getProfile(userid);
%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getRequestURL().toString();
if (request.getQueryString() != null)
	url = url + "?" + request.getQueryString();
%>
<script id="thislink"><%=url%></script>
<link rel="stylesheet" href="css/contents.css">
<script type="text/javascript" src="js/contents.js"></script>
<script src="https://kit.fontawesome.com/b71cf75717.js"
	crossorigin="anonymous"></script>
<script id="thislink">
	http: //localhost:8080/MorangWebPage/Search_info_test.jsp
</script>
<meta charset="utf-8">
<link rel="stylesheet" href="css/login_btn.css">
<script type="text/javascript" src="js/login_btn.js"></script>
<title>모랭검색테스트</title>

</head>

<body>

	<%
	String info_id = null;
	
	if (session.getAttribute("info_id") != null) {
		info_id = (String) session.getAttribute("info_id");
	}
	if (request.getParameter("info_id") != null) {
		info_id = request.getParameter("info_id");
		session.setAttribute("info_id", info_id);
	}

	String total = (String) session.getAttribute("total");
	informationDAO iDao = new informationDAO();
	commentsDAO cDao = new commentsDAO();
	ArrayList<commentsVO> arrtDto = cDao.getcomments(info_id);

	ArrayList<informationVO> arrtDto1 = iDao.getMiniRanks(total);
	informationDAO profileinfo = new informationDAO();

	informationVO iVo = iDao.getinfo(info_id);

	String title = iVo.getInfo_name();
	String img = profileinfo.bringProfile(title);
	String content = iVo.getInfo_content();
	%>


	<div id="frame">
		<header>
			<div class="head">
				<a href="sesionout.jsp"><img src="images/모두의랭킹.png" alt=""></a>
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
							<img src="<%=profile%>" class="prof_img" alt="">
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
		</header>
		<div id="wire">
			<%
			if (img == null && user.getUserAvailable() == 1) {
				session.setAttribute("info_name", title);
			%>

			<h4>이미지 등록 하기</h4>
			<button type="button" class="cancle" name="button"
				onclick="location.href='infoprofile.jsp'">등록</button>
			<%
			}
			%>
			<section>
				<div class="search">
					<input class="keyword" type="text" name="search" maxlength=255
						value="" autocomplete="off">
					<button class="img-button" type="submit" name="click" value="">

						<i class="fas fa-meteor"></i>
					</button>
				</div>

				<h3><%=title%></h3>

				<div class="parent_container">

					<div class="container">
						<div class="cont_img">
							<img src="<%=img%>">

						</div>


						<div class="contain_info">
							<p id=info_content>
								<%=content%>
							</p>
						</div>
						<button type="button" class="cont_img_bt">
							<a href="javascript:OpenPopimg();">이미지 더보기</a>
						</button>
						<button type="button" class="more">
							<a href="javascript:OpenPop();">더보기</a>
						</button>



						<div class="likeNshare">


							<button type="button" class="like_share_button" id=likebtn
								onclick="location.href = 'upLike.jsp'">추천</button>


							<button type="button" class="like_share_button" id=sharebtn
								onclick="copyToClipboard('thislink')">공유</button>
						</div>


						<div id="img_popup_layer" style="display: none">
							<div class="popup_box">
								<!--팝업 컨텐츠 영역-->
								<div class="popup_cont">
									<h2><%=title%></h2>
									<div class="popup_img">
										<img src="<%=img%>" width="100%;">
									</div>
								</div>
								<!--팝업 버튼 영역-->
								<div class="popup_btn">
									<!--하루동안 보지않기-->

									<!--7일간 보지않기-->
									<!-- <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for 7 days</a>-->
									<a href="javascript:closePopimg();">Close</a>
								</div>
							</div>
						</div>

						<div id="popup_layer" style="display: none">
							<div class="popup_box">
								<!--팝업 컨텐츠 영역-->
								<div class="popup_cont">
									<h2><%=title%></h2>
									<p>
										<%=content%>

									</p>
								</div>
								<!--팝업 버튼 영역-->
								<div class="popup_btn">
									<!--하루동안 보지않기-->

									<!--7일간 보지않기-->
									<!-- <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for 7 days</a>-->
									<a href="javascript:closePop();">Close</a>
								</div>
							</div>
						</div>


					</div>

					<div class="center_container">

						<%
						for (int i = 0; i < arrtDto.size(); i++) {
							commentsVO notice = arrtDto.get(i);
						%>
						<div class="comment_box" name="commentboxs">
							<img src="<%=notice.getUser_img()%>">
							<%=notice.getUser_id() + " : " + notice.getComments_info()%>

						</div>
						<%
						}
						%>
						<form action="insert.jsp" id="formcss" name="form1" method="post"
							onsubmit="formCheck()">

							<textarea name="comment_inputs" id="comment_input" rows="8"
								cols="80" maxlength=215></textarea>
							<input type="submit" id="comment_into_db" value="댓글 달기" />

						</form>

					</div>

					<div class="sub_container">


						<%
						for (int i = 0; i < arrtDto1.size(); i++) {
							informationVO notice = arrtDto1.get(i);
							String img1 = profileinfo.bringProfile(notice.getInfo_name());
						%>
						<div class="ranking_box">
							<img src="<%=img1%>">
							<%=notice.getInfo_name() + " : " + notice.getLikeamount()%>
							<form action="moveto.jsp" name="form_move2" method="post">

								<a href="contents.jsp?info_id=<%=notice.getInfo_id()%>">이동</a>
							</form>
						</div>
						<%
						}
						%>



					</div>



				</div>
		</div>
		</section>

		<footer>
			<div class="footer" id="foot">
				<div class="company" id="foot">
					<a style=""><img src="images/WTP.jpg" width="50px;">
						<h2>What the Pork</h2></a>
				</div>
				<div class="detail" id="foot">
					<b>주소</b> : 경기 수원시 팔달구 중부대로 100 3층 <br> <b>대표</b> : 박창주
				</div>
			</div>

		</footer>
	</div>

	</div>

</body>
</html>