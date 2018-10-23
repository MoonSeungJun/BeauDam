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
>>>>>>> 909e93aa0474d2fa501c2fd2fa5002d8d8eb418a
</body>
</html>