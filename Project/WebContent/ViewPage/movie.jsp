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
		title.add("아저씨"); title.add("이끼"); title.add("시라노:연애조작단"); title.add("드래곤길들이기"); title.add("나잇&데이"); title.add("버레스크"); title.add("아이언맨2"); title.add("인셉션");
		title.add("트랜스포머3"); title.add("의뢰인"); title.add("오싹한연애"); title.add("쿵푸팬더2"); title.add("써니"); title.add("머펫 대소동"); title.add("리얼스틸"); title.add("완득이");
		title.add("도둑들"); title.add("다크나이트 라이즈"); title.add("늑대소년"); title.add("아이스에이지4"); title.add("바람과함께 사라지다"); title.add("레미제라블"); title.add("어벤져스"); title.add("광해");
		title.add("아이언맨3"); title.add("컨저링"); title.add("위대한 개츠비"); title.add("터보"); title.add("7번방의 선물"); title.add("선샤인온리스"); title.add("설국열차"); title.add("관상");
		title.add("명량"); title.add("나를찾아줘"); title.add("비긴어게인"); title.add("겨울왕국"); title.add("슬로우비디오"); title.add("숲속으로"); title.add("인터스텔라"); title.add("수상한그녀");
		title.add("베테랑"); title.add("킹스맨:시크릿에이전트"); title.add("뷰티인사이드"); title.add("인사이드아웃"); title.add("인턴"); title.add("위플래쉬"); title.add("어벤져스2"); title.add("암살");
		title.add("캡틴아메리카:시빌워"); title.add("부산행"); title.add("미비포유"); title.add("주토피아"); title.add("검사외전"); title.add("라라랜드"); title.add("엑스맨:아포칼립스"); title.add("터널");
		title.add("공조"); title.add("살인자의 기억법"); title.add("콜미바이유어네임"); title.add("너의 이름은"); title.add("아이캔스피크"); title.add("미녀와야수"); title.add("스파이더맨:홈커밍"); title.add("택시운전사");
		title.add("미션임파서블:폴아웃"); title.add("곤지암"); title.add("너의 결혼식"); title.add("코코"); title.add("완벽한타인"); title.add("맘마미아2"); title.add("어벤져스3"); title.add("보헤미안랩소디");
		title.add("스파이더맨:파프롬홈"); title.add("조커"); title.add("가장 보통의 연애"); title.add("겨울왕국2"); title.add("극한직업"); title.add("캣츠"); title.add("어벤져스4"); title.add("기생충");
		
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
		<!-- 네비게이션 -->
		
		<nav class="clearfix">
		<% if(userID == null) {
								%>
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#1">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#2">로그인</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a href="#3">회원가입</a></li>
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
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a href="#2">로그아웃</a></li>
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#3">회원가입</a></li>
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