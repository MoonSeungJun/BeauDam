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
<title>뷰담바구니</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<style type="text/css">
@font-face { 
	font-family: 'designhouseOTFLight00'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/designhouseOTFLight00.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; }
	
@font-face { 
	font-family: 'SeoulHangangM'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulHangangM.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; }
		
#container {
    padding-bottom: 80px;
}

.title_style {
    overflow: hidden;
    text-align: center;
    height: 200px;
}

.title_style h2 {
    font-size: 60px;
    font-weight: 100;
    letter-spacing: -3px;
    line-height: 60px;
    margin-top: 26px;
    margin-bottom: 16px;
    height: 60px;
}

.title_area {
    margin: 0 auto;
    width: 1200px;
}

td
{
	text-align: center;
}

input
{
	text-align: center;
	font-family: SeoulHangangM;
	font-size: 12.37pt;
	border-style: none;
	width: 70px
}

a{
	text-decoration: none;
	color: black;
}

a:hover{
	text-decoration: underline;
}

button {
	height: 40px;
	font-family: SeoulHangangM;
	font-size: 12pt;
	border-style: none;
	font-weight: bold;
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	    $("#chk").change(function(){
	        if($("#chk").prop("checked")){
	        	$("#chk1").prop('checked', true);
	        	$("#chk2").prop('checked', true);
	        }else{
	        	$("#chk1").prop('checked', false);
	        	$("#chk2").prop('checked', false);
	        }
	    });
	});
	
	function checkAmount(num){
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		/* 최대범위는 재고갯수로 변경 */
		if($(amountId).val()>99 || $(amountId).val()<1){
			alert("범위 초과!");
			
			/* 기존 사용자가 설정했던 갯수로 초기화 */
			$(amountId).val(1);
		}
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).val(addComma(amount*price));
		
		var sum = 0;
		/* $.each(function (index, item){
			sum += rmComma($("#pay" + item.sales_code).val());
		}); */
		
		sum = rmComma($("#pay1").val()) + rmComma($("#pay2").val());
		$("#payResult").val(addComma(sum));
	}
	
	function plus(num){
		
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		/* 최대범위는 재고갯수로 변경 */
		if($(amountId).val()<99)
			$(amountId).val(Number($(amountId).val())+1);
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).val(addComma(amount*price));
		
		var sum = 0;
		/* $.each(function (index, item){
			sum += rmComma($("#pay" + item.sales_code).val());
		}); */
		
		sum = rmComma($("#pay1").val()) + rmComma($("#pay2").val());
		$("#payResult").val(addComma(sum));
			
	}
	
	function minus(num){
		
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		if($(amountId).val()>1)
			$(amountId).val(Number($(amountId).val())-1);
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).val(addCommas(amount*price));
		
		var sum = 0;
		/* $.each(function (index, item){
			sum += rmComma($("#pay" + item.sales_code).val());
		}); */
		
		sum = rmComma($("#pay1").val()) + rmComma($("#pay2").val());
		$("#payResult").val(addComma(sum));
				
	}
	
	function addComma(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function rmComma(str) {
		return parseInt(str.replace(/,/g,""));
	}

	function buy(){
		var root = document.productForm;
		
		
		
		root.action = "<%=cp%>/pay.action";
		root.submit();
	}

</script>

</head>
<body style="font-family: SeoulHangangM">

<!-- id 뒤에 붙는 숫자는 sale_code 입력 -->

<form method="post" name="productForm">

	<div id="container">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: designhouseOTFLight00">뷰담바구니</h2>
				<p style="font-family: Black Han Sans">My Cart</p>
			</div>
		</div>
		
		<div style="width: 1200px; margin: 0 auto">
			<h3 style="float: left">장바구니 내역</h3>
			<hr style="width: 1200px">
			<button type="button">삭제</button>
		</div>
		
		<br/>
			
		<table style="width: 1200px; margin: 0 auto" >
			<tr bgcolor="#EAEAEA" style="font-weight: bold; height: 30px">
				<td><input type="checkbox" id="chk"></td>
				<td></td>
				<td>상품명/옵션명</td>
				<td>수량</td>
				<td>판매가</td>
				<td>주문금액</td>
				
				<td>주문</td>
			</tr>
			
			<tr>
				<td><input type="checkbox" id="chk1" name="chk1"></td>
				<td>
					<a href="">
						<img style="margin: 0 auto; width: 100px; height: 100px;" src="http://www.thesaemcosmetic.com/view/attach/product/17211/list"> 
					</a>
				</td>
				
				<td>
					<a href="">피토 세븐 클렌징 오일 크림</a>
					<input type="hidden" name="saleCode" value="1">
					<input type="hidden" name="productNum" value="123">
				</td>
				<td>
					<button type="button" onclick="minus(1);">-</button>
	          		<input type="text" value="1" id="amount1" name="amount1" onchange="checkAmount(1);" style="width: 30px">
	          		<button type="button" onclick="plus(1);">+</button>
	          	</td>
				<td>
					<span id="price1" >
					<script type="text/javascript">
						$("#price1").html(addComma(16000));
					</script>
					</span> 원
				</td>
				<td>
					<input type="text" id="pay1" readonly="readonly">원
					<script type="text/javascript">
						$("#pay" + 1).val(addComma(16000));
					</script>
				</td>
				
				<td>
					<button type="button" onclick="pay();">바로구매</button>
					<br/><br/>
					<button type="button">삭제</button>
				</td>
			</tr>
			
			<tr height="0.1px" style="background-color: #e6e4e6;"><td colspan="7"></td></tr>
			
			<tr>
				<td><input type="checkbox" id="chk2" name="chk2"></td>
				<td>
					<a href="">
						<img style="margin: 0 auto; width: 100px; height: 100px;" src="http://www.thesaemcosmetic.com/view/attach/product/17444/detail/1">
					</a>
				</td>
				<td>
					<a href="">어반 에코 하라케케 크림</a>
					<input type="hidden" name="saleCode" value="2">
					<input type="hidden" name="productNum" value="777">
				</td>
				<td>
					<button type="button" onclick="minus(2);">-</button>
	          		<input type="text" value="1" id="amount2" name="amount2" onchange="checkAmount(2);" style="width: 30px">
	          		<button type="button" onclick="plus(2);">+</button>
	          	</td>
				<td>
					<span id="price2" >
					<script type="text/javascript">
						$("#price2").html(addComma(17000));
					</script>
					</span> 원
				</td>
				<td>
					<input type="text" id="pay2" readonly="readonly">원
					<script type="text/javascript">
						$("#pay" + 2).val(addComma(17000));
					</script>
				</td>
				
				<td>
					<button type="button" onclick="buy();">바로주문</button>
					<br/><br/>
					<button type="button">삭제</button>
				</td>
			</tr>
			
			<tr height="0.1px" style="background-color: #e6e4e6;"><td colspan="7"></td></tr>
			
		</table>
		
		<br/><br/>
		
		<div style="width: 1200px; margin: 0 auto; text-align: center;" align="center">
		
			<hr style="width: 30%">
			<span style="font-size: 19.5pt;">결제금액</span>
			<input type="text" id="payResult" readonly="readonly" style="font-size: 25pt; width: 12%; font-weight: bold;">
				<script type="text/javascript">
					$("#payResult").val(addComma(33000));
				</script>
			<span style="font-size: 19.5pt;">원</span>
			<hr style="width: 30%">
			
			<br/><br/>
			<div style="text-align: center; display: block;">
				<button type="button" style="width: 100px" onclick="buy();">선택주문</button>
				
				<button type="button" style="width: 100px">전체주문</button><br/><br/>
				<button type="button" style="float: right; display: block;">쇼핑 계속하기</button>
			</div>
		</div>
	</div>

</form>

</body>
</html>