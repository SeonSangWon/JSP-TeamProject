<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String birthday = request.getParameter("birthday");
	
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
			
			String sql = "select * from member where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String nameCheck = rs.getString("name");
			String telCheck = rs.getString("phone");
			String birthdayCheck = rs.getString("birth");
			
			//입력한값의 이름/전화번호/생년월일과 next()로 가져온 이름/전화번호/생년월일이 같을경우
			if(nameCheck.equals(name) && telCheck.equals(tel) && birthdayCheck.equals(birthday))
			{
				//받아온 name값 Session에 저장
				session.setAttribute("name", name);
				response.sendRedirect("main.jsp?target=member");
			}
			else
			{
				out.println("<script>alert('예약된 정보가 없습니다.');history.back();</script>");
			}
			
		}catch(Exception e){
			//관리자 ID
			String MasterID = "admin";
			if(name.equals(MasterID))
			{
				session.removeAttribute("name");
				session.setAttribute("Master", MasterID);
				out.println("<script>alert('관리자모드로 들어갑니다.');</script>");
				out.println("<script>location.href='main.jsp?target=memberList';</script>");
			}
			else
			{
				out.println("<script>alert('등록된 이름이 아닙니다.');history.back();</script>");
			}
		}finally{
			if(pstmt != null)// 쿼리실행 객체 close
				try{pstmt.close();}catch(SQLException e){}
			if(conn != null)// Connection 객체 close
				try{conn.close();}catch(SQLException e){}
		}
%>
<!-- ------------------------------------------------------------------------ -->
</body>
</html>