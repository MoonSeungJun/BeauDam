<!-- 제작자 : 서영진 + 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원로그인｜뷰담</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
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
		
#container {
    padding-bottom: 80px;
    margin: 0 auto;
    width: 800px;
}

.title_style {
    overflow: hidden;
    text-align: center;
    height: 150px;
}

.title_style h2 {
    font-size: 60px;
    font-weight: 100;
    letter-spacing: -3px;
    line-height: 60px;
    margin-top: 26px;
    margin-bottom: 16px;
    height: 60px;
}

.title_area {
    margin: 0 auto;
    width: 1200px;
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

a{
	color: grey;
	text-decoration: none;
}

a:hover{
	text-decoration: underline;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	function f_login(){
		
		var f = document.loginForm;
		var str = f.id.value;
		
		if(!str){
			alert("\n아이디를 입력하세요!");
			str.focus();
			return;			
		}
		
		var str = f.password.value;
		
		if(!str){
			alert("\n비밀번호를 입력하세요!");
			str.focus();
			return;			
		}
		
		f.action = "<%=cp%>/login_ok.action";
		f.submit();
		
	}

</script>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container">
			<div class="title_style">
				<div>
					<h2 style="font-family: designhouseOTFLight00">로그인</h2>
					<p style="font-family: Black Han Sans">Membership</p>
				</div>
			</div>
			
			<div style="width: 500px; padding: 0 19px; margin: 0 auto;">
				<div style="height: 20px; text-align: center;">
					<h5 style="color: red">${message }</h5>
				</div>

				<hr/>
				<form name="loginForm" method="post" action="">
					<table style="width: 100%">
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>아이디</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="id" style="width: 200ox; height: 28px"/>
							</td>
						</tr>
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>비밀번호</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="password" name="password" style="width: 200ox; height: 28px"/>
							</td>
						</tr>				
					</table>
					
					<hr/><br/>
					
					
					<div align="center" style="margin-bottom: 30px">
						<button type="button" onclick="f_login();" style="width: 184.5px; height: 40px; border-style: none;">
							로그인
						</button>
						<a href="${url}">
							<img src="<%=cp %>/resources/image/beaudam/login/naver_login.PNG" height=40/>
						</a>
					</div>
				
				</form>
				
				<h4>· 아직 뷰담인이 아니라면
				<a href="<%=cp %>/newTerm.action" style="float: right;">회원가입</a>
				</h4>
				<h4>· 아이디나 비밀번호가 기억이 안나신다면 
				<a href="" style="float: right;">아이디 / 비밀번호 찾기</a>
				</h4>
			</div>
			
	</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>