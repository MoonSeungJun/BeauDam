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
</head>
<body>

<form action="send" method="post">

<!-- 이메일 <input type="email" name="receiver" placeholder="abc@abc.com"/><br/> -->

제목 <input type="text" name="subject"/><br/>
아이디 <input type="text" name="id"/><br/>
이름 <input type="text" name="name"/><br/>
답변받을 이메일 주소 <input type="email" name="email" placeholder="abc@abc.com"><br/>
내용 <textarea rows="5" cols="30" name="content"></textarea><br/>
<input type="submit" value="문의하기"><br/>
</form>







</body>
</html>