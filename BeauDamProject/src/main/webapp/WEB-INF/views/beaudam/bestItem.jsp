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
			<c:forEach var="dto" items="${etuList }" varStatus="st">
			<div class="product">
				<p class="rank">BEST ${st.count}</p>
				<div>
					<a href="${detailUrl }?code=${dto.code}">
					<img alt="" src="<%=cp %>/${dto.thumb_Img}">
					</a>
					<p class="rankBand">${dto.brand }</p>
					<p class="rankName">${dto.product_Name }</p>
					<p class="price">${dto.product_Price }</p>
				</div>
			</div>
			</c:forEach>
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
			<c:forEach var="dto" items="${apList }" varStatus="st">
			<div class="product">
				<p class="rank">BEST ${st.count}</p>
				<div>
					<a href="${detailUrl }?code=${dto.code}">
					<img alt="" src="<%=cp %>/${dto.thumb_Img}">
					</a>
					<p class="rankBand">${dto.brand }</p>
					<p class="rankName">${dto.product_Name }</p>
					<p class="price">${dto.product_Price }</p>
				</div>
			</div>
			</c:forEach>
			</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/face2.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<c:forEach var="dto" items="${faceList }" varStatus="st">
			<div class="product">
				<p class="rank">BEST ${st.count}</p>
				<div>
					<a href="${detailUrl }?code=${dto.code}">
					<img alt="" src="<%=cp %>/${dto.thumb_Img}">
					</a>
					<p class="rankBand">${dto.brand }</p>
					<p class="rankName">${dto.product_Name }</p>
					<p class="price">${dto.product_Price }</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/innisfree2.jpg"></p>
		</div>
		<div style="overflow: hidden;">
			<c:forEach var="dto" items="${innisList }" varStatus="st">
			<div class="product">
				<p class="rank">BEST ${st.count}</p>
				<div>
					<a href="${detailUrl }?code=${dto.code}">
					<img alt="" src="<%=cp %>/${dto.thumb_Img}">
					</a>
					<p class="rankBand">${dto.brand }</p>
					<p class="rankName">${dto.product_Name }</p>
					<p class="price">${dto.product_Price }</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<div class="best">
		<div class="name">
			<p><img alt="" src="<%=cp%>/resources/image/beaudam/main/nature.gif"></p>
		</div>
		<div style="overflow: hidden;">
			<c:forEach var="dto" items="${natuList }" varStatus="st">
			<div class="product">
				<p class="rank">BEST ${st.count}</p>
				<div>
					<a href="${detailUrl }?code=${dto.code}">
					<img alt="" src="<%=cp %>/${dto.thumb_Img}">
					</a>
					<p class="rankBand">${dto.brand }</p>
					<p class="rankName">${dto.product_Name }</p>
					<p class="price">${dto.product_Price }</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<hr>
</div>
<jsp:include page="mainBottom.jsp"/>
</body>
</html>