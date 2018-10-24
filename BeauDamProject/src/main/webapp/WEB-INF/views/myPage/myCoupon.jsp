<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../beaudam/mainTop.jsp"/>
	<table border="1" style="margin: 0 auto; background-color: aqua;">
		<tr>
			<td colspan="4">쿠폰조회</td>
		</tr>
		<tr>
			<td width="20%">
				<img src="./resources/image/coupon.jpg" height="100px">
			</td>
			<td width="30%">
				사용가능 쿠폰<br/>
				<b style="font-size: 30pt; color: red;">2</b>장
			</td>
			
			<td width="20%">
				<img src="./resources/image/coupon.jpg" height="100px">
			</td>
			<td width="30%">
				7일 이내 소멸 쿠폰 쿠폰<br/>
				<b style="font-size: 30pt; color: red;">1</b>장
			</td>
		</tr>
		<tr>
			<td colspan="4">쿠폰 내역</td>
		</tr>
		<tr>
			<td colspan="4">
				<table border="1">
					<tr>
						<td>발행날짜</td>
						<td>상태</td>
						<td>쿠폰명</td>
						<td>사용기간</td>
						<td>할인율</td>
					</tr>
					
					<!-- 반복문으로 출력 -->
					<tr>
						<td>2018.10.15</td>
						<td>사용가능</td>
						<td>가입환영쿠폰</td>
						<td>2018.10.15~2018.10.29</td>
						<td>10%</td>
					</tr>
					
					<tr>
						<td>2018.10.20</td>
						<td>사용가능</td>
						<td>회원감사쿠폰</td>
						<td>2018.10.20~2018.10.27</td>
						<td>20%</td>
					</tr>
					<!-- 출력 -->
					<tr>
						<td colspan="5" style="background-color: #e6e4e6;">
						<b>유의사항</b><br/>
						* 쿠폰의 발급 및 사용은 더샘 사이트 회원 구매 시에만 적용됩니다.<br/>
						* 브랜드데이 기간 할인 적용 시 쿠폰 사용은 안되며 사은품은 지급되지 않습니다.<br/>
						* 한 주문, 한 품목에 대해서만 사용 가능합니다.<br/>
						* 한 품목에 대해 2장 이상의 쿠폰을 중복 사용하실 수 없습니다.<br/>
						* 쿠폰 사용 후 쿠폰 잔액에 대해서는 환불이 불가하며 잔액은 자동 소멸됩니다.<br/>
						* 쿠폰을 사용하여 주문결제한 건에 대해 취소/교환/반품 시 쿠폰은 재발급되지 않으며, 구매 시 사용한 쿠폰금액에 대해서도 환불되지 않습니다.<br/>
						* 쿠폰은 발급 후 사용 기간 내에서만 사용이 가능하며 기간 내 사용하지 않으면 자동 소멸됩니다.<br/>
						* 쿠폰 특성에 따라 금액, 상품 별로 사용이 제한될 수 있습니다.<br/>
						* 쿠폰은 현금화되지 않습니다.<br/>
						* 배송료와 기타 상품은 쿠폰으로 결제하실 수 없습니다.<br/>
						* 쿠폰은 타인 양도가 불가능합니다.<br/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>