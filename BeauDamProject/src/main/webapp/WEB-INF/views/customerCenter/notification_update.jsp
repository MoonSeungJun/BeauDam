<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		var f= document.notificationEditForm;
		var subVal = f.subject.value;
		var contVal = f.content.value;
		
		if(!subVal&&!contVal){
			alert("입력내용을 확인하세요")
		}
		
		f.action = "<%=cp%>/notification_update_ok.action"
		f.submit();
	}
	
	
	

</script>
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />

<form action="" name="notificationEditForm" method="post">
	<table border="1" align="center">
	
		<tr>
			<td>
				운영자
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
	
	
		<tr>
			<td align="center">
				제목
			</td>
			<td align="center">
				<input type="text" name="subject" style="width: 95%;" value="${dto.subject }"/>
			</td>
		</tr>
	
	
	
	<tr>
			<td valign="top" align="center">
				내용
			</td>
			<td>
				<textarea rows="10" cols="50" name="content">${dto.content }</textarea>
			</td>
		</tr>
		
		
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="pageNum" value="${pageNum }"/>
			<input type="button" value="수정하기"
			onclick="sendIt();">		
			<input type="button" value="작성취소"
			onclick="javascript:location.href='<%=cp%>/notification.action';"/>
		</td>
	</tr>
		

	</table>
</form>	
</body>
</html>