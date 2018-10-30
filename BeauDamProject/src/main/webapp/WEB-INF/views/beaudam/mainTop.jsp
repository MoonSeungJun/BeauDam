<%@page import="org.springframework.boot.web.servlet.server.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
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
<script type="text/javascript">

	function searchIt() {
		
		f = document.mainSearchForm;
		
		f.action = "<%=cp%>/productList.action";
		f.submit();
		
	}
	
	function typeSearch(type) {
		
		f = document.mainTopTypeForm;
		
		var searchType = type;
		
		f.action = "<%=cp%>/productList.action?searchType="+searchType;
		f.submit();	
		
		
	}



</script>

</head>
<body>
	<!-- 상단 시작 -->
	<form action="" method="post" name="mainSearchForm">
	<div class="header">
	    <div class="top">
	        GRAND OPEN! 신규 회원 20% 즉시 할인 쿠폰 증정!
	        <img src="<%=cp%>/resources/image/beaudam/main/top.png" onclick="$('.top').slideUp(400);" style="cursor:pointer">
	    </div>
	    <!-- 로고 영역 -->
	    <div class="header_wrapper">
	        <div class="login">
	            <ul>
	                <li><a href="<%=cp %>/notification.action">고객센터</a></li>
	          		<c:if test="${!empty id}">
	        		<li><a href="<%=cp%>/myPage.action">MY PAGE</a></li>
	             <li><a href="<%=cp%>/logout.action">LOGOUT</a></li>
	             <li>${id }님 환영합니다♥</li>
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
	                        <li><input type="button" value="GO!" onclick="searchIt();"></li>
	                        <li><input type="text" class="form-control" id="usr" name="searchValue" placeholder="에뛰드 틴트"
	                        onkeypress="if(event.keyCode==13) {searchIt();}">
	                        </li>
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
	</form>
	<!-- 카테고리 -->
	<div class="navbar_container sticky sticky_border">
	<div class="navbar">
	    <div class="dropdown" >
	    <button class="dropbtn">CATERORY 
	        <i class="fa fa-caret-down"></i>
	    </button>
	    	<form action="" method="post" name="mainTopTypeForm">
	        <div class="dropdown-content" style="width: 950px;  border-top: 1px solid gray; padding-top: 15px;">  
	            <div class="column">
	            <h3>SKIN</h3>
	            	<a href="javascript:void(0);" onclick="typeSearch('Foundation');" 
	            	style="text-decoration: none;">파운데이션</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('Base');" 
	            	style="text-decoration: none;">베이스</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Cushion');" 
	            	style="text-decoration: none;">쿠션</a>	                
	                <a href="javascript:void(0);" onclick="typeSearch('Pact');" 
	            	style="text-decoration: none;">파우더/팩트</a>	               
	                <a href="javascript:void(0);" onclick="typeSearch('Primer');" 
	            	style="text-decoration: none;">프라이머</a>	                
	                <a href="javascript:void(0);" onclick="typeSearch('Contouring/Highlighter');" 
	            	style="text-decoration: none;">컨투어링 / <br>하이라이터</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('Blush');" 
	            	style="text-decoration: none;">블러셔</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('BB');" 
	            	style="text-decoration: none;">BB</a>
	                
	            </div>
	            <div class="column">
	            <h3>EYE</h3>
	            <a href="javascript:void(0);" onclick="typeSearch('Shadow');" 
	            	style="text-decoration: none;">쉐도우</a>
	            <a href="javascript:void(0);" onclick="typeSearch('Mascara');" 
	            	style="text-decoration: none;">마스카라</a>
	            <a href="javascript:void(0);" onclick="typeSearch('Liner');" 
	            	style="text-decoration: none;">아이라이너</a>
	            <a href="javascript:void(0);" onclick="typeSearch('Eyelashes');" 
	            	style="text-decoration: none;">아이래쉬스</a>
	               
	            </div>
	            <div class="column">
	            <h3>LIP</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Stick');" 
	            	style="text-decoration: none;">립스틱</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Tint');" 
	            	style="text-decoration: none;">틴트</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Balm');" 
	            	style="text-decoration: none;">립밤</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('Gloss');" 
	            	style="text-decoration: none;">립글로즈</a>
	            </div>
	            <div class="column">
	            <h3>PACK</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Wash');" 
	            	style="text-decoration: none;">워시오프팩</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Sheet');" 
	            	style="text-decoration: none;">시트팩</a>
	            </div>
	            <div class="column">
	            <h3>CEALSING</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Cleansing');" 
	            	style="text-decoration: none;">클렌징폼</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Water/Oil/Cream');" 
	            	style="text-decoration: none;">워터/오일</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Peeling/Scrub');" 
	            	style="text-decoration: none;">필링/스크럽</a>
	            </div>
	            <div class="column">
	            <h3>PERFUME</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Perfume');" 
	            	style="text-decoration: none;">향수</a>
	            </div>
	            <div class="column">
	            <h3>ACC</h3>
	            <a href="javascript:void(0);" onclick="typeSearch('Brush');" 
	            	style="text-decoration: none;">브러쉬</a>	              
	                <a href="javascript:void(0);" onclick="typeSearch('Curler');" 
	            	style="text-decoration: none;">뷰러</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Puff');" 
	            	style="text-decoration: none;">퍼프</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('Pads');" 
	            	style="text-decoration: none;">화장솜</a>
	            	<a href="javascript:void(0);" onclick="typeSearch('Swab');" 
	            	style="text-decoration: none;">면봉</a>
	            </div>
	        </div>
	        </form>
	    </div> 
	        <a href="#home">BEST ITEM</a>
	        <a href="#news">NEW ITEM</a>
	        <a href="./event.action">EVENT</a>
	        <a href="#news">LOOKS</a>
	        <a href="#news">뷰담 PICK'S</a>
	        <a href="#news">SALE</a>
	    </div>
	    </div>
	   
	<!-- 카테고리 끝 -->
</body>
</html>