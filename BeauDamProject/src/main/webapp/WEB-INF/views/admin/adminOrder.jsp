<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeauDam Admin</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<script type="text/javascript">

	function orderSearch() {
		
		var f = document.adminOrderForm;		
		
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
		
		<tr>
			<td>
				1000102
			</td>
			<td>
				admin
			</td>				
			<td>
				관리자
			</td>
			<td>
				010-1234-1234
			</td>				
			<td>
				서울시 강남구 테헤란로
			</td>			
			<td>
				나는 화장품이 필요없다
			</td>			
			<td>
				시꺼먼색
			</td>						
			<td>
				15000
			</td>
			<td>
				10
			</td>
			<td>
				150000	
			</td>
			<td>
				2018-10-05 10:47:55
			</td>
			
			<td>
				<select>
					<option value="change">교환</option>
					<option value="returns">반품</option>
					<option value="cancel">취소</option>									
				</select>
			</td>
			
			<td>
				<select>
					<option value="ready">상품 준비중</option>
					<option value="ing">배송중</option>
					<option value="complete">배송완료</option>				
				</select>
			</td>
			<td>
				<a href="#" style="text-decoration: none;">수정</a>
			</td>			
		</tr>
	
	</table>






</body>
</html>