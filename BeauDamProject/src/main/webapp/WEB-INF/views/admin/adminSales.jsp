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
		var yearSearchValue = $("#yearDto option:selected").val();
		
		$("#yearBox").val(yearSearchValue);
		});	
	});	
	
		
		f.action = "<%=cp%>/adminSales.action";
		f.submit();



</script>
<body>

<jsp:include page="adminHeader.jsp"/>

<div class="wrapper">
<h3>Admin Sale Page</h3>

<h3>주간</h3>

	<table border="1">
		<tr>
			<td>
				요일
			</td>	
			<td>
				매출액
			</td>
		</tr>		
		<c:forEach var="dayDto" items="${dayDto }">
		<tr>				
			<td>
				${dayDto.saleDate }				
			</td>
			<td>
				${dayDto.total_Price }
			</td>
		</tr>
		</c:forEach>
			
	</table>



<h3>월간</h3>

<!-- select 문에다가 연도는 yearDto 를 갖고 와서 select문에 삽입할것 -->
<!-- select 문에 선택된 연도는 컨트롤러로 보내지게 할것 -->
<!-- select 문에 년도가  null값이면 2018을 기본으로 출력하게 셋팅 -->
<form action="" method="post"  name="yearSalesSearch">
		<table border="1">
			<tr>
				<td><input type="hidden" id="yearBox" name="yearSearchValue" value="2018">
					<select id="selectYear">
						<option>년도</option>
					<c:forEach var="yearDto" items="${yearDto }">
						<option value="${yearDto.saleDate }">${yearDto.saleDate }</option>
					</c:forEach>
					
					</select>
				</td>
			</tr>
			<tr>	
				<td>
					월
				</td>
				<td>
					매출액
				</td>
			</tr>	
			<c:forEach var="monthDto" items="${monthDto }">
			<tr>
				<td>
					${monthDto.saleDate }			
				</td>
				<td>
					${monthDto.total_Price }
				</td>
			</tr>
		</c:forEach>
		
	</table>
</form>	

<h3>연간</h3>

	<table border="1">
		<tr>
			<td>
				연도
			</td>
			<td>
				매출액
			</td>
		</tr>
		<c:forEach var="yearDto" items="${yearDto }">
		<tr>
			<td>
				${yearDto.saleDate }
			</td>
			<td>
				${yearDto.total_Price }			
			</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>