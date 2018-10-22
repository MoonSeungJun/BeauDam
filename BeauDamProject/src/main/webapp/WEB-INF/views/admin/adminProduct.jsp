<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function searchSend() {

<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<div>
	<h2>상품조회</h2>
	<table border="1">

		
		f = document.adminProductForm;
		
		searchValue1 = f.code.value;
		searchValue1 =searchValue1.trim();
		
		searchValue2 = f.brand.value;
		searchValue2 =searchValue2.trim();
		
		searchValue3 = f.category.value;
		searchValue3 =searchValue3.trim();
		
		searchValue4 = f.type.value;
		searchValue4 =searchValue4.trim();
		
		searchValue5 = f.product_Name.value;
		searchValue5 =searchValue5.trim();
		
		if(!searchValue1&&!searchValue5){		
			alert("\검색어를 입력하세요.");
			f.code.focus();
			return;
		}
		
		f.action = "<%=cp%>/adminProduct.action";
		f.submit();
		
			
	}
	
function adminProductUpdate() {
		
		
		f.action = "<%=cp%>	/adminProduct_update.action";
		f.submit();

	}
	
	jQuery('#category').change(function() {
	var state = jQuery('#category option:selected').val();
	if(state == 'Accessory') {
		jQuery('.layer').show();
	} 
	
	
	
	
});
	
	
	
	
	
</script>

</head>
<body>

	<jsp:include page="adminHeader.jsp" />

	<h1>상품조회</h1>
	<br>
	<br>
	<form action="" name="adminProductForm" method="post">
		<table border="1">

			<tr>
				<td>코드</td>

				<td colspan="3"><input type="text" name="code"></td>
			</tr>



			<tr>
				<td>브랜드</td>

				<td><select name="brand">
						<option>선택하세요</option>
						<c:forEach var="dto" items="${brandLists }">
							<option value="${dto.brand }">${dto.brand }</option>
						</c:forEach>
				</select></td>

				<td>분류</td>

				<td>
					<select name="category">
						<option>선택하세요</option>
						<c:forEach var="dto" items="${categoryLists }">
							<option value="${dto.category }">${dto.category }</option>
						</c:forEach>
					</select> 
				
					<select name="type">
						<option>선택하세요</option>
						<c:forEach var="dto" items="${typeLists }">
							<option value="${dto.type }">${dto.type }</option>
						</c:forEach>
					</select>
				
				</td>


			</tr>

			<tr>
				<td>상품명</td>

				<td><input type="text" name="product_Name"></td>

				<td rowspan="2" colspan="4"><input type="button" value="검색"
					onclick="searchSend();"></td>
			</tr>

		</table>
	</form>
	<br>
	<br>
	<table border="1">
		<tr>
			<td>코드</td>

			<td>브랜드</td>

			<td>카테코리</td>

			<td>타입</td>

			<td>상품명</td>

			<td>가격</td>

			<td>재고</td>

			<td>관리</td>
		</tr>
		<c:forEach var="dto" items="${lists }">
			<tr align="center">
				<td>${dto.code }</td>

				<td><input type="text" id="brand" value="${dto.brand }">
				</td>

				<td><input type="text" id="category" value="${dto.category }">
				</td>

				<td><input type="text" id="type" value="${dto.type }">
				</td>

				<td><input type="text" id="product_Name"
					value="${dto.product_Name }"></td>

				<td><input type="text" id="product_Price"
					value="${dto.product_Price }"></td>

				<td><input type="text" id="qty" value="${dto.qty }"></td>



				<td><input type="hidden" name="code" value="${dto.code}">
					<input type="hidden" name="pageNum" value="${pageNum }"> <a
					onclick="">수정</a>/<a href="" style="text-decoration: none;">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>