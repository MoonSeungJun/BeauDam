<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#val").hide();
		
		$("#msg").change(function(){
			if($("#msg").val()==4){
				$("#val").show();
				$("#msg").css("width", "17%");
			} else {
				$("#val").hide();
				$("#msg").css("width", "48%");
			}
		});
		
		$("#totalPrice").change(function(){
			if(rmComma($("#totalPrice").text())>50000){
				$("#shipping").text(0);
			} else {
				$("#shipping").text("2,500");
			}
		});
		
		$("#coupon").change(function(){
			if($("#coupon").val()!=1){
				$("#point").attr("readonly", true);
				var totalPrice;
				
				if($("#coupon").val()=="coupon1"){
					totalPrice = Number(rmComma($("#totalPrice").text()))*0.1;
					$("#discount").text(addComma(totalPrice));
				}else if($("#coupon").val()=="coupon2"){
					totalPrice = Number(rmComma($("#totalPrice").text()))*0.2;
					$("#discount").text(addComma(totalPrice));
				}
				
				$("#point").val(0);
			} else {
				$("#point").attr("readonly", false);
				$("#discount").text("0");
			}
			
			var pay = rmComma($("#totalPrice").text()) + rmComma($("#shipping").text()) - rmComma($("#discount").text());
			$("#pay").text(addComma(pay));
		});
		
		$("#point").change(function(){
			var point = Number($("#point").val());
			$("#coupon").prop("disabled", true);
			
			if(point != 0){				
				if(point>0 && point<=11809){
					$("#point").val(addComma(point));
					$("#discount").text(addComma(point));
				} else {
					point=11809;
					$("#point").val(addComma(point));
					$("#discount").text(addComma(point));
				}
			} else {
				$("#coupon").prop("disabled", false);
				$("#discount").text("0");
			}
			
			var pay = rmComma($("#totalPrice").text()) + rmComma($("#shipping").text()) - rmComma($("#discount").text());
			$("#pay").text(addComma(pay));
		});
	});
	
	function addComma(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function rmComma(str) {
		return parseInt(str.replace(/,/g,""));
	}

</script>

</head>


<body>
	
	<br><br>
	<table align="center" style="width: 650px;">
		<tr>
			<td style="border-bottom-width: 2px; border-bottom-style: solid;border-bottom-color: black; ">
				구매목록
			</td>
		</tr>	
	</table>
	
	<table align="center" cellspacing="0" style="width: 650px; height:auto;" border="1" class="mytable">
		<tr align="center">
			<td>이미지</td>
		
			<td>브랜드</td>
			
			<td>제품이름</td>
			
			<td>가격</td>
			
			<td>갯수</td>
			
			<td>총가격</td>
		</tr>
		
		<tr align="center">
			<td>
				<img alt="image" src="<%=cp %>/join/img/chan.jpg">
			</td>
		
			<td>에뛰드</td>
			
			<td>산호초립밤</td>
			
			<td>3,500원</td>
			
			<td>3</td>
			
			<td>10,500원</td>
		</tr>
		

	</table>
	
	<br><br>
	
	<table align="center" style="width: 650px;">
		<tr>
			<td style="border-bottom-width: 2px; border-bottom-style: solid;border-bottom-color: black; ">
				할인 및 포인트
			</td>
		</tr>
	</table>
	
	<table align="center" style="width: 650px;">
		<tr>
			<td>쿠폰</td>
			
			<td>
				<div>
			 		<select id="coupon" style="width: 15%">
			 			<option value="1" selected="selected">선택</option>
			 			
			 			<!-- jstl로 쿠폰 나열 -->
			 			<option value="coupon1">10% 할인</option>
			 			<option value="coupon2">20% 할인</option>
			 		</select> (사용가능 쿠폰 : 2장)
		 		</div>
			</td>
		</tr>
		
		<tr>
			<td>포인트</td>
			
			<td>
				<input type="text" value="0" id="point" style="width: 70px"> Point (사용가능 포인트 : 11,809 Point)
			</td>
		</tr>
	</table>
	
	<br><br>
	
	<table style="width: 650px;" cellspacing="0" align="center" border="1" class="mytable">
		<tr>
			<td colspan="2">배송정보</td>
		</tr>
		
		<tr>	
			<td>받는사람</td>
				
			<td>서영진</td>
		</tr>
		
		<tr>	
			<td>주소</td>
				
			<td>인천시 계양구 만양로 210-11 로앙블루 101동 2222호</td>
		</tr>
		
		<tr>	
			<td>연락처</td>
			
			<td>010-3301-0881/032-313-3111</td>
		</tr>
		
		<tr>	
			<td>배송메시지</td>
			
			<td>
				<select id="msg" style="width: 48%;">
					<option value="1" selected="selected">배송 전에 미리 연락바랍니다.</option>
					<option value="2">부재시 경비실에 맡겨주세요.</option>
					<option value="3">부재시 전화 주시거나 문자 남겨 주세요.</option>
					<option value="4">직접입력</option>
				</select>
				<input type="text" id="val" value="">
			</td>
		</tr>
		
	</table>
	
	<br><br>
	
	<table cellspacing="0" style="width: 650px;" height="350px;" align="center" border="1" class="mytable">
		<tr style="height: 50px" align="center">
			<td style="width: 80%;">결제정보</td>
			
			<td>결제금액</td>
		</tr>
		
		<tr align="center">
			<td style="height: 200px;">결제 수단 입력칸</td>
			
			<td rowspan="2">				
				<table width="100%" border="0" style="font-size: 7pt; border: none;">
					<tr>
						<td colspan="2"><span id="pay" style="font-size: 20pt;">13,000</span><span style="font-size: 15pt;">원</span></td>
					</tr>
					
					<tr height="0.1px" style="background-color: black;"><td colspan="2"></td></tr>
					
					<tr>
						<td width="50%">총 상품금액</td>
						<td width="50%" style="text-align: right;"><span id="totalPrice">100,500</span>원</td>
					</tr>

					<tr>
						<td>배송비</td>
						<td style="text-align: right;">(+) <span id="shipping">2,500</span>원</td>
					</tr>
					
					<tr>
						<td>할인금액</td>
						<td style="text-align: right;">(-) <span id="discount">0</span>원</td>
					</tr>
				</table>
				
			</td>
		</tr>
		
		<tr>
			<td>
				<font size="2px">
				<b>전자상거래 등에서의 소비자보호에 관한 법률에 따른 구매안전 서비스 이용안내</b><br><br>
				옥션의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이<br>
				모든 거래에 대하여 ㈜뷰담의 구매안전서비스(에스크로)를 적용하고 있습니다.<br>
				㈜뷰담의 전자금융거래법에 따른 결제대금예치업 등록번호는 02-006-00008입니다.<br>
				등록여부는 금융감독원 홈페이지(www.fss.or.kr)<br/>
				"업무자료>인허가업무안내>전자금융업등록현황"에서 확인하실 수 있습니다.
				</font>
			</td>
		</tr>
		
		<tr height="70px">
			<td colspan="2" align="center">
				<input type="button" value="결제하기" style="width: 30%; height: 30px;">
			</td>
		</tr>
		
	</table>
	
</body>
</html>