<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/admin/admin.css">
</head>
<body>

<jsp:include page="adminHeader.jsp"/>

<div class="wrapper">
	<h2 class="text-center">Admin Sale Page</h2>
	<hr>
	<div style="margin: 0 auto; text-align: center; overflow: hidden;">
		<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">주간</h3>
				</td>
			</tr>
			<tr>		
				<td>
					일				
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					월				
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					화	
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					수				
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					목
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					금	
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					토
				</td>
				<td>
					15000
				</td>
			</tr>
		</table>

		<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">월간</h3>
				</td>
			</tr>
			<tr>		
				<td>
					JAN				
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					FEB			
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					MAR	
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					APR				
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					MAY
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					JUN	
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					JUL
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					AUG
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					SEP
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					OCT
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					NOV
				</td>
				<td>
					15000
				</td>
			</tr>
			<tr>		
				<td>
					DEC
				</td>
				<td>
					15000
				</td>
			</tr>
		</table>

		<table border="1" style="margin: 10px; float: left; width: 30%;">
			<tr>
				<td colspan="2" style="background-color: gainsboro">
					<h3 style="margin: 0px; padding: 3px;">연간</h3>
				</td>
			</tr>
			<tr>
				<td>
					2017
				</td>
				<td>
					15000			
				</td>
			</tr>
			<tr>
				<td>
					2018
				</td>
				<td>
					15000
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>