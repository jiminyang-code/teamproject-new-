<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Reply.ReplyDao"%>
<%@ page import="Reply.ReplyUserDTO" %>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="boardID" name="dto2" param="boardID"/>
<jsp:setProperty property="userPW" name="dto2" param="cmt_password"/>
<jsp:setProperty property="userID" name="dto2" param="cmt_ID"/>
<%
	ReplyDao dao = ReplyDao.getInstance();
	String sessionID = (String) session.getAttribute("userID");
	
	String str = null;
	Boolean replyCheck = null;
	String reply = null;
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (sessionID == null) {
			str = dao.replyDelete(dto2);
			
			if(!str.equals("0")) {
				PrintWriter script = response.getWriter();
				String insert = "<script>history.back();</script>";
				script.println(insert);
				System.out.println(str);
				return;
				}
			
			else if(str.equals("0")) {
				PrintWriter script = response.getWriter();
				String insert = "<script> alert('입력오류입니다'); history.back(); </script>";
				script.println(insert);
				System.out.println(str);
			}

		}
	
	if(sessionID != null) {
		str = dao.replyDelete(dto);
		
		if(!str.equals("0")) {
			PrintWriter script = response.getWriter();
			String insert = "<script>location.reload(true);</script>";
			script.println(insert);
			System.out.println(str);
			return;
			}
		
		else if(str.equals("0")) {
			PrintWriter script = response.getWriter();
			String insert = "<script> alert('입력오류입니다'); history.back(); </script>";
			script.println(insert);
			System.out.println(str);
		}
	}
	
	//문제점 - 같은아이디로 입력시에 따로 인식을 못함.
	%>
</body>
</html>