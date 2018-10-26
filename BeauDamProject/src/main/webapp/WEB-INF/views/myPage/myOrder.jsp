<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/myPage/myPage.css">
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<!-- 마이페이지 우측 메뉴 사이즈 : 900*545 -->
	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">나의 주문 현황</h2>
				<hr style=" border: 0; height: 2px; background-color: gray;">
			</div>
		</div>
		
		<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
				<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<a href="<%=cp%>/myPage.action"><span style="font-size: 18px; color: black;">dohwi9406</span></a>
					</div>
					<a href="<%=cp%>/myInfo.action" class="setting_btn"> 
						<img src="/beaudam/resources/image/myPage/setting.jpg" height="30px" align="bottom">
					</a>
				</div>

				<div class="user_benefit">
					<div class="user_point">
						<div class="title">
							<h3 style="">뷰담 포인트</h3>
						</div>
						<div>
							<p class="point" style="font-size: 40px;">
								0
							</p>
						</div>
					</div>
					<div class="benefit_result">
						<dl>
							<dt style="float: left;">쿠폰</dt>
							<dd>	
								<span style="float: right;" >0</span>
							</dd>
						</dl>
						<dl>
							<dt style="float: left;">등급</dt>
							<dd>	
								<span style="float: right;" >silver</span>
							</dd>
						</dl>
					</div>
				</div>

				<!-- 좌측 메뉴바 -->
				<div class="lnb_menu">
					<nav>	
						<ul>
							<li>
								<a href="<%=cp %>/myOrder.action">나의 주문 현황</a>
							</li>
							<li><a href="" style="margin-bottom: 15px;">나의 정보</a>
								<ul class="sub_lnb">
									<li><a href="<%=cp%>/myCoupon.action" style="color: #9a9a9;">쿠폰조회</a></li>
									<li><a href="#">배송지 관리</a></li>
									<li><a href="<%=cp%>/myEdit.action">개인정보수정</a></li>
									<li><a href="<%=cp%>/myLeave.action">회원탈퇴</a></li>
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
					<div class="float_title" style="height: 65px;">
						<span style=" font-size: 14pt; font-weight: bold; ">
							나의 주문 현황
						</span>
					</div>
					<div class="infobox" style="height: 205px; padding: 0;">
						<div class="filter">
							<ul style="overflow: hidden;">
								<li><input type="radio" name="date"><label>1주일</label></li>
								<li><input type="radio" name="date"><label>1개월</label></li>
								<li><input type="radio" name="date"><label>3개월</label></li>
								<li><input type="radio" name="date"><label>6개월</label></li>
								<li>
									<div class="calendar">
										<div class="input_date">
											<input type="text">
											<button type="submit"><img src="/beaudam/resources/image/myPage/calendar.png"></button>
										</div>
										<div class="input_date">
											<input type="text">
											<button type="submit"><img src="/beaudam/resources/image/myPage/calendar.png"></button>
										</div>
									</div>
								</li>
								<li>
									<button style="height: 32px; padding: 10px; width: 65px;">검색</button>
								</li>
							</ul>
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
									<td rowspan="3">▶</td>
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
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							</table>
					</div>
					</div>
					<div class="mypage_index_conts">
						<div class="title_content" style="padding: 20px 18px;">
							<!-- [나의 주문 내역 위에서] 선택한 1주일~6개월 혹은 선택한 기간을 표시  -->
							<span style="display: block; font-size: 14pt; font-weight: bold">나의 주문 내역 </span>
						</div>
						<hr style="margin: 0; padding: 0;">
						<div class="mypage_index_state div_style col3 possession">
							<div class="mypageWrapper" style="width: 80%; margin: 30px auto 0 auto;">
								<table border="1">
									<!-- 주문내역 표시(TheSaem 주문내역 참조) -->
									<tr>			
										<td colspan="2" style="text-align: center;">
											주문정보
										</td>
										<td>
											가격(수량)
										</td>
										<td>
											쿠폰/포인트 내역
										</td>
										<td>
											결제금액
										</td>
										<td>
											배송상태
										</td>
									</tr>
									
									<!-- 반복문을 통해 출력 -->
										<tr>			
											<td>
												<img src="./resources/image/Sample_Image.jpg" height="135px">
											</td>
											<td>
												(결제완료) 2018.10.15 | 2018101533524<br/>
												(bk150624) 머엇진 마스카라 - bk257
											</td>
											<td>
												16,000원 (3개)
											</td>
											<td>
												1,600 Point
											</td>
											<td>
												14,400 원
											</td>
											<td>
												배송중
											</td>
										</tr>
										<tr>			
											<td>
												상품 이미지
											</td>
											<td>
												(결제상태 -> 꾸미기) 주문날짜 | 주문번호<br/>
												(제품번호) 제품명-색상
											</td>
											<td>
												가격(수량)
											</td>
											<td>
												쿠폰/포인트 내역
											</td>
											<td>
												최종결제금액
											</td>
											<td>
												배송상태
											</td>
										</tr>
									<!-- 출력 -->
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>