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
<title>My Beaudam</title>
<link rel="stylesheet" href="./resources/css/myPage/myPage.css">
<link rel="stylesheet" href="./resources/css/myPage/myOrder.css">

<script type="text/javascript">

	function sendIt() {
		
		var f = document.myOrderFrom;
		
		var startdate = f.startDate.value;
		var enddate = f.endDate.value;
		
		startdate = startdate.trim();
		enddate = enddate.trim();
		
		if(!startdate||!enddate){
			alert("날짜를 입력해주세요");
			f.startDate.focus();
			return;
		}else if(startdate.length>10||enddate.length>10){
			alert("날짜를 확인하세요");
			return;
		}else{
			f.action = "<%=cp%>/myOrder.action" ;
			f.submit();
		}
	}

</script>

</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<!-- 마이페이지 우측 메뉴 사이즈 : 900*545 -->
	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">나의 주문 현황</h2>
				
			</div>
		</div>
				<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
				<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<a href="<%=cp%>/myPage.action"><span style="font-size: 18px; color: black; text-decoration: none;">${id }</span></a>
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
							<li><a style="margin-bottom: 15px;">나의 정보</a>
								<ul class="sub_lnb">
									<li><a href="<%=cp%>/myCoupon.action" style="color: #9a9a9;">쿠폰조회</a></li>
									<li><a href="<%=cp%>/myInfo.action">개인정보수정</a></li>
									<li><a href="<%=cp%>/myLeave.action">회원탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- 우측 정보부분 / 주문현황-->
			<div class="float_right">
				<div class="float_conts">
					<!-- 마이페이지 INDEX -->
					<div class="float_title" style="height: 65px;">
						<span style=" font-size: 14pt; font-weight: bold; ">
							나의 주문 현황						
						</span>
					</div>
					<div class="infobox" style="height: 252px; padding: 0;">
						<div class="filter">
							<form action="" method="post" name="myOrderFrom">
							<ul style="overflow: hidden;">
								<li><input type="radio" name="date" onclick="window.location.href='<%=cp%>/myOrder.action?weekTerm=1';"><label>1주일</label></li>
								<li><input type="radio" name="date" onclick="window.location.href='<%=cp%>/myOrder.action?monthTerm=1';"><label>1개월</label></li>
								<li><input type="radio" name="date" onclick="window.location.href='<%=cp%>/myOrder.action?monthTerm=3';"><label>3개월</label></li>
								<li><input type="radio" name="date" onclick="window.location.href='<%=cp%>/myOrder.action?monthTerm=6';"><label>6개월</label></li>
								<li>
									<div class="calendar">
										<div class="input_date">
											<input type="date" style="border: none; text-align: center; color: #9a9a9a" name="startDate">
										</div>
										<div class="input_date">
											<input type="date" style="border: none; text-align: center; color: #9a9a9a" name="endDate">
										</div>
									</div>
								</li>
								<li>
									<button type="button" style="height: 32px; padding: 10px; width: 65px;" onclick="sendIt();">검색</button>
								</li>
							</ul>
							</form>
						</div>
						<table style="width: 100%; height: 100px; margin-top: 10px;">
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
					</div>
					<div class="mypage_orderSateWrapper" >
						<div class="title_content" style="padding: 20px 18px;">
							<!-- [나의 주문 내역 위에서] 선택한 1주일~6개월 혹은 선택한 기간을 표시  -->
							<span style="display: block; font-size: 14pt; font-weight: bold">
							<c:if test="${!empty alldate }">나의 주문 현황</c:if>
							<c:if test="${!empty weekSearch }">지난1주일간 나의 주문 현황</c:if>
							<c:if test="${!empty monthSearch }">지난${monthSearch}개월간 나의 주문 현황</c:if>
							<c:if test="${!empty startd }">${startd }~${endd }사이의 나의 주문 현황</c:if> </span>
						</div>
						<hr style="margin: 0; padding: 0;">
							<table class="mypage_orderSate"> 
								<tr style="width: 100%;">
									<td style="width: 500px;" colspan="2">주문정보</td>
									<td>가격 (수량)</td>
									<td>쿠폰/포인트 내역</td>
									<td>결제 금액</td>
									<td>배송 상태</td>
								</tr>
								
								<!-- 반복문으로 출력 -->
								<c:forEach var="dto" items="${sLists }">
								<tr style="width: 100%;">
									<td style="width: 100px;">
										<img src="/beaudam/resources/image/myPage/hour.jpg" height="80px" width="80px;">
									</td>
									<td style="width: 300px;">
										(${dto.pay_Status }) ${dto.saleDate } | ${dto.sale_Code }<br/>(${dto.color_Code }) ${dto.product_Name }
									</td>
									<td>16,000 원 (${dto.qty }개)</td>
									<td class="bbb">1,600</td>
									<td>14,400 원</td>
									<td>${dto.delivery_Status }</td>
								</tr>
								</c:forEach>
<!-- 								<tr style="width: 100%;">
									<td style="width: 100px;">
										<img src="/beaudam/resources/image/myPage/hour.jpg" height="80px" width="80px;">
									</td>
									<td style="width: 300px;">
										(결제완료) 2018.10.15 | 2018101533524<br/>(bk150624) 머엇진 마스카라
									</td>
									<td>16,000원 (3개)</td>
									<td class="bbb">1,600</td>
									<td>14,400 원</td>
									<td>배송 중</td>
								</tr> -->
							</table>
						</div>
					</div>
				</div>
			</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>