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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

function popUp(code) {
	var url = "adminProduct_update.action?code="+code;
	var option = "width=1300, height=300, resizable=no, scrollbars=no, status=no, toolbar=no;";
	 window.open(url,"",option); 
}

function searchSend() {

	var code = $('#code').val();
	var brand = $('#brand option:selected').val();
	var category = $('#category option:selected').val();
	var type = $('#type option:selected').val();
	var productName = $('#product_Name').val();
		
	if(code=="" && brand=='선택' && category=='선택' && type=='선택' && productName==""){
		alert('데이터를 입력하세요');		
		return;
	}
	if(brand =='선택'){
		brand = "";
	}
	if(category=='선택'){
		category=="";
	}
	if(type=='선택'){
		type=="";
	}
	
	$.ajax({
		type:'post',
		url: '/beaudam/adminProductViewAjax.action',
		dataType: 'json',		
		data:{'code':code,'brand':brand,'category':category,'type':type,'productName':productName},
		beforeSend: function() {
			$('#tester').empty();
		},
		success: function(result) {	
			
			var data = "<tr align='center'>";			
			$.each(result, function(i) {
				result[i] = decodeURI(result[i]);
				if( i>8 && (i+1)%9 == 1){
					data += "<tr align='center'>";
				}				
				data += "<td>"+result[i]+"</td>";	
				if(i%9==0){
					var j = i;					
				}
				if((i+1)%9==0){					
					data += "<td><a href='javascript:void(0)' onclick='popUp(\"";
					data += result[i-8];
					data += "\"); return false;'>수정</a>/<a href='adminProductDelete.action?code=" + result[i-8] + "' style='text-decoration: none;'>삭제</a></td></tr>";
				}			
			});
			
			if(result == ''){
				alert("데이터가 없습니다.");
			}			
			$("#tester").append(data);
		},
		error: function(result) {
			alert(result);
		}
		
	});
	
}
	
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
				<td><input type="text" name="code" style="width: 100%; border: none; text-indent: 1em;" id="code" onkeydown="if(event.keyCode == 13) searchSend();"></td>
				<td class="title">브랜드</td>

				<td style="width: 150px;">
					<select name="brand" id="brand" style="width: 100%;  text-indent: 1em">	
						<option>선택</option>					
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
						<option>선택</option>
					</select>			
				</td>
			</tr>

			<tr>
				<td class="title">상품명</td>

				<td colspan="3">
					<input type="text" id="product_Name" name="product_Name"  style="border: none; width: 80%;"onkeydown="if(event.keyCode == 13) searchSend();">
					<input type="button" value="검색" onclick="searchSend();" style="width: 18%;">
				</td>			
			</tr>

		</table>
	</form>
	<br><br>
	<table border="1"  style="width: 100%;" id="view">
		<tr>
			<td class="title">코드</td>

			<td class="title">브랜드</td>

			<td class="title">카테코리</td>

			<td class="title" style="width: 110px;">타입</td>

			<td class="title" style="width: 200px;">상품명</td>

			<td class="title" style="width: 100px;">가격</td>

			<td class="title" style="width: 100px;">색상코드</td>
			<td class="title" style="width: 100px;">색상</td>
			<td class="title" style="width: 100px;">재고</td>

			<td class="title">관리</td>
		</tr>
		<tbody id="tester">
		
		
		</tbody>
	</table>

	</div>
</body>
</html>