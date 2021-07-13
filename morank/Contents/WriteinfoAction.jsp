<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="searchdto.informationVO"%>
<%@ page import="searchdao.informationDAO"%>
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
	String BigC_id = null;
	String SmallC_id = null;
	String info_name = null;
	String keyword = null;
	String producer = null;
	String info_content = null;
	
	
	if(request.getParameter("BigC_id") != null){
		BigC_id = request.getParameter("BigC_id");
	}
	if(request.getParameter("SmallC_id") != null){
		SmallC_id = request.getParameter("SmallC_id");
	}
	if(request.getParameter("info_name") != null){
		info_name = request.getParameter("info_name");
	}
	if(request.getParameter("keyword") != null){
		keyword = request.getParameter("keyword");
	}
	
	if(request.getParameter("producer") != null){
		producer = request.getParameter("producer");
	}
	if(request.getParameter("info_content") != null){
		info_content = request.getParameter("info_content");
	}
	
	if (keyword.contains(" ")){
		keyword = keyword.replace(" ", "#");
	}
	
	
	
	String info_id = BigC_id.substring(0)+"_"+SmallC_id.substring(0)+"_"+"1";
	
	
	if (BigC_id == null || SmallC_id == null || info_name == null || keyword == null ||  producer == null || info_content == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	informationDAO infoDAO = new informationDAO();
	int result = infoDAO.writeinfo(new informationVO(BigC_id, SmallC_id, info_id, info_name, keyword, null, 0, producer, info_content));
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
		outter.println("location.href = 'ranking.jsp'");
		outter.println("</script>");
	}
%>


</body>
</html>