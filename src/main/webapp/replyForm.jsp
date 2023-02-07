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
<title>replyForm</title>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th></th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		List<Member> list = UserDao.getInstance().selectAll();

		for (int i = 0; i < list.size(); i++) {
			String getid = list.get(i).getId();
		%>
		<tr>
			<td><%=list.get(i).getId()%></td>
			<td><%=list.get(i).getPw()%></td>
			<td><%=list.get(i).getName()%></td>
			<td></td>
		</tr>
		<%
		String boardid = request.getParameter("uid"); // 회원목록 id
		String replyid = getCookieValue(cookies, "ID"); // Reply 쓴 회원
		
		if (getid.equals(boardid)) {
			List<Reply> reply = ReplyDao.getInstance().selectAll(boardid);
			for (int j = 0; j < reply.size(); j++) {
		%>

		<tr>
			<td><%=j%>번째 댓글</td>
			<td><%=reply.get(j).getId()%></td>
			<td colspan="2"><%=reply.get(j).getContents()%></td>
		</tr>
		<%
		}
		%>

		<form action="appendReply.jsp" method="post">
			<tr>
				<td><input type="hidden" name="BOARDID" value=<%=getid%>></td>
				<td><input type="hidden" name="REPLYID" value=<%=replyid%>></td>
				<td><input type="text" name="CONTENTS"></td>
				<td><input type="submit" value="댓글등록"></td>
			</tr>
		</form>
		<%
		} else
		%>
		<tr></tr>
		<tr></tr>
		<%
		}
		%>
	</table>
	<br>
	<div id="re">
		<input type="button" value="처음으로"
			onClick="location.href = 'sns_snsweb.jsp'">
	</div>
</body>
</html>
<%!
private String getCookieValue(Cookie[] cookies, String name) {
		String value = null;
		if (cookies == null) {
			return null;
		}
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name))
				
				return cookie.getValue();
		}
		return null;
	}%>