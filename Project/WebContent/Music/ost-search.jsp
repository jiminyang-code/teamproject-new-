<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Insert title here</title>
<style>

/*검색창 디자인*/
body {
	margin: 0;
	padding: 0;
}

.header {
	height: 100vh;
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url(image.jpg);
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: sans-serif;
}

h1 {
	color: #fff;
	margin-bottom: 70px;
	font-size: 45px;
	letter-spacing: 2px;
	text-align: center;
}

.search-field {
	height: 50px;
	padding: 10px;
	border: none;
	border-radius: 25px;
	outline: none;
}

.business {
	width: 400px;
}

.location {
	width: 200px;
}

.search-btn {
	height: 50px;
	width: 150px;
	background: #ffeb3b;
	border: none;
	color: #000;
	border-radius: 25px;
}

.search-btn: hover {
	background: #ffc107;
	cusor: pointer;
}

.form-box {
	background: rgba(0, 0, 0, 0.5);
	padding: 30px;
}

.pad {
	position: relative;
	border: 1px solid red;
}

.pad img {
	margin-left: 15px;
}

.pad a {
	display: inline-block;
	font-weight: bold;
	font-size: 20px;
	position: absolute;
	padding: 14px 2px 15px 50px;
}


.image {
	position: absolute;
	left: 770px;
}

.search-bar {
	position: absolute;
	right: 0;
	top: 30px;
	width: 280px;
	margin: 0 auto;	
}
</style>

</head>
<body>
	

	<div class="header">
		<form action="ostAction.jsp" method="get">
			<h1>어떤 음악을 찾으세요?</h1>
			<div class="form-box">
				<input type="text" class="search-field business" name="m_search" placeholder="영화제목">
				<input type="submit" class="search-btn" value="search">
			</div>
		</form>
	</div>
</body>


</html>