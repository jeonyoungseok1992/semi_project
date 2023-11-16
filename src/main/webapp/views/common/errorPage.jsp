<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1.error{
		color: #ff6f0f;
		margin-top: 200px;
		font-weight: 700;
		font-size: 24px;
		line-height: 24px;
		letter-spacing: -.23px;
		text-align: center;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<br><br>
	
	<h1 align="center" class="error"><%=request.getAttribute("errorMsg") %></h1>
</body>
</html>