<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<table border="1">
		<tr>
			<td>
				<a href="">
					<img src="<%=cp %>/resources/image/adminHeader/adminHeaderLogo.png" height="150" width="150">
				</a>
			</td>
			<td>
				<a href="">상품</a>
			</td>			
			<td>
				<a href="#">회원</a>
			</td>
			<td>
				<a href="adminOrder.action">주문</a>				
			</td>
			<td>
				<a href="adminBrand.action">브랜드/카테고리</a>				
			</td>
			<td>
				<a href="adminSales.action">매출</a>				
			</td>			
		</tr>	
	</table>
<hr>
</body>
</html>