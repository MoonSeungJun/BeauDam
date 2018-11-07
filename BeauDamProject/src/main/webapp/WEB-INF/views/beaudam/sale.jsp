<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beaudam > SALE</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/sale.css">
</head>
<body>
<jsp:include page="./mainTop.jsp"/>
<div>
	<div class="title">
		<h2 style=" letter-spacing: 0.1em;">SALE</h2>       
	</div>
	
</div>
<jsp:include page="./mainBottom.jsp"/>
</body>
</html>