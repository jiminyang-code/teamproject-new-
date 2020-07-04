<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Movie.MovieDao" %>

<% MovieDao dao = MovieDao.getInstance(); 
	String userID = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../js/bootstrap.min.js"></script>
</head>
<body>

	<% if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	%>
  <section class="container">
    <form action="replyAction.jsp" class="form-horizontal" method="post">
      <div class="form-group">
        <label>댓글</label>
        <input type="hidden" name="userID" placeholder="아이디">
        <textarea class="form-control" name="replyContent" id="replyContent" cols="20" rows="2" placeholder="댓글입력하기"></textarea>
        <br>
        <button type="submit" class="btn pull-right">등록</button>
      </div>
    </form>
    <hr>
	
  </section>
  <% } else {%>
  		
  		<section class="container">
    <form action="replyAction.jsp" class="form-horizontal" method="post">
      <div class="form-group">
        <label>댓글</label>
        <input type="text" name="userID" placeholder="아이디">
        <input type="password" name="userPW" placeholder="비밀번호">
        <textarea class="form-control" name="replyContent" id="replyContent" cols="20" rows="2" placeholder="댓글입력하기"></textarea>
        <br>
        <button type="submit" class="btn pull-right">등록</button>
      </div>
    </form>
    <hr>
  		</section>
  <% } %>


</body>
</html>