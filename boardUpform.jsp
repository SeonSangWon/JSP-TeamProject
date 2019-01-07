<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String uid = request.getParameter("uid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
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
		//DB연동 성공
		
		String sql = "select * from board where uid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		int getuid = rs.getInt("uid");
		String name = rs.getString("name");
		String subject = rs.getString("subject");
		String comment = rs.getString("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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

<img src="imgs/boardUpForm_1.jpg" width= 300 border="0"/>
<hr>
<hr>
<p>

<div class = "sans-serif">
<form name = modifyform method = post action = "main.jsp?target=boardUpdate&uid=<%=uid%>">
<table>
	<tr>
		<td width = 100>이름 
		</td>
		<td>
			<%= name %>
			<input type = hidden name = name value = "<%= name %>">	
		</td>
	</tr>
	<tr>
		<td>제목
		</td>
		<td>
			<input type = text name = subject size = 50 maxlength = 50 
				value = "<%= subject %>" autofocus required>
		</td>
	</tr>
	<tr>
		<td>내용
		</td>
		<td>
			<textarea name = comment cols = 40 rows = 10 
				 autofocus required><%= comment %></textarea>
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
			<input type = submit value = "글 수정">
			&nbsp;&nbsp;&nbsp;
     		<input type = button value = "취소" onclick = "javascript:history.back(-1)">
		</td>
	</tr>
</table>
</form>
</div>
<%		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null)
			try{rs.close();}catch(SQLException e){}
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException e){}
		if(conn != null)
			try{conn.close();}catch(SQLException e){}
	}
%>

</body>
</html>