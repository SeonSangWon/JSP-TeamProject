<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중간 메뉴</title>
</head>
<script>
	//버튼을 누를경우, 버튼스타일을 hidden으로 가리고 session.jsp로 이동
	function MasterShowBtn(){
		var doc = document;
		var f = document.myform;

		f.btnSulgyeOpenInfo.style.visibility = "hidden"	
		
		alert("관리자모드를 벗어납니다.");
		location.href="session.jsp";
	}
</script>
<style>
	button {
	   padding:5px 15px; 
	   background:#ccc; 
	   border:0 none;
	   color: #006fff; 
	   cursor:pointer;
	   width:110px;
	   height:40px;
	   -webkit-border-radius: 5px;
	   border-radius: 5px; 
	}
</style>
<body>
<table width = 100%>
	<tr>
		<td width = 80% align = right>
<!-- 예약하기 -->
  	  <a href = "main.jsp?target=reserve">
		<img src="imgs/middle_1.jpg" width="94"  border="0"/>
  	  </a>
<!-- 예약확인 -->
  	  <a href = "main.jsp?target=checkForm">
  		<img src="imgs/middle_2.jpg" width="99"  border="0"/>
  	  </a>
<!-- 게시판 -->
  	  <a href = "main.jsp?target=board">
  		<img src="imgs/middle_3.jpg" width="99"  border="0"/>
  	  </a>
		</td>
		<td>
		  	  <%
			  	  	if(session.getAttribute("Master") == null)
			  	  	{
			  	  		
			  	  	}
			  	  	else
			  	  	{
			  	  		%>
			  	  		<!-- 관리자상태일때만 버튼이 보이도록 함 -->
			  	  		<form name = myform method = post action = >
			  	  			<button type = button name = "btnSulgyeOpenInfo"
			  	  			id = "btnSulgyeOpenInfo" style= "visibillity:visible"
			  	  			onclick = "MasterShowBtn()" class="fun-btn">나가기</button>
			  	  		</form>
			  	  		<%
			  	  	}
  	 			 %>
		</td>
	</tr>
</table>

</body>
</html>