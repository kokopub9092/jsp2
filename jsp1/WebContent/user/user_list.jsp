<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Driver" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String url = "jdbc:mysql://localhost:3306/jsp_study";
String id = "root";
String	pwd = "yj921121";
Connection con;
Statement st;
try {
	Class.forName("org.mariadb.jdbc.Driver"); // Driver를 사용하겠다.
	con = DriverManager.getConnection(url,id,pwd); 
	System.out.println("연결 성공");
	st = con.createStatement(); // 쿼리를 만들어주는 함수 
	ResultSet rs= st.executeQuery("select * from user where id='red' "); // 쿼리를 실행시키는 함수
	out.println("<table border='1'>");
	while(rs.next()) { // rs.next는 줄을 내린다.
		out.println("<tr>");
	
		out.println("<td>");
		out.print(rs.getString("user_no"));
		out.println("</td>");
		
		out.println("<td>");
		out.print(rs.getString("id"));
		out.println("</td>");
		
		out.println("<td>");
		out.print(rs.getString("password"));
		out.println("</td>");
		
		out.println("<td>");
		out.println(rs.getString("name")+"<br>");
		out.println("</td>");
		
		out.println("</tr>");
	}
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();			
}
%>
</body>
</html>