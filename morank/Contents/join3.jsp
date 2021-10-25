<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDTO"%>
<%
// 유저 이메일을 가져올 객체 생성
UserDAO userDAO = new UserDAO();
//회원가입 페이지 (3)
// 유저 세션 정보를 가져와 로그인 시 접근을 제한 하기위함
String userid = null;
if (session.getAttribute("userid") != null) {
	userid = (String) session.getAttribute("userid");
}
// 회원가입 절차를 무시하고 접근 시 방지하기 위함
if (userid == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('잘못된 접근 입니다.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	script.close();
	return;
}
// 이메일 인증이 완료 되었는데 접근 시 방지하기 위함
boolean emailChecked = userDAO.getUserEmailChecked(userid);
if (emailChecked == true) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 인증된 회원 입니다.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

//사이트 주소
String host = "http://localhost:8080/morank/"; 

//보낼 아이디 지정
String from = "userTest";
//유저아이디
String to = userDAO.getUserEmail(userid); 
//메일 제목
String subject = "모랭 사이트 회원가입 이메일 인증 메일 입니다."; 
//메일 내용
String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host + "emailCheckAction.jsp?code="
		+ new SHA256().getSHA256(to) + "'><br>이메일 인증하기</a>";
		
// Property에 SMTP 서버의 정보를 설정
Properties p = new Properties();
//SMTP의 기본 사용자 이름
p.put("mail.smtp.user", from);
//연결할 SMT 서버
p.put("mail.smtp.host", "smtp.googlemail.com");
//SMTP 서버 포트
//SSL용 - 465 // TSL/STARTTLS - 587
p.put("mail.smtp.port", "465");

//SMTP MAIL 명령에 사용할 이메일 주소
p.put("mail.smtp.from", "fromTest");

//ture인 경우 AUTH 명령을 사용하여 사용자 인증을 시도
p.put("mail.smtp.auth", "true");

//javaMail에서 tls를 시작을 명시적 요청
//이전에는 암호화되지 않은 평문으로 보내다 설정을 확인하면 보안 관련 채널을 생성 , 인증서 확인 등의 작업을 거침
//p.put("mail.smtp.starttls.enable", "true");
//사용 시 - SSL(Secure Sockets Layer) : 자동으로 보안 채널을 생성하여 메일을 전송
p.put("mail.smtp.ssl.enable","true");

//debug에서 사용(로그출력)
p.put("mail.smtp.debug", "true");

//설정된 경우 javax.net.SocketFactory 인터페이스를 구현하는 클래스의 이름을 지정
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//지정된 소켓 팩토리 클래스를 사용하여 소켓을 생성하지 못하면 해당 java.net.Socket 클래스를 사용하여 소켓을 생성하는 부분
p.put("mail.smtp.socketFactory.fallback", "false");
//지정된 소켓 팩토리를 사용할 때 연결할 포트를 지정
p.put("mail.smtp.socketFactory.port", "465");

//이메일 전송
try {
	//구글 메일 계정으로 인스턴스 생성
	Authenticator auth = new Gmail();
	//session 클래스의 인스턴스 생성
	Session ses = Session.getInstance(p, auth);
	ses.setDebug(true);
	//msg 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성
	MimeMessage msg = new MimeMessage(ses);
	//제목
	msg.setSubject(subject);
	//보내는 아이디
	//InternetAddress(메일주소, 보내는사람 이름, 문자셋)
	Address fromAddr = new InternetAddress(from, "모랭", "UTF-8");
	msg.setFrom(fromAddr);
	//수신자 메일 주소
	Address toAddr = new InternetAddress(to);
	msg.addRecipient(Message.RecipientType.TO, toAddr);
	//메일 내용
	msg.setContent(content, "text/html;charset=UTF-8");
	//메시지 전송
	Transport.send(msg);
	
} catch (Exception e) {
	e.printStackTrace();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생 했습니다.')");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/join3.css">
</head>
<body>
	<%
	UserDTO user = userDAO.getuser(userid);
	%>
	<div id="wrapper">
		<div class="logo">
			<a href="index.jsp"><img src="images/모두의랭킹6.png" alt=""></a>
		</div>
		<div class="button">
			<img src="images/join_button_off.png" alt=""> <img
				src="images/join_button_off.png" alt=""> <img
				src="images/join_button.png" alt=""> <img
				src="images/join_button_off.png" alt="">
		</div>
		<p class="title">이메일 전송 안내</p>
		<hr>
		<div class="contents">
			<p>
				<a href="https://nid.naver.com/"><u><%=user.getEmail() %></u></a>(으)로 인증
				메일이 발송되었습니다.
			</p>
		</div>
		<button type="button" class="email-check" name="button"
			onclick="location.href='http://www.naver.com'">메일 확인하러 가기</button>
		<div class="footer">
			메일을 받지 못하셨나요? <a href="join3.jsp"> 다시 보내기 </a>
		</div>
	</div>
	<footer>Changju Co.</footer>
</body>
</html>