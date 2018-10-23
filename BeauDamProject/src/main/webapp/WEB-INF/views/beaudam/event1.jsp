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
            <span style="text-indent: 2em; font-weight: bold;">신규 회원을 위한 뷰담의 통큰 이벤트</span>
            <span style="color: gray; text-indent: 2.3em;">기간 2019. 11. 19 ~</span>
        </div>
        <div class="container_content">
            <img src="<%=cp %>/resources/image/beaudam/event/event.jpg">
        </div>
        <div class="event_button">
            <a href="./event.action"><p>목록</p></a>
        </div>
        <jsp:include page="./mainBottom.jsp"/>
    </boby>
</html>