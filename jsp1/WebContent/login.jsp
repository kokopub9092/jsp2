<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

out.println("입력하신 아이디 : " + id);
out.println("입력하신 비밀번호 : " + pwd);

String dbId = "really9092";
String dbPwd = "resd";
String result = "";
boolean login = false;
if(id.equals(dbId)){
	if(pwd.equals(dbPwd)){
		result = "로그인에 성공하셨습니다.";
		login=true;
	}else{
		result = "비밀번호가 틀렸습니다.";
	}
}else{
	result = "없는 아이디입니다.";
}
%>

<script>
	alert("<%=result%>");
	if("<%=login%>"=="false"){
		location.href="index.html";
	}
</script>

</body>
</html>