<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
//가져온 세션이 null 또는 세션 Master(admin)와 admin값이 다를경우 main.jsp로 돌아간다.
	if(session.getAttribute("Master") == null ||
			! ((String)session.getAttribute("Master")).equals("admin"))
	{
		out.println("<script>");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
	else
	{
		//out.println("<script>");
		//out.println("alert('관리자모드로 접속합니다.')");
		//out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드 - 예약자 리스트</title>
</head>
<style>
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
<center><img src="imgs/memberList_1.jpg" width="800" border="0"/></center>

<table border = 1 class = monospace align = center>
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
		//DB연동 완료
		
		String sql = "SELECT * FROM member order by num DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			int num = rs.getInt("num");
			String name = rs.getString("name");
			String tel = rs.getString("phone");
			String birthday = rs.getString("birth");
			String time = rs.getString("time");
			String email1 = rs.getString("email1");
			String email2 = rs.getString("email2");
			String emailcheck = rs.getString("emailcheck");
			String room = rs.getString("room");
			String day = rs.getString("day") + "일";
			String checkin = rs.getString("checkin");
			String checkout = rs.getString("checkout");
			String price = rs.getString("price");
			String bank = rs.getString("bank");
			Date register = rs.getDate("reg_date");
			
			String phone = tel.substring(0,3) + "-" + tel.substring(3,7) +
					"-" + tel.substring(7,11);
%>
	<tr class = "Label" height = 40>
		<td align = center><%= name %></td>
		<td align = center><%= phone %></td>	
		<td align = center><%= time %></td>	
		<td align = center><%= room %></td>	
		<td align = center><%= day %></td>	
		<td align = center><%= checkin %></td>
		<td align = center><%= checkout %></td>
		<td align = center><%= register %></td>
		<!-- 화면에 보이지않고 값을 전달하기위한 Hidden 사용 -->
		<form name = form method = post>
		<input type = hidden name = num value = "<%= num %>">
		<input type = hidden name = name value = "<%= name %>">
		<input type = hidden name = tel value = "<%= tel %>">
		<input type = hidden name = birthday value = "<%= birthday %>">
		<input type = hidden name = time value = "<%= time %>">
		<input type = hidden name = email1 value = "<%= email1 %>">
		<input type = hidden name = email2 value = "<%= email2 %>">
		<input type = hidden name = emailcheck value = "<%= emailcheck %>">
		<input type = hidden name = room value = "<%= room %>">
		<input type = hidden name = day value = "<%= day %>">
		<input type = hidden name = price value = "<%= price %>">
		<input type = hidden name = checkin value = "<%= checkin %>">
		<input type = hidden name = checkout value = "<%= checkout %>">
		<input type = hidden name = bank value = "<%= bank %>">
		<input type = hidden name = register value = "<%= register %>">
		<td align = center><input type = button onclick = "javascript:popup(this.form);" value = "예약정보"></td>
		</form>
<script language="javascript">
	
	//memberInfo.jsp를 팝업창으로 띄워주면서 값을 전달함
	function popup(frm)
	{
	  var url    ="memberInfo.jsp";
	  var title  = "testpop";
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=500, height=500, top=0,left=20"; 
	  window.open("", title,status);
	  
	  frm.target = title; 
	  frm.action = url;     
	  frm.method = "post";
	  frm.submit();     
	  }
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>alert('예약정보를 불러오지못했습니다.');history.back();</script>");
	}finally{
		if(rs != null)//ResultSet 객체 close
			try{rs.close();}catch(SQLException e){}
		if(pstmt != null)// 쿼리실행 객체 close
			try{pstmt.close();}catch(SQLException e){}
		if(conn != null)// Connection 객체 close
			try{conn.close();}catch(SQLException e){}
	}
%>
	</tr>
</table>
<br/>
<br/>

</body>
</html>