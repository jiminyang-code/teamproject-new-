<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Reply.ReplyDao"%>
<%@ page import="Reply.ReplyDTO"%>
<%@ page import="Reply.ReplyUserDTO"%>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>

<%  
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ReplyDao dao = ReplyDao.getInstance();
		ArrayList<String> title = new ArrayList<>();
		title.add("������"); title.add("�̳�"); title.add("�ö��:�������۴�"); title.add("�巡�����̱�"); title.add("����&����"); title.add("������ũ"); title.add("���̾��2"); title.add("�μ���");
		title.add("Ʈ��������3"); title.add("�Ƿ���"); title.add("�����ѿ���"); title.add("��Ǫ�Ҵ�2"); title.add("���"); title.add("���� ��ҵ�"); title.add("����ƿ"); title.add("�ϵ���");
		title.add("���ϵ�"); title.add("��ũ����Ʈ ������"); title.add("����ҳ�"); title.add("���̽�������4"); title.add("�ٶ����Բ� �������"); title.add("���������"); title.add("�����"); title.add("����");
		title.add("���̾��3"); title.add("������"); title.add("������ ������"); title.add("�ͺ�"); title.add("7������ ����"); title.add("�����ο¸���"); title.add("��������"); title.add("����");
		title.add("��"); title.add("����ã����"); title.add("�������"); title.add("�ܿ�ձ�"); title.add("���ο����"); title.add("��������"); title.add("���ͽ��ڶ�"); title.add("�����ѱ׳�");
		title.add("���׶�"); title.add("ŷ����:��ũ��������Ʈ"); title.add("��Ƽ�λ��̵�"); title.add("�λ��̵�ƿ�"); title.add("����"); title.add("���÷���"); title.add("�����2"); title.add("�ϻ�");
		title.add("ĸƾ�Ƹ޸�ī:�ú���"); title.add("�λ���"); title.add("�̺�����"); title.add("�����Ǿ�"); title.add("�˻����"); title.add("��󷣵�"); title.add("������:����Į����"); title.add("�ͳ�");
		title.add("����"); title.add("�������� ����"); title.add("�ݹ̹����������"); title.add("���� �̸���"); title.add("����ĵ����ũ"); title.add("�̳�;߼�"); title.add("�����̴���:ȨĿ��"); title.add("�ýÿ�����");
		title.add("�̼����ļ���:���ƿ�"); title.add("������"); title.add("���� ��ȥ��"); title.add("����"); title.add("�Ϻ���Ÿ��"); title.add("�����̾�2"); title.add("�����3"); title.add("����̾ȷ��ҵ�");
		title.add("�����̴���:������Ȩ"); title.add("��Ŀ"); title.add("���� ������ ����"); title.add("�ܿ�ձ�2"); title.add("��������"); title.add("Ĺ��"); title.add("�����4"); title.add("�����");
		
		int yearNum = 0;
		
		ArrayList<Integer> titleNo = new ArrayList<>();
		titleNo.add(50); titleNo.add(63); titleNo.add(44); titleNo.add(20); titleNo.add(14); titleNo.add(31); titleNo.add(48); titleNo.add(65);
		titleNo.add(80); titleNo.add(62); titleNo.add(57); titleNo.add(75); titleNo.add(45); titleNo.add(25); titleNo.add(23); titleNo.add(58);
		titleNo.add(19); titleNo.add(18); titleNo.add(17); titleNo.add(47); titleNo.add(30); titleNo.add(22); titleNo.add(52); titleNo.add(10);
		titleNo.add(49); titleNo.add(72); titleNo.add(60); titleNo.add(79); titleNo.add(2); titleNo.add(38); titleNo.add(39); titleNo.add(9);
		titleNo.add(26); titleNo.add(13); titleNo.add(36); titleNo.add(5); titleNo.add(1); titleNo.add(41); titleNo.add(66); titleNo.add(40);
		titleNo.add(32); titleNo.add(76); titleNo.add(35); titleNo.add(64); titleNo.add(67); titleNo.add(61); titleNo.add(53); titleNo.add(51);
		titleNo.add(70); titleNo.add(34); titleNo.add(27); titleNo.add(69); titleNo.add(4); titleNo.add(21); titleNo.add(56); titleNo.add(78);
		titleNo.add(8); titleNo.add(37); titleNo.add(74); titleNo.add(16); titleNo.add(46); titleNo.add(28); titleNo.add(43); titleNo.add(77);
		titleNo.add(29); titleNo.add(7); titleNo.add(15); titleNo.add(73); titleNo.add(59); titleNo.add(24); titleNo.add(55); titleNo.add(33);
		titleNo.add(42); titleNo.add(68); titleNo.add(3); titleNo.add(6); titleNo.add(11); titleNo.add(71); titleNo.add(54); titleNo.add(12);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Movie Select</title>
<link type="text/css" rel="stylesheet" href="../css/swiper.min.css" />
<link type="text/css" rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../js/swiper.min.js"></script>
<script src="../js/jquery-2.1.3.min.js">
    </script>
    <script src="../js/jquery.vide.min.js">
    </script>
    <script src="../js/jquery.scrollTo.min.js">
    </script>
</head>
<style>
body::before {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url(../images/endgame3.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100%;
	-webkit-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	filter: blur(5px);
	z-index: -1;
	content: "";
	-webkit-filter: blur(5px);
}

.contents {
	width: 980px;
	height: 500px;
	margin: 0 auto;
}

h {
	font-weight: bold;
}

p {
	display: block;
	position: relative;
	text-align: center;
	top: 226px;
	color: white;
	font-weight: bold;
	font-size: 24px;
	background-color: #34495e;
	
}

</style>

<body>
	
	<div id="header">
		<!-- �׺���̼� -->
		
		<nav class="clearfix">
		<% if(userID == null) {
								%>
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#1">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#2">�α���</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a href="#3">ȸ������</a></li>
				<li onclick="location.href='./movie.jsp'"><a href="#4">MOVIE</a></li>
				<li onclick="location.href='../Music/ost-search.jsp'"><a href="#5">OST</a></li>
				<li><a href="#">LOCATION</a></li>
			</ul>
			<a href="" id="trigger"></a>
		</nav>
		<% } else { %>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#1">HOME</a></li>
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a href="#2">�α׾ƿ�</a></li>
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#3">ȸ������</a></li>
				<li onclick="location.href='./movie.jsp'"><a href="#4">MOVIE</a></li>
				<li onclick="location.href='../Music/ost-search.jsp'"><a href="#5">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<% } %>
			<a href="" id="trigger"></a>
		</nav>

	</div>
	<section id="container">
		<!-- Swiper -->
		
		<div class="contents" style="margin-top: 50px;">
			
			<div class="swiper-container gallery-top">
			
				<div class="swiper-wrapper">
					<%for(int i=0; i<80; i++) { String value = title.get(i); int boardNo = titleNo.get(i);
					if(i>1 && i%8 == 0) yearNum++;%>
					
					<div class="swiper-slide" style="background-image: url(./images/total/<%=i%>.jpg)"
					onclick="location.href='../Movie-inform/movie-<%=boardNo%>.jsp'"><p><%=value%> (201<%=yearNum%>)</p></div>
				<% } %>
				</div>
				
				
				<!-- Add Arrows -->
				<div class="swiper-button-next swiper-button-white"></div>
				<div class="swiper-button-prev swiper-button-white"></div>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
						<%for(int i=0; i<10; i++) { for(int j=0; j<8; j++) { %>
						<div class="swiper-slide"
						style="background-image: url(./images/201<%=i%>/<%=j%>.jpg)">
						</div>
						<% } 
						}%>
				</div>
			</div>
		</div>
	</section>
	<script>
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 4,
			loop : true,
			freeMode : true,
			loopedSlides : 5, //looped slides should be the same
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});

		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			loop : true,
			loopedSlides : 5, //looped slides should be the same
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			thumbs : {
				swiper : galleryThumbs,
			},
		});
		
		
		function idFind() {
		      location.href = 'http://localhost/Project/ViewPage/detailMovie.jsp';
		   }
		
		
		
	</script>
</body>
</html>