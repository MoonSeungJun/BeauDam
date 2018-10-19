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
        <!-- 상단 시작 -->
        <div class="header">
            <div class="top">
                GRAND OPEN! 신규 회원 20% 즉시 할인 쿠폰 증정!
                <img src="<%=cp%>/resources/image/beaudam/main/top.png" onclick="$('.top').slideUp(400);" style="cursor:pointer">
            </div>
           <!-- <div class="login">
                <ul>
                    <li><a href="">고객센터</a></li>
                    <li><a href="">회원가입</a></li>
                    <li><a href="">LOGIN</a></li>
                </ul>
            </div>-->
            <!-- 로고 영역 -->
            <div class="header_wrapper">
                <div class="login">
                    <ul>
                        <li><a href="">고객센터</a></li>
                        <li><a href="<%=cp%>/newTerm.action">회원가입</a></li>
                        <li><a href="<%=cp%>/login.action">LOGIN</a></li>
                    </ul>
                </div>
                <div class="header_container">
                    <div class="header_grid">
                        <div class="header_event">
                            <p>GET IT!</p>
                            <ul>
                                <li><img src="<%=cp%>/resources/image/beaudam/main/header_event_l.png"></li>
                                <li><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/etude.png"></li>
                                <li>에뛰드하우스 틴트<br/>5,000원</li>
                                <li><img src="<%=cp%>/resources/image/beaudam/main/header_event_r.png"></li>
                            </ul>
                        </div>
                        <div class="header_logo">
                            <a href="<%=cp %>/main.action"><img src="<%=cp%>/resources/image/beaudam/main/logo.png"></a>
                        </div>
                        <div class="header_search"> 
                            <!-- 수정부분 -->
                            <ul class="search_icon">
                                <li><input type="button" value="GO!"></li>
                                <li><input type="text" class="form-control" id="usr" placeholder="에뛰드 틴트" ></li>
                            </ul>
                            <ul class="search_icon">
                                <li><img src="<%=cp%>/resources/image/beaudam/main/icon_blog1.gif"></li>
                                <li><img src="<%=cp%>/resources/image/beaudam/main/icon_blog2.gif"></li>
                                <li><img src="<%=cp%>/resources/image/beaudam/main/icon_blog3.gif"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 카테고리 -->
        <div class="navbar_container sticky">
        <div class="navbar">
            <div class="dropdown" >
            <button class="dropbtn">CATERORY 
                <i class="fa fa-caret-down"></i>
            </button>
                <div class="dropdown-content" style="width: 950px;">  
                    <div class="column">
                    <h3>SKIN</h3>
                        <a href="<%=cp %>/productList.action">파운데이션</a>
                        <a href="#">베이스</a>
                        <a href="#">쿠션</a>
                        <a href="#">파우더/팩트</a>
                        <a href="#">프라이머</a>
                        <a href="#">하이라이터</a>
                        <a href="#">쉐딩</a>
                        <a href="#">블러셔</a>
                    </div>
                    <div class="column">
                    <h3>EYE</h3>
                        <a href="#">쉐도우</a>
                        <a href="#">마스카라</a>
                        <a href="#">아이라이너</a>
                    </div>
                    <div class="column">
                    <h3>LIP</h3>
                        <a href="#">립스틱</a>
                        <a href="#">틴트</a>
                        <a href="#">립밤</a>
                    </div>
                    <div class="column">
                    <h3>PACK</h3>
                        <a href="#">워시오프팩</a>
                        <a href="#">시트팩</a>
                    </div>
                    <div class="column">
                    <h3>CEALSING</h3>
                        <a href="#">클렌징폼</a>
                        <a href="#">워터/오일</a>
                        <a href="#">필링/스크럽</a>
                    </div>
                    <div class="column">
                    <h3>PERFUME</h3>
                        <a href="#">남성용</a>
                        <a href="#">여성용</a>
                    </div>
                    <div class="column">
                    <h3>ACC</h3>
                        <a href="#">브러쉬</a>
                        <a href="#">뷰러</a>
                        <a href="#">퍼프</a>
                    </div>
                </div>
            </div> 
                <a href="#home">BEST ITEM</a>
                <a href="#news">NEW ITEM</a>
                <a href="#news">EVENT</a>
                <a href="#news">LOOKS</a>
                <a href="#news">뷰담 PICK'S</a>
                <a href="#news">SALE</a>
            </div>
            </div>
        <!--</div>-->
        <!-- 카테고리 끝 -->
        
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
        <div class="footer">
            <div>
                <p>
                사업자등록번호 : 113-81-17562   <Br/>
                통신판매업신고번호 : 제2011-서울종로-1012호 사업자정보확인<Br/>
                주소 : 아이티윌 15층 6강의실<Br/>   
                대표이사 : 김해나  개인정보 보호책임자 : 김해나<Br/>
                호스팅 서비스 제공자 : ㈜뷰담<Br/>
                </p>
            </div>
        </div>
        <div class="side">
            <a href=""><img src="<%=cp%>/resources/image/beaudam/main/side.png"></a> 
        </div>

    </body>
</html>