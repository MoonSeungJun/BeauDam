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
				<a href="" style="text-decoration: none;">
					<img src="<%=cp %>/resources/image/adminHeader/adminHeaderLogo.png" height="150" width="150">
				</a>
			</td>
			<td>
				<details>
					<summary>상품</summary>
					<p><a href="adminProduct.action">관리</a></p>
					<p><a href="adminProduct_new.action">등록</a></p>
				</details>
				
			</td>			
			<td>
				<a href="adminUser.action" style="text-decoration: none;">회원</a>
			</td>
			<td>
				<a href="adminOrder.action" style="text-decoration: none;">주문</a>				
			</td>
			<td>
				<a href="adminBrand.action" style="text-decoration: none;">브랜드/카테고리</a>				
			</td>
			<td>
				<a href="adminSales.action" style="text-decoration: none;">매출</a>				
			</td>			
		</tr>	
	</table>
<hr>
</body>
</html>