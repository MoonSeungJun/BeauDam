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
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<br><br>
	<table border="0" align="center" width="40%">
		<tr>
			<td colspan="4" align="center"style="background-color: #F6F6F6;">
				${dto.subject }
			</td>
		</tr>
		
		<tr>
			<td align="center">
				작성자
			</td>
			<td align="center">
				${dto.id }
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			
			<td align="right">
				작성일 :  ${dto.created }
			</td>
		</tr>
		<tr style="height: 360px;">
			<td colspan="4" valign="top" style="background-color: #F6F6F6;">
				${dto.content }
			</td>
			
		</tr>
		<tr>
			<td colspan=44">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="수정"
						onclick="javascript:location.href='<%=cp%>/notification_update.action?num=${dto.num}&pageNum=${pageNum}'"/>
				
				<input type="button" value="삭제"
						onclick="javascript:location.href='<%=cp%>/notification_delete.action?num=${dto.num}&pageNum=${pageNum}'"/>
				
				<input type="button" value="취소"
						onclick="javascript:location.href='<%=cp%>/notification.action?${detail}'"/>
								
			</td>
		</tr>


</table>





</body>
</html>