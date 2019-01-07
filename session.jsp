<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 나가기</title>
</head>
<body>
<%	
	//관리자 세션 삭제
	session.removeAttribute("Master");
	response.sendRedirect("main.jsp?target=home");
%>
</body>
</html>