<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Driver" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id1");
String pwd = request.getParameter("pwd1");
String dbUrl = "jdbc:mysql://localhost:3306/jsp_study";
String dbId = "root";
String	dbPwd = "yj921121";
Connection con;
PreparedStatement ps;
String result = id + "는 없는 아이디입니다.";
session.setAttribute("login", "false");
try {
	Class.forName("org.mariadb.jdbc.Driver"); // Driver를 사용하겠다.
	con = DriverManager.getConnection(dbUrl,dbId,dbPwd); 
	System.out.println("연결 성공");
	String sql = "select * from user where id = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1 , id);
	ResultSet rs= ps.executeQuery(); // 쿼리를 실행시키는 함수
	while(rs.next()) {
		if(pwd.equals(rs.getString("password"))){
			result = "로그인 성공하셨네요.";
			session.setAttribute("login", "true");
			session.setAttribute("id", id);
		} else {
			result = "비밀번호가 틀렸습니다.";
		}
	}
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();			
}

boolean login = false;

%>

<script>
	alert("<%=result%>");
	location.href="/login.jsp";
</script>

</body>
</html>