<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<style>
	input[type=submit] {
	   padding:5px 15px; 
	   background:#ccc; 
	   border:0 none;
	   color: #006fff; 
	   cursor:pointer;
	   width:100px;
	   height:40px;
	   -webkit-border-radius: 5px;
	   border-radius: 5px; 
	}
</style>
<body>
<img src="imgs/check_2.jpg" width="300" border="0"/><br/>

<table border = 1 align = center>
	<tr class = "Label" height = 40>
		<td align = center width = 80>이름</td>
		<td align = center width = 130>전화번호</td>
		<td align = center>도착예정시간</td>
		<td align = center>객실 이름</td>
		<td align = center>숙박일 수</td>
		<td align = center>CheckIn</td>
		<td align = center>CheckOut</td>
		<td align = center>결제한 날짜</td>
		<td align = center>예약정보</td>
	</tr>
<%
	//check.jsp에서 가져온 name세션 String형변환으로 nameSession 변수에 할당
	String nameSession = (String)session.getAttribute("name");

	if(session.getAttribute("name") == null)
	{
		//세션유지가 안될 경우, 다시 예약확인 페이지로 넘어간다.
		response.sendRedirect("main.jsp?target=checkForm");
	}	
	else
	{
		//정상적으로 로그인되었을 경우 예약자의 정보를 화면에 표시한다.
		out.println("<font size = 5>");
		out.println(session.getAttribute("name") + " 님의 예약정보입니다.");
		out.println("</font>");
	}


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
			
			//사용자가 중복으로 예약했을경우를 대비해 내림차순하여 최신예약정보가 위로가게끔 설정
			String sql ="select * from member where name = ? order by num DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nameSession);	
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				int num = rs.getInt("num");		//예약번호
				String name = rs.getString("name");
				String tel = rs.getString("phone");
				String birthday = rs.getString("birth");
				String time = rs.getString("time");
				String email1 = rs.getString("email1");
				String email2 = rs.getString("email2");
				String emailcheck = rs.getString("emailcheck");
				String room = rs.getString("room");
				String day = rs.getString("day");
				String price = rs.getString("price");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				Date register = rs.getDate("reg_date");
				
				String phone = tel.substring(0,3) + "-" + tel.substring(3,7) + "-" + tel.substring(7,11);
				String birth = birthday.substring(0,4) + "-" + birthday.substring(4,6) + "-" + 
						birthday.substring(6,8);
%>
	<tr>
		<td align = center width = 80><%=name%></td>
		<td align = center width = 130><%=phone%></td>
		<td align = center><%=time%></td>
		<td align = center><%=room%></td>
		<td align = center><%=day + "일"%></td>
		<td align = center><%=checkin%></td>
		<td align = center><%=checkout%></td>
		<td align = center><%=register%></td>
		<td align = center>
		<!-- 예약정보를 보기위해 해당 num값을 member2.jsp에 넘겨줌 -->
		<form name = member method = post action = "main.jsp?target=member2&num=<%=num%>">
		<input type = submit value = "예약정보">
		</form>
		</td>
	</tr>
<%
			}
%>		
</table>
<%
		}catch(Exception e){
			e.printStackTrace();
			out.println("<script>alert('예약정보를 불러오는데 실패하였습니다.');history.back();</script>");
		}finally{
			if(rs != null)// 쿼리실행 객체 close
				try{rs.close();}catch(SQLException e){}
			if(pstmt != null)// 쿼리실행 객체 close
				try{pstmt.close();}catch(SQLException e){}
			if(conn != null)// Connection 객체 close
				try{conn.close();}catch(SQLException e){}
		}
%>
</body>
</html>