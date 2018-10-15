<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품조회</h1>
	<br><br>
	<table align="center" style="width: 50%; height: auto;" border="1">
		
		<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;코드&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			
			<td colspan="3">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 16%; height: 30px;">
			</td>
		</tr>
		
		
		
		<tr style="height: 45px;" align="center">
			<td>
				브랜드
			</td>
			
			<td>
				<select style="width: 90%; height: 40px;">
					<option>에뛰드</option>
					<option>홀리카홀리카</option>
					<option>이니스프리</option>					
				</select>
			</td>
			
			<td>
				 분류				
			</td>
			
			<td>
				<select style="width: 45%; height: 40px;">
					<option>Lib</option>
					<option>Eye</option>
					<option>Face</option>					
				</select>
				
				<select style="width: 45%; height: 40px;">
					<option>Balm</option>
					<option>Gluds</option>
					<option>Tint</option>					
				</select>
			</td>
				
			
			
		</tr>	
		
		<tr  style="height: 35px;" align="center">
			<td>
				상품명
			</td>
			
			<td>
				<input type="text" style="width: 90%; height: 30px;">
			</td>
			
				
						
			<td rowspan="2" colspan="4">
				<input type="button" value="검색" style="height: 30px; width: 90%;">
			</td>
		</tr>	
		
		
		
	</table>
	<br><br>
	<table align="center" style="width: 60%; height: auto;" border="1">
		<tr align="center">
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
				수정/삭제
			</td>
		</tr>
		
	</table>

</body>
</html>