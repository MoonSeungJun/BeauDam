<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
	String data = request.getParameter("data");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<script type="text/javascript">
		
	function addBrand() {
		var data = <%=data%>;
		$.ajax({
			type: 'POST',
			url: "adminBrand.action",
			data: {"addbrand":$('#brandInput').val()},
			async:false,
			dataType: "text",
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}	
		});		
	}
	
	function delBrand(brand) {		
		$.ajax({			
			type: 'POST',
			url: "adminBrand.action",
			data: {"delbrand":brand},
			async:false,
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}			
		});				
	}


	function addCate() {
		var data = <%=data%>;
		$.ajax({
			type: 'POST',
			url: "adminBrand.action",
			data: {"addCate":$('#cateInput').val()},
			async:false,
			dataType: "text",
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}	
		});		
	}
	
	function delCate(cate) {		
		$.ajax({			
			type: 'POST',
			url: "adminBrand.action",
			data: {"delCate":cate},
			async:false,
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}			
		});				
	}
	
	
	function addType() {
		var data = <%=data%>;
		$.ajax({
			type: 'POST',
			url: "adminBrand.action",
			data: {"addType":$('#typeInput').val()},
			async:false,
			dataType: "text",
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}	
		});		
	}
	
	function delType(type) {		
		$.ajax({			
			type: 'POST',
			url: "adminBrand.action",
			data: {"delType":type},
			async:false,
			success: function() {				
				window.location.href = "/beaudam/adminBrand.action";
			}			
		});				
	}

</script>


</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<div class="wrapper">
	<h2 class="text-center">브랜드/카테고리 수정</h2>
	<hr>
	<div style="margin: 0 auto; text-align: center; overflow: hidden;">
		<table border="1" style="margin: 10px; float: left; width: 28%;">
			<tr>
				<td style="background-color: gainsboro; padding: 3px;">
					브랜드
				</td>		
				<td>
					<input type="text" name="brand" id="brandInput" style="border: none; width: 100%">
				</td>
				<td>
					<input type="button" value="+"  onclick="addBrand();">
				</td>		
			</tr>
			
			<c:forEach var="dto" items="${brand }">
				<tr>
					<td colspan="2">
						${dto.brand }
					</td>
					<td>
						<a href="javascript:void(0);" style="text-decoration: none;" onclick="delBrand('${dto.brand}');">삭제</a>
					</td>
				</tr>		
			</c:forEach>
		
		</table>

		<table border="1" style="margin: 10px; float: left; width: 30%">
			<tr>
				<td style="background-color: gainsboro; padding: 3px;">
					카테고리
				</td>		
				<td>
					<input type="text" name="category" id="cateInput" style="border: none; width: 100%;">
				</td>
				<td>
					<input type="button" value="+" onclick="addCate();">
				</td>
			</tr>
				<c:forEach var="dto" items="${category }">
				<tr>
					<td colspan="2">
						${dto.category }
					</td>
					<td>
						<a href="javascript:void(0);" style="text-decoration: none;" onclick="delCate('${dto.category}');">삭제</a>
					</td>
				</tr>		
			</c:forEach>
		</table>

		<table border="1" style="margin: 10px; float: left; width: 35%;">
			<tr>	
				<td style="background-color: gainsboro;">
					타입
				</td>		
				<td>
					<input type="text" name="type" id="typeInput"  style="border: none; width: 100%;">
				</td>
				<td>
					<input type="button" value="+" onclick="addType();">
				</td>		
			</tr>
				<c:forEach var="dto" items="${type }">
				<tr>
					<td colspan="2">
						${dto.type }
					</td>
					<td>
						<a href="javascript:void(0);" style="text-decoration: none;" onclick="delType('${dto.type}');">삭제</a>
					</td>
				</tr>		
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>