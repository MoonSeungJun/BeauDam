<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Beaudam</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<link rel="stylesheet" href="./resources/css/myPage/myPage.css">
</head>
<body>
	<jsp:include page="../beaudam/mainTop.jsp" />
	<div style="padding-bottom: 80px;">
	<!-- 타이틀 -->
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">마이뷰담</h2>
			</div>
		</div>
		
		<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
				<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<span style="font-size: 18px;">${id }</span>
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
								${dto.point }
							</p>
						</div>
						<div class="title">
							<h3 style="">쿠폰</h3>
						</div>
						<div>
							<p class="" style="font-size: 20px; font-weight: normal;" >
								${couponCount }
							</p>
						</div>
						<div class="title">
							<h3 style="">등급</h3>
						</div>
						<div>
							<p class="" style="font-size: 20px; font-weight: normal;" >
								${dto.grade }
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
							<li><a href="" style="margin-bottom: 5px;">나의 정보</a>
								<ul class="sub_lnb">
									<li><a href="<%=cp%>/myCoupon.action" style="color: gray;">쿠폰조회</a></li>
									<li><a href="<%=cp%>/myInfo.action" style="color: gray;">개인정보수정</a></li>
									<li><a href="<%=cp%>/myLeave.action" style="color: gray;">회원탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- 우측 정보부분 -->
			<div class="float_right">
				<div class="float_conts">
					<!-- 마이페이지 INDEX -->
					
					<!-- 나의 주문 현황 -->
					<div class="float_title" style="height: 65px;">
						<span style="display: block; font-size: 14pt; font-weight: bold; ">
							나의 주문 현황 </span>
					</div>
					<div class="infobox" style="height: 252px;">
						<table style="width: 100%; height: 100px;">
								<tr>
									<td>
										<img style="width: 40px" src="/beaudam/resources/image/myPage/hour.jpg">	
									</td>
									<td rowspan="3">▶</td>
									<td>
										<img style="width: 60px"src="/beaudam/resources/image/myPage/pay.jpg" />
									</td>
									<td rowspan="3" style="border-right: 1px solid #77797a;">&nbsp;&nbsp;&nbsp;</td>
									<td>
										<img style="width: 40px" src="/beaudam/resources/image/myPage/box.jpg" />
									</td>
									<td rowspan="3">▶</td>
									<td>
										<img style="width: 60px"src="/beaudam/resources/image/myPage/delivery.jpg" />
									</td>
									<td rowspan="3">▶</td>
									<td>
										<img style="width: 60px" src="/beaudam/resources/image/myPage/smile.jpg" />
									</td>
								</tr>
								<tr>
									<td>입금대기</td>
									<td>결제완료</td>
									<td>배송준비중</td>
									<td>배송중</td>
									<td>배송완료</td>
								</tr>
								<tr>
									<td>${payReady }</td>
									<td>${payCompl }</td>
									<td>${deliReady }</td>
									<td>${deliIng }</td>
									<td>${deliCompl }</td>
								</tr>
						</table>
					</div>
					<!-- 나의 보유 현황 -->
					<div class="mypage_index_conts" style="height: 255px;">
						<div class="title_content" style="padding: 20px 18px;">
							<span style="display: block; font-size: 14pt; font-weight: bold">나의 보유 현황 </span>
						</div>
						<hr style="margin: 0; padding: 0;">
						<div class="mypage_index_state">
							<div class="mypageWrapper" style="width: 80%; margin: 30px auto 30px auto;">
								<dl>
									<dt>포인트</dt>
									<dd class="point">${dto.point }</dd>
								</dl>
								<dl>
									<dt>쿠폰</dt>
									<dd>${couponCount }</dd>
								</dl>
								<dl>
									<dt>등급</dt>
									<dd>${dto.grade }</dd>
								</dl>
							</div>
						</div>
					</div>
					<!-- 정보 관리 -->
					<div class="imformation" style="overflow: hidden;">
						<div class="title_content" style="padding: 20px 18px;">
							<span style="display: block; font-size: 14pt; font-weight: bold">정보 관리</span>
						</div>
						<hr style="margin: 0; padding: 0;">
						<div class="imformation_content">
							<dl class="left aa" style="float: left; width: 50%;">
								<dt>회원정보 수정</dt>
								<dd>
									<div style="margin-bottom: 10px;">
										<p>가입 시 등록한 내용에서 변경된 내용이 있으신가요?</p>
									</div>
									<div>
										<a href="<%=cp%>/myInfo.action">회원정보수정</a>
									</div>
								</dd>
							</dl>
							<dl class="right aa" style="float: right; width: 50%; ">
								<dt>회원 탈퇴</dt>
								<dd>
									<div style="margin-bottom: 10px;">
										<p>회원님의 탈퇴를 원하시나요?</p>
									</div>
								</dd>
								<dd><a href="<%=cp%>/myLeave.action">회원 탈퇴</a></dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>