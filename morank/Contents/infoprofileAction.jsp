<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="searchdao.informationDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

informationDAO info = new informationDAO();

String directory = application.getRealPath("/upload").replaceAll("\\\\","/");;

int maxSize = 1024*1024*100;

String encoding ="UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

String IMG_LINK = multipartRequest.getOriginalFileName("IMG_LINK");


String info_name = null;

if(session.getAttribute("title") != null) {
	info_name = (String) session.getAttribute("title");
}

String total = null;

if(session.getAttribute("total") != null) {
	total = (String) session.getAttribute("total");
}

String info_id = null;

if(session.getAttribute("info_id") != null) {
	info_id = (String) session.getAttribute("info_id");
}
if (IMG_LINK == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력받은 프로필 정보가 없습니다.')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}

if (info_name == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력받은 이름이 없습니다.')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
}

else {
	info.getProfile(IMG_LINK, info_name);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('프로필 변경 완료')");
	script.println("location.href = 'contents.jsp?info_id="+info_id+"&total="+total+"&title="+info_name+"'");
	script.println("</script>");
	script.close();
}
%>
</body>
</html>