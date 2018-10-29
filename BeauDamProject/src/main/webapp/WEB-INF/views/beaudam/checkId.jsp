<!-- 제작자 : 허도휘 -->

<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<style type="text/css">
@font-face { 
	font-family: 'designhouseOTFLight00'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/designhouseOTFLight00.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; }
	
@font-face { 
	font-family: 'SeoulHangangM'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulHangangM.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; }

input {
	font-family: SeoulHangangM;
	font-size: 12pt;
	height: 20px;
	text-align: left;
}

button {
	height: 35px;
	font-family: SeoulHangangM;
	border-style: none;
	font-weight: bold;
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function Ok(){
		
		var f = document.id_chk_form;
		
		opener.registerForm.id.value = f.ck_id.value;
		opener.registerForm.ok.value = 1;
		opener.registerForm.id.style.background="#BDBDBD";
		
		window.close();
		
	}
	
	function change(){
		
		var f = document.id_chk_form;
		f.ck_id.focus();
		
	}
</script>
</head>
<body style="font-family: SeoulHangangM">

	<div style="text-align: center; vertical-align: center; margin-top: 45px;">
		<form name="id_chk_form" method="post" action="<%=cp%>/checkId.action">
		
			아이디 ｜ 
			<input type="text" name="ck_id" value="${ck_id }"/> 			
			<button type="submit" >입력</button><br/>
			
		<c:if test="${flag=='true'}">
			<div style="color: red; margin-top: 20px;"
			onload="change();">
				이미 사용중인 ID입니다<br/>
				다시 입력해주세요
			</div>
		</c:if>
		<c:if test="${flag=='false'}">
			<div style="color: green; margin-top: 20px;">
				사용가능한 ID입니다
			</div>
			<div style="margin-top: 20px;">
				<button type="button" onclick="Ok();">확인</button>
			</div>
		</c:if>
		</form>
	</div>
	
</body>
</html>