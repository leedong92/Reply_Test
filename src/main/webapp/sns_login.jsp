<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	body{
		text-align:center;
	}
</style>
</head>
<body>
	<h1>로그인</h1>
	<form action="sns_check.jsp" method="post">
		<img src="samo.jpg" width="200"><br>
		🐶<input type="text" name="id" placeholder="아이디"><br><br>
		🐕<input type="password" name="passwd" placeholder="비밀번호"><br><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='sns_join.jsp'">
		<input type="button" value="sns등록" onclick="location.href='sns_snsweb.jsp'">
	</form>
	
</body>
</html>