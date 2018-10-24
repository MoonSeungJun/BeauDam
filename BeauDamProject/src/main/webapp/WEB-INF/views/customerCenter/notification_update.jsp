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
<form action="" name="notificationEditForm" method="post">
	<div>
		<div>
			<dl>
				<dt>작성자</dt>
				<dd>
					운영자
				</dd>
			</dl>
		</div>
	</div>
	
	<div>
		<div>
			<dl>
				<dt>제목</dt>
				<dd>
					<input type="text" name="subject" value="${dto.subject }"/>
				</dd>
			</dl>
		</div>
	</div>
	
	
	
	<div>
		<div>
			<dl>
				<dt>내용</dt>
				<dd>
					<textarea rows="30" cols="50" name="content">${dto.content }</textarea>
				</dd>
			</dl>
		</div>
	</div>
	<div>
	<input type="hidden" name="num" value="${dto.num }"/>
	<input type="hidden" name="pageNum" value="${pageNum }"/>
		<input type="button" value="수정하기"
		onclick="sendIt();">
		
		<input type="button" value="작성취소"
		onclick="javascript:location.href='<%=cp%>/notification.action';"/>
	</div>
</form>	
</body>
</html>