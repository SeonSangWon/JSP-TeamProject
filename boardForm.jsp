<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기</title>
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
	    background:#FF0000; 
	    border:0 none;
	    color: #FFFFFF; 
	    cursor:pointer;
	   	width:100px;
	   	height:30px;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
	
	input[type=reset] {
	    padding:5px 15px; 
	    background:#ccc; 
	    border:0 none;
	    color: #006fff; 
	    cursor:pointer;
	   	width:100px;
	   	height:30px;
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
<img src="imgs/boardForm_1.jpg" width= 300 border="0"/>
<hr>
<hr>
<p>

<div class = "sans-serif">
<form name = boardForm method = post action = "boardAction.jsp">
<table>
	<tr>
		<td width = 100>이름 
		</td>
		<td>
			<input type = text name = name size = 30 maxlength = 50 
				placeholder = "이름을 입력해 주세요." autofocus required>
		</td>
	</tr>
	<tr>
		<td>제목
		</td>
		<td>
			<input type = text name = subject size = 50 maxlength = 50 
				placeholder = "제목을 입력해 주세요." autofocus required>
		</td>
	</tr>
	<tr>
		<td>내용
		</td>
		<td>
			<textarea name = comment cols = 40 rows = 10 
				 autofocus required></textarea>
		</td>
	</tr>
	<tr>
		<td>비밀번호 
		</td>
		<td><input type = text name = password size = 14 maxlength = 4 
				placeholder = "숫자 4자리 입력" autofocus required>
		</td>
	</tr>
	<tr>
		<td colspan = 2 align = center>
			<br/>
			<input type = submit value = "작성완료">&nbsp;&nbsp;&nbsp;
			<input type = reset value = "취소">
		</td>
	</tr>
</table>
</form>
</div>


</body>
</html>