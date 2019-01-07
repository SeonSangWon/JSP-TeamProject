<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String target = request.getParameter("target");
	if(target == null)
		target = "home";
	String targetPage = target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게스트하우스 운영 및 예약사이트</title>
</head>
<style>
	body{
		background-color : rgb(246,162,177);
	}
</style>
<body>
<!-- background-color : rgb(66,199,241); -->
<table width="100%" align ="center">
  <tr>
      <td colspan = 2>
      <a href = "main.jsp">
      <jsp:include page="top.jsp" flush="false" />
      </a>
      </td>
  </tr>
  <tr>
      <td colspan = 2>
            <jsp:include page="middletop.jsp" flush="false" />
      </td>
  </tr>
  <tr>
  	  <td width="80%" bgcolor = "white"> 
  	  		 <jsp:include page = "<%= targetPage %>" flush="false" />
  	  </td>
  	  <td valign = "top"><jsp:include page="right.jsp" flush="false" />
  	  </td>
  </tr>
   <tr>
  	  <td width="80%" valign="middle"> 
  	<!-- 사진클릭 시, menu.jsp(원스하우스 소개)로 이동 -->
  	  <a href = "menu.jsp?target=dinner">
  	  <img src="imgs/flower.jpg" width="100%" height = "450" border="0"/>
  	  </a>
  	  </td>
  </tr>
  <tr>
  	  <td colspan= 2><jsp:include page="bottom.jsp" flush="false" />
  	  </td>
  </tr>
</table>
</body>
<!-- 
mysqladmin -u root -p create house

mysql -u root -p
jsp2018

mysql>

GRANT ALL ON house.* TO 'sangwon'@'localhost'
IDENTIFIED BY 'yuhan1234';

use house

CREATE TABLE member(
num int not null auto_increment,
name VARCHAR(20) NOT NULL,
phone VARCHAR(20) NOT NULL,
birth VARCHAR(8) NOT NULL,
time VARCHAR(20) NOT NULL,
email1 VARCHAR(20) NOT NULL,
email2 VARCHAR(20) NOT NULL,
emailcheck VARCHAR(5),
room VARCHAR(30) NOT NULL,
day VARCHAR(2) NOT NULL,
price VARCHAR(10) NOT NULL,
checkin VARCHAR(20) NOT NULL,
checkout VARCHAR(20) NOT NULL,
bank VARCHAR(30) NOT NULL,
reg_date date NOT NULL,
primary key(num)
);

Create Table board(
uid int not null auto_increment,
name varchar(20) not null,
password varchar(4) not null,
subject varchar(50) not null,
comment text not null,
reg_date date not null,
ref int not null,
primary key(uid)
);
 -->
</html>