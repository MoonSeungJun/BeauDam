<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 조회</title>
<link rel="stylesheet" href="./resources/css/myPage/myPage.css">
<link rel="stylesheet" href="./resources/css/myPage/myOrder.css">

</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<!-- 마이페이지 우측 메뉴 사이즈 : 900*545 -->
	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">나의 쿠폰</h2>
				<hr style=" border: 0; height: 1px; background-color: gray;">
			</div>
		</div>
				<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
				<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<a href="<%=cp%>/myPage.action">
							<span style="font-size: 18px; color: black; text-decoration: none;">${id }</span>
						</a>
					</div>
					<a href="<%=cp%>/myInfo.action" class="setting_btn"> 
						<img src="/beaudam/resources/image/myPage/setting.jpg" height="30px" align="bottom">
					</a>
				</div>

				<div class="user_benefit" style="overflow: hidden;">
					<div class="user_point" style="float: left;">
						<div class="title">
							<h3 style="">포인트</h3>
						</div>
						<div>
							<p class="point" style="font-size: 20px; color: black; font-weight: normal;">
								0
							</p>
						</div>
						<div class="title">
							<h3 style="">쿠폰</h3>
						</div>
						<div>
							<p class="" style="font-size: 20px; font-weight: normal;" >
								0
							</p>
						</div>
						<div class="title">
							<h3 style="">등급</h3>
						</div>
						<div>
							<p class="" style="font-size: 20px; font-weight: normal;" >
								Bronze
							</p>
						</div>
					</div>
				</div>

				<!-- 좌측 메뉴바 -->
				<div class="lnb_menu">
					<nav>	
						<ul>
							<li>
								<a href="<%=cp %>/myBasket.action">나의 장바구니</a>
							</li>
							<li>
								<a href="<%=cp %>/myOrder.action">나의 주문 현황</a>
							</li>
							<li><a style="margin-bottom: 15px;">나의 정보</a>
								<ul class="sub_lnb">
									<li><a href="<%=cp%>/myCoupon.action" style="color: #9a9a9;">쿠폰조회</a></li>
									<li><a href="<%=cp%>/myEdit.action">개인정보수정</a></li>
									<li><a href="<%=cp%>/myLeave.action">회원탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- 우측 정보부분 / 쿠폰 -->
			<div class="float_right">
				<div class="float_conts">
					<!-- 마이페이지 INDEX -->
					<div class="float_title" style="height: 65px;">
						<span style=" font-size: 14pt; font-weight: bold; ">
							나의 쿠폰
						</span>
					</div>
					<hr style="margin: 0; padding: 0;">
					<div class="coupon_wrapper">
						<table class="coupon_table" style="width: 100%;">
							<tr>
								<td colspan="4" height="50px;" style="background-color: #F9F9F9;">쿠폰조회</td>
							</tr>
							<tr>
								<td width="20%">
									<img src="./resources/image/myPage/coupon.png" width="80px">
								</td>
								<td width="30%" style="padding: 10px;">
									사용가능 쿠폰<br/>
									<b style="font-size: 30pt; color: red;">${couponCount }</b>장
								</td>
								
								<td width="20%">
									<img src="./resources/image/myPage/coupon.png" width="80px">
								</td>
								<td width="30%" style="padding: 10px;">
									7일 이내 소멸 쿠폰 쿠폰<br/>
									<b style="font-size: 30pt; color: red;">${couponWeekCount }</b>장
								</td>
							</tr>
							<tr>
								<td colspan="4" height="50px;" style="background-color: #F9F9F9;">쿠폰 내역</td>
							</tr>
							<tr>
								<td colspan="4">
									<table class="coupon" style="width: 100%;">
										<tr>
											<td style="padding: 10px;">발행날짜</td>
											<td style="padding: 10px;">상태</td>
											<td style="padding: 10px;">쿠폰명</td>
											<td style="padding: 10px;">사용기간</td>
											<td style="padding: 10px;">할인율</td>
										</tr>
										
										<!-- 반복문으로 출력 -->
										<c:forEach var="dto" items="${cLists }">
										<tr>
											<td>${dto.begin }</td>
											<td>사용가능</td>
											<td>가입환영쿠폰</td>
											<td>${dto.begin } ~ ${dto.period }</td>
											<td>${dto.coupon }</td>
										</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
						<div class="coupon_bottom" style="margin-top: 30px;	background-color: #F9F9F9;">
							<p style="padding: 30px; margin: 0;">
								* 쿠폰의 발급 및 사용은 뷰담 사이트 회원 구매 시에만 적용됩니다.<br/>
								* 브랜드데이 기간 할인 적용 시 쿠폰 사용은 안되며 사은품은 지급되지 않습니다.<br/>
								* 한 주문, 한 품목에 대해서만 사용 가능합니다.<br/>
								* 한 품목에 대해 2장 이상의 쿠폰을 중복 사용하실 수 없습니다.<br/>
								* 쿠폰 사용 후 쿠폰 잔액에 대해서는 환불이 불가하며 잔액은 자동 소멸됩니다.<br/>
								* 쿠폰은 발급 후 사용 기간 내에서만 사용이 가능하며 기간 내 사용하지 않으면 자동 소멸됩니다.<br/>
								* 쿠폰 특성에 따라 금액, 상품 별로 사용이 제한될 수 있습니다.<br/>
								* 쿠폰은 현금화되지 않습니다.<br/>
								* 배송료와 기타 상품은 쿠폰으로 결제하실 수 없습니다.<br/>
								* 쿠폰은 타인 양도가 불가능합니다.<br/>
							</p>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>
