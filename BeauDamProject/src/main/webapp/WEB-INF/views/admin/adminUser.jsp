<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% %>
=======
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
>>>>>>> bb4ac565b18eb8f8da799ee307be6ab8ab409128
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {	
		
		var id =$("#id").val();
		var name =$("#name").val();
		var tel =$("#tel").val();
		var cellphone =$("#cellphone").val();
		var birth =$("#birth").val();
		
		var allData ={"id":id, "name":name,"tel":tel,"cellphone":cellphone,"birth":birth};
		
		$('#searchButton').click(function searchMember() {
			$.ajax({
				type : 'post',
				url : '/beaudam/adminUser.action',
				data : allData,
				dataType : "text",
				error: function(error) {
					console.log(error.responseText);
				},
				success : function(data) {					
					alert("ok");
					/* $.each(data, function(idx, val) {
						console.log(idx + " " + val.title);
					}); */
				}

			});

		});
	});
</script>
</head>
<body>

	<jsp:include page="adminHeader.jsp" />

	<h1>회원조회</h1>
	<br/>
	<br/>

=======
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<div class="wrapper">
<h1>회원조회</h1>
	<br><br>
>>>>>>> bb4ac565b18eb8f8da799ee307be6ab8ab409128
	<table border="1">
		<tr align="center">
			<td>아이디</td>
			<td><input type="text" id="id" name="id"></td>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
			<td>전화번호</td>
			<td><input type="text" id="tel" name="tel"></td>
			<td rowspan="3">
				<button type="button" id="searchButton" onclick="" value="ok">검색</button>
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
			<td>관리</td>
		</tr>

		<c:if test="${!empty memberList }">
		
<<<<<<< HEAD
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
					<td><a href="#" style="text-decoration: none;">수정</a>/<a
						href="#" style="text-decoration: none;">삭제</a></td>
				</tr>
			</c:forEach>
			
		</c:if>
	
	</table>










=======
	</table>
	</div>
>>>>>>> bb4ac565b18eb8f8da799ee307be6ab8ab409128

<%-- 			<c:if test="${!empty memberList }"> --%>
<%-- 				<c:forEach var="dto" items="${memberList }"> --%>
<!-- 					<tr> -->
<%-- 						<td>${dto.id }</td> --%>
<%-- 						<td>${dto.pwd }</td> --%>
<%-- 						<td>${dto.name }</td> --%>
<%-- 						<td>${dto.tel }</td> --%>
<%-- 						<td>${dto.cellphone }</td> --%>
<%-- 						<td>${dto.zip } ${dto.city } ${dto.street }</td> --%>
<%-- 						<td>${dto.birth }</td> --%>
<%-- 						<td>${dto.gender }</td> --%>
<%-- 						<td>${dto.created }</td> --%>
<!-- 						<td><a href="#" style="text-decoration: none;">수정</a>/<a -->
<!-- 							href="#" style="text-decoration: none;">삭제</a></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${!empty searchMemberList }"> --%>
<%-- 				<c:forEach var="dto" items="${searchMemberList }"> --%>
<!-- 					<tr> -->
<%-- 						<td>${dto.id }</td> --%>
<%-- 						<td>${dto.pwd }</td> --%>
<%-- 						<td>${dto.name }</td> --%>
<%-- 						<td>${dto.tel }</td> --%>
<%-- 						<td>${dto.cellphone }</td> --%>
<%-- 						<td>${dto.zip } ${dto.city } ${dto.street }</td> --%>
<%-- 						<td>${dto.birth }</td> --%>
<%-- 						<td>${dto.gender }</td> --%>
<%-- 						<td>${dto.created }</td> --%>
<!-- 						<td><a href="#" style="text-decoration: none;">수정</a>/<a -->
<!-- 							href="#" style="text-decoration: none;">삭제</a></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:if> --%>
</body>
</html>