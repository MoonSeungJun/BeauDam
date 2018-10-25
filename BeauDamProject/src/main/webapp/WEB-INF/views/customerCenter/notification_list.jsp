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

	//1:1문의연결팝업
    function popupOpen(){

	var popUrl = "inquire.action";	//팝업창에 출력될 페이지 URL

	var popOption = "width=780, height=780, resizable=yes, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
	

</script>



</head>
<body>
<!-- 윗부분 -->
<div>
	<table border="1" align="center" style="width:25% " >
		<tr align="center">
			<td align="center">
				HOME ><a href="notification.action">고객센터</a> > 공지사항
			</td>
		</tr>
		
		<tr align="center">
			<td align="center">
				공지사항<br>
				Customer Center
			</td>
		</tr>
			
	</table>
</div>

<br><br>
<!-- 왼쪽 사이드 메뉴바 -->

<div style="float: left; margin-left: 33%; margin-right: 10px; height: 240px;">
	<table border="1" align="center" style="height: 100%;">
		<tr>
			<td>
			  <a href="notification.action">공지사항</a>
			</td>
								
		</tr>		
		
		<tr>
			<td>
			 <a href="javascript:popupOpen();" > 1:1문의 </a>
			 </td>	
		</tr>
		
		<tr>
			<td>
			  <a href="faq.action">자주묻는질문</a>
			</td>
					
						
		</tr>
		
		<tr>
			<td>
			  매장안내
			</td>
									
		</tr>
		
		<tr>
			<td>
			  찾아오시는길
			</td>
						
		</tr>
		
		<tr>
			<td>
			  쇼핑몰 이용 안내
			</td>	
		</tr>
		
		<tr>
			<td>
			  뷰담 문의 안내
			</td> 
			
		</tr>
		
		<tr>
			<td>
			  매장 입점 문의
			</td>
		</tr>
		
	</table>
</div>

<div style="float: left; height: 255px;width: 30%;">
	<form action="" name="notificationListForm" method="post">
	<table border="1"  style="height: 100%; width: 100%;" >  
		
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
		<tr style="height: 35px;">
			<td colspan="3" align="right">
				<input type="button" value="공지등록하기" 
				onclick="javascript:location.href='<%=cp%>/notification_create.action';"/>
			</td>	
		</tr>
	</table>
</form>
</div>
</body>
</html>