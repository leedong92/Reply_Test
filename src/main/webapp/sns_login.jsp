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
	<h1>๋ก๊ทธ์ธ</h1>
	<form action="sns_check.jsp" method="post">
		<img src="samo.jpg" width="200"><br>
		๐ถ<input type="text" name="id" placeholder="์์ด๋"><br><br>
		๐<input type="password" name="passwd" placeholder="๋น๋ฐ๋ฒํธ"><br><br>
		<input type="submit" value="๋ก๊ทธ์ธ">
		<input type="button" value="ํ์๊ฐ์" onclick="location.href='sns_join.jsp'">
		<input type="button" value="sns๋ฑ๋ก" onclick="location.href='sns_snsweb.jsp'">
	</form>
	
</body>
</html>