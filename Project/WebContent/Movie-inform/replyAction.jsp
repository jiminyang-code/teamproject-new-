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
<jsp:setProperty property="replyContent" name="dto2" param="replyContent" />
<jsp:setProperty property="boardID" name="dto2" param="boardID"/>
<jsp:setProperty property="boardID" name="dto" param="boardID"/> <!--값전달시에 반드시-->

<%
	ReplyDao dao = ReplyDao.getInstance();
	String sessionID = (String) session.getAttribute("userID");
	
	String str = null;
	Boolean replyCheck = null;
	String reply = null;
	/* 
	int boardID = Integer.parseInt(request.getParameter("boardID"));
	System.out.println(boardID);
    dto2.setBoardID(boardID); */
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (sessionID != null) {
		str = dao.replyInsert(dto,sessionID);
		
		reply = dto.getReplyContent();
		
		if(reply == null || "".equals(reply.trim())) {
			PrintWriter script = response.getWriter();
			String result = "<script>alert('내용을 입력해주세요'); history.back(); </script>";
			script.println(result);
			return;
		}
		
		if (str.equals("-1")) {
			PrintWriter script = response.getWriter();
			String insert = "<script> alert('입력오류'); history.back();</script>";
			script.println(insert);
		} else {
			PrintWriter script = response.getWriter();
			String insert = "<script> history.back(); </script>";
			script.println(insert);
			return;
		}

	}

	//비회원 댓글작성
	if (sessionID == null) {
		str = dao.replyInsert(dto2);
		reply = dto2.getReplyContent();
		
		if(reply == null || "".equals(reply.trim())) {
			PrintWriter script = response.getWriter();
			String result = "<script> alert('내용을 입력해주세요'); history.back(); </script>";
			script.println(result);
			return;
		}
		
		if (str.equals("-1") || dto2.getUserID() == null || dto2.getUserPW() == null || reply == null) {
			PrintWriter script = response.getWriter();
			String insert = "<script> alert('입력오류'); history.back();</script>";
			script.println(insert);
		} else {
			PrintWriter script = response.getWriter();
			String insert = "<script> history.back(); </script>";
			script.println(insert);
		}
		
	}

	//문제점1 : 비회원 댓글작성 아이디가 기존회원아이디와 일치해야 작성가능한 상태다. 입력데이터가 없을때와 잘못된 글 작성시 경고메시지가 없다.
	//문제점2 : 로그인 후 댓글작성에 아이디 속성값이 테이블에 입력이 안된다
	//--해결--
	
	//문제점3 : 회원,비회원 댓글이 서로 순차적으로 리스트가 뿌려지도록 안되어있음
	//문제점4 : 댓글작성 후 history.back했을시 새로고침안하면 댓글이 보이지 않는다. 스크롤값 설정
	//문제점5 : 게시글에 따른 댓글, 게시글과 댓글 연관
	%>
</body>
</html>