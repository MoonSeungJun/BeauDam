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
</head>
<body>

<jsp:include page="adminHeader.jsp"/>

<h1>Admin Brand/Category Page</h1>

<table border="1">
	<tr>
		<td>
			브랜드
		</td>		
		<td>
			<input type="text" name="brand">
		</td>
		<td>
			<input type="button" value="추 가" onclick="">
		</td>		
	</tr>
	<c:forEach var="dto" items="${brand }">
		<tr>
			<td colspan="2">
				${dto.brand }
			</td>
			<td>
				<a href="#" style="text-decoration: none;">삭제</a>
			</td>
		</tr>		
	</c:forEach>

</table>

<table border="1">
	<tr>
		<td>
			카테고리
		</td>		
		<td>
			<input type="text" name="category">
		</td>
		<td>
			<input type="button" value="추 가" onclick="">
		</td>
	</tr>
		<c:forEach var="dto" items="${category }">
		<tr>
			<td colspan="2">
				${dto.category }
			</td>
			<td>
				<a href="#" style="text-decoration: none;">삭제</a>
			</td>
		</tr>		
	</c:forEach>
</table>

<table border="1">
	<tr>	
		<td>
			타입
		</td>		
		<td>
			<input type="text" name="type">
		</td>
		<td>
			<input type="button" value="추 가" onclick="">
		</td>		
	
	</tr>
		<c:forEach var="dto" items="${type }">
		<tr>
			<td colspan="2">
				${dto.type }
			</td>
			<td>
				<a href="#" style="text-decoration: none;">삭제</a>
			</td>
		</tr>		
	</c:forEach>

</table>










</body>
</html>