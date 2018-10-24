<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BeauDam</title>
        <link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    </head>
    <body>
	<jsp:include page="./mainTop.jsp"/>
        <!-- 슬라이드 이미지 -->
        <div class="container" style="width: 100%">  
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main01.jpg" alt="" style="width:100%;">
                </div>

                <div class="item">
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main05.png"  alt="" style="width:100%;">
                </div>

                <div class="item">
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main03.jpg" alt="" style="width:100%;">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background-color: white; opacity: 0;">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next" style="background-color: white; opacity: 0;">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
        </div>
        <!-- 슬라이드 이미지 끝 -->
        
        <!-- 베스트 상품 -->
        <div class="best_wrapper">
            <h3>BEST ITEM</h3>
            <ul>
                <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
            </ul>
        </div>
        <!-- 베스트 상품 끝 -->
        
        <!-- 이미지 레이아웃  -->
        <div class="content_layout">
            <div class="content_box">
                <div class="content_grid">
                    <div class="content_left">
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout06.jpg">
                        </div>
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout03.jpg">
                        </div>
                    </div>
                    <div class="content_right">
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout01.jpg">
                        </div>
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout07.jpg">
                        </div>
                    </div>
                </div>           
            </div>
        </div>
        <!-- 이미지 레이아웃 끝 -->
        
        <img  style="width: 100%" src="<%=cp%>/resources/image/beaudam/main/content_main04.jpg" >
        
        <div class="new_item">
            <div class="best_wrapper">
                <h3>NEW ITEM</h3>
                <ul>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
                    <li><img src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></li>
             	</ul>
            </div>
        </div>
        <jsp:include page="./mainBottom.jsp"/>

    </body>
</html>