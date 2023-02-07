<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<style>
	
</style>
</head>
<body>
	
	<form action="sns_join_ok.jsp" method="post" align="center">
	<h2>회원가입</h2>
		아이디<br><input type="text" name="idwd"><br><br>
		비밀번호<br><input type="password" name="passwd"><br><br>
		비밀번호 확인<br><input type="password" name="passwd2"><br><br>
		이름<br><input type="text" name="name"><br><br>
		
		<input type="submit" value="가입">
		<input type="button" value="처음으로" onclick="location.href='sns_login.jsp'">
	</form>
	
	
</body>
</html>