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
	<div class="wrapper">
	<form action="" name="adminProductForm" method="post">
		<h2 class="text-center">상품조회</h2>
		<hr>
		<table border="1" style="text-align: center; margin: 0 auto;"> 
			<tr>

				<td class="title">코드</td>
				<td colspan="3"><input type="text" name="code" style="width: 100%; border: none; text-indent: 1em;"></td>
			</tr>
			<tr>
				<td class="title">브랜드</td>
				<td style="width: 150px;">
					<select name="brand" style="width: 100%;  text-indent: 1em">
							<option>선택하세요</option>
						<c:forEach var="dto" items="${brandLists }">
							<option value="${dto.brand }">${dto.brand }</option>
						</c:forEach>
					</select>
				</td>
				<td class="title">분류</td>
				<td style="text-align: center;">
					<select name="category" style="width: 100px;">
							<option>선택하세요</option>
						<c:forEach var="dto" items="${categoryLists }">
							<option value="${dto.category }">${dto.category }</option>
						</c:forEach>
					</select> 
					<select name="type" style="width: 100px;">
							<option>선택하세요</option>
						<c:forEach var="dto" items="${typeLists }">
							<option value="${dto.type }">${dto.type }</option>
						</c:forEach>

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
				<td class="title">상품명</td>
				<td colspan="3">
					<input type="text" name="product_Name" style="border: none; width: 80%;">
					<input type="button" value="검색" onclick="searchSend();">
				</td>
			</tr>
		</table>
	</form>

	<br><br>
	
	<table border="1" style="width: 100%;">
				<tr>
			<td class="title">
				코드
			</td>
			
			<td class="title">
				브랜드
			</td>
			
			<td class="title">
				카테코리
			</td>
			
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
			
			<td class="title">
				관리
			</td>
		</tr>

			<c:forEach var="dto" items="${lists }">
		<tr align="center">
			<td>${dto.code }</td>
			<td>
				<input type="text" id="brand" value="${dto.brand }">
			</td>
			<td>
				<input type="text" id="category" value="${dto.category }">
			</td>
			<td>
				<input type="text" id="type" value="${dto.type }">
			</td>
			<td>
				<input type="text" id="product_Name" value="${dto.product_Name }">
			</td>
			<td>
				<input type="text" id="product_Price" value="${dto.product_Price }">
			</td>
			<td>
				<input type="text" id="qty" value="${dto.qty }">
			</td>
			<td>
				<input type="hidden" name="code" value="${dto.code}">
				<input type="hidden" name="pageNum" value="${pageNum }"> <a onclick="">수정</a>/<a href="" style="text-decoration: none;">삭제</a>
			</td>
		</tr>
			</c:forEach>
	</table>
	</div>
	</body>

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