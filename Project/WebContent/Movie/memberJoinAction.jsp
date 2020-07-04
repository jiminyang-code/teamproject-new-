<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao"%>
<%@ page import="util.SHA256" %>
<%@ page import="Movie.UserDTO" %>
<jsp:useBean id="member" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="member" param="userID" />
<jsp:setProperty property="userPW" name="member" param="userPW" />
<jsp:setProperty property="userName" name="member" param="userName" />
<jsp:setProperty property="email" name="member" param="email" />
<jsp:setProperty property="phoneNumber" name="member" param="phone" />
<%

	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("userID") != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 상태입니다.')");
		script.println("history.back()");
		script.println("</script>");
		return;
	}
		
		
		if (member.getUserID() == null || member.getUserPW() == null || member.getUserName() == null
				|| member.getEmail() == null || member.getPhoneNumber() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");

		} else {
		
			Dao dao = Dao.getInstance();
			member.setUserEmailHash(SHA256.getSHA256("email"));
			//setproperty로 매핑된 객체를 함수에 매개변수로 전달
			int result = dao.insertMember(member);

			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류입니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				request.getSession().setAttribute("userID",userID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href='./login.jsp'");
				script.println("</script>");
			}
		
		}
	%>
</body>


</html>