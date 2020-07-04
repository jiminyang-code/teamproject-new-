<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Reply.ReplyDao"%>

<%  
		request.setCharacterEncoding("UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ReplyDao dao = ReplyDao.getInstance();
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/script.js"></script>
<title>아이언맨2 OST</title>
<style>

.search-btn: hover {
	background: #ffc107;
	cusor: pointer;
}

.pad a {
	font-size: 18px;
}

nav a: hover {
	text-decoration: none;
}

</style>

</head>
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
				<li onclick="location.href='../ViewPage/movie.jsp'"><a href="#4">MOVIE</a></li>
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
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a href="#3">회원가입</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp'"><a href="#4">MOVIE</a></li>
				<li onclick="location.href='./ost-search.jsp'"><a href="#5">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<% } %>
			<a href="" id="trigger"></a>
		</nav>
	</div>
	
	

	<h1 style="color: black;">Music is your life.</h1>
	<div class="search-bar">
	<form action="./ostAction2.jsp" method="get" class="form-inline my-2 my-lg-0">
		<input type="text" name="q_search" class="form-control mr-sm-2" type="search" placeholder="영화제목을 입력하세요">
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	</form>
	</div>
	<div class="image">
		<img alt="" src="./image/Frozen1.jpg" style="width: 500px;">
	</div>
	
	<section>
	
	
	
	<!--재생플레이어-->
	
		<div class="pads" style="width: 700px;">
			<div class="pad">
				<img name="igg" onmouseover="chImg(this,'over')"
					onmouseout="chImg(this,'out')" src="on.png"
					onclick="playOrPouseSong()">
					<a class="text">음악제목</a>
				<audio id="audio" src="./MusicFile/SF/IronMan2/1.mp3"></audio>
				
				<div class="seek-bar" onclick="seekSong()">
					<div class="fill" ></div>
					<div class="handle"></div>
				</div>
				<div class="currentTime">00:00<%for(int i=0; i<32; i++){ %>&nbsp;<%}%>00:00</div>
			</div>
			
			<hr>
			
				<%for(int i=2; i<7; i++) {%>
			<div class="pad">
				<img name="igg" onmouseover="chImg<%=i%>(this,'over')"
					onmouseout="chImg<%=i%>(this,'out')" src="on.png"
					onclick="playOrPouseSong<%=i%>()">
					<a class="text"><%=i%>. 음악제목</a>
					
				<audio id="audio<%=i%>" src="./MusicFile/SF/IronMan2/<%=i%>.mp3"></audio>
				
				<div class="seek-bar" onclick="seekSong<%=i%>()">
					<div class="fill" ></div>
					<div class="handle"></div>
				</div>
				<div class="currentTime">00:00</div>
			</div>
			
			<hr>
			<% } %>
	 </div>
		
	</section>
	
	<script>
		
	var strArray = ['Shoot to Thrill - AC/DC',
		"'Rock 'N' Roll Damnation - AC/DC'",
		'Guns for Hire - AC/DC',
		'Let There Be Rock - AC/DC'];
		
		var str = document.getElementsByClassName("text");
		
		for(var i=0; i<6; i++) {
			str[i].innerHTML = strArray[i];
		}
		
	</script>

</body>


<script type="text/javascript">
var audioCtx = new (window.AudioContext || window.webkitAudioContext)();

/* window.onload = function() {
	
	function fnc1() {
		document.getElementyById("igg").src="on3.png";
		
		var audio = document.getElementById("audio");
	    
		if (audio.paused) { 
	        audio.play();
	    } else { 
	        audio.pause(); 
	        audio.currentTime = 0 
	    }
	}
	function fnc2() {
		document.getElementyById("on_img").src="on.png";
	}
	
	var myBtn = document.getElementById("on_image");
	var attr = myBtn.getAttribute('src');
	
	if(attr == 'on.png') {
		myBtn.addEventListener("click",fnc1,false);
	} else {
		myBtn.addEventListener("click",fnc2,false);
	}
	
	
} */

/*클릭 이벤트 이미지 변경*/
var audio = document.getElementById("audio");
var audio2 = document.getElementById("audio2");
var audio3 = document.getElementById("audio3");
var audio4 = document.getElementById("audio4");
var audio5 = document.getElementById("audio5");
var audio6 = document.getElementById("audio6");
var barSize = 250;

var audios = [audio, audio2, audio3, audio4, audio5, audio6];


var fillBar = document.getElementsByClassName("fill");
var songSlider = document.getElementsByClassName("handle");
var totalBar = document.getElementsByClassName("seek-bar");
var currentTime = document.getElementsByClassName("currentTime");


var currentSong = 0;
var song;
var songs = ["kiss.mp3","LCPart3.mp3"];


//재생시에 핸들 움직이기
var updateSongSlider = function() {
	var c = Math.round(audio.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[0].value = c; //재생타임값을 핸들에 바인딩
}

var updateSongSlider2 = function() {
	var c = Math.round(audio2.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[1].value = c; //재생타임값을 핸들에 바인딩
}

var updateSongSlider3 = function() {
	var c = Math.round(audio3.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[2].value = c; //재생타임값을 핸들에 바인딩
}

var updateSongSlider4 = function() {
	var c = Math.round(audio4.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[3].value = c; //재생타임값을 핸들에 바인딩
}

var updateSongSlider5 = function() {
	var c = Math.round(audio5.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[4].value = c; //재생타임값을 핸들에 바인딩
}

var updateSongSlider6 = function() {
	var c = Math.round(audio6.currentTime); //입력값을 반올림한 수와 가장 가까운 정수 값을 반환합니다.
	songSlider[5].value = c; //재생타임값을 핸들에 바인딩
}
//음악 구간 바꾸기
var clickedBar = function(e) {
	if(!audio.ended) {
		var mouseX = e.pageX - totalBar[0].offsetLeft;
		var newtime = mouseX*audio.duration/barSize;
		
		audio.currentTime = newtime;
		fillBar[0].style.width = mouseX + 'px';
	}
};

var clickedBar2 = function(e) {
	if(!audio2.ended) {
		var mouseX = e.pageX - totalBar[1].offsetLeft;
		var newtime = mouseX*audio2.duration/barSize;
		
		audio2.currentTime = newtime;
		fillBar[1].style.width = mouseX + 'px';
	}
};

var clickedBar3 = function(e) {
	if(!audio3.ended) {
		var mouseX = e.pageX - totalBar[2].offsetLeft;
		var newtime = mouseX*audio3.duration/barSize;
		
		audio3.currentTime = newtime;
		fillBar[2].style.width = mouseX + 'px';
	}
};

var clickedBar4 = function(e) {
	if(!audio4.ended) {
		var mouseX = e.pageX - totalBar[3].offsetLeft;
		var newtime = mouseX*audio4.duration/barSize;
		
		audio4.currentTime = newtime;
		fillBar[3].style.width = mouseX + 'px';
	}
};

var clickedBar5 = function(e) {
	if(!audio5.ended) {
		var mouseX = e.pageX - totalBar[4].offsetLeft;
		var newtime = mouseX*audio4.duration/barSize;
		
		audio5.currentTime = newtime;
		fillBar[4].style.width = mouseX + 'px';
	}
};

var clickedBar6 = function(e) {
	if(!audio6.ended) {
		var mouseX = e.pageX - totalBar[5].offsetLeft;
		var newtime = mouseX*audio6.duration/barSize;
		
		audio6.currentTime = newtime;
		fillBar[5].style.width = mouseX + 'px';
	}
};

totalBar[0].addEventListener('click',clickedBar,false);
totalBar[1].addEventListener('click',clickedBar2,false);
totalBar[2].addEventListener('click',clickedBar3,false);
totalBar[3].addEventListener('click',clickedBar4,false);
totalBar[4].addEventListener('click',clickedBar5,false);
totalBar[5].addEventListener('click',clickedBar6,false);

setInterval(updateSongSlider, 1000); //1초마다 updateSongSlider 호출
setInterval(updateSongSlider2, 1000); //1초마다 updateSongSlider 호출
setInterval(updateSongSlider3, 1000); //1초마다 updateSongSlider 호출
setInterval(updateSongSlider4, 1000); //1초마다 updateSongSlider 호출
setInterval(updateSongSlider5, 1000); //1초마다 updateSongSlider 호출
setInterval(updateSongSlider6, 1000); //1초마다 updateSongSlider 호출

function seekSong() {
	audio.currentTime = songSlider[0].value;
	currentTime[0].textContent = convertTime(audio.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}

function seekSong2() {
	audio2.currentTime = songSlider[1].value;
	currentTime[1].textContent = convertTime(audio2.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}

function seekSong3() {
	audio3.currentTime = songSlider[2].value;
	currentTime[2].textContent = convertTime(audio3.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}

function seekSong4() {
	audio4.currentTime = songSlider[3].value;
	currentTime[3].textContent = convertTime(audio4.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}

function seekSong5() {
	audio5.currentTime = songSlider[4].value;
	currentTime[4].textContent = convertTime(audio5.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}

function seekSong6() {
	audio6.currentTime = songSlider[5].value;
	currentTime[5].textContent = convertTime(audio6.currentTime);
	//var size = parseInt(audio.currentTime*barSize/audio.duration);
}


function playOrPouseSong() {
	var attr = document.getElementsByName("igg");
	
	if(attr[0].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[0].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio.play();
   	
    for(var i=1; i<6; i++) {
    attr[i].src = "on.png";
	audios[i].pause();
    }
	
	
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[0].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio.pause();
	        //audio.currentTime = 0
		}
	}

function playOrPouseSong2() {
	var attr = document.getElementsByName("igg");
	
	if(attr[1].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[1].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio2.play();
    for(var i=0; i<6; i++) {
        if(i==1) ++i;
    	attr[i].src = "on.png";
		audios[i].pause();
        }
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[1].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio2.pause();
	        //audio.currentTime = 0
		}
	}

function playOrPouseSong3() {
	var attr = document.getElementsByName("igg");
	
	if(attr[2].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[2].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio3.play();
    for(var i=0; i<6; i++) {
        if(i==2) ++i;
    	attr[i].src = "on.png";
		audios[i].pause();
        }
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[2].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio3.pause();
	        //audio.currentTime = 0
		}
	}

function playOrPouseSong4() {
	var attr = document.getElementsByName("igg");
	
	if(attr[3].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[3].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio4.play();
    for(var i=0; i<6; i++) {
        if(i==3) ++i;
    	attr[i].src = "on.png";
		audios[i].pause();
        }
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[3].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio4.pause();
	        //audio.currentTime = 0
		}
	}


function playOrPouseSong5() {
	var attr = document.getElementsByName("igg");
	
	if(attr[4].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[4].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio5.play();
    for(var i=0; i<6; i++) {
        if(i==4) ++i;
    	attr[i].src = "on.png";
		audios[i].pause();
        }
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[4].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio5.pause();
	        //audio.currentTime = 0
		}
	}

function playOrPouseSong6() {
	var attr = document.getElementsByName("igg");
	
	if(attr[5].getAttribute('src') == "on2.png") {
	//재생버튼 첫클릭 이미지변경 + 음악재생
    //document.igg.src = "on3.png";
    attr[5].src = "on3.png";
    //audio = document.getElementById(audios[i]);
    audio6.play();
    for(var i=0; i<6; i++) {
        if(i==5) break;
    	attr[i].src = "on.png";
		audios[i].pause();
        }
    
		} else {
			//재생버튼 첫클릭 이미지변경 + 일시정지
			attr[5].src = "on2.png";
			//audio = document.getElementById(audios[i]);
			audio6.pause();
	        //audio.currentTime = 0
		}
	}

/* function next() {
	currentSong++;
	if(currentSong >2) {
		currentSong = 0;
	}
	playSong();
} */

//재생막대 진행
 audio.addEventListener('timeupdate',function(){ 
     
     var position = audio.currentTime / audio.duration;
     
     fillBar[0].style.width = position * 100 +'%';
     
     convertTime(Math.round(audio.currentTime));
 });

 audio2.addEventListener('timeupdate',function(){ 
     
     var position = audio2.currentTime / audio2.duration;
     
     fillBar[1].style.width = position * 100 +'%';
     
     convertTime2(Math.round(audio2.currentTime));
 });
 
audio3.addEventListener('timeupdate',function(){ 
     
     var position = audio3.currentTime / audio3.duration;
     
     fillBar[2].style.width = position * 100 +'%';
     
     convertTime3(Math.round(audio3.currentTime));
 });
 

audio4.addEventListener('timeupdate',function(){ 
    
    var position = audio4.currentTime / audio4.duration;
    
    fillBar[3].style.width = position * 100 +'%';
    
    convertTime4(Math.round(audio4.currentTime));
});

audio5.addEventListener('timeupdate',function(){ 
        
        var position = audio5.currentTime / audio5.duration;
        
        fillBar[4].style.width = position * 100 +'%';
        
        convertTime5(Math.round(audio5.currentTime));
    });

audio6.addEventListener('timeupdate',function(){ 
    
    var position = audio6.currentTime / audio6.duration;
    
    fillBar[5].style.width = position * 100 +'%';
    
    convertTime6(Math.round(audio6.currentTime));
});
//이미지 변경
function chImg(obj, state) {
	var attr = document.getElementsByName("igg");
	audio.playbackRate = 1;
	if(state == "over") {
		if(attr[0].getAttribute('src') == "on.png")
		attr[0].src = "on2.png";
		}
	if(state =="out" && attr[0].getAttribute('src') == "on2.png") {
		attr[0].src = "on.png";
	}	
}

	function chImg2(obj, state) {
	var attr = document.getElementsByName("igg");
	audio.playbackRate = 1;
	if(state == "over") {
		if(attr[1].getAttribute('src') == "on.png")
		attr[1].src = "on2.png";
		}
	if(state =="out" && attr[1].getAttribute('src') == "on2.png") {
		attr[1].src = "on.png";
		}
	}
	
	function chImg3(obj, state) {
	var attr = document.getElementsByName("igg");
	audio.playbackRate = 1;
	if(state == "over") {
		if(attr[2].getAttribute('src') == "on.png")
		attr[2].src = "on2.png";
		}
	if(state =="out" && attr[2].getAttribute('src') == "on2.png") {
		attr[2].src = "on.png";
		}
	}
	
	function chImg4(obj, state) {
		var attr = document.getElementsByName("igg");
		audio.playbackRate = 1;
		if(state == "over") {
			if(attr[3].getAttribute('src') == "on.png")
			attr[3].src = "on2.png";
			}
		if(state =="out" && attr[3].getAttribute('src') == "on2.png") {
			attr[3].src = "on.png";
			}
		}
	
	function chImg5(obj, state) {
		var attr = document.getElementsByName("igg");
		audio.playbackRate = 1;
		if(state == "over") {
			if(attr[4].getAttribute('src') == "on.png")
			attr[4].src = "on2.png";
			}
		if(state =="out" && attr[4].getAttribute('src') == "on2.png") {
			attr[4].src = "on.png";
			}
		}
	
	function chImg6(obj, state) {
		var attr = document.getElementsByName("igg");
		audio.playbackRate = 1;
		if(state == "over") {
			if(attr[5].getAttribute('src') == "on.png")
			attr[5].src = "on2.png";
			}
		if(state =="out" && attr[5].getAttribute('src') == "on2.png") {
			attr[5].src = "on.png";
			}
		}

//시간표시
function convertTime(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[0].textContent = min + ":" + sec;
	
	totalTime(Math.round(audio.duration));
}

function convertTime2(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[1].textContent = min + ":" + sec;
	
	totalTime2(Math.round(audio2.duration));
}

function convertTime3(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[2].textContent = min + ":" + sec;
	
	totalTime3(Math.round(audio3.duration));
}

function convertTime4(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[3].textContent = min + ":" + sec;
	
	totalTime4(Math.round(audio4.duration));
}

function convertTime5(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[4].textContent = min + ":" + sec;
	
	totalTime5(Math.round(audio5.duration));
}

function convertTime6(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[5].textContent = min + ":" + sec;
	
	totalTime6(Math.round(audio6.duration));
}


function totalTime(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[0].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}	

function totalTime2(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[1].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}

function totalTime3(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[2].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}

function totalTime4(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[3].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}

function totalTime5(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[4].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}

function totalTime6(seconds) {
	var min = Math.floor(seconds/60);
	var sec = seconds % 60;
	min = (min<10)? "0" + min : min;
	sec = (sec<10)? "0" + sec : sec;
	currentTime[5].textContent += "<%for(int i=0; i<16; i++){%> \u00A0<%}%>" + min + ":" + sec;
}

</script>
</html>