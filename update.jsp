<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String num = request.getParameter("num");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	String time = request.getParameter("time");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String check = request.getParameter("check");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");

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

			String sql = "update member set phone=?, birth=?, time=?, email1=?, email2=?, " +
					"emailcheck=?, checkin=?, checkout=? where num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, phone);
			pstmt.setString(2, birth);
			pstmt.setString(3, time);
			pstmt.setString(4, email1);
			pstmt.setString(5, email2);
			pstmt.setString(6, check);
			pstmt.setString(7, checkin);
			pstmt.setString(8, checkout);
			pstmt.setString(9, num);
			
			pstmt.executeUpdate();

			out.println("<script>alert('예약정보가 수정되었습니다.');</script>");
			out.println("<script>location.href='main.jsp?target=member';</script>");
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("main.jsp");
		}finally{
			if(pstmt != null)// 쿼리실행 객체 close
				try{pstmt.close();}catch(SQLException e){}
			if(conn != null)// Connection 객체 close
				try{conn.close();}catch(SQLException e){}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 수정-2</title>
</head>
<body>
</body>
</html>