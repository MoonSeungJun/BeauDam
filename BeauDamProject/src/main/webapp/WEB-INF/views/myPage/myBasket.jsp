<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뷰담바구니</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<link href="./resources/css/myPage/myBasket.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	    $("#chk").change(function(){
	    	var lists = new Array();

	    	<c:forEach items="${bList}" var="item">	    		
    			lists.push("${item.basket_Num}");
    		</c:forEach>
	    	
	        if($("#chk").prop("checked")){
	        	$.each(lists, function(idx, val) {
	        		$("#" + val).prop('checked', true);
	  		   });
	        }else{
	        	$.each(lists, function(idx, val) {
	        		$("#" + val).prop('checked', false);
	  		   });
	        }
	    });
	});
	
	function payResult(){
		var sum = 0;
		var lists = new Array();

    	<c:forEach items="${bList}" var="item">
    		sum += rmComma($("#pay" + ${item.basket_Num}).text());
    	</c:forEach>
		$("#payResult").val(addComma(sum));
	}
	
	function checkAmount(num, qty, max){
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		/* 최대범위는 재고갯수로 변경 */
		if($(amountId).val()>max || $(amountId).val()<1){
			alert("재고 수량과 맞지 않습니다.");
			
			/* 기존 사용자가 설정했던 갯수로 초기화 */
			$(amountId).val(qty);
		}
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).val(addComma(amount*price));

		payResult();
	}
	
	function plus(num, max){
		
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		if($(amountId).val()<max)
			$(amountId).val(Number($(amountId).val())+1);
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).text(addComma(amount*price));
		
		payResult();
	}
	
	function minus(num){
		
		var amountId = "#amount" + num;
		var priceId = "#price" + num;
		var payId = "#pay" + num;
		
		if($(amountId).val()>1)
			$(amountId).val(Number($(amountId).val())-1);
		
		var amount = Number($(amountId).val());
		var price = rmComma($(priceId).text());
		
		$(payId).text(addComma(amount*price));
		
		payResult();
	}
	
	function addComma(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function rmComma(str) {
		return parseInt(str.replace(/,/g,""));
	}
	
	function buy(){
		var f = document.myBasketForm;
		var check = false;
		var lists = new Array();

    	<c:forEach items="${bList}" var="item">
    		if($("#${item.basket_Num}").is(":checked")){
    			check = true;
    		}
    	</c:forEach>
    	
    	if(!check){
    		alert("선택된 상품이 없습니다!");
    		return;
    	}
		
		f.action="<%=cp%>/pay.action";
		f.submit();
	}

	function keepShopping() {
		
		var f = document.myBasketForm;
		f.action = "<%=cp%>/main.action";
		f.submit();		
	}
	
	function goMypage() {
		
		var f = document.myBasketForm;
		f.action = "<%=cp%>/myPage.action";
		f.submit();		
	}

	function deleteProduct(basketNum,id) {
		
		$.ajax({
			
			type:'POST',
			url:'deleteBasket.action',
			data: {'basket_Num':basketNum, 'id':id},
			complete: function() {
				
				alert("삭제되었습니다.");
				window.location.href = "/beaudam/myBasket.action";
				
			}		
			
		});	
		
	}
	
	
	function allDeleteChk() {
		
		$.ajax({
			
			type:'POST',
			url:'deleteAllBasket.action',			
			complete: function() {
				
				alert('전체 삭제 되었습니다.');
				window.location.href = "/beaudam/myBasket.action";
			}
			
		});
		
	}
	
	function allBuy() {		
		
		var f = document.myBasketForm;

		var lists = new Array();
		$('#payResult').val(rmComma($('#payResult').val()));
    	<c:forEach items="${bList}" var="item">
    		$("#${item.basket_Num}").prop('checked', true);    		
    	</c:forEach>		
    	
		f.action="<%=cp%>/pay.action";
		f.submit();
		
	}
	
	
	function pay(basket_Num) {
		var f = document.myBasketForm;
		var check = false;
		var lists = new Array();
		
    	<c:forEach items="${bList}" var="item">
    		if(${item.basket_Num} == basket_Num){
    			$("#${item.basket_Num}").prop('checked', true);    			
    		}    		
    	</c:forEach>

		
		f.action="<%=cp%>/pay.action";
		f.submit();
	}
	
</script>

</head>
<body style="font-family: SeoulHangangM">

<form method="post" name="myBasketForm">
	<div id="container">
		<div class="title_style">
			<div class="title_area">
			<a href="<%=cp%>/main.action"
					style="text-decoration: none; color: black; font-family: 'designhouseOTFLight00';"><h3>뷰티를 담다 뷰ː담</h3></a>
				<h2 style="font-family: designhouseOTFLight00">뷰담바구니</h2>
				<p style="font-family: Black Han Sans">My Cart</p>
			</div>
		</div>
		
		<div style="width: 1200px; margin: 0 auto">
			<h3 style="float: left">장바구니 내역</h3>
			<hr style="width: 1200px">
			<button type="button" onclick="allDeleteChk();">전체삭제</button>
		</div>
		
		<br/>
		
		<table style="width: 1200px; margin: 0 auto" >
			<tr bgcolor="#EAEAEA" style="font-weight: bold; height: 30px">
				<td width="10%"><input type="checkbox" id="chk"></td>
				<td colspan="2" width="30%">상품명</td>
				<td width="10%">색상</td>
				<td width="10%">수량</td>
				<td width="15%">판매가</td>
				<td width="15%">주문금액</td>
				<td width="10%">주문</td>
			</tr>
			
			<c:forEach var="dto" items="${bList}">
				<tr>
					<td><input type="checkbox" id="${dto.basket_Num}" name="check" value="${dto.basket_Num }"></td>
					<td width="10%">
						<a href="">
							<img style="margin: 0 auto; width: 100px; height: 100px;" src="<%=cp%>/thumbImg/${dto.thumb_Img }"> 
						</a>
					</td>
					
					<td style="text-align: left;">
						<a href="" style="font-size: 15pt; font-weight: bold; margin-left: 20px;">
							${dto.product_Name }
						</a>
					</td>
					
					<td>${dto.color_Name }</td>
					
					<td>
						<button type="button" onclick="minus(${dto.basket_Num });">-</button>
		          		<input type="text" value="${dto.qty }" id="amount${dto.basket_Num }" name="amount${dto.basket_Num }" onchange="checkAmount(${dto.basket_Num }, ${dto.qty}, ${dto.qty_Max });" style="width: 30px">
		          		<button type="button" onclick="plus(${dto.basket_Num }, ${dto.qty_Max });">+</button>
		          	</td>
		          	
					<td>
						<span id="price${dto.basket_Num }" >
						<script type="text/javascript">
							$("#price${dto.basket_Num }").html(addComma(${dto.product_Price}));
						</script>
						</span> 원
					</td>
					
					<td>
						<span id="pay${dto.basket_Num }" >
						<script type="text/javascript">
							$("#pay${dto.basket_Num }").html(addComma(${dto.product_Price} * ${dto.qty}));
						</script>
						</span> 원
					</td>
					
					<td>
						<button type="button" onclick="pay('${dto.basket_Num}');">바로구매</button>
						<br/><br/>
						<button type="button" onclick="deleteProduct('${dto.basket_Num}','${dto.id }');">삭제</button>
					</td>
				</tr>
				
				<tr height="0.1px" style="background-color: #e6e4e6;"><td colspan="8"></td></tr>
			</c:forEach>
			
		</table>
	
		
		<br/><br/>
		
		<div style="width: 1200px; margin: 0 auto; text-align: center;" align="center">
		
			<hr style="width: 30%">
			<span style="font-size: 19.5pt;">결제금액</span>
			<input type="text" id="payResult" name="payResult" readonly="readonly" style="font-size: 25pt; width: 12%; font-weight: bold;">
				<script type="text/javascript">
					payResult();
				</script>
			<span style="font-size: 19.5pt;">원</span>
			<hr style="width: 30%">
			
			<br/><br/>
			<div style="text-align: center; display: block;">
				<button type="button" style="width: 100px" onclick="buy();">선택주문</button>
				<button type="button" style="width: 100px" onclick="allBuy();">전체주문</button><br/><br/>
				<button type="button" style="float: right; display: block;" onclick="keepShopping();">쇼핑 계속하기</button>
				<button type="button" style="float: right; display: block; margin-right: 10px;" onclick="goMypage();">마이페이지</button>
			</div>
		</div>
	</div>
</form>
</body>
</html>