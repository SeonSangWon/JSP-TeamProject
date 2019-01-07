<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원스하우스 위치</title>
</head>
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
	'Tel. 02)2610.0600</p>' +
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

<body onload="initialize()">


<table width = "100%" bgcolor = "green">
	<tr>
		<td width = "40%" align = center>
			 <img src="imgs/google_1.jpg" width="300" border="0"/>
			 <div id="map_view" style="width:400px; height:400px;"></div>
		</td>
		<td>
			<img src="imgs/google_2.jpg" width="400" border="0"/>
		</td>
	</tr>
</table>

</body>
</html>