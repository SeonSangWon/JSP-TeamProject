<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String uid = request.getParameter("uid");
	int hit = Integer.parseInt(request.getParameter("ref"));	//조회수 증가를 위한 변수
	int cnt = Integer.parseInt(request.getParameter("cnt"));	//글번호 가져오기

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
		
		String sql = "Select * from board where uid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			String name = rs.getString("name");
			String password = rs.getString("password");
			String subject = rs.getString("subject");
			String comment = rs.getString("comment");
			Date register = rs.getDate("reg_date");
			int ref = rs.getInt("ref");
			//조회수 증가
			hit++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 View</title>
</head>
<script>
	//목록 > 뒤로가기
	function movePage(){
		self.location = "main.jsp?target=board";
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
<style type = "text/CSS">
	a:link {
		color : red;
		text-decoration : none;
	}
</style>
<body>

<center><img src="imgs/board_1.jpg" width= "600" border="0"/>

<table width = 55%>
<tr>
	<td align = right>
		<input type = button onclick = "movePage()" value = "목록">
	</td>
</tr>
</table>

<!-- View -->
<table width = 55% border = 1>
	<tr>
		<td align = right>No.&nbsp;&nbsp;<%= cnt %>
		</td>
	</tr>
	<tr>
		<td align = center><%= subject %>
		</td>
	</tr>
	<tr>
		<td>등록일 :&nbsp;&nbsp;<%= register %>
		</td>
	</tr>
	<tr>
		<td>글쓴이 :&nbsp;&nbsp;<%= name %>
		</td>
	</tr>
	<tr height = 180>
		<td valign = top>
			<%= comment %>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>
			<input type=button onclick="window.location='main.jsp?target=boardUpform&uid=<%= uid %>'"
			value="글 수정">
			&nbsp;&nbsp;&nbsp;
			<input type = button onclick = "window.location='main.jsp?target=boardDelForm&uid=<%= uid %>'"
			value = "글 삭제">
		</td>
	</tr>
</table>
</center>
<%
		//조회수 +1
		PreparedStatement pstmt2 = null;
		String newsql = "update board set ref = ? where uid = ?";
		pstmt2 = conn.prepareStatement(newsql);
		
		pstmt2.setInt(1, hit);
		pstmt2.setString(2, uid);
		
		pstmt2.executeUpdate();

		pstmt2.close();
		
		}//if
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>alert('오류가 발생하였습니다.');history.back();</script>");
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