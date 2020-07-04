<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao"%>
<jsp:useBean id="member" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="member" param="userID"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Dao dao = Dao.getInstance(); //데이터 연결객체 생성

		ArrayList<String> list = dao.idCheck(); //아이디 리스트 가져오기
		PrintWriter script = response.getWriter();
		String id = member.getUserID(); //브라우저 리퀘스트 입력값 담기

		String result = "<script> alert('중복된 아이디 입니다');" 
		+ "history.back(); </script>";
		
		String result2 = "<script> alert('사용가능한 아이디 입니다');" 
				+ "history.back(); </script>";
		
		int num = list.size();
				
				
		for (String str : list) {
			if (str.equals(id)) {
				script.println(result);
				return;
			}
		}
	%>
</body>
</html>