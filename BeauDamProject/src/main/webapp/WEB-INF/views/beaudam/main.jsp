<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	
	 <!-- 브랜드 소개 -->
        <div class="brandwrapper" style="padding: 30px;">
        	<h2 style="padding: 30px 30px 10px 30px; text-align: center; font-family: 'YiSunShinDotumM'; ">
        		브랜드 모아, 모아! 잘나가는건 <span style="font-family: 'designhouseOTFLight00'; font-size: 35px;">뷰담</span>에 다있다!
        	</h2>
        	<h3 style="text-align: center; font-family: 'YiSunShinDotumM'; color: gray;">뷰담에서 더 쉽고 빠르게 쇼핑하자</h3>
        	<div class="brand_grid" style="overflow: hidden; margin: 20px auto;">
        		<div class="brandimg">
        			<img alt="" src="<%=cp%>/resources/image/beaudam/main/apieu2.jpg">
        		</div>
        		<div class="brandimg">
        			<img alt="" src="<%=cp%>/resources/image/beaudam/main/etude.jpg">
        		</div>
        		<div class="brandimg">
        			<img alt="" src="<%=cp%>/resources/image/beaudam/main/face2.jpg">
        		</div>
        		<div class="brandimg">
        			<img alt="" src="<%=cp%>/resources/image/beaudam/main/innisfree2.jpg">
        		</div>
        		<div class="brandimg">
        			<img alt="" src="<%=cp%>/resources/image/beaudam/main/nature.gif">
        		</div>
        	</div>
        </div>

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
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main011.jpg" alt="" style="width:100%;">
                </div>

                <div class="item">
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main021.jpg"  alt="" style="width:100%;">
                </div>

                <div class="item">
                    <img src="<%=cp%>/resources/image/beaudam/main/content_main031.jpg" alt="" style="width:100%;">
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
        	<div class="rolling_panel" style="width: 100%;">
				<ul class="rolling_panel" style="width: 1400px;">
				<c:forEach var="dto" items="${productList }">					
					<li style="width: 280px;">
						<a href="productDetail.action?code=${dto.code }">
							<img src="<%=cp %>/${dto.thumb_Img}" >
						</a>
						<div style="width: 270px;">
							<p style="color: gray;">${dto.brand }</p>
							<p style="font-family: 'YiSunShinDotumM'; font-size: 20px;">${dto.product_Name }</p>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
        </div>
        <!-- 베스트 상품 끝 -->
        
        <!-- 이미지 레이아웃  -->
        <div class="content_layout">
            <div class="content_box">
                <div class="content_grid row">
                    <div class="content_left col-sm-6">
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout06.jpg" >
                        </div>
                     	<div class="layout_img">
                            <a href="./look.action"><img src="<%=cp%>/resources/image/beaudam/main/content_layout031.jpg"></a>
                     	</div>
                    </div>
                    <div class="content_right col-sm-6">
                       <div class="layout_img">
                            <a href="./event2.action"><img src="<%=cp%>/resources/image/beaudam/main/content_layout01.jpg"></a>
                       	</div>	
                        <div class="layout_img">
                            <img src="<%=cp%>/resources/image/beaudam/main/content_layout07.jpg">
                        </div>
                    </div>
                </div>           
            </div>
        </div>
        <!-- 이미지 레이아웃 끝 -->
        
        <!-- new item -->
        <div class="new_item" id="newItem">
            <div class="new_item" style="margin: 50px auto;">
            	<c:if test="${!empty newItemList }">
                <h3>NEW ITEM </h3>
                <ul class="new_item" style="width: 1266px;">
                	<c:forEach var="dto" items="${newItemList }">
                    <li>
                    	<div style="width: 420px;">
	                  		<a href="${detailUrl }?code=${dto.code}">
	                  		<img src="<%=cp %>/thumbImg/${dto.thumb_Img}"></a>
					    	<div style="width: 400px; height: 86px; margin: 0 auto;"><p style="color: gray;">${dto.brand }</p><p style="font-family: 'YiSunShinDotumM'; font-size: 20px;">${dto.product_Name }</p></div>   
                    	</div >
                    </li>
                    </c:forEach>
                </ul>
                </c:if>
            </div>
        </div>
        <jsp:include page="./mainBottom.jsp"/>
    </body>
</html>