<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.InitialContext, javax.naming.Context" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<%
	System.out.println("1 ");
	InitialContext initCtx = new InitialContext();
	System.out.println("2 " + initCtx);
	Context envContext = (Context)initCtx.lookup("java:comp/env");
	System.out.println("3 " + envContext);
	DataSource ds = (DataSource) envContext.lookup("jdbc/Project"); //소스발견시 프로젝트에 접근하도록
	System.out.println("4 " + ds.getConnection());
	System.out.println("5 " + ds);
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT VERSION();");
	
	while(rs.next()) {
		out.println("MySQL Version: "+rs.getString("version()"));
	}
	rs.close();
	stmt.close();
	conn.close();
	initCtx.close();
	
	%>
</body>
</html>