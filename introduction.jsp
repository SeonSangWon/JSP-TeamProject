<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String target2 = request.getParameter("target2");
	
	if(target2 == null) 
		target2 = "google";
	String targetPage2 = target2 + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원스하우스 소개</title>
</head>
<body>

<table>
  <tr>
      <td align = "center"><img src="imgs/introduce_1.jpg" width="600"  border="0"/> 
      </td>
      <td valign = "top"><img src="imgs/introduce_2.jpg" width="400"  border="0"/>
      <p>
      				   	 <img src="imgs/introduce_3.jpg" width="550"  border="0"/>
	  </td>
  </tr>
</table>
<table bgcolor = "green" width = "100%">
	<tr>
		<td><jsp:include page = "<%= targetPage2 %>" flush="false" />
		</td>
	</tr>
</table>


</body>
</html>