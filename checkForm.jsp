<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Master세션이 비어있거나, Master세션의 값이 admin이 아닐경우
	if(session.getAttribute("Master") == null ||
			! ((String)session.getAttribute("Master")).equals("admin"))
	{
		response.sendRedirect("main.jsp");
	}
	else
	{
		out.println("<script>");
		out.println("self.location='main.jsp?target=memberList'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
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
</style>
<body>

<center>
<img src="imgs/check_1.jpg" width="400" border="0"/>
<p>
	
<form name = "check" method = "post" action = "check.jsp">
			<input type = text name = name size = 35 maxlength = 50 
			placeholder = "예약자의 이름을 입력해 주세요." autofocus required>
<p>
			<input type = text name = tel size = 35 maxlength = 11
			 placeholder = "전화번호를 '-'없이 입력해 주세요." autofocus required>
<p>
			<input type = text name = birthday size = 35 maxlength = 8
			 placeholder = "생년월일을 8자리로 입력해 주세요." autofocus required>
<p>
<br/>
<input type = submit value = "조회하기">
</form>

</center>
</body>
</html>