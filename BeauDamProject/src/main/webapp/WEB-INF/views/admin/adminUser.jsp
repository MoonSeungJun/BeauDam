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

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
<script type="text/javascript">

	function searchMember() {
		
		var id = $('#id').val();
		var tel = $('#tel').val();
		var name = $('#name').val();
		var cellphone = $('#cellphone').val();
		var birth = $('#birth').val();
		
		var f = document.userSearchForm;
		
		f.action = 'adminUser.action';
		f.submit();
		
		
	}
	
	
	

</script>
</head>
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<div class="wrapper">
<h1>회원조회</h1>
	<br><br>
<form action="" method="post" name="userSearchForm">
	<table border="1">
		<tr align="center">
			<td>아이디</td>
			<td><input type="text" id="id" name="id"></td>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
			<td>전화번호</td>
			<td><input type="text" id="tel" name="tel"></td>
			<td rowspan="3">
				<button type="button" id="searchButton" onclick="searchMember();" value="ok">검색</button>
			</td>
		</tr>
		<tr>
			<td colspan="6"></td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><input type="text" id="cellphone" name="cellphone"></td>
			<td>생일</td>
			<td><input type="text" id="birth" name="birth"></td>
		</tr>

	</table>
</form>
	<br/>
	<br/>

	<table border="1" id="listTable">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>핸드폰</td>
			<td>주소</td>
			<td>생일</td>
			<td>성별</td>
			<td>가입일</td>
			<td>탈퇴여부</td>
			<td>관리</td>
		</tr>

		<c:if test="${!empty memberList }">
			<c:forEach var="dto" items="${memberList }">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.pwd }</td>
					<td>${dto.name }</td>
					<td>${dto.tel }</td>
					<td>${dto.cellphone }</td>
					<td>${dto.zip } ${dto.city } ${dto.street }</td>
					<td>${dto.birth }</td>
					<td>${dto.gender }</td>					
					<td>${dto.created }</td>
					<c:if test="${dto.isLeave eq 1 }">
						<td>탈퇴</td>	
					</c:if>
					<c:if test="${dto.isLeave ne 1 }">
						<td>-</td>	
					</c:if>
					<td><a href="#" style="text-decoration: none;">수정</a>/<a
						href="#" style="text-decoration: none;">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty memberList }">
			<c:forEach var="dto" items="${searchList }">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.pwd }</td>
					<td>${dto.name }</td>
					<td>${dto.tel }</td>
					<td>${dto.cellphone }</td>
					<td>${dto.zip } ${dto.city } ${dto.street }</td>
					<td>${dto.birth }</td>
					<td>${dto.gender }</td>				
					<td>${dto.created }</td>
					<c:if test="${dto.isLeave eq 1 }">
						<td>탈퇴</td>	
					</c:if>
					<c:if test="${dto.isLeave ne 1 }">
						<td>-</td>	
					</c:if>
					<td><a href="#" style="text-decoration: none;">수정</a>/
					<a href="#" style="text-decoration: none;">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
			
		
	
	</table>
</div>
</body>
</html>