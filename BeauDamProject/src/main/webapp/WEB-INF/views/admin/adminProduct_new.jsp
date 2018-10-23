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
<script type="text/javascript">

	function showSubSelect(category) {
		
		$.ajax({
		
			type:'post',
			url: "/beaudam/adminProduct_newAjax.action",
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
<jsp:include page="adminHeader.jsp"/>
<div class="wrapper">
<h2>상품등록</h2>
	<br><br>	
<form method="post" enctype="multipart/form-data" action="adminProduct_new.action" name="adminProductForm">
	<table border="1">
		<tr>
			<td>
				브랜드
			</td>
			
			<td>
			
				<select name="brand" id="brand">
					
					<c:forEach var="brand" items="${brand }">
						<option value="${brand.brand }">${brand.brand }</option>	
					</c:forEach>								
				</select>
			
			</td>
			
			<td>
				 분류				
			</td>
			
			<td>
				<select id="category" name="category" onchange="showSubSelect(this.value);">
					<option value="">선택</option>	
					<c:forEach var="dto" items="${cate }">
						<option value="${dto.category }">${dto.category }</option>					
					</c:forEach>					
				</select>
				
				<select name="type" id="type">
					<option value=""></option>					
				</select>
			</td>
			
			<td>
				재고
			</td>
			
			<td>
				<input type="text" name="count"/> 
			</td>
			
			<td>
				코드
			</td>
			
			<td>
				<input type="text" name="code">
			</td>
			
			
		</tr>	
		
		<tr>
			<td>
				상품명
			</td>
			
			<td>
				<input type="text" name="productName">
			</td>
			
			
			<td>
				가격
			</td>
			
			<td>
				<input type="text" name="price">원
			</td>
			<td>
				색상
			</td>
			
			<td>
				<input type="text" name="color">
			</td>
			<td>
				색상 코드
			</td>
			
			<td>
				<input type="text" name="colorCode">
			</td>
			

		</tr>	
		
		<tr>
			<td>
				썸네일이미지
			</td>
			
			<td>
				<input type="file" name="thumbImg">
			</td>
			
			<td>
				상세이미지
			</td>
			
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
		<tr >
			<td>
				코드
			</td>
			
			<td>
				브랜드
			</td>
			
			<td>
				카테코리
			</td>
			
			<td>
				타입
			</td>
			
			<td>
				상품명
			</td>
			
			<td>
				가격
			</td>
			
			<td>
				색상코드
			</td>
			<td>
				색상
			</td>
			<td>
				재고
			</td>

		</tr>
	<c:forEach var="dto" items="${productList }">
		<tr>
			<td>
				${dto.code }
			</td>
			
			<td>
				${dto.brand }
			</td>
			
			<td>
				${dto.category }
			</td>
			
			<td>
				${dto.type }
			</td>
			
			<td>
				${dto.product_Name }
			</td>
			
			<td>
			 	${dto.product_Price }
			</td>
			
			<td>
				${dto.color_Code }
			</td>
			<td>
				${dto.color_Name }
			</td>
				
			<td>
				${dto.qty }
			</td>	

		</tr>
	</c:forEach>
	</table>

</div>
</body>
</html>