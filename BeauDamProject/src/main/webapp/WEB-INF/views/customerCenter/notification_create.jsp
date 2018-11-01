<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
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
<link rel="stylesheet" href="./resources/css/customerCenter/customCenter.css">
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
<div class="wrapper">
	<!-- 메뉴바 -->
	<div class="menubar">
		<div class="menu" style="width: 660px; margin: 50px auto;">
			<ul class="menu_ul" style="overflow: hidden;">
				<li style="border-left: 1px solid #ddd; background-image: url('/beaudam/resources/image/customerCenter/custom1.png');"><a href="<%=cp%>/notification.action">공지사항</a></li>
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom2.png');"><a href="<%=cp%>/faq.action">자주 묻는 질문</a></li>
			<c:if test="${!empty id }">
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png');"><a href="javascript:popupOpen();">1:1 상담 문의</a></li>
			</c:if>
			<c:if test="${empty id }"> 
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png');"><a data-toggle="tooltip" title="로그인이 필요합니다">1:1 상담 문의</a></li>
			</c:if>
			</ul>
		</div>
	</div>
	<h3 style="width: 90%; margin: 10px auto 0 auto;">공지사항</h3>
	<form action="" name="notificationCreateForm" method="post">
	<table style="width: 90%; margin: 30px auto; border-bottom: 1px solid #e4eaed; border-top: 1px solid #e4eaed;">
		<tr style="border-bottom: 1px solid #e4eaed;">
			<td align="center" style="padding: 10px; background-color: #F5F5DD;">
				운영자
			</td>
			<td>
				<input type="text" value="Admin" style="width: 100%; border: none; text-indent: 1em;">
			</td>
		</tr>
		
		<tr style="border-bottom: 1px solid #e4eaed;">
			<td align="center" style="padding: 10px; background-color: #F5F5DD;">
				제목
			</td>
			<td align="center">
				<input type="text" name="subject" style="width: 100%; border: none; text-indent: 1em;"/>
			</td>
		</tr>
		
		<tr style="border-bottom: 1px solid #e4eaed;">
			<td valign="top" align="center" style="padding: 10px; background-color: #F5F5DD;">
				내용
			</td>
			<td>
				<textarea rows="10" cols="50" name="content" style="width: 100%; resize: none; border: none; text-indent: 1em;"></textarea>
			</td>
		</tr>
	</table>
	<div style="margin: 20px auto; text-align: center;">
		<input type="button" value="등록하기" onclick="sendIt();" style="border: none;">
		<input type="button" value="작성취소" onclick="javascript:location.href='<%=cp%>/notification.action';" style="border: none;"/>
	</div>
</form>	
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>