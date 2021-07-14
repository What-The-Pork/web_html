<%@page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@page import="searchdao.commentsDAO"%>
<%@page import="searchdto.commentsVO"%>
<%@page import="searchdao.informationDAO"%>
<%@page import="searchdto.informationVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	UserDAO userDAO = new UserDAO();
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
	
	
	String info_id = null;
	
	if (request.getParameter("info_id") != null) {
		info_id = request.getParameter("info_id");
	}
	
	informationDAO infoDAO = new informationDAO();
	
	informationVO infoVO = infoDAO.getinfo(info_id);
	
	String total = infoVO.getSmallC_id()+infoVO.getBigC_id();
	
	if (userid==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해 주세요')");
		script.println("location.href = 'contents.jsp?info_id="+info_id+"&total="+total+"'");
		script.println("</script>");
		script.close();
	}
	else{
		String profile = userDAO.getProfile(userid);
		String comment_inputs = request.getParameter("comment_inputs");
		commentsDAO comm = new commentsDAO();
		int result = comm.creatcomment(new commentsVO(info_id, profile, userid, comment_inputs, 0));
		if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("location.href = 'contents.jsp?info_id="+info_id+"&total="+total+"'");
			script.println("</script>");
			script.close();
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 등록 완료')");
			script.println("location.href = 'contents.jsp?info_id="+info_id+"&total="+total+"'");
			script.println("</script>");
			script.close();
		}
	}
	%>
</body>
</html>