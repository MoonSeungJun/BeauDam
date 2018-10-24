<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function sendIt() {
		
		var f = document.notificationListForm;
		
		f.action="<%=cp%>/notification.action";
		f.submit();
		
		
	}


</script>



</head>
<body>
<div style="float: left; height: 240px;">
	<form action="" name="notificationListForm" method="post">
	<table border="1"  style="height: 100%;">  
		
		<tr>
			<td>
				<select name="searchKey" >
					<option value="subject">제목</option>
					<option value="content">내용</option>
								
				</select>
			</td>
			<td>
				<input type="text" name="searchValue"/>
			</td>
			
			<td>
				<input type="button" value="검색" 
				onclick="sendIt();">
			</td>
			
		</tr>
		
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td>
				${dto.num }
			</td>
			
			<td>
			<a href="${articleUrl}&num=${dto.num}">
				${dto.subject }</a></td>
			
			<td>
				${dto.created }
			</td>		
		</tr>
		</c:forEach>
		
		<tr align="center">
			<td colspan="3" align="center">
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된 공지가 없습니다.
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="button" value="공지등록하기" 
				onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
			</td>	
		</tr>
	</table>
</form>
</div>
</body>
</html>