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


<script type="text/javascript">

	function searchIt() {
		
		f = document.mainSearchForm;
		
		var check = f.searchValue.value;
		
		check = check.trim();
		
		if(!check){
			alert("검색어를 입력해주세요")
			f.searchValue.focus();			
			return;
		}		
			
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
	                <li><a href="<%=cp %>/notification.action">고객센터</a></li>
	          	<c:if test="${!empty id && id ne 'admin'}">
	        		<li><a href="<%=cp%>/myPage.action">MY PAGE</a></li>
	            	<li><a href="<%=cp%>/logout.action">LOGOUT</a></li>
	             	<li><a>${id }님 환영합니다♥</a></li>
	       		</c:if>         
	       		<c:if test="${id eq 'admin' }">	            	
	            	<li><a href="<%=cp %>/adminProduct.action">관리자페이지</a></li>
	            	<li><a href="<%=cp%>/logout.action">LOGOUT</a></li>
	            	<li><a>사...사장님?</a></li>
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
		                    <div class="container" style="background-color: transparent;">

									<div id="myCarousel" class="carousel slide"
										data-ride="carousel" style="width: 25%; background-color: transparent;">
										
										<!-- Wrapper for slides -->
										<div class="carousel-inner" style="background-color: white;">
											<div class="item active " style="background-color: white;">
												<ul>
													<li><a href="<%=cp %>/productDetail.action?code=ae2001"><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo1.jpg"></a></li>
		                       						<li>A'pieu<br/>미네랄 섀도우<br/>4,000원</li>
		                       					</ul>
											</div>

											<div class="item" style="background-color: white;">
												<ul>
		                        					<li><a href="<%=cp %>/productDetail.action?code=al4002"><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo2.jpg"></a></li>
		                       						<li>A'pieu<br/>컬러 립 스테인<br/>7,500원</li>
		                        				</ul>
											</div>

											<div class="item" style="background-color: white;">
												<ul>
		                        					<li><a href="<%=cp %>/productDetail.action?code=fs2003"><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo3.jpg"></a></li>
		                       						<li>THE FACE SHOP<br/>수분 쿠션 블러쉬<br/>12,000원</li>
		                        				</ul>
		                        			</div>
										</div>

										<!--  Left and right controls -->
										<!-- <a class="left carousel-control" href="#myCarousel"
											data-slide="prev" style="background-color: transparent;"> <span
											class="glyphicon glyphicon-chevron-left" style="background-color: white;"></span> <span
											class="sr-only" style="background-color: transparent;">Previous</span>
										</a> <a class="right carousel-control" href="#myCarousel"
											data-slide="next" style="background-color: transparent;"> <span
											class="glyphicon glyphicon-chevron-right" style="background-color: white;"></span> <span
											class="sr-only" style="background-color: transparent;">Next</span>
										</a>   -->
										
										<!-- Controls -->
										<!-- <a class="left carousel-control"
											href="#carousel-example-generic" role="button"
											data-slide="prev"> <span
											class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="right carousel-control"
											href="#carousel-example-generic" role="button"
											data-slide="next"> <span
											class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a> -->


									</div>
								</div>
							</li>
		                    
		                    
		                    
	                        <%-- <li>
	                        	<div id="slideshow">
		                        	<ul>
		                        		<li><img class="list_logo" src="<%=cp%>/resources/image/beaudam/main/list_logo1.jpg"></li>
		                       			<li>A'pieu<br/>미네랄 섀도우<br/>4,000원</li>
		                        	</ul>
	                        	</div>
	           				</li> --%>
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
	                    </ul>
	                </div>
	                <div class="header_logo">
	                    <a href="<%=cp %>/main.action"><img alt="" src="<%=cp%>/resources/image/beaudam/main/logo.png"></a>
	                </div>
	               
	                <div class="header_search"> 
	                     <form action="" method="post" name="mainSearchForm">
	                    <!-- 수정부분 -->
	                    <ul class="search_icon">
	                        <li><input type="button" value="GO!" onclick="searchIt();"></li>
	                        <li><input type="text" placeholder="에뛰드 틴트" name="searchValue" onkeypress="if(event.keyCode == 13) searchIt();" style="padding: 5px;"></li>
	                    </ul>
	                    <ul class="search_icon">
	                        <li><a href="https://www.facebook.com/"><img src="<%=cp%>/resources/image/beaudam/main/icon_blog1.gif"></a></li>
	                        <li><a href="https://twitter.com/"><img src="<%=cp%>/resources/image/beaudam/main/icon_blog2.gif"></a></li>
	                        <li><a href="https://www.instagram.com/under_the_sound/"><img src="<%=cp%>/resources/image/beaudam/main/icon_blog3.gif"></a></li>
	                    </ul>
	                	</form>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 카테고리 -->
	<div class="navbar_c?searchType=ontainer sticky sticky_border" style="height: 52px;">
	<div class="navbar">
	    <div class="dropdown" >
	    <button class="dropbtn">CATERORY 
	        <i class="fa fa-caret-down"></i>
	    </button>
	        <div class="dropdown-content" style="width: 950px;  border-top: 1px solid gray; padding-top: 15px;">  
	            <form action="" name="mainTopTypeForm" method="post">
	            <div class="column">
	            <h3>SKIN</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Foundation');">파운데이션</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Base');">베이스</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Cushion');">쿠션</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Pact');">파우더/팩트</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Primer');">프라이머</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Contouring/Highlighter');">컨투어링 / <br>하이라이터</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Blush');">블러셔</a>
	                <a href="javascript:void(0);" onclick="typeSearch('BB');">BB</a>
	            </div>
	            <div class="column">
	            <h3>EYE</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Shadow');">쉐도우</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Mascara');">마스카라</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Liner');">아이라이너</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Eyelashes');">아이래쉬스</a>
	            </div>
	            <div class="column">
	            <h3>LIP</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Stick');">립스틱</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Tint');">틴트</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Balm');">립밤</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Gloss');">립글로스</a>
	            </div>
	            <div class="column">
	            <h3>PACK</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Wash');">워시오프팩</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Sheet');">시트팩</a>
	            </div>
	            <div class="column">
	            <h3>CEALSING</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Cleansing');">클렌징폼</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Water');">워터/오일</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Peeling');">필링/스크럽</a>
	            </div>
	            <div class="column">
	            <h3>PERFUME</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Perfume');">향수</a>
	            </div>
	            <div class="column">
	            <h3>ACC</h3>
	                <a href="javascript:void(0);" onclick="typeSearch('Brush');">브러쉬</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Curler');">뷰러</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Puff');">퍼프</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Pads');">화장솜</a>
	                <a href="javascript:void(0);" onclick="typeSearch('Swab');">면봉</a>
	            </div>
	       	</form>
	        </div>
	    </div> 
	        <a href="./bestItem.action">BEST ITEM</a>
	        <a href="#newItem">NEW ITEM</a>
	        <a href="./event.action">EVENT</a>
	        <a href="./look.action">LOOKS</a>
	        <a href="./pick.action">뷰담 PICK'S</a>
	    </div>
	    </div>
	   
	<!-- 카테고리 끝 -->
</body>
</html>