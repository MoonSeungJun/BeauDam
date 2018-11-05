<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
    <head>
		<title>event1</title>
		<link rel="stylesheet" href="./resources/css/beaudam/event.css">
		
    </head>
    <boby>
    	<jsp:include page="./mainTop.jsp"/>
        <div class="container_title">
            <span style="font-weight: bold; font-size: 25px; font-family: 'YiSunShinDotumM';">환절기 홈케어, 시트팩 10+10</span>
            <span style="color: gray; font-size: 15px;'YiSunShinDotumM';">기간 2019. 11. 19 ~</span>
        </div>
        <div class="container_content">
            <img src="<%=cp %>/resources/image/beaudam/event/event3.jpg">
        </div>
        <div class="event_button">
            <a href="./event.action">목록</a>
        </div>
        <jsp:include page="./mainBottom.jsp"/>
    </boby>
</html>