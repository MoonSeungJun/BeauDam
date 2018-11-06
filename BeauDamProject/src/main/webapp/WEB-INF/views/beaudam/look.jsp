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
<title>beaudam > LOOKS</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/look.css">
</head>
<body>
<jsp:include page="mainTop.jsp"/>
<div>
	<div class="video" style="background-color: #c9765a; " id="autoumn">
	<div class="menu">
			<p>내게 맞는 MAKEUP LOOK을 찾아봐!💕</p>
			<a href="#daily"><span>#데일리 메이크업</span></a>
			<a href="#date"><span>#데이트 메이크업</span></a>
			<a href="#autoumn"><span>#가을 메이크업</span></a>
		</div>
		<video src="<%=cp%>/resources/video/look/LOOK_1.mp4" controls="controls" style="display: block; margin: 100px auto 30px auto;" autoplay="autoplay" ></video>
		<p class="videoName">AUTOUMN CHILLI MOOD MAKEUP</p>
		<p class="videoComment">올 가을 은은한 붉은빛으로 물들여보자!<Br>
		#이니스프리 #가을메이크업 #칠리무드 #뷰담 </p>
		<div style="border: 2px solid #ddd; width: 960px; margin: 30px auto;">
			<p class="itemTitle">사용한 제품 알아보기!</p>
			<div class="videoItem">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Primer&code=is7002"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look11.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Shadow&code=ie2002"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look12.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Stick&code=il3003"> <img alt="" src="<%=cp%>/resources/image/beaudam/look/look13.png"></a>
			</div>
		</div>
	</div>
	<div class="video" style="background-color: #ffe2c9;" id="daily">
		
		<video src="<%=cp%>/resources/video/look/LOOK_2.mp4" controls="controls" style="display: block; margin: 100px auto 30px auto;"autoplay="autoplay" ></video>
		<p class="videoName">DAILY PEACH MAKEUP</p>
		<p class="videoComment">새내기들이 하기 좋은 데일리 메이크업<Br>
		섀도우 꿀조합, 메이크업 꿀팁 알아가자 ♡</p>
		<div style="border: 2px solid #ddd; width: 960px; margin: 60px auto;">
			<p class="itemTitle">사용한 제품 알아보기!</p>
			<div class="videoItem">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Shadow&code=ee2002"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look21.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Mascara&code=ee3002"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look22.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Tint&code=fl4001"> <img alt="" src="<%=cp%>/resources/image/beaudam/look/look23.jpg"></a>
			</div>
		</div>
	</div>
	
	<div class="video" style="background-color: pink;" id="date">
		<video src="<%=cp%>/resources/video/look/LOOK_3.mp4" controls="controls" style="display: block; margin: 100px auto 30px auto;" autoplay="autoplay" ></video>
		<p class="videoName">SWEET PINK MAKEUP</p>
		<p class="videoComment">솜사탕처럼 달콤한 핑크 메이크업 🎀 <Br>
		데이트에 안성맞춤! 차분한 핑크 🎀 
		</p>
		<div style="border: 2px solid #ddd; width: 960px; margin: 30px auto;">
			<p class="itemTitle">사용한 제품 알아보기!</p>
			<div class="videoItem">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Blush&code=es2001"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look31.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Foundation&code=es5001"><img alt="" src="<%=cp%>/resources/image/beaudam/look/look32.png"></a>
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Liner&code=ne1001"> <img alt="" src="<%=cp%>/resources/image/beaudam/look/look33.gif"></a>
			</div>
		</div>
	</div>
	

</div>
<jsp:include page="mainBottom.jsp"/>
</body>
</html>