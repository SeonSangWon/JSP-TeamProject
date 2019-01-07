<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String subject = request.getParameter("subject");
	String comment = request.getParameter("comment");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
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
		String sql = "select password from board where uid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		String getpassword = rs.getString("password");
		
		//가져온 비밀번호값과 가져온 비밀번호값이 일치할 경우
		if(getpassword.equals(password))
		{
			PreparedStatement pstmt2 = null;
			String newsql = "update board set subject=?, comment=? where uid=?";
			pstmt2 = conn.prepareStatement(newsql);
			pstmt2.setString(1, subject);
			pstmt2.setString(2, comment);
			pstmt2.setString(3, uid);
			
			pstmt2.executeUpdate();
			
			pstmt2.close();
			//out.println("<script>alert('글이 수정되었습니다.');</script>");
%>
			<script>
			alert("글이 수정되었습니다.");
			location.href = "main.jsp?target=board";
			</script>			
<%
		}
		else
		{
			out.println("<script>alert('비밀번호가 틀렸습니다.');history.back();</script>");			
		}		
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>alert('오류가 발생했습니다.');</script>");
	}finally{
		if(rs != null)
			try{rs.close();}catch(SQLException e){}
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException e){}
		if(conn != null)
			try{conn.close();}catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>

</body>
</html>