<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
			
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#wrapper {
		width: 90%;
		max-width: 1100px;
		min-width: 760px;
		margin: 50px auto;
	}
	
	#columns {
		-webkit-column-count: 2;
		-webkit-column-gap: 10px;
		-moz-column-count: 2;
		column-count: 2;
		-moz-column-gap: 10px;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		background: #fff;
		border: 2px solid #aaa;
		border-bottom: 3px solid #bbb;
		padding: 15px;
		padding-bottom: 15px;
		margin: 15px;
	}
	
	.card img {
		width: 100%;
		border-bottom: 1px solid #ccc;
		padding-bottom: 15px;
		margin-bottom: 5px;
	}
	
	.card p{
		font-family: "맑은 고딕", 돋움;
		color: #333;
		margin: 0;
		padding: 10px;
	}
	
	@media(min-width: 960px) {
		#columns {
			-webkit-column-count: 3;
			-moz-column-count: 3;
			column-count: 3;
		}
	}
	
	@media(min-width: 1100px) {
		#columns {
			-webkit-column-count: 4;
			-moz-column-count: 4;
			column-count: 4;
		}
	}
	
</style>
</head>
<body>
		<div id="wrapper">
				<div id="columns">
					<%for(int i=1; i<10; i++) { %>
					<div class="card">
						<a href="../images/Sirano<%=i%>.jpg"><img alt="" src="../images/Sirano	<%=i%>.jpg"></a>
						<p></p>
					</div>
					<% } %>
				</div>
		</div>
</body>
</html>