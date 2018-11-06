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
<title>beaudam > PICK'S</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/pick.css">
</head>
<body>
<jsp:include page="mainTop.jsp"/>
<div>
	<div class="title">
		<h2 style=" letter-spacing: 0.1em;">뷰담 PICK'S</h2>       
	</div>
<div>
		<video src="<%=cp%>/resources/video/pick/apuie.mp4" controls="controls"></video>
	</div>
	<div>
		<video src="<%=cp%>/resources/video/pick/etude.mp4" controls="controls"></video>
	</div>
	<div>
		<video src="<%=cp%>/resources/video/pick/innis.mp4" controls="controls"></video>
	</div>
	<div>
		<video src="<%=cp%>/resources/video/pick/nature.mp4" controls="controls"></video>
	</div>
	<div>
		<video src="<%=cp%>/resources/video/pick/the.mp4" controls="controls"></video>
	</div>	
	

	
	
</div>
<jsp:include page="mainBottom.jsp"/>
</body>
</html>