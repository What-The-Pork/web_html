<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="searchdao.informationDAO" %>
<%@ page import="searchdto.informationVO" %>
<%@ page import="searchdao.rankingDAO" %>
<%@ page import="searchdto.rankingVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import = "user.UserDAO" %>   
<%@ page import = "user.UserDTO" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<% String search = request.getParameter("search");
   session.setAttribute("search", search); 
%>
<%
		String userid = null;
		if(session.getAttribute("userid") != null) {
			userid = (String)session.getAttribute("userid");
			boolean emailChecked = new UserDAO().getUserEmailChecked(userid); //이메일 인증 안될시
			if(emailChecked==false){
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
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>모두의 랭킹</title>
    <link rel="stylesheet" href="css/search_IN.css">
    <script src="https://kit.fontawesome.com/8b15bac25a.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/search_IN.js"></script>
        <script src="https://kit.fontawesome.com/8b15bac25a.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/login_btn.css">
	<script type="text/javascript" src="js/login_btn.js"></script>
  </head>
  <body>

    <div id="wrapper">
      <header>
        <div class="head">
          <a href="sesionout.jsp"><img src="images/모두의랭킹.png" alt=""></a>
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

        <section>
          <article class="main_contents">
          
			<form method="post" action="search.jsp" >
	           
	              <input type="text"  name="search" style="height:50px; width:50%">
	              <input type="submit" style="width:50px; height:50px;" value="검색" >
	              
	           
			</form>
			<%
				if (user.getUserAvailable()==1){
				%>
				<button onclick="location.href='writeInfo.jsp'">정보작성</button>
				<%
				}
				%>
			<!-- 검색 결과 text -->
			<div style="border: 1px solid black;  margin-top:20px;">
			<%	
				//String search1 = request.getParameter("search");
				out.print("\""+search+"\"에 대한 검색 결과 입니다.");
			%>
			</div>
			
			<!-- 소 카테고리 분류 -->
			<div style="border: 1px solid black; margin-top:20px;">
				<%
					//String search = request.getParameter("search");
					informationDAO iDao = new informationDAO();
					ArrayList<informationVO> result = iDao.showcategory(search);
							
					for (int i= 0; i <result.size(); i++){
						informationVO iVo = result.get(i);
				%>
					<form method="post" action="ranking.jsp">
						<input type="submit" name="showcate" value="<%= iVo.getSmallC_id() + iVo.getBigC_id()%>">&nbsp;&nbsp;&nbsp;
					</form>
				<%
					}
					if (result.size() == 0){
				%>		
					<form method="post" action="SCpage.jsp">
						<input type="submit" name="gotoSC" value="추가 요청하러 가기">
					</form>
				<%		
					}
				%>
			</div>
						
          </article>
        </section>

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