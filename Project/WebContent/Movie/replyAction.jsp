<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Reply.ReplyDao"%>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="replyContent" param="replyContent" />
<jsp:setProperty name="dto" property="userID" param="userID" />
<jsp:setProperty property="userID" name="dto2" param="userID" />
<jsp:setProperty property="userPW" name="dto2" param="userPW" />
<jsp:setProperty property="replyContent" name="dto2"
	param="replyContent" />
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
		if (session.getAttribute("userID") != null) {
		str = dao.replyInsert(dto,sessionID);
		
		reply = dto.getReplyContent();
		
		if("".equals(reply.trim())) {
			PrintWriter script = response.getWriter();
			String result = "<script>alert('내용을 입력해주세요'); history.back(); </script>";
			script.println(result);
			return;
		}
		
		if (str.equals("-1") || dto.getReplyContent() == null) {
			PrintWriter script = response.getWriter();
			String insert = "<script> alert('입력오류'); history.back();</script>";
			script.println(insert);
		} else {
			PrintWriter script = response.getWriter();
			String insert = "<script> location.href='reply.jsp'; </script>";
			script.println(insert);
		}

	}

	//비회원 댓글작성
	if (session.getAttribute(dto.getUserID()) == null) {
		str = dao.replyInsert(dto2);
		reply = dto2.getReplyContent();
		
		if("".equals(reply.trim())) {
			PrintWriter script = response.getWriter();
			String result = "<script>alert('내용을 입력해주세요'); history.back(); </script>";
			script.println(result);
			return;
		}
		
		if (str.equals("-1") || dto2.getUserID() == null || dto2.getUserPW() == null || dto2.getReplyContent() == null) {
			PrintWriter script = response.getWriter();
			String insert = "<script> alert('입력오류'); history.back();</script>";
			script.println(insert);
		} else {
			PrintWriter script = response.getWriter();
			String insert = "<script> location.href='reply.jsp'; </script>";
			script.println(insert);
		}
	}

	//문제점 : 비회원 댓글작성 아이디가 기존회원아이디와 일치해야 작성가능한 상태다. 입력데이터가 없을때와 잘못된 글 작성시 경고메시지가 없다.
	//문제점2 : 로그인 후 댓글작성에 아이디 속성값이 테이블에 입력이 안된다
	%>
</body>
</html>