<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeauDam Admin</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	function orderUpdate(code) {		
		
		var delState = $('#delivery_Status option:selected').val();
		var payState = $('#pay_Status option:selected').val();
		var sale_Code = code;	
		alert(payState +"  " +delState + "  " +  sale_Code);
		$.ajax({
			
			type:'post',
			data: {'delState':delState,'payState':payState,'sale_Code':sale_Code},
			url: '/beaudam/adminOrder.action',
			success: function() {
				alert('변경 되었습니다.');
				window.location.href = "/beaudam/adminOrder.action";
			},
			error: function() {
				
			}		
			
		});		
		
	}
	
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div class="wrapper">
<h2 class="text-center">주문 조회</h2>
<hr>
	<form action="" name="adminOrderForm" method="post">
		<table border="1" style="margin: 0 auto; text-align: center;">
			<tr>
				<td class="title">입금대기</td>
				<td class="title">결제완료</td>
				<td class="title">상품준비중</td>
				<td class="title">배송중</td>
				<td class="title">배송완료</td>
				<td class="title">환불</td>
				<td class="title">교환</td>
				<td class="title">취소</td>
			</tr>
			<tr>
				<td>${payReady }</td>
				<td>${payCompl }</td>
				<td>${ready }</td>
				<td>${ing }</td>
				<td>${compl }</td>
				<td>${refund }</td>
				<td>${change }</td>
				<td>${cancel }</td>				
			</tr>
		</table>
		<br><br>
		<table border="1" style="margin: 0 auto;">
			<tr>
				<td class="title">이름</td>
				<td>
					<input type="text" name="name" style="border: none;">
				</td>
				<td class="title">
					아이디
				</td>
				<td>
					<input type="text" name="id" style="border: none;">
				</td>
				<td class="title">
					전화번호
				</td>
				<td>
					<input type="text" name="cellphone" style="border: none;">
				</td>
				<td>
					<input type="button" value="검 색" onclick="orderSearch();">
				</td>
			</tr>
		</table>
	</form>
</div>
<br/><br/>
<form action="" name="orderView" method="post">
	<table border="1" style="margin: 0 auto; width: 90%; text-align: center;">
		<tr>
			<td class="title">
				주문번호
			</td>
			<td class="title">
				아이디
			</td>				
			<td class="title">
				이름
			</td>
			<td class="title">
				전화번호
			</td>				
			<td class="title">
				주소
			</td>	
			<td class="title">
				상품코드
			</td>		
			<td class="title">
				상품명
			</td>
			<td class="title">
				색상코드
			</td>													
			<td class="title">
				상품가격
			</td>
			<td class="title">
				수량
			</td>
			<td class="title">
				결제금액
			</td>
			<td class="title">
				주문일자
			</td>
			<td class="title">
				결제상태
			</td>	
			<td class="title">
				배송상태
			</td>					
			<td class="title">
				비고
			</td>		
		</tr>

		<c:forEach var="dto" items="${saleList }"> 
			<tr>
				<td>
					${dto.sale_Code }
				</td>
				<td>
					${dto.id }
				</td>				
				<td>
					${dto.name }
				</td>
				<td>
					${dto.cellphone }
				</td>				
				<td>
					${dto.addr }
				</td>
				<td>
					${dto.code }
				</td>			
				<td>
					${dto.product_Name }
				</td>			
				<td>
					${dto.color_Code }
				</td>						
				<td>
					${dto.product_Price }
				</td>
				<td>
					${dto.qty }
				</td>
				<td>
					${dto.total_Price }
				</td>
				<td>
					${dto.saleDate }
				</td>
				
				<td>
					<select id="pay_Status">
						<option value="pay_ready">입금대기</option>
						<option value="pay_compl">결제완료</option>
						<option value="change">교환</option>
						<option value="refund">환불</option>
						<option value="cancel">취소</option>									
					</select>
				</td>
				
				<td>
					<select id="delivery_Status">
						<option value="ready">상품 준비중</option>
						<option value="ing">배송중</option>
						<option value="compl">배송완료</option>				
					</select>
				</td>
				<td>					
					<a href="javascript:void(0);" onclick="orderUpdate('${dto.sale_Code}');" style="text-decoration: none;">수정</a>
				</td>			
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>