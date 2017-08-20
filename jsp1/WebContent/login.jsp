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

<%=request.getParameter("id")%>
<%
String login = "false";
if(session.getAttribute("login")!=null){
	login = (String)session.getAttribute("login");
}
if(login.equals("false")){
%>
<form action = "login_ok.jsp">
아이디 : <input type="text" name ="id1" id="id" ><br>
비밀번호 : <input type="password" name ="pwd1" id="pwd"><br>
<input type="submit" value="로그인">
</form>

<%
}else if(login.equals("true")){
	out.println(session.getAttribute("id") + "님 환영합니다.");
}
%>




</body>
</html>