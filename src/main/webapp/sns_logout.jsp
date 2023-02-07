<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	session.invalidate();
	Cookie user = new Cookie("id","");
	user.setMaxAge(0);
	response.addCookie(user);
	response.sendRedirect("sns_login.jsp");
	%>
</body>
</html>