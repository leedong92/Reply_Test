<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jspDB.UserDao"%>
<%@page import="jspDB.Member"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("idwd");
	String passwd = request.getParameter("passwd");
	String passwd2 = request.getParameter("passwd2");
	String name = request.getParameter("name");
	
	Member member = new Member();
	member.setId(id);
	member.setPw(passwd);
	member.setName(name);
	
	
	if(passwd.equals(passwd2)){
		UserDao.getInstance().insertMember(member);
		response.sendRedirect("sns_loginSuss.jsp");
	}else{
		response.sendRedirect("sns_loginFail.jsp");
	}
	%>
	

</body>
</html>