<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<jsp:include page="./mainTop.jsp"/>
<!DOCTYPE HTML>
    <html>
        <head>
            <title>event</title>
            <link rel="stylesheet" href="./resources/css/beaudam/event.css">
            <link rel="stylesheet" href="./resources/css/beaudam/main.css">
            </head>
        <body>
            <div class="event_title">
                <h2 style="text-align: center; font-weight: normal;">뷰담 EVENT</h2>
                <hr style=" border: 0; height: 2px; background-color: gray;">
                <span>진행중인 이벤트</span>
            </div>
            <div class="event_content">
                <div class="event_grid">
                    <a href="./event1.action"><img src="<%=cp %>/resources/image/beaudam/event/event_banner.jpg"></a><br/>
                    <span style="font-size: 20px; text-indent: 2em; font-weight: bold;">신규 회원을 위한 뷰담의 통큰 이벤트</span>
                    <span style="margin-bottom: 30px; color: gray; text-indent: 3em;">2019. 11. 19 ~</span>
                </div>
                <div class="event_grid">
                    <a href="./event2.action"><img src="<%=cp %>/resources/image/beaudam/event/event2_banner.jpg"></a>
                    <span style="font-size: 20px; text-indent: 2em; font-weight: bold;">뷰담 인스타그램 오픈!</span>
                    <span style="margin-bottom: 30px; color: gray; text-indent: 3em;">2019. 11. 19 ~</span>
                </div>
                <div class="event_grid">
                    <a href="./event3.action"><img src="<%=cp %>/resources/image/beaudam/event/event3_banner.jpg"></a>
                    <span style="font-size: 20px; text-indent: 2em; font-weight: bold;">환절기 홈케어, 시트팩 10+10</span>
                    <span style="margin-bottom: 30px; color: gray; text-indent: 3em;">2019. 11. 19 ~</span>
                </div>
            </div>
        </body>
        <jsp:include page="./mainBottom.jsp"/>
    </html>
        
        
        