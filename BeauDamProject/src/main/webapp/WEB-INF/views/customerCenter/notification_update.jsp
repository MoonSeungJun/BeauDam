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
		
		var f = document.notificationEditForm;
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
		
		f.action = "<%=cp%>/notification_update_ok.action";
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
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png'); cursor: default;"><a data-toggle="tooltip" title="로그인이 필요합니다">1:1 상담 문의</a></li>
			</c:if>
			</ul>
		</div>
	</div>
	<h3 style="width: 90%; margin: 10px auto 0 auto;">공지사항</h3>
	<div style="width: 90%; margin: 30px auto;">
		<form action="" name="notificationListForm" method="post">
		<!-- 공지사항 게시물 -->
		<table style="width: 80%; margin: 0 auto; border: 1px solid balck;" class="board">  
			<tr align="center" style="background-color: #F5F5DD;">
				<td style="width: 100%;" colspan="2">
				 	<input type="text" name="subject" style="width: 95%; background-color: #F5F5DD;" value="${dto.subject }"/> 			 	
				</td>
			</tr>
			<tr>
				<td style="text-align: right; margin-right: 30px;">
					${dto.id }&nbsp;|&nbsp;${dto.created }
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color: #f7f7f7; padding: 30px; height: 500px;" valign="top">
					<textarea rows="10" cols="50" name="content" style="border: none; background-color: #f7f7f7; resize: none; height: 500px; width: 100%;">${dto.content }</textarea>
				</td>
			</tr>
		</table>
		<div style="margin: 10px auto ; width: 100%; text-align: center;" class="article_button">
				<input type="hidden" name="num" value="${dto.num }" style="border: none;"/>
				<input type="hidden" name="pageNum" value="${pageNum }" style="border: none;"/>
				<input type="button" value="수정하기" onclick="sendIt();">		
				<input type="button" value="작성취소"onclick="javascript:location.href='<%=cp%>/notification.action';"/>
		</div>
		</form>
	</div>
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>