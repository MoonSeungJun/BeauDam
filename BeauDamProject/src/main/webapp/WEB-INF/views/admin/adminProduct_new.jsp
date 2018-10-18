<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

	


</script>



<body>

<jsp:include page="adminHeader.jsp"/>

<h1>상품등록</h1>
	<br><br>
	
	
	
<form name="adminProduct_new" method="post" enctype="multipart/form-data">
	<table border="1">
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
			
			<td>
				재고
			</td>
			
			<td>
				<input type="text"> 
			</td>
			
			<td>
				코드
			</td>
			
			<td>
				<input type="text">
			</td>
			
			
		</tr>	
		
		<tr>
			<td>
				상품명
			</td>
			
			<td>
				<input type="text">
			</td>
			
			
			<td>
				가격
			</td>
			
			<td>
				<input type="text">원
			</td>
			
						
			<td rowspan="2" colspan="4">
				<input type="button" value="등록하기">
			</td>
		</tr>	
		
		<tr>
			<td>
				썸네일이미지
			</td>
			
			<td>
				<input type="file">
			</td>
			
			<td>
				상세이미지
			</td>
			
			<td>
				<input type="file">
			</td>
		</tr>
		
	</table>
	<br><br>
	<table border="1">
		<tr >
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

		</tr>
		
		<tr>
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

		</tr>
		
	</table>
</form>
</body>
</html>