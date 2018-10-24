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

<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">


<script type="text/javascript">

	function searchSend() {
		
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
			
</script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

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

	
	f.action = "<%=cp%>/adminProduct.action";
	f.submit();
	
		
}
	
function adminProductUpdate() {
		
		
		f.action = "<%=cp%>	/adminProduct_update.action";
		f.submit();

	}
	
	$('#category').change(function() {
	var state = $('#category option:selected').val();
	if(state == 'Accessory') {
		$('.layer').show();
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
	<div class="wrapper">
	<h2 class="text-center">상품조회</h2>
	<hr>
	<form action="" name="adminProductForm" method="post">
		<table border="1" style="text-align: center; margin: 0 auto;">
			<tr>
				<td class="title">코드</td>
				<td><input type="text" name="code" style="width: 100%; border: none; text-indent: 1em;"></td>
				<td class="title">브랜드</td>

				<td style="width: 150px;">
					<select name="brand" id="brand" style="width: 100%;  text-indent: 1em">						
						<c:forEach var="dto" items="${brandLists }">
							<option value="${dto.brand }">${dto.brand }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="title">분류</td>
				<td style="text-align: center;" colspan="3">
					<select name="category" id="category" onchange="showSubSelect(this.value);" style="width: 48%;">
						<option>선택</option>
						<c:forEach var="dto" items="${categoryLists }">
							<option value="${dto.category }">${dto.category }</option>
						</c:forEach>
					</select> 	
					<select name="type" id="type" style="width: 48%;">
						<option value=""></option>					
					</select>			
				</td>
			</tr>

			<tr>
				<td class="title">상품명</td>

				<td colspan="3">
					<input type="text" name="product_Name"  style="border: none; width: 80%;">
					<input type="button" value="검색" onclick="searchSend();" style="width: 18%;">
				</td>			
			</tr>

		</table>
	</form>
	<br><br>
	<table border="1"  style="width: 100%;">
		<tr>
			<td class="title">코드</td>

			<td class="title">브랜드</td>

			<td class="title">카테코리</td>

			<td class="title" style="width: 110px;">타입</td>

			<td class="title" style="width: 200px;">상품명</td>

			<td class="title" style="width: 100px;">가격</td>

			<td class="title" style="width: 100px;">재고</td>

			<td class="title">관리</td>
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
	</div>
</body>
</html>