<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String subject = request.getParameter("subject");
	String comment = request.getParameter("comment");
	//글쓴 날짜값 받아오기
	Timestamp register = new Timestamp(System.currentTimeMillis());
	int ref = 0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 완료</title>
</head>
<body>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		//노트북
		String jdbcUrl = "jdbc:mysql://localhost:3306/house";
		String dbId = "jspid2";
		String dbPass = "yuhan1234";
		
		//학교
		//String jdbcUrl = "jdbc:mysql://localhost:3309/house";
		//String dbId = "sangwon";
		//String dbPass = "yuhan1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		if(conn == null)
		{
			out.println("<script>alert('데이터베이스 연동에 실패하였습니다.');history.back();</script>");
		}
		//DB연동 성공
		
		String sql = "INSERT INTO board (name, password, subject, comment, reg_date, ref) " +
						"VALUES(?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, subject);
		pstmt.setString(4, comment);
		//reg_date의 자료형은 Date이지만 Timestamp형으로도 가능함
		pstmt.setTimestamp(5, register);
		pstmt.setInt(6, ref);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("main.jsp?target=board");
		
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>alert('오류가 발생했습니다.');history.back();</script>");
	}finally{
		if(pstmt != null)// 쿼리실행 객체 close
			try{pstmt.close();}catch(SQLException e){}
		
		if(conn != null)// Connection 객체 close
			try{conn.close();}catch(SQLException e){}
	}
%>

</body>
</html>