<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeauDam Admin</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<script type="text/javascript">

	function orderSearch() {
		
		f = document.adminOrderForm;
		
		searchValue1 = f.id.value;
		searchValue1 = searchValue1.trim();
		
		searchValue2 = f.name.value;
		searchValue2 = searchValue2.trim();
		
		searchValue3 = f.cellphone.value;
		searchValue3 = searchValue3.trim();
		
		if(!searchValue1&&!searchValue2&&!searchValue3){
			alert("\검색어를 입력하세요.");
			f.id.focus();
			return;
		}
		
		f.action = "<%=cp%>/adminOrder.action";
		f.submit();
		
	}
	
	function adminOrderUpdate() {
		
		
		f.action = "<%=cp%>/adminOrderUpdate.action";
		f.submit();
		
		
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
				<td class="title">배송중</td>
				<td class="title">배송완료</td>
				<td class="title">환불</td>
			</tr>
			<tr>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
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
<form action="" name="adminOrderEditForm" method="post">
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
				상품명
			</td>			
			<td class="title">
				상품색상
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

		<c:forEach var = "dto" items="${lists }"> 
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
					${dto.totalPrice }
				</td>
				<td>
					${dto.saleDate }
				</td>
				
				<td>
					<select id="pay_Status">
						<option value="change">교환</option>
						<option value="returns">반품</option>
						<option value="cancel">취소</option>									
					</select>
				</td>
				
				<td>
					<select id="delivery_Status">
						<option value="ready">상품 준비중</option>
						<option value="ing">배송중</option>
						<option value="complete">배송완료</option>				
					</select>
				</td>
				<td>
					<input type="hidden" name="sale_Code" value="${dto.sale_Code }">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<a onclick="adminOrderUpdate();" style="text-decoration: none;">수정</a>
				</td>			
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>