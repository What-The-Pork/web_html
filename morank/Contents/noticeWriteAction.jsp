<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDTO"%>
<%@ page import="notice.NoticeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int noticeid;
	String noticeTitle = null;
	String noticeContent = null;
	
	if(request.getParameter("noticeTitle") != null){
		noticeTitle = request.getParameter("noticeTitle");
	}
	if(request.getParameter("noticeContent") != null){
		noticeContent = request.getParameter("noticeContent");
	}
	
	if (noticeTitle == null || noticeContent == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.write(new NoticeDTO(0, noticeTitle, noticeContent));
	if (result == -1){
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("alert('글쓰기에 실패 했습니다.')");
		outter.println("history.back()");
		outter.println("</script>");
	}
	else {
		PrintWriter outter = response.getWriter();
		outter.println("<script>");
		outter.println("location.href = 'serviceCenter.jsp'");
		outter.println("</script>");
	}
%>


</body>
</html>