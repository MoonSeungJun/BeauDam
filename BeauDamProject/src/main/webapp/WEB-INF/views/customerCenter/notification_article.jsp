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
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />

<!-- /notification.action 고객센터 메인 -->

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
				 	${dto.subject } 			 	
				</td>
			</tr>
			<tr>
				<td style="text-align: right; margin-right: 30px;">
					${dto.id }&nbsp;|&nbsp;${dto.created }
				</td>
			</tr>
			<tr>
				<td colspan="4" style="background-color: #f7f7f7; padding: 30px; height: 500px;" valign="top">
					${dto.content }
				</td>
			</tr>
		</table>
		<div style="margin: 10px auto ; width: 100%; text-align: center;" class="article_button">
			<c:if test="${id eq'Admin' }">
				<input type="button" value="수정" onclick="javascript:location.href='<%=cp%>/notification_update.action?num=${dto.num}&pageNum=${pageNum}'" style="border: none;"/>
				<input type="button" value="삭제" onclick="javascript:location.href='<%=cp%>/notification_delete.action?num=${dto.num}&pageNum=${pageNum}'" style="border: none;"/>
			</c:if>
				<input type="button" value="뒤로가기" onclick="javascript:location.href='<%=cp%>/notification.action?${detail}'" style="border: none;"/>
		</div>
		</form>
	</div>
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>