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
<script type="text/javascript">
$(document).ready(function() {

    var $panel = $(".rolling_panel").find("ul");

    var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
    var itemLength = $panel.children().length;      // 아이템 수

    // Auto 롤링 아이디
    var rollingId;

    auto();

    // 이전 이벤트
    $("#prev").on("click", prev);

    $("#prev").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#prev").mouseout(auto);

    // 다음 이벤트
    $("#next").on("click", next);

    $("#next").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#next").mouseout(auto);

    function auto() {

        // 2초마다 start 호출
        rollingId = setInterval(function() {
            start();
        }, 2500);
    }

    function start() {
        $panel.css("width", itemWidth * itemLength);
        $panel.animate({"left": - itemWidth + "px"}, function() {

            // 첫번째 아이템을 마지막에 추가하기
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");

            // 첫번째 아이템을 삭제하기
            $(this).find("li:first").remove();

            // 좌측 패널 수치 초기화
            $(this).css("left", 0);
        });
    }

    // 이전 이벤트 실행
    function prev(e) {
        $panel.css("left", - itemWidth);
        $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
        $panel.animate({"left": "0px"}, function() {
            $(this).find("li:last").remove();
        });
    }

    // 다음 이벤트 실행
    function next(e) {
        $panel.animate({"left": - itemWidth + "px"}, function() {
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li:first").remove();
            $(this).css("left", 0);
        });
    }
});


</script>    
</head>
<body>
	<jsp:include page="mainTop.jsp"/>
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
        <div class="best_wrapper rolling_wrapper">
        <h3>BEST ITEM</h3>
        	<div class="rolling_panel">
				<!-- <div class="rolling_icon"><a href="javascript:void(0)" id="prev"><img src="image/header_event_l.png"></a></div>-->
				<ul class="rolling_panel">
				<c:forEach var="dto" items="${productList }">					
					<li><a href="productDetail.action?code=${dto.code }"><img src="<%=cp %>/${dto.thumb_Img}"></a></li>
				</c:forEach>
				</ul>
				<!-- <div class="rolling_icon"><a href="javascript:void(0)" id="prev"><img src="image/header_event_r.png"></a></div>-->
			</div>
        </div>
        <!-- 베스트 상품 끝 -->
        
        <!-- 이미지 레이아웃  -->
        <div class="content_layout">
            <div class="content_box">
                <div class="content_grid row">
                    <div class="content_left col-sm-6">
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout06.jpg">
                        </div>
                     	<div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout03.jpg">
                     	</div>
                    </div>
                    <div class="content_right col-sm-6">
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
            <div class="new_item">
                <h3>NEW ITEM</h3>
                <ul class="new_item" style="width: 960px;">
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