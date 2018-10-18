<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="adminHeader.jsp"/>

<h1>회원조회</h1>
	<br><br>
	<table border="1">
		<tr align="center">
			<td>
				아이디
			</td>
			
			<td>
				<input type="text">
			</td>		
			
			<td>
				이름
			</td>
			
			<td>
				<input type="text">
			</td>		
			
			<td>
				전화번호
			</td>
			
			<td>
				<input type="text">
			</td>
			
			<td rowspan="3">
				<input type="button" value="검색">
			</td>
						
		</tr>	
		<tr>
			<td colspan="6">
				
			</td>
		</tr>
		<tr>
			<td>
				핸드폰
			</td>
			
			<td>
				<input type="text">
			</td>
			
			<td>
				생일
			</td>
			
			<td>
				<input type="text">
			</td>
		</tr>	
		
	</table>
	<br><br>
	
	<table border="1">
		<tr>
			<td>
				아이디
			</td>
			
			<td>
				비밀번호
			</td>
						
			<td>
				이름
			</td>
								
			<td>
				전화번호
			</td>
				
			<td>
				핸드폰
			</td>

	
			<td>
				주소
			</td>
		
			<td>
				생일
			</td>		
			
			<td>
				성별
			</td>
			
			<td>
				가입일
			</td>			
			
			<td>
				관리
			</td>
		</tr>	
		
		<tr>
			<td>
				kmj22233
			</td>
						
			<td>
				1234
			</td>
								
			<td>
				김말자
			</td>
				
			<td>
				010-3341-3101
			</td>
			
			<td>
				010-3341-3101
			</td>
			
			<td>
				서울시 강남구 테헤란로
			</td>
			
			<td>
				1993-08-03
			</td>
			
			<td>
				남
			</td>
			
			<td>
				2018-10-15 14:57:57
			</td>
							
			<td>
				<a href="#" style="text-decoration: none;">수정</a>/<a href="#" style="text-decoration: none;">삭제</a>
			</td>
		</tr>
		
	</table>
	

</body>
</html>