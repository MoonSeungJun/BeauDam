<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BeauDam</title>
        <link rel="stylesheet" href="./resources/css/beaudam/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
    </head>
    <body>
        <!-- 상단 시작 -->
        <div class="header">
            <div class="top">
                GRAND OPEN! 신규 회원 20% 즉시 할인 쿠폰 증정!
                <img src="./resources/image/beaudam/main/top.png" onclick="$('.top').slideUp(400);" style="cursor:pointer">
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
                        <li><a href="">회원가입</a></li>
                        <li><a href="">LOGIN</a></li>
                    </ul>
                </div>
                <div class="header_container">
                    <div class="header_grid">
                        <div class="header_event">
                            <p>GET IT!</p>
                            <ul>
                                <li><img src="./resources/image/beaudam/main/header_event_l.png"></li>
                                <li><img class="list_logo" src="./resources/image/beaudam/main/etude.png"></li>
                                <li>에뛰드하우스 틴트<br/>5,000원</li>
                                <li><img src="./resources/image/beaudam/main/header_event_r.png"></li>
                            </ul>
                        </div>
                        <div class="header_logo">
                            <a href=""><img src="./resources/image/beaudam/main/logo.png"></a>
                        </div>
                        <div class="header_search"> 
                            <!-- 수정부분 -->
                            <ul class="search_icon">
                                <li><input type="button" value="GO!"></li>
                                <li><input type="text" class="form-control" id="usr" placeholder="에뛰드 틴트" ></li>
                            </ul>
                            <ul class="search_icon">
                                <li><img src="./resources/image/beaudam/main/icon_blog1.gif"></li>
                                <li><img src="./resources/image/beaudam/main/icon_blog2.gif"></li>
                                <li><img src="./resources/image/beaudam/main/icon_blog3.gif"></li>
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
                        <a href="#">파운데이션</a>
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
</body>
</html>