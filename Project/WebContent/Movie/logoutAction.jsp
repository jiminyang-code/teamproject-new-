<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="user" param="userID" />
<jsp:setProperty property="userPW" name="user" param="userPW" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그아웃 되었습니다.')");
		script.println("</script>");
	%>
	<script>
		history.back();
	</script>
</body>
</html>