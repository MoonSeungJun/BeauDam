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
<title>beaudam > PICK'S</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/pick.css">
</head>
<body>
<jsp:include page="mainTop.jsp"/>
<div class="wrapper" style="background: url('<%=cp%>/resources/image/beaudam/pick/back_pick.png') no-repeat center top;">
	<h2>뷰담 PICK'S</h2>
</div>
	<h2 style="font-family: 'designhouseOTFLight00'; margin: 30px auto; text-align: center;">뷰담이 직접 추천하는 <span style="color: red;">HOT ITEM!</span></h2>
	
	<div style="overflow: hidden; width: 1120px; margin: 0 auto 10px auto;">
		<div class="video">
			<p style="font-family: 'YiSunShinDotumM'; color: #e45151; font-size: 23px;">[어퓨] 트루 멜팅 립스틱</p>
			<video src="<%=cp%>/resources/video/pick/apuie.mp4" controls="controls"></video>
			<p class="video_cotent">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Lip&code=al3003	">지금 사러 가자! ♡ 트루 립스틱</a>
			</p>
		</div>
		<div class="video">
			<p style="font-family: 'YiSunShinDotumM'; color: #e45151; font-size: 23px;">[에뛰드] 더블래스팅 쿠션</p>
			<video src="<%=cp%>/resources/video/pick/etude.mp4" controls="controls"></video>
			<p class="video_cotent">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Foundation&code=es4001	">지금 사러 가자! ♡ 박나래가 극찬한 더블래스팅 쿠션</a>
			</p>
		</div>
	</div>
	
	<hr>
	
	<div style="overflow: hidden; width: 1700px; margin: 0 auto; ">
		<div class="video" >
			<p style="font-family: 'YiSunShinDotumM'; color: #e45151; font-size: 23px;">[네이처리퍼블릭] 프로 터치 블러셔 팔레트</p>
			<video src="<%=cp%>/resources/video/pick/nature.mp4" controls="controls" style="width: 350px;"></video>
			<p class="video_cotent">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Shadow&code=ns2003	">지금 사러 가자 ♡ 8색조 블러셔 팔레트</a>
			</p>
		</div>
		<div class="video" >
			<p style="font-family: 'YiSunShinDotumM'; color: #e45151; font-size: 23px;">[더페이스샵] 모노큐브 아이섀도우</p>
			<video src="<%=cp%>/resources/video/pick/the.mp4" controls="controls" style="width: 350px;"></video>
			<p class="video_cotent">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Shadow&code=fe2002	">지금 사러 가자! ♡ 영롱한 모노큐브 !</a>
			</p>
		</div>
		<div class="video">
			<p style="font-family: 'YiSunShinDotumM'; color: #e45151; font-size: 23px;">[이니스프리] 노세범 미네랄 팩트</p>
			<video src="<%=cp%>/resources/video/pick/innis.mp4" controls="controls" style="width: 350px; height: 410px;"></video>
			<p class="video_cotent">
				<a href="<%=cp %>/productDetail.action?pageNum=1&searchType=Powder&code=is6001	">지금 사러 가자! ♡ 행운이 담긴 노세범 팩트</a>
			</p>
		</div>
	</div>
	
<jsp:include page="mainBottom.jsp"/>
</body>
</html>