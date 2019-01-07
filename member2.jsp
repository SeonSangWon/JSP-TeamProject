<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%	
	String num = request.getParameter("num");
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
			
			String sql = "select * from member where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);	
			
			rs = pstmt.executeQuery();
			rs.next();
			
			String name = rs.getString("name");
			String tel = rs.getString("phone");
			String birthday = rs.getString("birth");
			String time = rs.getString("time");
			String email1 = rs.getString("email1");
			String email2 =  rs.getString("email2");
			String emailcheck = rs.getString("emailcheck");
			String room = rs.getString("room");
			String day = rs.getString("day") + "일";	
			String price = rs.getString("price");
			String checkin = rs.getString("checkin");
			String checkout = rs.getString("checkout");
			String bank = rs.getString("bank");
			Date register = rs.getDate("reg_date");
			
			String phone = tel.substring(0,3) + "-" + tel.substring(3,7) + "-" + tel.substring(7,11);
			String birth = birthday.substring(0,4) + "-" + birthday.substring(4,6) + "-" + 
							birthday.substring(6,8);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=name%>님의 예약하신 정보입니다.</title>
</head>
<script> 
		function Back(){
			self.location = "main.jsp?target=member";
		}
</script>
<style>
	input[type=submit] {
	    padding:5px 15px; 
	    background:#ff0000; 
	    border:0 none;
	    color: #ffffff; 
	    cursor:pointer;
	    width:100px;
	    height:40px;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
	input[type=button] {
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
.serif {font-family: serif;}
.sans-serif {font-family: sans-serif;}
.cursive {font-family: cursive;}
.fantasy {font-family: fantasy;}
.monospace {font-family: monospace;}
</style>
<body>

<div class = monospace>
<table>
	<tr height = 25>
		<td width = 250>결제한 날짜
		</td>
		<td><%= register %>
		</td>
		<td rowspan = 14><!-- <img src="imgs/main.jpg" width="700" height = 400 border="0"/> -->
			<%
			//객실 사진
				if(room.equals("나눔관 5406호"))
				{
			%>
					<img src="imgs/room_2.jpg" width="500" height = "450" border="0"/>
			<%
				}
				else
				{
			%>
					<img src="imgs/room_1.jpg" width="500" height = "450" border="0"/>
			<%
				}
			%>
		</td>
	</tr>
	<tr height = 25>
		<td>예약자 이름 
		</td>
		<td><%= name %>
		</td>
	</tr>
	<tr height = 25>
		<td>휴대전화
		</td>
		<td><%= phone %>
		</td>
	</tr>
	<tr height = 25>
		<td>생년월일
		</td>
		<td><%= birth %>
		</td>
	</tr>
	</tr>
	<tr height = 25>
		<td>도착예정시간
		</td>
		<td><%= time %>
		</td>
	</tr>
	<tr height = 25>
		<td>이메일
		</td>
		<td><%= email1 + "@" + email2 %>
		</td>
	</tr>
	<tr height = 25>
		<td>메일수신동의
		</td>
		<td><%= emailcheck %>
		</td>
	</tr>
	<tr height = 25>
		<td>객실 이름
		</td>
		<td><%= room %>
		</td>
	</tr>
	<tr height = 25>
		<td>숙박일 수
		</td>
		<td><%= day %>
		</td>
	</tr>
	<tr height = 25>
		<td>CheckIn
		</td>
		<td><%= checkin %>
		</td>
	</tr>
	<tr height = 25>
		<td>CheckOut
		</td>
		<td><%= checkout %>
		</td>
	</tr>
	<tr height = 25>
		<td>결제 금액 
		</td>
		<td><%= price %>
		</td>
	</tr>
	<tr height = 25>
		<td>입금은행
		</td>
		<td><%= bank %>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td width = 100>
		</td>
		<td>
		<form method = post action = "main.jsp?target=updateForm&num=<%=num%>">
			<input type = submit value = "예약 수정"/>
		</form>
		</td>
		<td>
		<form method = post action = "main.jsp?target=delete&num=<%=num%>">
			<input type = submit value = "예약 취소"/>
		</form>
		</td>
		<td><input type = button onclick = "Back()" value = "돌아가기">
		</td>
	</tr>
</table>
</div>
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