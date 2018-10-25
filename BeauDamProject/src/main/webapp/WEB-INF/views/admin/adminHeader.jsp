<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function goMain() {
		
		
		
		
		
		
		
		
		
	}
	
	


</script>
<title>Insert title here</title>
</head>
<body>
    <div class="header_wrapper">
            <div class="logo">
                <ul class="top">
                    <li><input type="button" value="로그아웃" style="text-align: right;" onclick="goMain();"></li>
                    <li>admin님이 로그인중입니다.</li>
                </ul>
                <a style="text-decoration: none; color: black;" href="main.action" >뷰티를 담다 뷰ː담</a>
            </div>
            
        <div class="header">
            <div class="dropdown">
                <button class="dropdown-toggle category btn" type="button" data-toggle="dropdown" style="margin-right: 30px; margin-left: 30px; background-color: gainsboro; font-size: 15px; font-weight: bold;">상품
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="adminProduct.action">조회/관리</a></li>
                    <li><a href="adminProduct_new.action">등록</a></li>
                </ul>
                <a class="category" style="text-decoration: none;" href="adminUser.action">회원</a>
                <a class="category"  style="text-decoration: none;" href="adminOrder.action">주문</a>
                <a class="category"  style="text-decoration: none;" href="adminBrand.action">브랜드/카테고리</a>
                <a class="category"  style="text-decoration: none;" href="adminSales.action">매출</a>
            </div>
        </div>
    </div>
</body>
</html>