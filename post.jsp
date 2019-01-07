<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"  %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//입력폼에서 전달받은 값
	String Name = request.getParameter("name");
	String Tel = request.getParameter("tel");
	String Birthday = request.getParameter("birthday");
	String Time = request.getParameter("time");
	String Email1 = request.getParameter("email1");
	String Email2 = request.getParameter("email2");
	String Check = request.getParameter("check");
	String Room = request.getParameter("room");
	String day06 = request.getParameter("5406");
	String day21 = request.getParameter("5421");
	String CheckIn = request.getParameter("checkin");
	String CheckOut = request.getParameter("checkout");
	String Bank = request.getParameter("bank");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	//전달 값은 값 화면에 표시하기 위한 작업
	String phone = Tel.substring(0,3) + "-" + Tel.substring(3,7) + "-" + Tel.substring(7,11);
	String birth = Birthday.substring(0,4) + "-" + Birthday.substring(4,6) + "-" + 
			Birthday.substring(6,8);
	String Email = Email1 + "@" + Email2;
	String price = "";
	String day = "";
	
	//숙박일 수 와 금액 가져오기
	if(day06.equals("0"))
	{
		day = day21;
	}
	if(day21.equals("0"))
	{
		day = day06;
	}
	if(day06.equals("1"))
	{
		price = "55,000원";
	}
	if(day06.equals("2"))
	{
		price = "110,000원";
	}
	if(day06.equals("3"))
	{
		price = "165,000원";
	}
	
	if(day21.equals("1"))
	{
		price = "55,000원";
	}
	if(day21.equals("2"))
	{
		price = "110,000원";
	}
	if(day21.equals("3"))
	{
		price = "165,000원";
	}
	
	//JDBC연결
	Connection conn = null;
	PreparedStatement pstmt = null;
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
			
			String sql = "INSERT INTO member (name,phone,birth,time,email1,email2, " +
			"emailcheck,room,day,price,checkin,checkout,bank,reg_date) " +
			"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Name);
			pstmt.setString(2, Tel);
			pstmt.setString(3, Birthday);
			pstmt.setString(4, Time);
			pstmt.setString(5, Email1);
			pstmt.setString(6, Email2);
			pstmt.setString(7, Check);
			pstmt.setString(8, Room);
			pstmt.setString(9, day);
			pstmt.setString(10, price);
			pstmt.setString(11, CheckIn);
			pstmt.setString(12, CheckOut);
			pstmt.setString(13, Bank);
			pstmt.setTimestamp(14, register);
			
			pstmt.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null)// 쿼리실행 객체 close
				try{pstmt.close();}catch(SQLException e){}
			if(conn != null)// Connection 객체 close
				try{conn.close();}catch(SQLException e){}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
</head>
 <!-- 예약확인 화면옆에 나올 구글 지도 -->
 <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 <script>
function initialize() { 
	//37.487258, 126.820577 원스하우스 좌표값
	var Y_point = 37.487258; // Y 좌표
	var X_point = 126.820577; // X 좌표
	var zoomLevel = 17; // 첫 로딩시 보일 지도의 확대 레벨
	var markerTitle = "원스 하우스"; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
	var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	
	var contentString = '<div id="content">' +
	'<div id="siteNotice">' +
	'</div>' +
	'<h3 id="firstHeading" class="firstHeading">원스하우스</h3>' +
	'<div id="bodyContent">' +
	'<p>경기도 부천시 경인로 590<br />' +
	'Tel. Tel 02)2610.0600</p>' +
	'</div>' +
	'</div>';

	 var myLatlng = new google.maps.LatLng(Y_point, X_point);
	 var mapOptions = {
	 zoom: zoomLevel,
	 center: myLatlng,
	 mapTypeId: google.maps.MapTypeId.ROADMAP
	 }
	 var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

	 var marker = new google.maps.Marker({
	 position: myLatlng,
	 map: map,
	 title: markerTitle
	 });

	 var infowindow = new google.maps.InfoWindow(
	 {
	 content: contentString,
	 maxWidth: markerMaxWidth
	 }
	 );

	 google.maps.event.addListener(marker, 'click', function() {
	 infowindow.open(map, marker);
	 });
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
body{
	background-color : rgb(246,162,177);
}

.serif {font-family: serif;}
.sans-serif {font-family: sans-serif;}
.cursive {font-family: cursive;}
.fantasy {font-family: fantasy;}
.monospace {font-family: monospace;}

</style>
<body onload="initialize()">
<%
java.text.SimpleDateFormat formatter = new java.text.
SimpleDateFormat("yyyy년 MM월 dd일");
String today = formatter.format(new java.util.Date());
%>

<table width="90%" align="center">
  <tr>
      <td colspan = 2>
      <a href = "main.jsp">
      <jsp:include page="top.jsp" flush="false" />
      </a>
      </td>
  </tr>
    <tr>
      <td colspan = 2 align = "right">
            <jsp:include page="middletop.jsp" flush="false" />
      </td>
  </tr>
  <tr>
  	  <td width="80%" bgcolor = "white"> 
 <!-- -------------------------------------------------------------------------------- -->
  	  <img src="imgs/post_1.jpg" width="300" border="0"/>
<p>
<div class = "monospace">
<font color = "black">
<font size = 4>감사합니다. <font size = 6><%= Name %></font>님의 예약이 확정되었습니다!</font>
</font>
<p>
<font color = "skyblue" size = 6>원스하우스</font><br/>

<table><!-- 전체 테이블 -->
	<tr>
		<!-- 원스하우스정보 -->
		<td>
			<table>
			<tr height = 30>
				<td width = 100>주소
				</td>
				<td>590 Gyeong-gi, Bucheon-si<br/>
					경기도 부천시 경인로 590
				</td>
			</tr>
			<tr height = 30>
				<td>전화
				</td>
				<td>010.9935.7482
				</td>
			</tr>
			<tr height = 30>
				<td>예약날짜
				</td>
				<td> <%= today %>
				</td>
			</tr>
			</table>
		</td>
		<!-- 구글 지도 - 원스하우스 위치 -->
		<td rowspan = 2 align = center>
			<img src="imgs/post_2.jpg" width="300" border="0"/><br/>
			<div id="map_view" style="width:400px; height:400px;"></div>
		</td>
	</tr>
	<tr>
		<!-- 예약정보 -->
		<td>
			<table>
			<tr>
				<td width = 290>예약자 이름
				</td>
				<td width = 200><%= Name %> 
				</td>
			</tr>
			<tr>
				<td>휴대전화
				</td>
				<td><%= phone %>
				</td>
			</tr>
			<tr>
				<td>생년월일
				</td>
				<td><%= birth %>
				</td>
			</tr>
			<tr>
				<td>내 예약
				</td>
				<td><%= Room %>
				</td>
			</tr>
			<tr>
				<td>결제 금액
				</td>
				<td><%= price %>
				</td>
			</tr>
			<tr>
				<td>도착예정시간
				</td>
				<td><%= Time %>
				</td>
			</tr>
			<tr>
				<td>CheckIn
				</td>
				<td><%= CheckIn %>
				</td>
			</tr>
			<tr>
				<td>CheckOut
				</td>
				<td><%= CheckOut %>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table><!-- 전체 테이블 -->

 <!-- -------------------------------------------------------------------------------- -->		 	 
  	  </td>
  	  <td valign = "top"><jsp:include page="right.jsp" flush="false" />
  	  </td>
  </tr>
   <tr>
  	  <td width="80%" valign="middle"> 
  	  <a href = "menu.jsp">
  	  <img src="imgs/flower.jpg" width="100%" height = "450" border="0"/>
  	  </a>
  	  </td>
  </tr>
  <tr>
  	  <td colspan= 2><jsp:include page="bottom.jsp" flush="false" />
  	  </td>
  </tr>
</table>

</div>
</body>
</html>