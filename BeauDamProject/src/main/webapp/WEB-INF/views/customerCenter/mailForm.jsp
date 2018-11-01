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
<title>1:1 상담 문의</title>
<style type="text/css">
@font-face {
	font-family: 'designhouseOTFLight00';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/designhouseOTFLight00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'WONBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/WONBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

html, body, div, h1, h2, h3 {
padding: 0;
margin: 0;

}

input {
border: none;
text-indent: 1em;
height: 30px;
width: 100%;
}

.mail {
margin: 0 auto;
width: 100%;
}

.mail td {
font-weight: bold;
font-family: 'designhouseOTFLight00';
font-size: 20px;
text-align: center;
}

</style>
</head>
<body>
	<form action="send" method="post">
		<!-- 이메일 <input type="email" name="receiver" placeholder="abc@abc.com"/><br/> -->
		<div style="padding: 30px; background-color: #F0EDE5;">
			<h1 style="margin-bottom: 20px; font-family: 'designhouseOTFLight00'; text-align: center;">뷰티를 담다 뷰ː담</h1>
			<h2 style="font-family: 'designhouseOTFLight00'; text-align: center; margin-bottom: 5px;">1:1 상담 문의</h2>
			<h3 style="font-family: 'designhouseOTFLight00'; text-align: center; margin-bottom: 30px; color: #DC4C46;">고객님의 소중한 의견을 적극 반영하겠습니다 ♥</h3>
			<div style="border: 2px dashed #ddd; padding: 20px; width: 500px;">
				<table class="mail">
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" /></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email" placeholder="답변받을 이메일을 입력하세요! [abc@abc.com]"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="5" cols="30" name="content" style="border: none; width: 100%;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="문의하기" style="width: 20%; text-align: center;"></td>
					</tr>
				</table>
			</div>
		</div>	
	</form>
</body>
</html>