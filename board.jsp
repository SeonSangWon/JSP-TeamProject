<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<script>
	//글쓰기 폼으로 이동
	function moveForm(){
		self.location = "main.jsp?target=boardform";
	}

</script>
<style>
	input[type=button] {
	   padding:5px 15px; 
	   background:#ff0000; 
	   border:0 none;
	   color: #ffffff; 
	   cursor:pointer;
	   width:140px;
	   height:45px;
	   font-size:25px;
	   -webkit-border-radius: 5px;
	   border-radius: 5px; 
	}
</style>
<style type = "text/CSS">
	a:link {
		color : black;
		text-decoration : none;
	}
</style>
<body>

<center><img src="imgs/board_1.jpg" width= "600" border="0"/>
<form name = View method = post action = "board.jsp">
<table border = 1>
	<tr>
		<td align = center>번호</td>
		<td align = center width = 500>제목</td>
		<td align = center width = 80>글쓴이</td>
		<td align = center width = 100>날짜</td>
		<td align = center>조회</td>
	</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int total = 0;	//조회수
	int cnt = 0;	//글번호 
	
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
		
		String sql = "select count(*) from board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			total = rs.getInt(1);
			cnt = rs.getInt(1);
		}
		rs.close();
		
		String newsql = "select * from board order by uid DESC";
		rs = pstmt.executeQuery(newsql);
		
		if(total == 0 )
		{
%>
		<tr>
			<td colspan = 5 align = center> 등록된 게시글이 없습니다.
			</td>
		</tr>
<%
		}
		else
		{
			while(rs.next())
			{
				int uid = rs.getInt("uid");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String subject = rs.getString("subject");
				String comment = rs.getString("comment");
				Date register = rs.getDate("reg_date");
				int ref = rs.getInt("ref");
%>
	<tr>
		<td align = center><%= cnt %></td>
		<!-- 제목클릭 시, uid ref cnt값 Get방식으로 전달 -->
		<td><a href="main.jsp?target=boardView&uid=<%=uid%>&ref=<%=ref%>&cnt=<%=cnt%>"><%= subject %></td>
		<td align = center><%= name %></td>
		<td align = center><%= register %></td>
		<td align = center><%= ref %></td>
	</tr>
<%			
			cnt--;
			}	//while
		}	//else
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>alert('오류가 발생했습니다. 메인화면으로 돌아갑니다');history.back();</script>");
	}finally{
		if(pstmt != null)// 쿼리실행 객체 close
			try{pstmt.close();}catch(SQLException e){}
		
		if(conn != null)// Connection 객체 close
			try{conn.close();}catch(SQLException e){}
	}
%>

</table><p>

<input type = button value = "글쓰기" onclick = "window.location='main.jsp?target=boardForm'"
		class = "fun-btn">
</form>
</center>

</body>
</html>