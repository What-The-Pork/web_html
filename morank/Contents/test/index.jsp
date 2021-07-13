<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>   
<%@ page import = "user.UserDAO" %>   
<%@ page import = "user.UserDTO" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>모두의 랭킹</title>
<link rel="stylesheet" href="css/hometest.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/login_btn.css">
<script type="text/javascript" src="js/login_btn.js"></script>
</head>
<body>
	<%
		String userid = null;
		if(session.getAttribute("userid") != null) {
			userid = (String)session.getAttribute("userid");
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
		UserDAO userDAO = new UserDAO();
		UserDTO user = userDAO.getuser(userid);
		String profile = new UserDAO().getProfile(userid);
	%>

	<div id = "wrap">
		<header>
			<div class="login">
			<%
				if(userid == null){
			%>	
					<button type="button" class="login_btn" onclick="location.href='serviceCenter.jsp'">고객센터</button>
	         		<button type="button" class="login_btn" onclick="location.href='login.jsp'">로그인</button>
	          		<button type="button" class="login_btn" onclick="location.href='join.jsp'">회원가입</button>
          	<%		
				} else {
			%>
					<button type="button" class="login_btn" id="login_btn"><%= user.getNixname()+"▼" %></button>
          			<div id="profile_wrap">
            			<div class="hello">
              				<%= user.getNixname() + " 님 안녕하세요" %>
            				<div class="profile_img">
              					<img src="<%=profile %>" class="prof_img" alt="">
            				</div>
            				<a href="mypageMain.jsp" class="mypage">마이페이지</a>
           					<a href="serviceCenter.jsp" class="mypage">고객센터</a>
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
        <div class="logo">
          <img src="images/모두의랭킹2.png" alt="">
        </div>
        <form action="#"> <!-- 폼태크 검색시 액션 jsp 필요 -->
	        <div class="search">
	          <input class="keywor	" id="keyword" type="text" name="search" maxlength=255 value="" autocomplete="off" placeholder="원하는 랭킹을 입력하세요" alt="">
	          <label for="keyword">검색</label>
	        </div>
	        <div class="category">
	          <ul>
	            <li class="big"><a class="bigLink" href="#">영화</a>
	              <ul class="small">
	                <li><a class="smallLink" href="#">액션</a></li>
	                <li><a class="smallLink" href="#">코미디</a></li>
	                <li><a class="smallLink" href="#">로맨스</a></li>
	              </ul>
	            </li>
	            <li class="big"><a class="bigLink" href="#">드라마</a>
	              <ul class="small">
	                <li><a class="smallLink" href="#">액션</a></li>
	                <li><a class="smallLink" href="#">코미디</a></li>
	                <li><a class="smallLink" href="#">로맨스</a></li>
	              </ul>
	            </li>
	            <li class="big"><a class="bigLink" href="#">애니메이션</a>
	              <ul class="small">
	                <li><a class="smallLink" href="#">액션</a></li>
	                <li><a class="smallLink" href="#">코미디</a></li>
	                <li><a class="smallLink" href="#">로맨스</a></li>
	              </ul>
	            </li>
	            <li class="big"><a class="bigLink" href="#">게임</a>
	              <ul class="small">
	                <li><a class="smallLink" href="#">액션</a></li>
	                <li><a class="smallLink" href="#">코미디</a></li>
	                <li><a class="smallLink" href="#">로맨스</a></li>
	              </ul>
	            </li>
	          </ul>
	        </div>
        </form>
        <!-- 이미지 슬라이드 시작 -->
        <div class="slider">
          <div class="slides">
            <!-- 버튼 시작 -->
            <input type="radio" name="radio-btn" id="radio1" value="">
            <input type="radio" name="radio-btn" id="radio2" value="">
            <input type="radio" name="radio-btn" id="radio3" value="">
            <!-- 버튼 끝 -->
            <!-- 슬라이드 이미지 시작 -->
            <div class="slide first">
              <img src="images/image1.png" alt="">
            </div>
            <div class="slide">
              <img src="images/image2.png" alt="">
            </div>
            <div class="slide">
              <img src="images/image3.png" alt="">
            </div>
            <!-- 슬라이드 이미지 끝 -->
            <!-- 자동 내비게이션 시작 -->
            <div class="navigation-auto">
              <div class="auto-btn1"></div>
              <div class="auto-btn2"></div>
              <div class="auto-btn3"></div>
            </div>
            <!-- 자동 내비게이션 끝 -->
          </div>
          <div class="navigation-manual">
            <label for="radio1" class="manual-btn"></label>
            <label for="radio2" class="manual-btn"></label>
            <label for="radio3" class="manual-btn"></label>
          </div>
        </div>
      </div>
      <footer>
        <div class="footer">
          <div class="company">
            <a style=""><img src="images/WTP.jpg" width=50px;> <h2>What the Pork</h2></a>
          </div>
          <div class="detail">
            <b>주소</b> : 경기 수원시 팔달구 중부대로 100 3층
            <br>
            <b>대표</b> : 박창주
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>