<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
</head>
<script type="text/javascript">


	$(function(){
		$("#selectYear").change(function() {
		var yearSearchValue = $("#selectYear option:selected").val();
		
		$("#yearBox").val(yearSearchValue);
		});	
		
		f.action = "<%=cp%>/adminSales.action";
		f.submit();
		
	});	

</script>
<body>

<jsp:include page="adminHeader.jsp"/>

<div class="wrapper">
<h2 class="text-center">매출</h2>
<hr>
<div style="margin: 0 auto; text-align: center; overflow: hidden;">
		
		<form action="" method="post" name="adminSalesForm">
		<table align="center">
			<tr>
				<td>
					<select id="selectYear">
						<c:forEach var="dto" items="${yearSales }">
							<option>${dto.saledate }</option>
						</c:forEach>
										
					</select>
					<input type="hidden" id="yearBox" name="yearSearchValue" value=""/>
				</td>
			</tr>
		</table>
		</form>
		
		<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">주간</h3>
				</td>
			</tr>
			<tr>
				<c:forEach var="dto" items="${daySales }">
					<td>
						${dto.saledate }
					</td>
					<td>
						${dto.total_Price }
					</td>
				</c:forEach>
			</tr>			
		</table>

		<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">월간</h3>
				</td>
			</tr>
			<c:forEach var="dto" items="${monthSales}">
				<tr>
					<td>
						${dto.saledate }
					</td>
					<td>
						${dto.total_Price }
					</td>
				</tr>			
			</c:forEach>
		
		</table>




	<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">연간</h3>
				</td>
			</tr>
			<c:forEach var="dto" items="${yearSales }">
				<tr>
					<td>
						${dto.saledate }
					</td>
					<td>
						${dto.total_Price }
					</td>
				</tr>
			</c:forEach>			
		</table>
	</div>

</div>
</body>
</html>