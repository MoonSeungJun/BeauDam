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
		
		var f = document.notificationCreateForm;
		var subVal = f.subject.value;
		var contVal = f.content.value;
		
		subVal = subVal.trim();
		contVal = contVal.trim();
		
		if(!subVal){
			alert("제목을 확인해주세요")
			f.subject.focus();			
			return;
		}
		if(!contVal){
			alert("내용을 확인해주세요")
			f.content.focus();			
			return;
		}
		
		f.action = "<%=cp%>/notification_create_ok.action";
		f.submit();
		
	}
</script>
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
	<form action="" name="notificationCreateForm" method="post">
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
				<input type="text" name="subject" style="width: 95%;"/>
			</td>
		</tr>
		
		<tr>
			<td valign="top" align="center">
				내용
			</td>
			<td>
				<textarea rows="10" cols="50" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">	
	
		<input type="button" value="등록하기"
		onclick="sendIt();">
		
		<input type="button" value="작성취소"
		onclick="javascript:location.href='<%=cp%>/notification.action';"/>
			</td>
		</tr>

	</table>
</form>	
</body>
</html>