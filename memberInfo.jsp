<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String birthday = request.getParameter("birthday");
	String time = request.getParameter("time");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String emailcheck = request.getParameter("emailcheck");
	String room = request.getParameter("room");
	String day = request.getParameter("day");
	String price = request.getParameter("price");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	String bank = request.getParameter("bank");
	String register = request.getParameter("register");
	String phone = tel.substring(0,3) + "-" + tel.substring(3,7) + "-" + tel.substring(7,11);
	String birth = birthday.substring(0,4) + "-" + birthday.substring(4,6) + "-" + 
			birthday.substring(6,8);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= name %>님의 예약하신 정보입니다.</title>
</head>
<script>
	function closeWindow() {   
		window.close();  
	} 	
</script>
<style>
	input[type=button] {
	    padding:5px 15px; 
	    background:#ccc; 
	    border:0 none;
	    color: #006fff; 
	    cursor:pointer;
	    width:100px;
	    height:50px;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
		input[type=submit] {
	    padding:5px 15px; 
	    background:#ff0000; 
	    border:0 none;
	    color: #ffffff; 
	    cursor:pointer;
	    width:100px;
	    height:50px;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
</style>
<body>

<font size = 4>
<table>
	<tr height = 25>
		<td width = 250>결제한 날짜
		</td>
		<td><%= register %>
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
	<tr height = 25>
		<form name = member method = post action = "delete.jsp?num=<%=num%>">
		<td align = center><input type = submit value = "예약취소">
		</form>
		</td>
		<td><input type = button onclick = "closeWindow()" value = "종료">
		</td>
	</tr>
</table>
</font>
	
</body>
</html>