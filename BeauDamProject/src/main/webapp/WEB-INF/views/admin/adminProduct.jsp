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
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<!-- <div>
	<h2>상품조회</h2>
	<table border="1">
		
		<tr>
			<td>
				코드
			</td>
			
			<td colspan="3">
				<input type="text" name="code">
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				브랜드
			</td>
			
			<td>
				<select>
					<option>에뛰드</option>
					<option>홀리카홀리카</option>
					<option>이니스프리</option>					
				</select>
			</td>
			
			<td>
				 분류				
			</td>
			
			<td>
				<select>
					<option>Lib</option>
					<option>Eye</option>
					<option>Face</option>					
				</select>
				
				<select>
					<option>Balm</option>
					<option>Gluds</option>
					<option>Tint</option>					
				</select>
			</td>
				
			
			
		</tr>	
		
		<tr>
			<td>
				상품명
			</td>
			
			<td>
				<input type="text">
			</td>
			
				
						
			<td rowspan="2" colspan="4">
				<input type="button" value="검색">
			</td>
		</tr>	
		
		
		
	</table>
	<br><br>
	<table border="1">
		<tr>
			<td>
				코드
			</td>
			
			<td>
				브랜드
			</td>
			
			<td>
				카테코리
			</td>
			
			<td>
				타입
			</td>
			
			<td>
				상품명
			</td>
			
			<td>
				가격
			</td>
			
			<td>
				재고
			</td>
			
			<td>
				관리
			</td>
		</tr>
		
		<tr align="center">
			<td>
				2012012
			</td>
			
			<td>
				<input type="text" value="에뛰드">
			</td>
			
			<td>
				<input type="text" value="Lib">
			</td>
			
			<td>
				<input type="text" value="Balm">
			</td>
			
			<td>
				<input type="text" value="산호초 발색 레드립밤">
			</td>
			
			<td>
			 	<input type="text" value="3500">
			</td>
			
			<td>
				<input type="text" value="232">
			</td>
			
			<td>
				<a href="" style="text-decoration: none;">수정</a>/<a href="" style="text-decoration: none;">삭제</a>
			</td>
		</tr>
		
	</table>
	</div> -->
</body>
</html>