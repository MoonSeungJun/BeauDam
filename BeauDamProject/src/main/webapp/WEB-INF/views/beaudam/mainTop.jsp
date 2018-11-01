<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<style type="text/css">
html {
  scroll-behavior: smooth;
}
</style>
</head>
<body>
	<!-- 상단 시작 -->
	<div class="header">
	    <div class="top">
	        GRAND OPEN! 신규 회원 20% 즉시 할인 쿠폰 증정!
	        <img src="<%=cp%>/resources/image/beaudam/main/top.png" onclick="$('.top').slideUp(400);" style="cursor:pointer">
	    </div>
	    <!-- 로고 영역 -->
	    <div class="header_wrapper" style="height: 170px;">
	        <div class="login">
	            <ul>
	            <c:if test="${id eq 'Admin' }">
	            	<li><a href="<%=cp %>/adminProduct.action">관리자페이지</a></li>
	            </c:if>
	                <li><a href="<%=cp %>/notification.action">고객센터</a></li>
	          	<c:if test="${!empty id}">
	        		<li><a href="<%=cp%>/myPage.action">MY PAGE</a></li>
	            	<li><a href="<%=cp%>/logout.action">LOGOUT</a></li>
	             	<li><a>${id }님 환영합니다♥</a></li>
	       		</c:if>         
	       		<c:if test="${empty id }">
	            	<li><a href="<%=cp%>/newTerm.action">회원가입</a></li>
	            	<li><a href="<%=cp%>/login.action">LOGIN</a></li>
	            </c:if>
	            </ul>
	        </div>
	        <div class="header_container">
	            <div class="header_grid">
	                <div class="header_event">
	                    <p>GET IT!</p>
	                    <ul>
	                    	<li>
		                    	<div>
		                    		<ul>
		                    			<li><img src="<%=cp%>/resources/image/beaudam/main/header_event_l.png" id="prev"></li>
		                    		</ul>
		                        </div>
		                    </li>
	                        <li>
	                        	<div id="slideshow">
		                        	<ul>
		                        		<li><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo1.jpg"></li>
		                       			<li>A'pieu<br/>미네랄 섀도우<br/>4,000원</li>
		                        	</ul>
	                        	</div>
	           				</li>
	           				<!-- 제이쿼리 수정 중 -->
	           				<%-- <li>
	                        	<div id="slideshow">
		                        	<ul>
		                        		<li><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo2.jpg"></li>
		                       			<li>A'pieu<br/>컬러 립 스테인<br/>7,500원</li>
		                        	</ul>
	                        	</div>
	           				</li>
	           				<li>
	                       <div id="slideshow">
		                        	<ul>
		                        		<li><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo3.jpg"></li>
		                       			<li>THEFACESHOP<br/>수분 쿠션 스테인<br/>12,000원</li>
		                        	</ul>
	                        </div>
	           				</li> --%>
	                        <li>
		                    	<div>
		                    		<ul>
		                    			<li><img src="<%=cp%>/resources/image/beaudam/main/header_event_r.png" id="next" ></li>
		                    		</ul>
		                        </div>
		                    </li>
	                    </ul>
	                </div>
	                <div class="header_logo">
	                    <a href="<%=cp %>/main.action"><img alt="" src="<%=cp%>/resources/image/beaudam/main/logo.png"></a>
	                </div>
	                <div class="header_search"> 
	                    <!-- 수정부분 -->
	                    <ul class="search_icon">
	                        <li><input type="button" value="GO!"></li>
	                        <li><input type="text" class="form-control" id="usr" placeholder="에뛰드 틴트" ></li>
	                    </ul>
	                    <ul class="search_icon">
	                        <li><img src="<%=cp%>/resources/image/beaudam/main/icon_blog1.gif"></li>
	                        <li><a href="<%=cp %>/myPage.action"><img src="<%=cp%>/resources/image/beaudam/main/icon_blog2.gif"></a></li>
	                        <li><a href="<%=cp %>/adminProduct.action"><img src="<%=cp%>/resources/image/beaudam/main/icon_blog3.gif"></a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 카테고리 -->
	<div class="navbar_container sticky sticky_border" style="height: 52px;">
	<div class="navbar">
	    <div class="dropdown" >
	    <button class="dropbtn">CATERORY 
	        <i class="fa fa-caret-down"></i>
	    </button>
	        <div class="dropdown-content" style="width: 950px;  border-top: 1px solid gray; padding-top: 15px;">  
	            <div class="column">
	            <h3>SKIN</h3>
	                <a href="<%=cp %>/productList.action">파운데이션</a>
	                <a href="<%=cp %>/productList.action">베이스</a>
	                <a href="#">쿠션</a>
	                <a href="#">파우더/팩트</a>
	                <a href="#">프라이머</a>
	                <a href="#">컨투어링 / <br>하이라이터</a>
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
	                <a href="#">향수</a>
	            </div>
	            <div class="column">
	            <h3>ACC</h3>
	                <a href="#">브러쉬</a>
	                <a href="#">뷰러</a>
	                <a href="#">퍼프</a>
	            </div>
	        </div>
	    </div> 
	        <a href="#">BEST ITEM</a>
	        <a href="#newItem">NEW ITEM</a>
	        <a href="./event.action">EVENT</a>
	        <a href="#">LOOKS</a>
	        <a href="#">뷰담 PICK'S</a>
	        <a href="./sale.action">SALE</a>
	    </div>
	    </div>
	   
	<!-- 카테고리 끝 -->
</body>
</html>