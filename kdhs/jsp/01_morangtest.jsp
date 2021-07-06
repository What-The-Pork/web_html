
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@page import ="java.sql.DriverManager" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.Statement" %>
<%@page import = "java.sql.ResultSet" %>    


  
<!DOCTYPE html>
<html>



  <head>

    <link rel="stylesheet" href="01_morangtest.css">
    <script type="text/javascript" src="01_morangtest.js"></script>
    <script src="https://kit.fontawesome.com/b71cf75717.js" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title>모랭검색테스트</title>

  </head>

  <body>
  
	<%
	           
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","kdh","kdh331");
	Statement stmt = conn.createStatement();
	int x=1;
	ResultSet rs = stmt.executeQuery("select * from search_info_test,rank_info_test where info_id="+x);
	
	String content ="";
	String title = "";
	String img = "";
	int like =0;
	String title_r = "";
	String img_r = "";
	while (rs.next())
	{
		content = rs.getString("info_content");
		title = rs.getString("info_title");
		img = rs.getString("img_link");
		like = rs.getInt("info_like");
		title_r = rs.getString("rank_title");
		img_r = rs.getString("img_link_1");
	}
	
	
	
	
	stmt.close();
	conn.close(); 
	%>
	
  
    <div id = "frame">
    <header>
      <div class="logo" id= searchlogo>
          <a href="#">
            <img src="logo/모두의랭킹4.png" width="200px" alt="" >
          </a>
      </div>
      <div class = "search">
        <input class="keyword" type="text" name="search" maxlength=255 value="" autocomplete="off">
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
            </ul>
          </li>
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
</header>



<div class="parent_container">


      <div class="container" >
        <div class="cont_img">
            <img src="<%=img %>"  >
         
          </div>


        <div class="contain_info">
          <p id=test>
			<%=content %>
              </p>
        </div>
        <button type="button" class= "cont_img_bt" ><a href="javascript:OpenPopimg();">이미지 더보기</a></button>
        <button type="button" class= "more" ><a href="javascript:OpenPop();">더보기</a></button>



<div class="likeNshare">
      <button type="button" class= "like_share_button" id =likebtn onclick="ClickLikeButton()" >추천</button>
      <button type="button" class= "like_share_button" id = sharebtn onclick="copyToClipboard('getPageName()')">공유</button>
</div>


        <div id="img_popup_layer" style="display:none">
          <div class="popup_box">
              <!--팝업 컨텐츠 영역-->
              <div class="popup_cont" >
                  <h2><%=title %></h2>
                  <div class="popup_img">
                    <img src="<%=img %>" width="100%;"  >
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

        <div id="popup_layer" style="display:none">
          <div class="popup_box">
              <!--팝업 컨텐츠 영역-->
              <div class="popup_cont" >
                  <h2><%=title %></h2>
                  <p>
                    <%=content %>
         
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

    <div class="center_container" >
      <div class="comment_box">
        <img src="logo/모두의랭킹5.png"  >
      댓글댓글대대대대대대ㅐ대대댓글
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹3.png"  >
      로우킥로우킥로우킥로우킥로우킥로우킥
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div><div class="comment_box">
        <img src="logo/모두의랭킹2.png" >
        sadf
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="comment_box">
        <img src="logo/모두의랭킹.png" >
        사커킥사커킥사커킥사커킥사커킥사커킥사커
      </div>
      <div class="">
        <button type="button" name="button">댓글 더보기</button>
      </div>

    </div>


  <div class="sub_container">

    <div class="ranking_box">
      <img src="<%=img_r %>"  >
      <%=title_r %><br><%=like %>
    </div>
    <div class="ranking_box">
      <img src="logo/모두의랭킹5.png"  >
      sadf
    </div>
    <div class="ranking_box">
      <img src="logo/모두의랭킹5.png"  >
      sadf
    </div>
    <div class="ranking_box">
      <img src="logo/모두의랭킹5.png"  >
      sadf
    </div>
  </div>

</div>

</div>

 

</body>
</html>