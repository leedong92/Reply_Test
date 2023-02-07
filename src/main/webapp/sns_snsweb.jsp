<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns_snsweb</title>
<style>
	body{
		text-align:center;
	}
	
</style>
</head>
<body>
<div>
	<h1>SNS 웹 개발</h1>
		<img src="dog.jpg" width="150" class="fixed">
		<form action="sns_login.jsp" method="post">
				<td width="50"><input type="submit" value="로그인"></td>
				<input type="button" value="로그아웃" onclick="location.href='sns_logout.jsp'">
		</form>
		
		<br>
		<form action="sns_selectMember.jsp" method="post">
			<tr>
				<td width="50"><input type="submit" value="SNS등록"><br></td>
			</tr>
		</form>
		
		
</div>
</body>
</html>