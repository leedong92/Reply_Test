<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "jspDB.UserDao" %>
    <%@page import = "jspDB.Member" %>
    <%@page import = "java.util.*" %>
    <%Cookie[] cookies = request.getCookies(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns_check</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");		
		String passwd = request.getParameter("passwd");
		
		Member mem = UserDao.getInstance().selectOne(id);
		
		String chkid = mem.getId();
		String chkpw = mem.getPw();
		String name = mem.getName();
		
		if(id.equals(chkid) && passwd.equals(chkpw)){
			response.addCookie(new Cookie("ID",chkid));
			
			response.sendRedirect("sns_loginSuss.jsp");
		}else{
			response.sendRedirect("sns_loginFail.jsp");
		}
	%>
</body>
</html>