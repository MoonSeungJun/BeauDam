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
		
		var f = document.notificationListForm;
		
		f.action="<%=cp%>/notification.action";
		f.submit();
				
	}

	//1:1문의연결팝업
    function popupOpen(){

	var popUrl = "inquire.action";	//팝업창에 출력될 페이지 URL

	var popOption = "width=600, height=490, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
	

</script>
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
		<!-- 공지사항 게시판 검색창 -->
		<table style="margin: 10px 0 10px 10px; align-content: right;">
			<tr>
				<td>
					<select  name="searchKey" style="width: 90px;height: 24px;">
						<option value="subject">제목</option>
						<option value="content">내용</option>			
					</select>
					<input type="text" name="searchValue">		
				</td>
				<td>
					&nbsp;<input style="width: 80px;" type="button" value="검색" onclick="sendIt();">
				</td>
				
			</tr>
		</table>
		<!-- 공지사항 게시판 -->
		<table style="width: 100%; margin: 0 auto;" class="board">  
			<tr>			
			
<%-- 			<c:if test="${id ne 'admin' }"> --%>
<!-- 				<td align="right" colspan="3"> -->
<!-- 					&nbsp; -->
<!-- 				</td> -->
<%-- 			</c:if> --%>
			<c:if test="${empty id }">&nbsp;</c:if>
			</tr>
			<tr align="center" style="background-color: #F5F5DD;">
				<td style="width: 10%;">
				 	번호 			 	
				</td>
				<td style="width: 60%; text-align: left;">
					제목
				</td>
				<td style="width: 30%;">
					작성일
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
		<c:forEach var="dto" items="${lists }">
			<tr align="center" style="height: 50px;">
				<td>
					${dto.num }
				</td>
				<td style="text-align: left;">
					<a href="${articleUrl}&num=${dto.num}" style="text-decoration: none; color: black;">${dto.subject }</a></td>
				<td>
					${dto.created }
				</td>
				<td>
					&nbsp;
				</td>				
			</tr>
		</c:forEach>
			<tr align="center">
				<td colspan="3" align="center">
					<c:if test="${dataCount!=0 }">
						${pageIndexList }
						<c:if test="${id eq'admin' }">
							<td align="right" colspan="3">
								<input type="button" value="공지등록" onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
							</td>
						</c:if>
					</c:if>
					<c:if test="${dataCount==0 }">
						등록된 공지가 없습니다.
						<c:if test="${id eq'admin' }">
							<td align="right" colspan="3">
								<input type="button" value="공지등록" onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
							</td>
						</c:if>						
					</c:if>
				</td>
			
			</tr>
		</table>
		</form>
	</div>
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>