<!-- 제작자 : 허도휘 -->

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
<title>아이디/비밀번호 찾기｜뷰담</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400"
	rel="stylesheet">
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
	font-family: 'SeoulHangangM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulHangangM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#container {
	padding-bottom: 80px;
	margin: 0 auto;
	width: 1200px;
}

.title_style {
	overflow: hidden;
	text-align: center;
}

.title_style h3 {
	font-family: 'designhouseOTFLight00';
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

a {
	color: grey;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	function searchId(){
		
		var f = document.searchIdForm;
		
		if(!f.name.value){
			alert("\n이름을 입력하세요!");
			f.name.focus();
			return;			
		}
		
		if(!f.birth.value){
			alert("\n생년월일을 입력하세요!");
			f.birth.focus();
			return;			
		}
		
		var popupX = (window.screen.width/2)-(400/2);
		var popupY= (window.screen.height/2)-200;
		
		window.open("<%=cp%>/searchId.action?name="+f.name.value+"&birth="+f.birth.value,
				'아이디 찾기',
				'width=400, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=no, left='
				+ popupX 
				+ ', top=' + popupY 
				+ ', screenX=' + popupX 
				+ ', screenY= '+ popupY);
		
	}
	
	function searchPwd(){
		
		var f = document.searchPwdForm;
		
		if(!f.id.value){
			alert("\n아이디를 입력하세요!");
			f.id.focus();
			return;			
		}
		
		if(!f.name.value){
			alert("\n이름을 입력하세요!");
			f.name.focus();
			return;			
		}
		
		if(!f.email.value){
			alert("\n이메일을 입력하세요!");
			f.email.focus();
			return;			
		}
		
		var popupX = (window.screen.width/2)-(400/2);
		var popupY= (window.screen.height/2)-200;
		
		window.open("<%=cp%>/searchPwd.action?searchId="+f.id.value+"&name="+f.name.value+"&email="+f.email.value,
				'아이디 찾기',
				'width=400, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=no, left='
				+ popupX 
				+ ', top=' + popupY 
				+ ', screenX=' + popupX 
				+ ', screenY= '+ popupY);
		
	}

</script>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container">
		<div class="title_style">
			<div>
				<a href="<%=cp %>/main.action"
					style="text-decoration: none; color: black;"><h3>뷰티를 담다
						뷰ː담</h3></a>
				<h2 style="font-family: designhouseOTFLight00">아이디 / 비밀번호 찾기</h2>
				<p style="font-family: Black Han Sans">Membership</p>
			</div>
		</div>

		<div style="width: 1000px; overflow: hidden; margin: 0 auto; padding-top: 30px">
			<div style="width: 400px; margin: 0 auto; float: left; border-right: medium;">
				<h2 style="font-family: designhouseOTFLight00; text-align: center;">아이디
					찾기</h2>
				<hr/>
				<form name="searchIdForm" method="post">
					<table style="width: 100%">
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>이름</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="name" style="width: 200ox; height: 28px" />
							</td>
						</tr>
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>생년월일</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="birth" placeholder="예) 2000-01-01" style="width: 200ox; height: 28px" />
							</td>
						</tr>
					</table>

					<hr/>
					<br/>


					<div align="right" style="margin-bottom: 30px">
						<button type="button" onclick="searchId();" style="width: 184.5px; height: 40px; border-style: none;">
							확인
						</button>
					</div>

				</form>

				<h4>
					· 아직 뷰담인이 아니라면 <a href="<%=cp %>/newTerm.action"
						style="float: right;">회원가입</a>
				</h4>
			</div>
			<div style="width: 400px; margin: 0 auto; float: right; border-right: medium;">
				<h2 style="font-family: designhouseOTFLight00; text-align: center;">비밀번호 찾기</h2>
				<hr/>
				<form name="searchPwdForm" method="post">
					<table style="width: 100%">
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>아이디</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="id" style="width: 200ox; height: 28px" />
							</td>
						</tr>
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>이름</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="name" style="width: 200ox; height: 28px" />
							</td>
						</tr>
						<tr align="right">
							<td style="padding-left: 40px">
								<h4>이메일</h4>
							</td>
							<td style="padding-right: 40px">
								<input type="text" name="email" style="width: 200ox; height: 28px" />
							</td>
						</tr>
					</table>

					<hr/>
					<p style="color: gray;">· 회원가입 시 등록하신 이메일 주소를 입력해주시기 바랍니다.</p>

					<div align="right" style="margin-bottom: 30px">
						<button type="button" onclick="searchPwd();" style="width: 184.5px; height: 40px; border-style: none;">
							확인
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>