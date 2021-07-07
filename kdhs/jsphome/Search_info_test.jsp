
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>



<!DOCTYPE html>
<html>



<head>

<link rel="stylesheet" href="search_info_test.css">
<script type="text/javascript" src="search_info_test.js"></script>
<script src="https://kit.fontawesome.com/b71cf75717.js"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<title>모랭검색테스트</title>

</head>

<body>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "kdh", "kdh331");
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from search_info_result where info_id=2");

	String content = "";
	String title = "";
	String img = "";
	String comment = "";
	int like = 0;

	while (rs.next()) {
		
		content = rs.getString("info_content");
		title = rs.getString("info_title");
		img = rs.getString("img_link");
		like = rs.getInt("like_num");
		comment = rs.getString("comment_info");

	}

	stmt.close();
	conn.close();
	%>


	<div id="frame">
		<header>
			<div class="head">
				<a href="index.html"><img src="logo/모두의랭킹.png" alt=""></a>
				<button type="button"
					style="width: 50px; height: 50px; float: right; padding-top: 0px;">=</button>
			</div>
		</header>
		<div id="wire">

			<section>
				<div class="search">
					<input class="keyword" type="text" name="search" maxlength=255
						value="" autocomplete="off">
					<button class="img-button" type="submit" name="click" value="">
						<i class="fas fa-meteor"></i>
					</button>
				</div>

				<div class="category">
					<ul>
						<li><a href="#">영화</a>
							<ul class="view" id="view">
								<li><a href="#">코미디</a></li>
								<li><a href="#">멜로</a></li>
								<li><a href="#">연애</a></li>
								<li><a href="#">로맨스</a></li>
								<li><a href="#">성인</a></li>
								<li><a href="#">공</a></li>
							</ul></li>
						<li><a href="#">게임</a></li>
						<li><a href="#">스포츠</a></li>
						<li><a href="#">드라마</a></li>
						<li><a href="#">먹거리</a></li>
						<li><a href="#">음식점</a></li>
						<li><a href="#">명소</a></li>
						<li><a href="#">명화</a></li>
						<li><a href="#">인물</a></li>
						<li><a href="#">주식</a></li>
						<li><a href="#">연예</a></li>
						<button type="button" name="button" onclick="view2()"></button>
						<button type="button" onclick="javascript:display();">더보기▼</button>

					</ul>
				</div>




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
								onclick="ClickLikeButton()">추천</button>
							<button type="button" class="like_share_button" id=sharebtn
								onclick="copyToClipboard('getPageName()')">공유</button>
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
						<div class="comment_box">
							<img src="logo/모두의랭킹5.png">
							<%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹3.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹2.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						<div class="comment_box">
							<img src="logo/모두의랭킹.png"> <%=comment%>
						</div>
						

					</div>


					<div class="sub_container">

						<div class="ranking_box">
							<img src="<%=img%>">
							
							좋아요 수 : <%=like%>
						</div>
						<div class="ranking_box">
							<img src="logo/모두의랭킹5.png"> sadf
						</div>
						<div class="ranking_box">
							<img src="logo/모두의랭킹5.png"> sadf
						</div>
						<div class="ranking_box">
							<img src="logo/모두의랭킹5.png"> sadf
						</div>
					</div>

				</div>
			</section>
		</div>

	</div>

</body>
</html>