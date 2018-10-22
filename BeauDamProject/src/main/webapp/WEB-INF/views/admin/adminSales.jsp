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

		<table border="1">
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