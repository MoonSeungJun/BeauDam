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

<h1>Admin Order Page</h1>

<form action="" name="adminOrderForm" method="post">
	<table border="1">
		<tr>
			<td>
				입금대기
			</td>
			<td>
				결제완료
			</td>
			<td>
				배송중
			</td>
			<td>
				배송완료
			</td>
			<td>
				환불
			</td>
		</tr>
		<tr>
			<td>
				0
			</td>
			<td>
				0
			</td>
			<td>
				0
			</td>
			<td>
				0
			</td>
			<td>
				0
			</td>
		</tr>
	</table>

	<table border="1">
		<tr>
			<td>
				이름
			</td>
			<td>
				<input type="text" name="name">
			</td>
			<td>
				아이디
			</td>
			<td>
				<input type="text" name="id">
			</td>
			<td>
				전화번호
			</td>
			<td>
				<input type="text" name="cellphone">
			</td>
			<td>
				<input type="button" value="검 색" onclick="orderSearch();">
			</td>
		</tr>
	</table>
</form>
<form action="" name="adminOrderEditForm" method="post">
	<table border="1">
		<tr>
			<td>
				주문번호
			</td>
			<td>
				아이디
			</td>				
			<td>
				이름
			</td>
			<td>
				전화번호
			</td>				
			<td>
				주소
			</td>			
			<td>
				상품명
			</td>			
			<td>
				상품색상
			</td>						
			<td>
				상품가격
			</td>
			<td>
				수량
			</td>
			<td>
				결제금액
			</td>
			<td>
				주문일자
			</td>
			<td>
				결제상태
			</td>	
			<td>
				배송상태
			</td>
					
			<td>
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