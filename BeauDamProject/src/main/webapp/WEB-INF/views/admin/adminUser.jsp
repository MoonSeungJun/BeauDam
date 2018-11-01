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
	
	
	function deleteMember(id) {
		
		if(confirm("삭제한 회원의 정보는 복구할 수 없습니다.") == true){
			$.ajax({				
				type:'post',
				data: {'id':id},
				url: 'adminMemberDelete.action',
				success: function() {
					alert("삭제되었습니다.");
					window.location.href = "/beaudam/adminUser.action";
					
				},
				error: function() {
					alert("삭제할 수 없습니다.");
				}				
			});
			
		}else{
			return;
		}	
		
	}
	
	
	

</script>
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
<div class="wrapper">
<h2 class="text-center">회원조회</h2>
<hr>
<form action="" method="post" name="userSearchForm">
	<table border="1" style="margin: 0 auto;">
		<tr align="center">
			<td class="title">아이디</td>
			<td><input type="text" id="id" name="id" style="border: none;" onkeydown="if(event.keyCode == 13) searchMember();"></td>
			<td class="title">이름</td>
			<td><input type="text" id="name" name="name" style="border: none;" onkeydown="if(event.keyCode == 13) searchMember();"></td>
			<td class="title">전화번호</td>
			<td><input type="text" id="tel" name="tel" style="border: none;"onkeydown="if(event.keyCode == 13) searchMember();"></td>
		</tr>
		<tr>
			<td colspan="6"></td>
		</tr>
		<tr>
			<td class="title">핸드폰</td>
			<td><input type="text" id="cellphone" name="cellphone" style="border: none;"onkeydown="if(event.keyCode == 13) searchMember();"></td>
			<td class="title">생일</td>
			<td><input type="text" id="birth" name="birth" style="border: none;"onkeydown="if(event.keyCode == 13) searchMember();"></td>
			<td colspan="2" style="text-align: right;">
				<button type="button" id="searchButton" onclick="searchMember();" value="ok" style="width: 60%">검색</button>
			</td>
		</tr>

	</table>
</form>
	<br/>
	<br/>

	<table border="1" id="listTable" style="margin: 0 auto; text-align: center;">
		<tr>

			<td class="title">아이디</td>
			<td class="title">비밀번호</td>
			<td class="title">이름</td>
			<td class="title">전화번호</td>
			<td class="title">핸드폰</td>
			<td class="title" style="width: 200px">주소</td>
			<td class="title">생일</td>
			<td class="title" style="width: 50px">성별</td>
			<td class="title">가입일</td>
			<td class="title" style="width: 70px; text-align: center;">탈퇴여부</td>
			<td class="title">관리</td>

		</tr>

		<c:if test="${!empty memberList }">
			<c:forEach var="dto" items="${memberList }">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.pwd }</td>
					<td>${dto.name }</td>
					<td>${dto.tel }</td>
					<td>${dto.cellphone }</td>
					<td style="width: 200px">${dto.zip } ${dto.city } ${dto.street }</td>
					<td>${dto.birth }</td>
					<td style="width: 50px">${dto.gender }</td>					
					<td>${dto.created }</td>
					<c:if test="${dto.isLeave eq 1 }">
						<td style="width: 70px; text-align: center;">탈퇴</td>	
					</c:if>
					<c:if test="${dto.isLeave ne 1 }">
						<td style="width: 70px; text-align: center;">-</td>	
					</c:if>
					<td><a href="javascript:void(0)" style="text-decoration: none;" onclick="deleteMember('${dto.id}');">삭제</a></td>
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
					<td><a href="#" style="text-decoration: none;" onclick="deleteMember('${dto.id}');">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
			
		
	
	</table>
</div>
</body>
</html>