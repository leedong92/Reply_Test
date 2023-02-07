<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jspDB.UserDao"%>
<%@page import="jspDB.ReplyDao"%>
<%@page import="jspDB.Member"%>
<%@page import="jspDB.Reply"%>
<%@page import="java.util.*"%>
<%
Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>appendReply</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	String board = request.getParameter("BOARDID");
	String id = request.getParameter("REPLYID");
	String contents = request.getParameter("CONTENTS");
	
	Reply re = new Reply();
	
	re.setBoardid(board);
	re.setId(id);
	re.setContents(contents);
	
	ReplyDao.getInstance().insertReply(re);
	%>
	<script>
		alert("댓글작성 완료");
	</script>
	<input type="button" value="sns등록" onclick="location.href='replyForm.jsp'">
	
</body>
</html>