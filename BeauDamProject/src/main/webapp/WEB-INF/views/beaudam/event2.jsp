<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
    <head>
		<title>event1</title>
		<link rel="stylesheet" href="./resources/css/beaudam/event.css">
		<link rel="stylesheet" href="./resources/css/beaudam/main.css">
    </head>
    <boby>
    	<jsp:include page="./mainTop.jsp"/>
        <div class="container_title">
            <span style="font-weight: bold; font-size: 15px;">뷰담 인스타그램 오픈!</span>
            <span style="color: gray;">기간 2019. 11. 19 ~</span>
        </div>
        <div class="container_content">
            <img src="<%=cp %>/resources/image/beaudam/event/event2.jpg">
        </div>
        <div class="event_button">
            <a href="./event.action"><p>목록</p></a>
        </div>
        <jsp:include page="./mainBottom.jsp"/>
    </boby>
</html>