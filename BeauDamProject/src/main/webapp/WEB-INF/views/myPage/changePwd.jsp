<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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
	width: 100px;
	height: 30px;
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

tr {
	height: 30px;

}
</style>

<script type="text/javascript">

	function checkPwd() {
	
		var f = document.changePwdForm;
		var pw1 = f.newPwd.value;
		var pw2 = f.newPwd1.value;
		if (pw1 != pw2) {
	
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "불일치";
			
		} else {
			
			document.getElementById('checkPwd').style.color = "green";
			document.getElementById('checkPwd').innerHTML = "일치";
	
		}
	
	}
	
	function changeOk(){
		
		var f = document.changePwdForm;
		
		if(!f.newPwd.value){
			alert("새로운 비밀번호를 입력해주세요!");
			f.newPwd.focus();
			return;			
		}
		
		if(!f.newPwd1.value){
			alert("비밀번호 확인을 해주세요!");
			f.newPwd1.focus();
			return;					
		}
		
		if(f.newPwd.value != f.newPwd1.value){
			alert("비밀번호가 불일치합니다!");
			f.newPwd1.focus();
			return;				
		}
		
		opener.editForm.pwd.value=f.newPwd.value;
		window.close();
		
	}
	
</script>
</head>
<body style="font-family: SeoulHangangM">
	<form name="changePwdForm">
		<div style="margin: 0 auto; text-align: center; padding-top: 30px;">
			<table style="margin: 0 auto">
				<tr>
					<td align="left"><b>새로운 비밀번호</b></td>
					<td><input type="password" name="newPwd"/></td>
					<td width="60"></td>
				</tr>
				<tr>
					<td align="left"><b>비밀번호 확인</b></td>
					<td><input type="password" name="newPwd1" onkeyup="checkPwd();"/></td>
					<td><span id="checkPwd"></span></td>
				</tr>

				<tr align="right">
					<td colspan="3">
						<button type="button" onclick="changeOk();">확인</button>
					</td>
				</tr>
			</table>
			<br/>
		</div>
	</form>
</body>
</html>