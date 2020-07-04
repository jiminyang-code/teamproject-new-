<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style2.css">
    <script src="../js/jquery-2.1.3.min.js">
    </script>
    <script src="../js/jquery.vide.min.js">
    </script>
    <script src="../js/jquery.scrollTo.min.js">
    </script>
    <script>
    
    $(document).ready(function(){
        $('nav a').click(function(e){
            $.scrollTo(this.hash||0, 280);
            e.preventDefault();
        });
        $('#btn_gotop').click(function(e){
            $.scrollTo(this.hash||0, 280);
            e.preventDefault();
        });
    });
    
    $(function () {
            var trigger = $('#trigger');
            var menu = $('nav ul');
            $(trigger).on('click', function(e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function () {
                var w = $(window).width();
                if(w>320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    
    </script>
</head>



<body>
	<div id="5"></div>
	<div id="container">
    <!-- 네비게이션 -->
    <nav class="clearfix">
    	<%if(userID == null) { %>
        <ul class="clearfix">
            <li onclick="location.href='../ViewPage/main.jsp'"><a href="">HOME</a></li>
            <li onclick="location.href='../Movie/login.jsp'"><a href="">로그인</a></li>
            <li onclick="location.href='../Movie/memberJoin.jsp'"><a href="">회원가입</a></li>
            <li><a href="#1">MOVIE</a></li>
            <li><a href="#2">OST</a></li>
            <li><a href="#3">LOCATION</a></li>
            
        </ul>
        <a href="" id="trigger"></a>
        <% } else {%>
        <ul class="clearfix">
            <li onclick="location.href='../ViewPage/main.jsp'"><a href="">HOME</a></li>
            <li onclick="location.href='../Movie/logoutAction.jsp'"><a href="">로그아웃</a></li>
            <li onclick="location.href='../ViewPage/main.jsp'"><a href="">회원가입</a></li>
            <li><a href="#1">MOVIE</a></li>
            <li><a href="#2">OST</a></li>
            <li><a href="#3">LOCATION</a></li>
            
        </ul>
        <% } %>
    </nav>



    <!-- <div class="container">
        <div><a href="">HOME</a></div>
        <div><a href="">로그인</a></div>
        <div><a href="">회원가입</a></div>
    </div> -->
    
    <section id="container" data-vide-bg="stream">
    <h1 style="font-size: 25px; color: white; font-weight: bold;">The Best Movie</h1>
    <h1 style="font-size: 33px; color: white; font-weight: bold;">in the world</h1>
    </section>
    <section id="1" class="page1" onclick="location.href='./movie.jsp'">
    </section>
    <section data-vide-bg="waterfall" id="2" class="page2" onclick="location.href='../Music/ost-search.jsp'">
    <h1 style="font-size: 25px; color: white; font-weight: bold;">Listen to OST</h1>
    </section>
    <section id="3" class="page3">
    </section>
    <section id="4" class="page4">
    <h1 style="font-size: 100px; color: white; display: inline-block;">FOOTER</h1>
    </section>
    
    <a href="#5" id="btn_gotop" class="btn_gotop">
    <img src="../images/topbutton.png" style="width:80px; display: block; margin: 240px; "> 
  	<span class="glyphicon glyphicon-chevron-up">
  	</span>
	</a>
	</div>
</body>
</html>