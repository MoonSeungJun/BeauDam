<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">-->
    <link rel="stylesheet" href="admin.css">
     <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <div class="header_wrapper">
            <div class="logo">
                <ul class="top">
                    <li><input type="button" value="로그아웃" style="text-align: right;"></li>
                    <li>admin님이 로그인중입니다.</li>
                </ul>
                <a style="text-decoration: none; color: black;" href="" >뷰티를 담다 뷰ː담</a>
            </div>
            
        <div class="header">
            <div class="dropdown">
                <button class="dropdown-toggle category btn" type="button" data-toggle="dropdown" style="margin-right: 30px; margin-left: 30px; background-color: gainsboro; font-size: 15px; font-weight: bold;">상품
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">조회/관리</a></li>
                    <li><a href="#">등록</a></li>
                </ul>
                <a class="category" style="text-decoration: none;">회원</a>
                <a class="category"  style="text-decoration: none;">주문</a>
                <a class="category"  style="text-decoration: none;">브랜드/카테고리</a>
                <a class="category"  style="text-decoration: none;">매출</a>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <h3>상품조회</h3>
        <hr>
	<table border="1" class="product">
		<tr>
			<td class="title">
				코드
			</td>
			<td colspan="3" style="text-align: center; ">
				<input type="text" name="code" style="width: 100%; border: none;">
			</td>
		</tr>
		<tr>
			<td class="title">
				브랜드
            </td>
			<td style="width: 150px;">
				<select style="width: 100%; border: none;">
					<option>에뛰드</option>
					<option>홀리카홀리카</option>
					<option>이니스프리</option>					
				</select>
			</td>
			<td class="title">
				 분류				
			</td>
			<td style="text-align: center;">
				<select style="border: none; width: 100px;">
					<option>Lib</option>
					<option>Eye</option>
					<option>Face</option>					
				</select>
				<select style="border: none; width: 100px;">
					<option>Balm</option>
					<option>Gluds</option>
					<option>Tint</option>					
				</select>
			</td>	
		</tr>	
		<tr>
			<td class="title">
				상품명
			</td>
			<td colspan="3">
				<input type="text" style="border: none;">
            </td>
		</tr>	
	</table>
    <div style="width: 660px;  text-align: right;">
        <input type="button" value="조회">
    </div>
    <hr>
	<table border="1" style="text-align: center;">
		<tr>
			<td class="title">
				코드
			</td>
			
			<td class="title">
				브랜드
			</td>
			
			<td class="title">
				카테코리
			</td>
			
			<td class="title">
				타입
			</td>
			
			<td class="title">
				상품명
			</td>
			
			<td style="width: 80px;">
				가격
			</td>
			
			<td class="title" style="width: 80px;">
				재고
			</td>
			
			<td class="title">
				관리
			</td>
		</tr>
		
		<tr align="center">
			<td>
				2012012
			</td>
			
			<td>
				<input type="text" value="에뛰드" style="border: none;">
			</td>
			
			<td>
				<input type="text" value="Lib" style="border: none;">
			</td>
			
			<td>
				<input type="text" value="Balm" style="border: none;">
			</td>
			
			<td>
				<input type="text" value="산호초 발색 레드립밤" style="border: none;">
			</td>
			
			<td>
			 	<input type="text" value="3500" style="border: none;">
			</td>
			
			<td>
				<input type="text" value="232" style="border: none;">
			</td>
			
			<td>
				<a href="" style="text-decoration: none;">수정</a>/<a href="" style="text-decoration: none;">삭제</a>
			</td>
		</tr>
		
	</table>
	</div>
</body>
</html>