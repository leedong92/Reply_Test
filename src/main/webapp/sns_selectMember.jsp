<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="jspDB.UserDao"%>
<%@page import="jspDB.Member"%>
<%@page import="java.util.*"%>
<%Cookie[] cookies = request.getCookies(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns_selectMember</title>
<style>

th, td {
	padding:10px;
	text-align: center;
	background-color:yellow;
}
</style>
</head>
<body>
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th></th>
			</tr>
			<%
			request.setCharacterEncoding("utf-8");
			List<Member> list = UserDao.getInstance().selectAll();

			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><a href="modifyMember.jsp?uid=<%=list.get(i).getId()%>"><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getPw()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><input type="button" value="댓글"
					onclick="location.href='replyForm.jsp?uid=<%=list.get(i).getId()%>'"></td>
			</tr>
			<%
			}
			%>
		</table>
	</form>
	<input type="button" value="처음으로"
		onclick="location.href='sns_login.jsp'">

</body>
</html>