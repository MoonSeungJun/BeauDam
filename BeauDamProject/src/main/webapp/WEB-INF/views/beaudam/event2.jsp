<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
    <head>
		<title>beaudam > EVENT</title>
		<link rel="stylesheet" href="./resources/css/beaudam/event.css">
		
    </head>
    <boby>
    	<jsp:include page="./mainTop.jsp"/>
        <div class="container_title">
            <span style="font-weight: bold; font-size: 25px; font-family: 'YiSunShinDotumM';">뷰담 인스타그램 오픈!</span>
             <span style="color: gray; font-size: 15px;'YiSunShinDotumM';">기간 2019. 11. 19 ~</span>
        </div>
        <div class="container_content">
            <img src="<%=cp %>/resources/image/beaudam/event/event2.jpg">
        </div>
        <div class="event_button">
            <a href="./event.action">목록</a>
        </div>
        <jsp:include page="./mainBottom.jsp"/>
    </boby>
</html>