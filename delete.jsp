<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소</title>
</head>
<body>
<%
	String num;
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
			
			//Master세션의 값이 들어있을 경우(관리자 권한으로 접근 시)
			if((String)session.getAttribute("Master") != null)
			{
				num = request.getParameter("num");
				
				String sql = "delete from member where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
		
				pstmt.executeUpdate();
				out.println("<script>alert('관리자 권한 : 예약을 취소합니다.');</script>");
				out.println("<script>window.close();</script>");
			}
			else
			{
				num = request.getParameter("num");
				
				String sql = "delete from member where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				
				pstmt.executeUpdate();				
				
				out.println("<script>alert('예약을 취소했습니다.');</script>");
				out.println("<script>location.href='main.jsp';</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null)// 쿼리실행 객체 close
				try{pstmt.close();}catch(SQLException e){}
			if(conn != null)// Connection 객체 close
				try{conn.close();}catch(SQLException e){}
		}
%>

</body>
</html>