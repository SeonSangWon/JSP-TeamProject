<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//5406호와 5421호의 가격을 표시할 변수 초기화
	String price06 = "0원";
	String price21 = "0원";
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type = "text/javascript">
 
 	//5406호 객실의 숙박일수를 클릭하면 그에 맞게 가격이 바뀌도록 함
	function changeFunc06(){
 		var selectBox = document.getElementById("selectBox06");
 		var selectedValue = selectBox.options[selectBox.selectedIndex].value;

	 	if(selectedValue == 0)
			{
				price06 = "0원";
			}
 		if(selectedValue == 1)
 			{
 				price06 = "55,000원";
 			}
 		if(selectedValue == 2)
 			{
 				price06 = "110,000원";
 			}
 		if(selectedValue == 3)
 			{
 				price06 = "165,000원";
 			}
 		 console.log(price06);
 		 $("#price06").text(price06);
 	}
 
	//5421호 객실의 숙박일수를 클릭하면 그에 맞게 가격이 바뀌도록 함
 	function changeFunc21(){
 		var selectBox = document.getElementById("selectBox21");
 		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
 		
 		if(selectedValue == 0)
			{
				price21 = "0원";
			}
 		if(selectedValue == 1)
 			{
 				price21 = "40,000원";
 			}
 		if(selectedValue == 2)
 			{
 				price21 = "80,000원";
 			}
 		if(selectedValue == 3)
 			{
 				price21 = "120,000원";
 			}
 		 console.log(price21);
 		 $("#price21").text(price21);
 	}
 </script>
<meta charset="UTF-8">
<title>예약하기</title>
</head>
<script type="text/javascript">

function email_change(){
	
	//이메일 주소를 선택하면 text에 선택한 이메일 주소 값이 설정하도록 함
	if(document.reserve.email.options[document.reserve.email.selectedIndex].value == '')
	 {
	 	 	document.reserve.email2.value = "";
	 }
	if(document.reserve.email.options[document.reserve.email.selectedIndex].value == '9')
	 {
	  		document.reserve.email2.value = "";
	  		document.reserve.email2.focus();
	}
	else
	{
			document.reserve.email2.value = document.reserve.email.
			options[document.reserve.email.selectedIndex].value;
	 }
}
</script>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	//CheckIn 과 CheckOut의 달력을 표시하도록 설정
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy.mm.dd'
        });
    });

</script>
		<img src="imgs/reserve_1.jpg" width="300" border="0"/>
<hr><hr>
<div class = "">

<!--  ----------------예약자 입력정보---------------- -->
<form name = "reserve" method = "post" action = "post.jsp">
<table>
	<tr height = 40>
		<td width = 150><font size = 2>예약자 이름 </font><font color = "red">*</font>
		</td>
		<td width = 700><input type = text name = name
						 size = 30 maxlength = 50 placeholder = "예약자의 이름을 입력해 주세요."
						 autofocus required>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>휴대전화 번호 </font><font color = "red">*</font>
		</td>
		<td><input type = text name = tel size = 30 maxlength = 11
			 placeholder = "'-'없이 입력해 주세요." autofocus required><br/>
			 <font color = "red" size = 2>예약 관련 연락에 이용되오니 휴대폰번호를 정확하게 입력해 주세요</font>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>생년월일 </font><font color = "red">*</font>
		</td>
		<td><input type = text name = birthday size = 30 maxlength = 8
			 placeholder = "생년월일을 8자리로 입력해 주세요." autofocus required>
		</td>
	</tr>
	<tr height = 40>
		<td>픽업 이용 여부
		</td>
		<td><font color = "red">
			<input type = text name = pickup size = 30 maxlength = 50
			 placeholder = "-픽업 불가능" autofocus required disabled = true > 
			 </font>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>도착 예정 시간</font>
		</td>
		<td><select name = time>
			<option value = "14:00" selected>14:00</option>
			<option value = "15:00">15:00</option>
			<option value = "16:00">16:00</option>
			<option value = "17:00">17:00</option>
			<option value = "18:00">18:00</option>
			<option value = "19:00">19:00</option>
			<option value = "20:00">20:00</option>
			<option value = "21:00">21:00</option>
			<option value = "22:00">22:00</option>
			<option value = "23:00">23:00</option>
			<option value = "24:00">24:00</option>
			</select><br/>
			<font size = 1>입실 14:00 이후   |  퇴실 11:00 이전</font>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>이메일</font><font color = "red">*</font>
		</td>
		<td><input type = text name = email1 size = 20 maxlength = 50
			 autofocus required onfocus="this.value='';">
			 <font size = 1>@</font>
			<input type = text name = email2 size = 20 maxlength = 50
			 autofocus required>
			 <!-- 이메일 선택 -->
			<select name="email" onchange="email_change()">
		    <option value="" >-이메일 선택-</option>
		    <option value="9">직접입력</option>
 		    <option value="naver.com">naver.com</option>
 		    <option value="daum.net">daum.net</option>
 		    <option value="nate.com">nate.com</option>
 		    <option value="gmail.com">gamil.com</option>
		    </select>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>이메일 수신여부 </font>
		</td>
		<td><input type = checkbox name = check value = "ok"><font size = 1>동의함<br/>
			 예약 확인안내 및 사이트에 제공하는 유익한 소식을 이메일로 받으실 수 있습니다.</font>
		</td>
	</tr>
</table>
<br/><p>

<!--  ----------------객실 선택---------------- -->
		<img src="imgs/reserve_5.jpg" width="200" border="0"/>

<hr><hr><br/>
<input type = radio name = room value = "나눔관 5406호">나눔관 5406호&nbsp;&nbsp;
		<select name = "5406" id = "selectBox06" onchange = "changeFunc06();">
		<option value = "0">-일수선택-</option>
		<option value = "1">1박</option>
		<option value = "2">2박</option>
		<option value = "3">3박</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp; 
		<!-- select으로 선택한 값에 따라 가격 변경 -->
		<font size = 5><span id = "price06">0원</span></font>
		<br/>
	<img src="imgs/reserve_3.jpg" width="600" border="0"/>
<br/><br/>

<input type = radio name = room value = "나눔관 5421호">나눔관 5421호&nbsp;&nbsp;
		<select name = "5421" id = "selectBox21" onchange = "changeFunc21();">
		<option value = "0">-일수선택-</option>
		<option value = "1">1박</option>
		<option value = "2">2박</option>
		<option value = "3">3박</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp; 
		<!-- select으로 선택한 값에 따라 가격 변경 -->
		<font size = 5><span id = "price21">0원</span></font>
		<br/>
	<img src="imgs/reserve_4.jpg" width="600" border="0"/>
<br/>

<table>
	<tr>
		<td>
			<font size = 2>Check In </font><font color = "red">*</font>
			<input type="text" id="datepicker1" name = "checkin"
			placeholder = "체크인 할 날짜" autofocus required>
			<font size = 2>Check Out </font><font color = "red">*</font>
   			<input type="text" id="datepicker2" name = "checkout"
   			placeholder = "체크아웃 할 날짜" autofocus required >
		</td>
	</tr>
</table>
<br/><p>

<!--  ----------------결제 수단---------------- -->
		<img src="imgs/reserve_2.jpg" width="300" border="0"/>
<hr><hr>
<div class="container show-grid" style="width: 700px;">

<table>
	<tr height = 40>
		<td colspan = 2><input type = radio name = "radio" value = "radio" checked = checked>
						무통장입금
		</td>
	</tr>
	<tr height = 40>
		<td colspan = 2>
		<font size = 1>
		· 입금기한 : 예약 후 3시간 이내<br/>
		· 입금기한 내 입금확인 되지 않으면 예약이 자동 취소됩니다.<br/>
		· 입금확인이 되면 예약완료 문자(펜션 연락처, 예약번호 등)가 휴대폰으로 전송됩니다.<br/>
		<font color = "red">· 무통장입금 시 반드시 예약자명으로 입금 하셔야 입금확인이 됩니다.</font><br/>
		<font color = "red">· 은행 미선택 시 자동으로 국민은행 계좌가 설정되오니 주의하시기 바랍니다.</font>
		</font>
		</td>
	</tr>
	<tr height = 40>
		<td><font size = 2>무통장 입금 </font><font color = "red">*</font>
		</td>
		<td><select name = bank>
			<option value = "국민662601-04-029895" selected>-은행선택-</option>
			<option value = "국민662601-04-029895">국민은행 662601-04-029895</option>
			<option value = "신한110-441-105498">신한은행 110-441-105498</option>
			<option value = "기업107-141422-14-002">기업은행 107-141422-14-002</option>
			</select>
		</td>
	</tr>
</table>
<center><input type = "submit" value = "결제하기"></center>
</div></div>
</form>

</body>
</html>