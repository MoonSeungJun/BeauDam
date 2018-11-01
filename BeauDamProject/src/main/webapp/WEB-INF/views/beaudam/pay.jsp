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
		$("#point").val(0);
		$("#msg").change(function(){
			if($("#msg").val()==4){
				$("#val").show();
				$("#msg").css("width", "17%");
			} else {
				$("#val").hide();
				$("#msg").css("width", "48%");
			}
		});
		setShippingPrice();
		setTotalPrice();			
		setPayResult();
		
		$("#totalPrice").change(function(){
			setShippingPrice();
		});
		
		$("#coupon").change(function(){
			if($("#coupon").val()!=1){
				$("#point").attr("readonly", true);
				var totalPrice = 0;
				var val = $("#coupon").val().substring(0, 3);
				
				if(val=="10%"){
					totalPrice = Number(rmComma($("#totalPrice").text()))*0.1;
					$("#discount").text(addComma(totalPrice));
				}else if(val=="20%"){
					totalPrice = Number(rmComma($("#totalPrice").text()))*0.2;
					$("#discount").text(addComma(totalPrice));
				}
		
				$("#point").val(0);
			} else {
				$("#point").attr("readonly", false);
				$("#discount").text("0");
			}
			
			setTotalPrice();			
			setPayResult();
		});
		
		$("#point").change(function(){
			var point = Number($("#point").val());
			var payResult = Number(rmComma($("#totalPrice").text())) + Number(rmComma($("#shipping").text()))
			$("#coupon").prop("disabled", true);

			if(point > payResult){				
				point = payResult; 				
				$("#point").val(addComma(point));
				$("#discount").text(addComma(point));								
					
			}
			
			
			if(point != 0){
				if(${member.point}==0){
					point=${member.point};
					$("#point").val(addComma(point));
					$("#coupon").prop("disabled", false);
				} else if(point>0 && point<=${member.point}) {
					$("#point").val(addComma(point));
					$("#discount").text(addComma(point));
				}else if(point > payResult){
					point = payResult;
					$("#point").val(addComma(point));
					$("#discount").text(addComma(point));
				}else {
					point=${member.point};
					$("#point").val(addComma(point));
					$("#discount").text(addComma(point));
				}	
				
				
				
				
			} else {
				$("#coupon").prop("disabled", false);
				$("#discount").text("0");
			}
			
			
			setTotalPrice();
			setPayResult();
		
			
		});
	});
	
	function setTotalPrice(){
		var lists = new Array();
		var sum = 0;

    	<c:forEach items="${buyLists}" var="item">
    		lists.push("${item.basket_Num}");
    	</c:forEach>
		
    	$.each(lists, function(idx, val) {
   			sum += rmComma($("#pay" + val).text());
		});
    	
    	$("#totalPrice").text(addComma(sum));
	}
	
	function setShippingPrice(){
		if(rmComma($("#totalPrice").text())>50000){
			$("#shipping").text("0");
		} else {
			$("#shipping").text("2,500");
		}
	}
	
	function setPayResult(){	
		
		var pay = Number(rmComma($("#totalPrice").text())) + Number(rmComma($("#shipping").text())) - Number(rmComma($("#discount").text()));
		$("#payResult").val(addComma(pay));
		
		setShippingPrice();
	}
	
	function addComma(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function rmComma(str) {
		
		if(str=="")
			return 0;
		
		return parseInt(str.replace(/,/g,""));
	}

	
	function buying() {
		
		var f = document.payForm;	
		
		var payResult = Number(rmComma($("#totalPrice").text())) + Number(rmComma($("#shipping").text())) - Number(rmComma($("#discount").text()));
		
		var payType = $(":input:radio[name=payType]:checked").val();
		var useCoupon = $('#coupon option:selected').val().substr(3);		
// 		alert(useCoupon);
		var p = $("#point").val();
		var point = Number(rmComma(p));
		
		var id = '${member.id}';
		var lists = new Array();		
		<c:forEach items="${buyLists}" var="item">
			lists.push("${item.basket_Num}");
		</c:forEach>
		var msg;
		
		var qty = new Array();		
		<c:forEach items="${buyLists}" var="item">
			qty.push("${item.qty}");			
		</c:forEach>
		
		if($('#msg').val() == 1){
			msg = '배송 전에 미리 연락바랍니다.'
		}else if($('#msg').val() ==2){
			msg = '부재시 경비실에 맡겨주세요.';
		}else if($('#msg').val()==3){
			msg='부재시 전화 주시거나 문자 남겨 주세요.';
		}else{
			msg = $('#val').val();
		}
		
		var code = new Array();		
		<c:forEach items="${buyLists}" var="item">
			code.push("${item.code}");			
		</c:forEach>
	   	var params = {'payResult':payResult, 'payType':payType, 'id':id, 'lists':lists, 'msg':msg, 'code':code, 'coupon':useCoupon, 'point':point,'qty':qty};		
		
	    var method = method || "post";	    
	    var form = document.createElement("form");
	    
	    form.setAttribute("method", method);
	    form.setAttribute("action", 'iampay.action');

	    for(var key in params) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", params[key]);
	        form.appendChild(hiddenField);
// 	        alert(params[key]);
	    }
	    document.body.appendChild(form);
	    form.submit();
		
		
	}
	
	
</script>

</head>


<body>
	
	<br><br>
	<table align="center" style="width: 1200px;">
		<tr>
			<td style="border-bottom-width: 2px; border-bottom-style: solid;border-bottom-color: black; ">
				구매목록
			</td>
		</tr>	
	</table>
	
	<form action="iampay.action" method="post" name="payForm">
	
	<table align="center" cellspacing="0" style="width: 1200px; height:auto;" border="1" class="mytable">
		<tr align="center">
			<td>이미지</td>
		
			<td>브랜드</td>
			
			<td>제품이름</td>
			
			<td>가격</td>
			
			<td>갯수</td>
			
			<td>총가격</td>
		</tr>
		
		<c:forEach var="dto" items="${buyLists }">
			<tr align="center">
				<td width="15%">
					<img style="margin: 0 auto; width: 100px; height: 100px;" src="<%=cp%>/thumbImg/${dto.thumb_Img }">
				</td>
			
				<td>${dto.brand }</td>
				
				<td>${dto.product_Name }</td>
				
				<td>
					<span id="price${dto.basket_Num }" >
					<script type="text/javascript">
						$("#price${dto.basket_Num }").html(addComma(${dto.product_Price}));
					</script>
					</span> 원
				</td>
				
				<td>${dto.qty }</td>
				
				<td>
					<span id="pay${dto.basket_Num }" >
					<script type="text/javascript">
						$("#pay${dto.basket_Num }").html(addComma(${dto.product_Price} * ${dto.qty}));
					</script>
					</span> 원
				</td>
			</tr>
		</c:forEach>
		

	</table>
	
	<br><br>
	
	<table align="center" style="width: 1200px;">
		<tr>
			<td style="border-bottom-width: 2px; border-bottom-style: solid;border-bottom-color: black; ">
				할인 및 포인트
			</td>
		</tr>
	</table>
	
	<table align="center" style="width: 1200px;">
		<tr>
			<td>쿠폰</td>
			
			<td>
				<div>
			 		<select id="coupon" style="width: 15%">
			 			<option value="1" selected="selected">선택</option>
			 			
			 			<!-- jstl로 쿠폰 나열 -->
			 			<c:forEach var="dto" items="${couponLists }">
			 				<option value="${dto.coupon }${dto.num}">${dto.coupon } 할인</option>
			 			</c:forEach>
			 		</select> (사용가능 쿠폰 : ${couponCount }장)
			 		<input type="hidden" id="couponNum" name="couponNum" value="">
		 		</div>
			</td>
		</tr>
		
		<tr>
			<td>포인트</td>
			
			<td>
				<input type="text" value="" id="point" style="width: 70px"> Point 
				(사용가능 포인트 : 
					<span id="usepoint" >
					<script type="text/javascript">
						$("#usepoint").html(addComma(${member.point}));
					</script>
					</span> 
				Point)
			</td>
		</tr>
	</table>
	
	<br><br>
	
	<table style="width: 1200px;" cellspacing="0" align="center" border="1" class="mytable">
		<tr>
			<td colspan="2">배송정보</td>
		</tr>
		
		<tr>	
			<td>받는사람</td>
				
			<td>${member.name }</td>
		</tr>
		
		<tr>	
			<td>주소</td>
				
			<td>${member.zip } ${member.city } ${member.street }</td>
		</tr>
		
		<tr>	
			<td>연락처</td>
			
			<td>${member.cellphone }/${member.tel }</td>
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
	
	<table cellspacing="0" style="width: 1200px;" height="350px;" align="center" border="1" class="mytable">
		<tr style="height: 50px" align="center">
			<td style="width: 75%;">결제정보</td>
			
			<td>결제금액</td>
		</tr>
		
		<tr align="center">
			<td style="height: 200px;">
				<input type="radio" name="payType" value="vbank">무통장 입금
				<input type="radio" name="payType" value="card">카드 결제
				<input type="radio" name="payType" value="trans">실시간 계좌이체
			</td>
			
			<td rowspan="2" valign="top">
				<table width="80%" style="font-size: 9pt; margin-top: 10px; margin-left: 10px; margin-right: 10px;">
					<tr>
						<td colspan="2">
							<input type="text" id="payResult" value="" style="width: 80%; text-align: center; font-size: 27pt; border: none;" readonly="readonly">
							<span style="font-size: 20pt;">원</span>
						</td>
					</tr>
					
					<tr height="0.1px" style="background-color: black;"><td colspan="2"></td></tr>
					
					<tr>
						<td width="50%">총 상품금액</td>
						<td width="50%" style="text-align: right;"><span id="totalPrice">
						<script type="text/javascript">
							setTotalPrice();
							setPayResult();
						</script>
						</span>원</td>
					</tr>

					<tr>
						<td>배송비</td>
						<td style="text-align: right;">(+) 
							<span id="shipping">
							<script type="text/javascript">
								setShippingPrice();
							</script>
							</span>원
						</td>
					</tr>
					
					<tr>
						<td>할인금액</td>
						<td style="text-align: right;">(-) <span id="discount">0</span>원</td>
					</tr>
				</table>
				
			</td>
		</tr>
		
		<tr>
			<td style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
				<font size="2px">
				<b>전자상거래 등에서의 소비자보호에 관한 법률에 따른 구매안전 서비스 이용안내</b><br><br>
				옥션의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이
				모든 거래에 대하여 ㈜뷰담의 구매안전서비스(에스크로)를 적용하고 있습니다.<br>
				㈜뷰담의 전자금융거래법에 따른 결제대금예치업 등록번호는 02-006-00008입니다.<br>
				등록여부는 금융감독원 홈페이지(www.fss.or.kr)
				"업무자료>인허가업무안내>전자금융업등록현황"에서 확인하실 수 있습니다.
				</font>
			</td>
		</tr>
		
		<tr height="70px">
			<td colspan="2" align="center">				
				<input type="button" value="결제하기" onclick="buying();" style="width: 30%; height: 30px;">
			</td>
		</tr>
		
	</table>
	
	</form>
	
</body>
</html>