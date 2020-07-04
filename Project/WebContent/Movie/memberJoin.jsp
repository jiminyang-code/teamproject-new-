<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Movie.Dao"%>
<jsp:useBean id="user" class="Movie.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="user" param="userID" />
<jsp:setProperty property="userPW" name="user" param="userPW" />
<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	PrintWriter script = response.getWriter();
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
table {
	position: absolute;
	padding: 20px;
	width: 500px;
	background-color: #EEEFF1;
	border-radius: 5px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: montserrat;
	box-sizing: border-box;
}

body {
	min-height: 100vh;
	background-image: linear-gradient(120deg, #3498db, #8e44ad);
}

.login-form {
	width: 360px;
	background: #f1f1f1;
	height: 720px;
	padding: 80px 40px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.login-form h1 {
	text-align: center;
	margin-bottom: 60px;
}

.txtb {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 30px 0;
}

.txtb input {
	font-size: 15px;
	color: #333;
	border: none;
	width: 100%;
	outline: none;
	background: none;
	padding: 0 5px;
	height: 20px;
}

.txtb span::before {
	content: attr(data-placeholder);
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	z-index: -1;
	transition: .5s;
}

.txtb span::after {
	content: '';
	position: absolute;
	width: 0%;
	height: 2px;
	background: linear-gradient(120deg, #3498db, #8e44ad);
	transition: .5s;
}

.focus+span::before {
	top: -5px;
}

.focus+span::after {
	width: 100%;
}

.logbtn {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background: linear-gradient(120deg, #3498db, #8e44ad, #3498db);
	background-size: 200%;
	color: #fff;
	outline: none;
	cursor: pointer;
	transition: .5s;
}

.logbtn:hover {
	background-position: right;
}

.bottom-text {
	margin-top: 60px;
	text-align: center;
	font-size: 13px;
}



</style>

</head>
<body>

	<form id="fm" onsubmit="return check(this);"
		action="memberJoinAction.jsp" class="login-form" method="post">
			<h1>회원가입</h1>
				
				<div class="txtb">
					<input type="text" name="userID" id="userID">
					<span data-placeholder="아이디 입력"></span>
				</div>
				
				<div class="bottom-text" style="margin-top: -20px;">
					아이디 중복검사 <input type="button" value="확인" onclick="idFind()">
				</div>
			
				<div class="txtb">
				<input type="password" name="userPW">
				<span data-placeholder="비밀번호 입력"></span>
				</div>
				<div class="bottom-text" style="margin-top: -20px;">영어+특수문자+숫자를 섞어서 (8~16)자리</div>
				
				<div class="txtb">
				<input type="password" name="correctPassword">
				<span data-placeholder="비밀번호 입력 확인"></span>
				</div>
				
				<div class="txtb">
				<input type="text" name="userName">
				<span data-placeholder="이름"></span>
				</div>
				
				<div class="txtb">
				<input type="email" name="email">
				<span data-placeholder="이메일 주소"></span>
				</div>
				
				<div class="txtb">
				<input type="text" name="phone">
				<span data-placeholder="연락처"></span>
				</div>

				   <input type="submit" class="logbtn"
					name="join-button" value="회원가입">

				<div class="bottom-text">
					계정이 이미 있으신가요? <a href="http://localhost/Project/Movie/login.jsp">로그인 하러가기</a>
				</div>
	</form>
	<%-- <%
		if (userID != null) {
	%>
	<div class="logout">
		<h1>로그아웃 하시겠습니까?</h1>
		<form action="logoutAction.jsp" method="get">
			<input type="submit" name="logout-button" value="로그아웃">
		</form>
	</div>
	<%
		} else {
	%>

	<div>
		기존의 계정이 있으시다면?
		<form action="login.jsp" method="get">
			<input type="submit" name="login-button" value="로그인 하러가기">
		</form>
	</div>


	<%
		}
	%> --%>
	<script type="text/javascript">
		$(".txtb input").on("focus",function(){
			$(this).addClass("focus");
		});
		
		$(".txtb input").on("blur",function(){
			if($(this).val() == "")
			$(this).removeClass("focus");
		});	
	</script>
	<script>
	var text ="";
	var count = 0;
	
	function print() {
	    alert("asdf")
	}
	
	function idFind() {
	      let inputId = document.getElementsByName('userID');
	      location.href = 'idcheckAction.jsp?userID=' + inputId[0].value;
	   }
	
	function idFind2() {
		var userID = $('#userID').val();
		$.ajax ({
			type:'POST',
			url:'idcheckAction.jsp',
			data: {userID: userID},
			success: function(result) {
				if(result ==1) {
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		});
	}
	
	
	function inputClear() {				
		document.getElementById("fm").reset();
	}
	
	
	function check() {
		count ++;
		//dom객체 찾기
		var userID = document.getElementsByName("userID");
		var userPW = document.getElementsByName("userPW");
		var correctPassword = document.getElementsByName("correctPassword");
		var userName = document.getElementsByName("userName");
		var email = document.getElementsByName("email");
		var phone = document.getElementsByName("phone");

		//정규표현식
		var idPattern = /^[a-zA-Z0-9]{4,12}$/;
		var pwPattern = /^[a-zA-Z0-9]{4,12}$/;
		var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
		//아이디 유효성 검사
		if (idPattern.test(userID[0].value) == true) {
			text += "ID : " + userID[0].value + "\n";
			
		} else { 
			alert("아이디를 잘못 입력 하셨습니다.");
		}
		
		
		//비밀번호 유효성 검사
		if((pwPattern.test(userPW[0].value) == true) && 
            (pwPattern.test(correctPassword[0].value) == true)
            && (userPW[0].value == correctPassword[0].value))
               text += "PW : " + userPW[0].value + "\n";
              
     	 else 
                 alert("패스워드가 일치 하지 않습니다.");
		
		
		//이메일 유효성 검사
		if (emailPattern.test(email[0].value) == true) {
			text += "EMAIL : " + email[0].value + "\n";
		} else {
			alert("이메일을 잘못 입력 하셨습니다.");
		}
		
		
		//폰번호 유효성 검사
		if (phonePattern.test(phone[0].value) == true) {
			text += "PHONE : " + phone[0].value + "\n";
		} else {
			alert("폰번호 형식이 잘못 되었습니다.");
		}
		
		alert(text);
		
		if(count == 0+count)
	        text = [];
	}
	
	
</script>


</body>
</html>