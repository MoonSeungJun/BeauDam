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
	
	var f = document.adminProductForm;
	
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
	
function showSubSelect(category) {
		
		$.ajax({
		
			type:'post',
			url: "/beaudam/adminProductAjax.action",
			dataType: "json",
			data:{'params':category,'brand':$('#brand option:selected').val()},
			success: function (result) {
				
				$('#type').find('option').remove().end().append("<option value=''>전체</option>");
				
				$.each(result, function(i) {
					$('#type').append("<option value='"+result[i]+"'>"+result[i]+"</option>")
				});	
		
			},
			error: function(jqXHR, textStatus,errorThrown) {
				alert(errorThrown);				
				alert(textStatus);				
			}					
		});		
	}
	
	
	
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

				<td><input type="text" name="code"></td>
				<td>브랜드</td>

				<td><select name="brand" id="brand">						
						<c:forEach var="dto" items="${brandLists }">
							<option value="${dto.brand }">${dto.brand }</option>
						</c:forEach>
				</select></td>
			</tr>



			<tr>
				

				<td>분류</td>

				<td>
					<select name="category" id="category" onchange="showSubSelect(this.value);">
						<option>선택하세요</option>
						<c:forEach var="dto" items="${categoryLists }">
							<option value="${dto.category }">${dto.category }</option>
						</c:forEach>
					</select> 				
				</td>
				<td>
					<select name="type" id="type">
						<option value=""></option>					
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

				<td>${dto.brand }</td>

				<td>${dto.category }</td>

				<td>${dto.type }</td>

				<td>${dto.product_Name }</td>

				<td>${dto.product_Price }</td>

				<td>${dto.qty }</td>
				<td>
					<a>수정</a>/
					<a href="adminProductDelete.action?code=${dto.code }" style="text-decoration: none;">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>