<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
@font-face {
	font-family: 'SeoulHangangM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulHangangM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

button {
	height: 40px;
	font-family: SeoulHangangM;
	font-size: 12pt;
	border-style: none;
	font-weight: bold;
	vertical-align: top;
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function yesPwd(){
		
		opener.parent.location="login.action";
		window.close();
	
	}
	
	function noPwd(){
		
		opener.searchPwdForm.id.value="";
		opener.searchPwdForm.name.value="";
		opener.searchPwdForm.email.value="";
		window.close();
	
	}
</script>
</head>
<body style="font-family: SeoulHangangM">
	<div style="margin: 0 auto; text-align: center; padding-top: 30px;">
		<c:if test="${!empty resultPwd }">
		회원님의 비밀번호는 다음과 같습니다.<br/>
		<h2 style="font-weight: bold;'">[ ${resultPwd } ]</h2>
		<button type="button" onclick="yesPwd();">확인</button>
		</c:if>
		<c:if test="${empty resultPwd }">
		<h3 style="font-weight: bold;'">해당 정보와 일치하는 회원이<br/><br/> 존재하지 않습니다</h3>
		<button type="button" onclick="noPwd();">확인</button>
		</c:if>
	</div>
</body>
</html>