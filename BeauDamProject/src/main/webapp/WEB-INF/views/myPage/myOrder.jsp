<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">

		<tr>
			<td>주문 현황</td>
			<td>취소/반품/교환 현황</td>
		</tr>

		<tr>
			<td colspan="2">
				
				<input type="button" value="1주일">&nbsp;
				<input type="button" value="1개월">&nbsp;
				<input type="button" value="3개월">&nbsp;
				<input type="button" value="6개월">&nbsp;&nbsp;
				
				<!-- 버튼눌러서 나온 달력에서 원하는 날짜를 찍으면 value값으로 입력 -->
				<input type="button" value="2018.10.01">&nbsp;-&nbsp;
				<input type="button" value="2018.10.15">
			
			</td>
		</tr>

		<tr>
			<td colspan="2">
				
				<input type="button" value="All">&nbsp;-&nbsp;
				<input type="button" value="입금대기">&nbsp;-&nbsp;
				<input type="button" value="결제완료">&nbsp;-&nbsp;
				<input type="button" value="배송준비중">&nbsp;-&nbsp;
				<input type="button" value="배송중">&nbsp;-&nbsp;
				<input type="button" value="배송완료">
				
			</td>
		</tr>

		<tr>
			<!-- *는 위에서 선택한 1주일~6개월 혹은 선택한 기간을 표시  -->
			<td colspan="2">* 주문 내역</td>
		</tr>

		<tr>
			<td colspan="2">
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
			</td>
		</tr>
				
		<tr height="50px">
			<td colspan="2"></td>
		</tr>

	</table>

</body>
</html>