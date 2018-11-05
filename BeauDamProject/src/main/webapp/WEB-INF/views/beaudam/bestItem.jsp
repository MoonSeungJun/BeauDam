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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/bestItem.css">
</head>
<body>
<jsp:include page="mainTop.jsp"/>
<div class="title">
	<h2 style=" letter-spacing: 0.1em;">BEST ITEM</h2>       
</div>
<div class="content">
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/etude.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<div class="product">
				<p class="rank">BEST 1</p>
				<div>
					<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg"></a>
					<p class="rankBand">ETUDE HOUSE</p>
					<p class="rankName">제품명 제품명</p>
					<p class="price">100,000원</p>
				</div>
			</div>
			<div class="product">
				<p class="rank">BEST 2</p>
				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg"></a>
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
			<div class="product">
				<p class="rank">BEST 3</p>
				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg"></a>
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
		</div>
	</div>
	<hr>
	<!-- 여기까지 반복 -->
	
	
	
	<!-- 브랜드별 로고 (class=name) 이미지 주소 샘플 -->
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/apieu2.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<div class="product">
				<p class="rank">BEST 1</p>
				<div>
					<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
					<p class="rankBand">ETUDE HOUSE</p>
					<p class="rankName">제품명 제품명</p>
					<p class="price">100,000원</p>
				</div>
			</div>
			<div class="product">
				<p class="rank">BEST 2</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
			<div class="product">
				<p class="rank">BEST 3</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/face2.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<div class="product">
				<p class="rank">BEST 1</p>
				<div>
					<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
					<p class="rankBand">ETUDE HOUSE</p>
					<p class="rankName">제품명 제품명</p>
					<p class="price">100,000원</p>
				</div>
			</div>
			<div class="product">
				<p class="rank">BEST 2</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
			<div class="product">
				<p class="rank">BEST 3</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/innisfree2.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<div class="product">
				<p class="rank">BEST 1</p>
				<div>
					<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
					<p class="rankBand">ETUDE HOUSE</p>
					<p class="rankName">제품명 제품명</p>
					<p class="price">100,000원</p>
				</div>
			</div>
			<div class="product">
				<p class="rank">BEST 2</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
			<div class="product">
				<p class="rank">BEST 3</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/nature.gif"></p>
		</div>
		<div style="overflow: hidden;">
			<div class="product">
				<p class="rank">BEST 1</p>
				<div>
					<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
					<p class="rankBand">ETUDE HOUSE</p>
					<p class="rankName">제품명 제품명</p>
					<p class="price">100,000원</p>
				</div>
			</div>
			<div class="product">
				<p class="rank">BEST 2</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
			<div class="product">
				<p class="rank">BEST 3</p>
				<img alt="" src="<%=cp%>/resources/image/beaudam/main/sample5.jpg">
				<p class="rankBand">ETUDE HOUSE</p>
				<p class="rankName">제품명 제품명</p>
				<p class="price">100,000원</p>
			</div>
		</div>
	</div>
	<hr>
</div>
<jsp:include page="mainBottom.jsp"/>
</body>
</html>