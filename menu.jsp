<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");
	if(target == null) 
		target = "introduction";
	String targetPage = target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원스하우스 상단메뉴</title>
</head>
<style>
body{
	background-color : rgb(66,199,241);
}
</style>
<body>

<table width="100%" align="center">
  <tr>
      <td colspan = 2>
      <a href = "main.jsp">
      <jsp:include page="top_introdution.jsp" flush="false" />
      </a>
      </td>
  </tr>
</table>
 <center>
 	<!-- 원스하우스 소개 -->
      <a href = "menu.jsp?target=introduction">
  	  <img src="imgs/menu_3.jpg" width="200" border="0"/>
  	  </a><font size = 8>|</font>    
  	<!-- 시설&객실안내 -->
      <a href = "information.jsp">
  	  <img src="imgs/menu_4.jpg" width="200" border="0"/>
  	  </a><font size = 8>|</font>
  	<!-- 이용안내&예약 -->
      <a href = "menu.jsp?target=guide">
  	  <img src="imgs/menu_5.jpg" width="200" border="0"/>
  	  </a><font size = 8>|</font>  
   	<!-- 저녁 식사 -->
      <a href = "menu.jsp?target=dinner">
  	  <img src="imgs/menu_6(2).jpg" width="180" border="0"/>
  	  </a>
</center> 

<p>

<table width = "100%">
	<tr>
		<td align = "center">
			<jsp:include page = "<%= targetPage %>" flush="false" />
		</td>
	</tr>
</table>

</body>
</html>