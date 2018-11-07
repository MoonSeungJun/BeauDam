<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	
	function yap(){
		
		alert('해당 상품을 구매하신 고객님만 리뷰작성이 가능합니다!');
		
		location.href = "<%=cp%>/${url}";
		
	}


</script>
</head>
<body onload="yap();">

</body>
</html>