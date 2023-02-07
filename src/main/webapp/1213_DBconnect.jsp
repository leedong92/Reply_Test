<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Database Connect</title>
</head>
<body>
	<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/friend?serverTimezone=Asia/Seoul";

	try {
		Class.forName(driver);
		System.out.println("MySQL 드라이버 검색 성공...");
		out.println("MySQL 드라이버 검색 성공...");
	} catch (ClassNotFoundException e) {
		System.out.println("MySQL 드라이버 검색 오류");
		e.printStackTrace();
		return;
	}
	Connection conn = DriverManager.getConnection(dbURL, user, pass);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		pstmt = conn.prepareStatement("select * from custome");
		rs = pstmt.executeQuery();
		while(rs.next()){
			String name = rs.getString("name");
			String grade = rs.getString("grade");
			String age = rs.getString("age");
			String job = rs.getString("job");%><br>
		<% 	out.println(name+" "+grade+" "+age+" "+job+" ");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>