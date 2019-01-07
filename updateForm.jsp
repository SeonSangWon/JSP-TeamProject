<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	String num = request.getParameter("num");
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
			
			String sql = "Select * from member where num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			//DB에서 해당 name에 대한 정보 가져오기
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
			Date register = rs.getDate("reg_date");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 수정-1</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	//이메일
	function email_change(){
	
		if(document.reserve.email.options[document.reserve.email.selectedIndex].value == '')
		 {
		 	 	document.reserve.email2.value = "";
		 }
		if(document.reserve.email.options[document.reserve.email.selectedIndex].value == '9')
		 {
		  		document.reserve.email2.value = "";
		  		document.reserve.email2.focus();
		}
		else
		{
				document.reserve.email2.value = document.reserve.email.options[document.reserve.email
					.selectedIndex].value;
		 }
	}
	
	//객실선택
	function roomChoice(){
		window.open("updateRoom.jsp", "객실 선택",
				"width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}

	//달력
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy.mm.dd'
        });
    });
	
	//수정취소
	function Cancel(){
		location.href='main.jsp?target=member';
	}
</script>
</head>
<style>
	input[type=text] {
	    padding:5px; 
	    border:2px solid #ccc; 
	    -webkit-border-radius: 5px;
	    border-radius: 5px;
	}
	
	input[type=text]:focus {
	    border-color:#333;
	}
	
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
	
	select { 
    width: 200px; 
    height: 20px; 
    padding-left: 10px; 
    font-size: 13px; 
    color: #006fff; 
    border: 1px solid #006fff; 
    border-radius: 3px; 
	} 
.serif {font-family: serif;}
.sans-serif {font-family: sans-serif;}
.cursive {font-family: cursive;}
.fantasy {font-family: fantasy;}
.monospace {font-family: monospace;}
</style>
<body>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<form name = "update" method = "post" action = "main.jsp?target=update&num=<%=num%>">
<table width = "100%">
	<tr height = 30>
		<td width = "30%">예약자 이름
		</td>
		<td width = "70%"><%= name %>
		</td>
	</tr>
	<tr height = 30>
		<td>휴대전화
		</td>
		<td><input type = text name = phone size = 30 maxlength = 50
			 value = "<%= tel %>">
		</td>
	</tr>
	<tr height = 30>
		<td>생년월일
		</td>
		<td><input type = text name = birth size = 30 maxlength = 50
			 value = "<%= birthday %>">
		</td>
	</tr>
	<tr height = 30>
		<td>도착예정시간
		</td>
		<td><select name = time>
			<option value = "<%= time %>" selected><%= time %></option>
			<option value = "14:00">14:00</option>
			<option value = "15:00">15:00</option>
			<option value = "16:00">16:00</option>
			<option value = "17:00">17:00</option>
			<option value = "18:00">18:00</option>
			<option value = "19:00">19:00</option>
			<option value = "20:00">20:00</option>
			<option value = "21:00">21:00</option>
			<option value = "22:00">22:00</option>
			<option value = "23:00">23:00</option>
			<option value = "24:00">24:00</option>
			</select>
		</td>
	</tr>
	<tr height = 30>
		<td>이메일
		</td>
		<td><input type = text name = email1 size = 20 maxlength = 50 
			 value = "<%= email1 %>">
			<font size = 1>@</font>
			<input type = text name = email2 size = 20 maxlength = 50
			 value = "<%= email2 %>">
			 			 
			 <!-- 이메일 선택 -->
			<select name="email" onchange="email_change()">
		    <option value="" >-이메일 선택-</option>
		    <option value="9">직접입력</option>
 		    <option value="naver.com">naver.com</option>
 		    <option value="daum.net">daum.net</option>
 		    <option value="nate.com">nate.com</option>
 		    <option value="gmail.com">gamil.com</option>
		    </select>
		</td>
	</tr>
	<tr height = 30>
		<td>이메일 수신동의
		</td>
		<td><input type = checkbox name = check value = "ok">동의함
		</td>
	</tr>
	<tr height = 30>
		<td>내 예약
		</td>
		<td><input type = text name = room size = 30 maxlength = 50
			 value = "<%= room %>" disabled = true>
			<input type = button onclick = "roomChoice()" value = "객실 변경 Tip">
		</td>
	</tr>
	<tr height = 30>
		<td>숙박일수
		</td>
		<td><input type = text name = day size = 30 maxlength = 50
			 value = "<%= day %>" disabled = true>
		</td>
	</tr>
	<tr height = 30>
		<td>CheckIn
		</td>
		<td><input type="text" id="datepicker1" name = "checkin"
			value = "<%= checkin %>" autofocus required>
		</td>
	</tr>
	<tr height = 30>
		<td>CheckOut
		</td>
		<td><input type="text" id="datepicker2" name = "checkout"
   			value = "<%= checkout %>" autofocus required >
		</td>
	</tr>
	<tr height = 30>
		<td>결제한 날짜
		</td>
		<td><%= register %>
		</td>
	</tr>
</table>
<p>
<table>
	<tr>
		<td width = 200>
		</td>
		<td>
		<input type = submit value = "수정하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = button onclick = "Cancel()" value = "수정취소">
		</td>
	</tr>
</table>
</form>
<%
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