<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/myPage/myPage.css">
<link rel="stylesheet" href="./resources/css/myPage/myOrder.css">
</head>
<script type="text/javascript">
function leave() {
	
	f = document.myLeave;
	var result = confirm("정말로 탈퇴하시겠습니까?");
	
	if(result) {
		alert("탈퇴 되었습니다.");
		f.action = "<%=cp%>/main.action";
	}
	else {
		alert("탈퇴 취소되었습니다.");	
		f.action = "<%=cp%>/myLeave.action";
	}
	
	f.submit();
	
}


</script>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<!-- 마이페이지 우측 메뉴 사이즈 : 900*545 -->
	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: 'designhouseOTFLight00'; font-weight: normal;">회원 탈퇴</h2>
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
							회원 탈퇴
						</span>
					</div>
					<hr style="margin: 0; padding: 0;">
					<div class="leave_wrapper">
						<form action="" name="myLeave">
							<div class="leave1">
								<h4>회원탈퇴</h4>
								<p>
									고객님께서 회원탈퇴를 원하시다니 저희 뷰담 서비스가 많이 부족하고 미흡했나 봅니다.<br/> 
									불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br/> 
									아울러 회원탈퇴 시 아래 사항을 숙지해 주시기 바랍니다.
								</p>
							</div>
							<div class="leave2" >
								<h4>유의사항</h4>
								<p>
									*회원탈퇴를 하시면 보유하고 계신 포인트는 자동 소멸됩니다.<br/>
									*회원탈퇴는 온라인/오프라인 통합 탈퇴이므로 추후 멤버쉽카드 사용이 불가능합니다.<br/>
									*회원탈퇴시 고객님께서 보유하셨던 포인트 등은 모두 삭제되며 모든 내역, 구매 정보, 기타 활동 정보는 바로 삭제됩니다.<br/> 
									 (단, 해킹 및 본인의 의사와 상관없이 이뤄진 탈퇴는 고객센터로 문의해 주시기 바랍니다.)<br/>
									*이벤트 참여는 탈퇴 이후 자동 탈락을 기본으로 하며 이전 당첨에 있어서는 경품 발송이 진행됩니다.<br/>
									*회원탈퇴 시에는 탈퇴 일 이후 15일 동안 재가입이 불가능합니다.<br/>
									*회원탈퇴 후 재가입은 가능하지만 한 번 탈퇴한 아이디는 다시 사용하실 수 없습니다.
								</p>
							</div>
							<div class="leave3" >
								<h4>본인확인</h4>
								<table>
									<tr>
										<td style="padding: 10px;">아이디</td>
										<td style="padding: 10px; text-align: left;">${id }</td>
									</tr>
									<tr>
										<td style="padding: 10px;">비밀번호</td>
										<td style="padding: 10px;">
											<input type="password">
										</td>
										<td>
											<button onclick="leave();" style="padding: 3px;">탈퇴하기</button>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>