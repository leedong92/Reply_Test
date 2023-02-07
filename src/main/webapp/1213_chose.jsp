<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
	
	String uploadPath = request.getRealPath("img");
	int size = 10 * 1024 * 1024;
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";

	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");

		Enumeration files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
<body>
	올린사람:<%=name %><br>
	제목:<%=subject %><br>
	파일명1:<a href="img/<%=filename1 %>"><%=filename1 %></a><br>
</body>
</html>