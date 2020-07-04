<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Movie.Dao"%>
<jsp:useBean id="dto" class="Movie.UserDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="dto" property="userID" param="userID" />  
<jsp:setProperty name="dto" property="userPW" param="userPW" /> 


<%
	/*선언부분*/
	request.setCharacterEncoding("UTF-8");
	String userID = null; //입력ID를 담을 변수
 	/* String id = request.getParameter("userID");
	String pw = request.getParameter("userPW");
	dto.setUserID(id);
	dto.setUserPW(pw);  */ /*setProperty param속성으로 대체*/
	
	Dao dao = Dao.getInstance(); //DB연결 객체생성
	
	int result = dao.login(dto.getUserID(), dto.getUserPW()); 
	//로그인 메서드 사용(정수 0, 1, -1, -2 중에 하나가 담김)
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%	
		/* ID검사  */
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(request.getParameter("userID") == "") {
			PrintWriter script = response.getWriter();
			String str = "<script>alert('아이디를 입력해주세요.'); history.back();</script>";
			script.println(str);
			return;
		}
	
	
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("history.back();");
			script.println("</script>");
			return;
		}
		
		if(result == 1) {
			session.setAttribute("userID",dto.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공입니다.')");
			script.println("location.href='../ViewPage/main.jsp'");
			script.println("</script>");
			return;
		} 
		
		else if(result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('패스워드가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
			return;
		}
		
		else if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>"); 
			}
		
		else if(result == -2) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류입니다.')");
				script.println("history.back()");
				script.println("</script>");
				return;
			}
		
		
	%>

</body>

</html>
