<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	var popOption = "width=300, height=300, resizable=yes, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
	}
</script>
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<<<<<<< HEAD
<div >
	<table border="0" align="center" style="width:25% ">
		<tr align="center">
			<td align="center">
				HOME ><a href="notification.action">고객센터</a> > 공지사항
			</td>
		</tr>
		
		<tr align="center">
			<td align="center">
				공지사항<br>

			</td>
		</tr>
			
	</table>
</div>

<br><br>
<!-- 왼쪽 사이드 메뉴바 -->

<div style="float: left;margin-left:260px; margin-right: 30px; height: auto; width: 260px;">
	<table border="1" align="center" style="height: 100%; width: 100%;">

		<tr style="height: 55px;">

			<td align="center">
			  <a href="notification.action">공지사항</a>
			</td>
								
		</tr>		
		

		<tr style="height: 55px;">
		<c:if test="${!empty id }">
			<td align="center">
			 <a href="javascript:popupOpen();" > 1:1문의 </a>
			 </td>
		</c:if>
		<c:if test="${empty id }"> 
			 <td align="center">
			  1:1문의
			 </td>		
		</c:if> 		
		</tr>
		

		<tr style="height: 55px;">

			<td align="center">
			  <a href="faq.action">자주묻는질문</a>
			</td>
									
		</tr>
		
				
	</table>
</div>

<div style="float: left; height:auto;width: 52%;">
	<form action="" name="notificationListForm" method="post">

	<table border="0"  style="height: 100%; width: 100%;" >  
				
		<tr style="height: 50px;">
			
			<td colspan="2" align="right"valign="middle">
				<select  name="searchKey" style="width: 90px;height: 24px;">

					<option value="subject">제목</option>
					<option value="content">내용</option>
								
				</select>
				&nbsp;&nbsp;			
				<input style="width: 250px;" type="text" name="searchValue"/>
				&nbsp;
			</td>
			
			<td align="center" style="width: 96px;">
				<input style="width: 80px;" type="button" value="검색" onclick="sendIt();">
			</td>
			
			
		</tr>
		<tr align="center" style="height: 50px; background-color: #F5F5DD;">
			<td>
			 	번호 			 	
			</td>
			<td>
				제목
			</td>
			<td>
				작성일
			</td>
		</tr>
		
		
		<c:forEach var="dto" items="${lists }">

		<tr align="center">

		<tr align="center" style="height: 50px;">

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
		<tr>
			<td colspan="3">
				&nbsp;
			</td>
		</tr>
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
		<tr style="height: 35px;">
			<td colspan="2" align="right">
			</td>
			<c:if test="${id eq'Admin' }">
			<td align="center">
				<input type="button" value="공지등록" 
				onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
			</td>
			</c:if>	
			<c:if test="${empty id }">
=======

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
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png');"><a data-toggle="tooltip" title="로그인이 필요합니다">1:1 상담 문의</a></li>
			</c:if>
			</ul>
		</div>
	</div>
	<h3 style="width: 90%; margin: 10px auto 0 auto;">공지사항</h3>
	<div style="width: 90%; margin: 30px auto;">
		<form action="" name="notificationListForm" method="post">
		<!-- 공지사항 게시판 검색창 -->
		<table style="margin: 10px; align-content: right;">
			<tr>
>>>>>>> 김해나브랜치
				<td>
					<select  name="searchKey" style="width: 90px;height: 24px;">
						<option value="subject">제목</option>
						<option value="content">내용</option>			
					</select>
					<input type="text" name="searchValue">		
				</td>
				<td>
					&nbsp;&nbsp;<input style="width: 80px;" type="button" value="검색" onclick="sendIt();">
				</td>
			</tr>
		</table>
		<!-- 공지사항 게시판 -->
		<table class="board" style="width: 100%;" >
			<tr style="height: 50px; background-color: #F5F5DD; text-align: center;">
				<td style="width: 10%;">
				 	번호 			 	
				</td>
				<td style="width: 70%;">
					제목
				</td>
				<td style="width: 30%;">
					작성일
				</td>
			</tr>
			<c:forEach var="dto" items="${lists }">
			<tr align="center" style="height: 50px;">
				<td>
					${dto.num }
				</td>
				<td>
					<a href="${articleUrl}&num=${dto.num}">${dto.subject }</a>
				</td>
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
			<tr style="height: 35px;">
				<td colspan="2" align="right" style="border-bottom: none;">
				</td>
				<c:if test="${id eq'admin' }">
				<td align="center" style="border-bottom: none;">
					<input type="button" value="공지등록" 
					onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
				</td>
				</c:if>	
				<c:if test="${empty id }">
					<td style="border-bottom: none;">
						&nbsp;
					</td>
				</c:if>
			</tr>
		</table>
	</form>
	</div>
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>