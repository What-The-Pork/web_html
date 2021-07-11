<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="test.testDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		testDAO tstDAO = new testDAO();
	
		int like =1;
		int result = tstDAO.getLike(like);
		
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('DB오류')");
		      script.println("location.href = 'Search_info_test.jsp'");
		      script.println("</script>");
		      script.close();
		}
		else
		{
			PrintWriter outter = response.getWriter();
		      outter.println("<script>");
		      outter.println("alert('추천 완료')");
		      outter.println("location.href = 'Search_info_test.jsp'");
		      outter.println("</script>");
		}
	%>
	


</body>
</html>