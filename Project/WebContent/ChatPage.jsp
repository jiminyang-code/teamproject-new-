<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao" %>
<%@ page import="chat.ChatDTO" %>
<%@ page import="chat.ChatDAO" %>

<%
		String userID = null;

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		
		String toID = null;
		if (request.getParameter("toID") != null) {
			toID = (String) request.getParameter("toID");
		}
		
		
		if(userID == null) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "로그인이 되어 있지 않습니다.");
			response.sendRedirect("Movie/login.jsp");
			return;
		}
		
		if (toID == null) {
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "대화상대가 없습니다.");
			response.sendRedirect("/Project/ChatPage.jsp");
			return;
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function autoClosingAlert(selector, delay) {
	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() { alert.hide() }, delay);
}


function submitFunction() {
	var fromID = '<%= userID%>';
	var toID = '<%= toID%>';
	var chatContent = $('#chatContent').val(); //채팅내용
	$.ajax(	{
		type : "POST",
		url : "./chatSubmitServlet",
		data : {
			fromID : encodeURIComponent(fromID),
			toID : encodeURIComponent(toID),
			chatContent : encodeURIComponent(chatContent)
		},
		success : function(result) {
			if (result == 1) {
				autoClosingAlert('#successMessage', 2000);
			} else if (result == 0) {
				autoClosingAlert('#dangerMessage', 2000);
			} else {
				autoClosingAlert('#warningMessage', 2000);
			}
		}
	});
	$('#chatContent').val('');
}


var lastID = 0; //마지막 대화 chatID

function chatListFunction(type) {
	var fromID = '<%= userID%>';
	var toID = '<%= toID%>';
	$.ajax({
		type: "POST",
		url : "./chatListServlet",
		data: {
			fromID: encodeURIComponent(fromID),	
			toID: encodeURIComponent(toID),
			listType: type // [궁금한 부분]
		},
		success: function(data) {
			if(data=="") return;
			var parsed = JSON.parse(data); //제이슨 형태로 데이터 파싱
			var result = parsed.result;
			for (var i = 0; i < result.length; i++) {// [궁금한 부분]
				addChat(result[i][0].value, result[i][2].value,result[i][3].value);
			}
			lastID = Number(parsed.last); //가장 마지막으로 전달받은 chatID가져오기
		}
	});
}

function addChat(chatName, chatContent, chatTime) {
	$('#chatList').append('<div class="row">' +
	'<div class="col-lg-12">' + 
	'<div class="media">' +
	'<a class="pull-left" href="#">' +
	'<img class="media-object img-circle" src="../images/icon.png" style="width: 30px; height: 30px;" alt="">' +
	'</a>' +
	'<div class="media-body">'+
	'<h4 class="media-heading">'+
	chatName +
	'<span class="small pull-right">' +
	chatTime +
	'</span>'+
	'</h4>' +
	'<p>' +
	chatContent +
	'</p>' +
	'</div>' +
	'</div>' +
	'</div>' +
	'</div>' +
	'<hr>'); 
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}

function getInfiniteChat() { //몇초간격으로 새로운 메시지가 왔는지 가져오는것
	setInterval(function() {
		chatListFunction(lastID);
	},3000);
}
	
	
</script>
</head>
<body>

	<div class="container bootstrap snippet">
		<div class="row">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4>
							<i class="fa fa-circle text-green"></i>실시간 채팅창
						</h4>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatList" class="portlet-body chat-widget"
						style="overflow-y: auto; width: auto; height: 600px;"></div>
					<div class="portlet-footer">
						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 50px;" id="chatContent"
									class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="alert alert-success" id="successMessage"
		style="display: none;">
		<strong>메시지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage"
		style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage"
		style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	
	<script type="text/javascript">
	 $('#messageModal').modal("show");
	 </script>
	 <%
	 	session.removeAttribute("messageContent");
	 	session.removeAttribute("messageType");
	 %>
	 
	 <!--특정시간을 주기로 데이터베이스 목록을 가져오기  -->
	 <script>
	 
	 $(document).ready(function(){
		 chatListFunction('ten');
		 getInfiniteChat();
	 });
	 
	 
	</script>
</body>

</html>