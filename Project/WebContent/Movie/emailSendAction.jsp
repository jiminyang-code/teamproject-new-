<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
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
<%@ page import="Movie.Dao"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="member" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="email" name="member" param="email" />

<%
	  
	String userID = request.getParameter("userID");

	request.setCharacterEncoding("UTF-8");
	Dao dao = Dao.getInstance();
	String email = null;

	/* boolean emailChecked = dao.getEmailChecked(userID);
	
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		String result = "<script> alert('인증이 된 회원입니다.'); history.back(); </script>";
		script.println(result);
	} */
	
	if (request.getParameter("email") != null) {
		email = request.getParameter("email");
	
	
	String host = "http://localhost:80/Movie/"; //접속 주소
	String from = "busangalmaegie@gmail.com";
	String to = dao.getUserEmail(userID); //DB에 저장된 이메일
	String subject = "회원가입을 위한 인증 메일입니다.";
	
	String content = "링크에 접속하여 이메일 인증을 진행하십시오." +
	"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to)+"'>";
	
	
	
	Properties p = new Properties();
	
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465"); //구글 서버 포트
	p.put("mail.startls.enable", "true");
	p.put("mail.startls.auth", "true");
	p.put("mail.smtp.sdebug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	
	try {
		//이메일 인증메일 전송
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO,toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
		
	} catch(Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		String result = "<script> alert('오류가 발생했습니다.'); history.back(); </script>";
		script.print(result);
	}
	
	} else {
		PrintWriter script = response.getWriter();
		String result = "<script> alert('널값입니다.'); history.back(); </script>";
		script.print(result);
	}
%>
