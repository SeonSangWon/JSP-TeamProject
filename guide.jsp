<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내&예약</title>
</head>
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
	    background:#ffffff; 
	    border:0 none;
	    color: #ff0000; 
	    cursor:pointer;
	   	width:130px;
	    height:45px;
	    -webkit-border-radius: 5px;
	    border-radius: 5px; 
	}
</style>
<body>
<table width="90%">
  <tr>
      <td><img src="imgs/guide_1.jpg" width="600"  border="0"/> 
      </td>
      <td valign = "top"><img src="imgs/guide_2.jpg" width="400"  border="0"/>
      <p>
      					 <img src="imgs/guide_3.jpg" width="400"  border="0"/>
      <p>
      <input type="button" onclick="location.href='main.jsp?target=reserve'"
    		  class = "fun-btn" value = "예약하러가기">
	  </td>
  </tr>
</table>
</body>
</html>