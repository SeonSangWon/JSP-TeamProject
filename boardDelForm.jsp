<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<script language = "javascript">  // 자바 스크립트 시작
	function deleteCheck(){
	   var form = document.deleteform;
	   form.submit(); 		
	  } 
</script>
<style>
	input[type=password] {
	    padding:5px; 
	    border:2px solid #ccc; 
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

<center><img src="imgs/boardDelete_1.jpg" width= "600" border="0"/>
<div class = "sans-serif">
			<!-- 삭제하기위한 게시글의 uid값 넘기기 -->
			<form name = deleteform method=post action="main.jsp?target=boardDelete&uid=<%=uid%>">
<table>
	<tr>
		<td>
			비밀번호 <input type = password name = password size = 30 maxlength = 50
			 placeholder = "비밀번호 4자리를 입력해주세요.." autofocus required>
		</td>
	</tr>
	<tr>
		<td>
			<input type = button value = "글 삭제" onclick = "javascript:deleteCheck();"> 
			<input type = button value = "취소" onclick = "javascript:history.back(-1)">
			</form>
		</td>
	</tr>
</table>
</div>
</center>

</body>
</html>