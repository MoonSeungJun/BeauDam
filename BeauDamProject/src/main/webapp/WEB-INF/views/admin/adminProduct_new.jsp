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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<script type="text/javascript">

// 	function addProduct() {
		
// 		var f = document.adminProduct_new;
		
// 		var brand = $('#brandSelect option:selected').val();
// 		var category = $('#cateSelect option:selected').val();
// 		var type = $('#typeSelect option:selected').val();
// 		var count = $('#count').val();
// 		var code = $('#code').val();
// 		var productName = $('#productName').val();
// 		var price = $('#price').val();
// 		var thumbImg = $('#thumbImg').val();
// 		var detailImg = $('#detailImg').val();
// 		var color = $('#color').val();
// 		var colorCode = $('#colorCode').val();
			
// 		alert(brand + category + type + count + code + productName);
// 		alert(price + thumbImg + detailImg + color + colorCode);
				
// 		f.action = "/beaudam/adminProduct_new.action";
// 		f.submit();	
		
// 	}
	
	
// 	$(function() {
// 		$('#addProduct').click(function() {
// 			var formData = new FormData();
// 			formData.append("brand",$('#brandSelect option:selected').val());
// 			formData.append('category',$('#cateSelect option:selected').val());
// 			formData.append('type',$('#typeSelect option:selected').val());
// 			formData.append('count', $('#count').val());
// 			formData.append('code',$('#code').val());
// 			formData.append('productName',$('#productName').val());
// 			formData.append('price', $('#price').val());
// 			formData.append('thumbImg', $('#thumbImg').val());
// 			formData.append('detailImg', $('#detailImg').val());
// 			formData.append('color',$('#color').val());
// 			formData.append('colorCode', $('#colorCode').val());				
			
// 	 		$.ajax({			
// 	 			type:'POST',
// 	 			url: '/adminProduct_new.action',
// 	 			data: formData,
// 	 			processData: false,
// 	 			contentType: false,	 			
// 	 			success: function(data) {				
// 	 				alert('성공');
// 	 			}			 		
//  			});			
// 		});			
// 	});


</script>

<body>
	<jsp:include page="adminHeader.jsp"/>
	<div class="wrapper">
	<form method="post" enctype="multipart/form-data" action="adminProduct_new.action">
		<h2 class="text-center">상품등록</h2>
		<hr>
		<table border="1" style="text-align: center;">
			<tr>
				<td class="title">브랜드</td>
				<td style="text-align: left; text-indent: 1em;">
					<select name="brand" style="width: 80%;">
						<c:forEach var="brand" items="${brand }">
							<option value="${brand.brand }">${brand.brand }</option>	
						</c:forEach>								
					</select>
				</td>
				<td class="title">분류</td>
				<td>
					<select name="category">
						<c:forEach var="dto" items="${cate }">
							<option value="${dto.category }">${dto.category }</option>					
						</c:forEach>					
					</select>
					<select name="type">
						<c:forEach var="type" items="${type }">
							<option value="${type.type }">${type.type }</option>
						</c:forEach>
					</select>
				</td>
				<td class="title">재고</td>
				<td>
					<input type="text" name="count" style="border: none;"> 
				</td>
				<td class="title">코드</td>
				<td><input type="text" name="code" style="border: none;"></td>
			</tr>	
			<tr>
				<td class="title">상품명</td>
				<td>
					<input type="text" name="productName" style="width: 100%; border: none;">
				</td>
				<td class="title">가격</td>
				<td style="text-align: left;">
					<input type="text" name="price" style="border: none;">원
				</td>
				<td class="title">색상</td>
				<td>
					<input type="text" name="color" style="border: none;">
				</td>
				<td class="title">색상 코드</td>
				<td>
					<input type="text" name="colorCode" style="border: none;">
				</td>
			</tr>	
			<tr>
				<td class="title">썸네일<Br>이미지</td>
				<td>
					<input type="file" name="thumbImg">
				</td>
				<td class="title">상세<Br>이미지</td>
				<td>
					<input type="file" name="detailImg">
				</td>					
				<td colspan="4">
					<input type="submit" name="addProduct" value="등록하기">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
		<table border="1">
			<tr>
				<td class="title">코드</td>
				<td class="title">브랜드</td>
				<td class="title">카테코리</td>
				<td class="title" style="width: 110px;">
					타입
				</td>
				<td class="title" style="width: 200px;">
					상품명
				</td>
				<td class="title" style=" width: 100px;">
					가격
				</td>
				<td class="title" style="width: 100px;">
					재고
				</td>
			</tr>
			<tr>
				<td>2012012</td>
				<td>
					<input type="text" value="에뛰드" style="border: none;">
				</td>
				<td>
					<input type="text" value="Lib" style="border: none;">
				</td>
				<td>
					<input type="text" value="Balm" style="border: none;">
				</td>
				<td>
					<input type="text" value="산호초 발색 레드립밤" style="border: none;">
				</td>
				<td>
				 	<input type="text" value="3500" style="border: none;">
				</td>
				<td>
					<input type="text" value="232" style="border: none;">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>