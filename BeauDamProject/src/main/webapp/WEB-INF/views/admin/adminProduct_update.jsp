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
	
	window.onload = function() {
	    document.getElementById('addProduct').onclick = function() {
	    	
	    	var f = document.adminProductForm;
	    	if(f.count.value==""||f.code.value==""||f.productName.value==""||f.price.value==""||f.colorCode.value==""||f.color.value==""||f.thumbImg.value==""||f.detailImg.value==""){
	    		alert("값을 모두 입력하세요");
	    		
	    	}else{
	    		document.getElementById('adminProductForm').submit();	    		
	    	}
	    	
	        
	        return false;
	    };
	};


	
</script>
</head>
<body>
<div class="wrapper">
	<h2 class="text-center">상품수정</h2>
	<hr>	
	<form method="post" enctype="multipart/form-data" action="" name="adminProductForm" id="adminProductForm">
		<table border="1" style="text-align: center; border: 1px solid black">
			<tr>
				<td class="title">
					브랜드
				</td>
				
				<td style="text-align: left; text-indent: 1em;">			
					<select name="brand" id="brand" style="width: 80%;">
						<option value="${dto.brand }">${dto.brand }</option>						
						<c:forEach var="brand" items="${brand }">
							<option value="${brand.brand }">${brand.brand }</option>	
						</c:forEach>								
					</select>				
				</td>
				
				<td class="title">
					 분류				
				</td>
				
				<td>
					<select id="category" name="category" onchange="showSubSelect(this.value);" style="width: 90px;">
						<option value="${dto.category }">${dto.category }</option>	
						<c:forEach var="dto" items="${cate }">
							<option value="${dto.category }">${dto.category }</option>					
						</c:forEach>					
					</select>
					
					<select name="type" id="type" style="width: 130px;">
						<option value="${dto.type }">${dto.type }</option>	
						<c:forEach var="dto" items="${type }">
							<option value="${dto.type }">${dto.type }</option>					
						</c:forEach>				
					</select>
				</td>
				
				<td class="title">
					재고
				</td>
				
				<td>
					<input type="text" name="count" style="border: none;" value="${dto.qty }"/> 
				</td>
				
				<td class="title">
					코드
				</td>
				
				<td>
					<input type="text" name="code" style="border: none;" value="${dto.code }" readonly="readonly">
				</td>				
			</tr>	
			
			<tr>
				<td class="title">
					상품명
				</td>				
				<td>
					<input type="text" name="productName" style="width: 100%; border: none;" value="${dto.product_Name }">
				</td>				
				<td class="title">
					가격
				</td>			
				<td style="text-align: left;">
					<input type="text" name="price" style="border: none;" value="${dto.product_Price }">원
				</td>
				<td class="title">
					색상
				</td>				
				<td>
					<input type="text" name="color" style="border: none;" value="${dto.color_Name }">
				</td>
				<td class="title">
					색상 코드
				</td>				
				<td>
					<input type="text" name="colorCode" style="border: none;" value="${dto.color_Code }" readonly="readonly">
				</td>	
			</tr>	
			
			<tr>
				<td class="title">
					썸네일<br/>이미지<br/>
				</td>				
				<td>
					<input type="file" name="thumbImg" value="${dto.thumb_Img }">
				</td>
				
				<td class="title">
					상세<br/>이미지<br/>
				</td>
				
				<td>
					<input type="file" name="detailImg" value="${dto.detail_Img }">
				</td>
										
				<td colspan="4">
					<input type="submit" name="addProduct" value="수 정" id="addProduct">
				</td>
			</tr>			
		</table>
	</form>
</div>
</body>
</html>