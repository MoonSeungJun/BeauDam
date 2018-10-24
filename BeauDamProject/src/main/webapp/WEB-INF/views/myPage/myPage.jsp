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
<link rel="stylesheet" href="./resources/css/myPage/aaa.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#1").click(function(){
        $.ajax({url: "./myOrder.action", success: function(result){
            $("#float_right").html(result);
        }});
    });
});
</script>
</head>
<body>
	<jsp:include page="../beaudam/mainTop.jsp" />
	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">마이뷰담</h2>
				<hr style=" border: 0; height: 2px; background-color: gray;">
			</div>
		</div>
		
		<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
				<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<span style="font-size: 18px;">dohwi9406</span>
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
								<span style="float: right;" >sliver</span>
							</dd>
						</dl>
					</div>
				</div>

				<!-- 좌측 메뉴바 -->
				<div class="lnb_menu">
					<nav>	
						<ul>
							<li>
								<a href="#" id="1">나의 주문 현황</a>
							</li>
							<li><a href="" style="margin-bottom: 15px;">나의 정보</a>
								<ul class="sub_lnb">
									<li><a href="<%=cp%>/myCoupon.action" style="color: #9a9a9;">쿠폰조회</a></li>
									<li><a href="/page/mythesaem/member/address">배송지 관리</a></li>
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
						<span style="display: block; font-size: 14pt; font-weight: bold; ">
							나의 주문 현황 </span>
					</div>
					<div class="infobox" style="height: 205px;">
						<table border="1" style="width: 100%; height: 100px;">
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
							<span style="display: block; font-size: 14pt; font-weight: bold">나의 보유 현황 </span>
						</div>
						<hr style="margin: 0; padding: 0;">
						<div class="mypage_index_state div_style col3 possession">
							<div class="mypageWrapper" style="width: 80%; margin: 30px auto 0 auto;">
								<dl>
									<dt>포인트</dt>
									<dd class="point">0</dd>
								</dl>
								<dl>
									<dt>쿠폰</dt>
									<dd>0</dd>
								</dl>
								<dl>
									<dt>등급</dt>
									<dd>Sliver</dd>
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