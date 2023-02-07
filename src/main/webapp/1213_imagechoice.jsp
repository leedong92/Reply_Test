<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="1213_chose.jsp" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tbody>
				<tr>
					<td colspan="2">파일 업로드 폼</td>
				</tr>
				<tr>
					<td>올린 사람:</td>
					<td><input name="name" type="text"></td>
				</tr>
				<tr>
					<td>제목:</td>
					<td><input name="subject" type="text"></td>
				</tr>
				<tr>
					<td>파일명:</td>
					<td><input name="fileName1" type="file"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="전송"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>