<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String target = request.getParameter("target");
	if(target == null)
		target = "outside";
	String targetPage = target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용&객실안내</title>
</head>
<script type="text/javascript">
	function pageOutside() {
		self.location="information.jsp?target=outside";
}
	function pageInside() {
		self.location="information.jsp?target=inside";
}
</script>
<style>
	.page {
	  width: 100vw;
	  height: 100vh;
	  display: flex;
	  justify-content: center;
	}
	.color-bg-start {
	  background-color: salmon;
	}
	.bg-animate-color {
	  animation: random-bg .5s linear infinite;
	}
	@keyframes random-bg {
	  from {
	    filter: hue-rotate(0);
	  }
	  to {
	    filter: hue-rotate(360deg);
	  }
	}
	
	.fun-btn {
	  background-color: salmon;
	  color: white;
	  padding: 2em 3em;
	  border: none;
	  transition: all .3s ease;
	  border-radius: 5px;
	  letter-spacing: 2px;
	  text-transform: uppercase;
	  outline: none;
	  align-self: center;
	  cursor: pointer;
	  font-weight: bold;
	}
	
	.fun-btn:hover {
	  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
	}
	
	.start-fun {
	  background-color: #fff !important;
	  color: salmon !important;
	}
	
	@keyframes grow {
	  0% {
	    transform: scale(1);
	  }
	  14% {
	    transform: scale(1.3);
	  }
	  28% {
	    transform: scale(1);
	  }
	  42% {
	    transform: scale(1.3);
	  }
	  70% {
	    transform: scale(1);
	  }
	}
	input[type=button] {
	    padding:5px 15px; 
	    background:#cceeff; 
	    border:0 none;
	    color: #bdb76b; 
	    cursor:pointer;
	    width:140px;
	    height:48px;
	    font-size:25px;
	    font-family:sans-serif;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
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
<div class = page>
<form name = "myForm">
<table width = 100%>
	<tr>
		<!-- 이용&객실안내 -->
		<td width = 50% align = center><img src="imgs/information_2.jpg" width="400" border="0"/>
		</td>
		<td>
			<input type = button class="fun-btn" onclick = "pageOutside()" value = "외부전경"/>
			&nbsp;&nbsp;&nbsp;
			<input type = button class="fun-btn" onclick = "pageInside()" value = "객실내부"/>
		</td>
	</tr>
	<tr>
		<td colspan = 2 align = center>
			<jsp:include page = "<%= targetPage %>" flush="false" />	
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>