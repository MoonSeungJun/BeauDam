<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cp = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
}

.title_style {
    overflow: hidden;
    text-align: center;
    height: 200px;
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
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

function checkPwd(){
	
	var f = document.CheckForm;
	
	if(!f.chkPwd.value){
		
		alert("\n비밀번호를 입력해주세요!");
		f.chkPwd.focus();
		return;
		
	}
	
	f.action = "<%=cp%>/myInfo.action";
	f.submit();
	
}

</script>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container" style="width: 800px;  margin: 0 auto">
			<div class="title_style">
				<div>
					<a href="<%=cp %>/main.action" style="text-decoration: none; color: black; font-family: 'designhouseOTFLight00';"><h3>뷰티를 담다 뷰ː담</h3></a> 
					<h2 style="font-family: designhouseOTFLight00">회원정보</h2>
					<p style="font-family: Black Han Sans">My INFO</p>
				</div>
			</div>
			
			<div style="padding: 0 19px; margin: 0 auto;">
				<h3>회원정보수정</h3>
				<div style="box-sizing: border-box; margin: 0 auto; padding: 23px 30px 25px 28px;
				background-color: #f4f7f8; border: 1px solid #e4eaed">
					<h3>회원정보를 수정하기위해서는 비밀번호 입력이 필요합니다</h3>
					<p>· 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
					<p>· 비밀번호를 입력하시고 확인 버튼을 클릭해주세요.</p>
				</div>
				<br/><br/>
				<hr/>
				
				<form name="CheckForm" method="post">
					<table style="width: 100%">
						<tr>
							<td style="padding-left: 20px"><h4>아이디</h4></td>
							<td><h4>${id }</h4></td>
						</tr>
						<tr>
							<td style="padding-left: 20px"><h4>비밀번호</h4></td>
							<td><input type="password" name="chkPwd" style="width: 200ox; height: 28px"></td>
						</tr>				
					
					</table>
					<br/>
					<button type="button" onclick="checkPwd();" 
					style="float: right; height: 40px; border-style: none;">회원정보수정</button>
				</form>
			</div>
			
	</div>
		

		
</body>
</html>