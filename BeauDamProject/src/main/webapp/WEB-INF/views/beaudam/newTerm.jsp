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
<title>회원가입｜뷰담</title>
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

input {
	font-family: SeoulHangangM;
	font-size: 12pt;
	height: 20px;
	text-align: left;
}

select {
	font-family: SeoulHangangM;
	font-size: 12pt;
	height: 30px;
	text-align: center;
}

tr {
	height: 40px;
}

button {
	height: 35px;
	font-family: SeoulHangangM;
	border-style: none;
	font-weight: bold;
	font-size: 14pt;
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}

</style>

<script type="text/javascript">

/* 체크박스 전체선택, 전체해제 */

   $(document).ready(function(){
       $("#chk").change(function(){
           if($("#chk").prop("checked")){
        	   for(i=0; i < termForm.chk_e.length; i++) {
        		   termForm.chk_e[i].prop('checked', true);
        	   }
           }else{
        	   for(i=0; i < termForm.chk_e.length; i++) {
        		   termForm.chk_e[i].prop('checked', false);
				}
           }
       });
   });

</script>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container">
			<div class="title_style">
				<div>
					<h2 style="font-family: designhouseOTFLight00">약관동의</h2>
					<p style="font-family: Black Han Sans">Agree Terms And Condition</p>
					<p style="color: grey">회원가입을 위해서 아래 이용약관 및 개인정보 수집 및 이용에 대한 약관을 읽고 동의해주세요.</p>
				</div>
			</div>
			
			<form name="termForm">
				<div style="width: 1000px; margin: 0 auto">				
					<h3 style="float: left">본 약관 전체를 동의합니다</h3>
					<h3 style="float: right;"><input type="checkbox" id="chk"/>
						전체동의
					</h3>
					<hr style="width: 1000px">
					<div style="box-sizing: border-box; padding: 13px 30px 25px 28px; background-color: #f4f7f8; border: 1px solid #e4eaed; height: 300px">
						<iframe src="<%=cp %>/resources/assets/membership.html" width="100%" height="100%" frameborder="0" class="iframe_provision" title="더샘 통합멤버십 이용약관">
						</iframe>
					</div>
					
					<h4 style="float: right;"><input type="checkbox" name="chk_e"/>본 약관에 동의합니다</h4>
					<div style="height: 80px;"></div>
					
					<div style="box-sizing: border-box; padding: 13px 30px 25px 28px; background-color: #f4f7f8; border: 1px solid #e4eaed; height: 230px">
						<iframe src="<%=cp %>/resources/assets/privacyList.html" width="100%" height="100%" frameborder="0" class="iframe_provision" title="더샘 통합멤버십 이용약관">
						</iframe>
					</div>
					
					<h4 style="float: right;"><input type="checkbox" name="chk_e"/>본 약관에 동의합니다</h4>
					<div style="height: 80px;"></div>
					
					<div style="box-sizing: border-box; padding: 13px 30px 25px 28px; background-color: #f4f7f8; border: 1px solid #e4eaed; height: 300px">
						<iframe src="<%=cp %>/resources/assets/privacyUse.html" width="100%" height="100%" frameborder="0" class="iframe_provision" title="더샘 통합멤버십 이용약관">
						</iframe>
					</div>
					
					<h4 style="float: right;"><input type="checkbox" name="chk_e"/>본 약관에 동의합니다</h4>
					<div style="height: 80px;"></div>				
	
	
					<div style="box-sizing: border-box; padding: 13px 30px 25px 28px; background-color: #f4f7f8; border: 1px solid #e4eaed; height: 340px">
						<iframe src="<%=cp %>/resources/assets/privacyTerm.html" width="100%" height="100%" frameborder="0" class="iframe_provision" title="더샘 통합멤버십 이용약관">
						</iframe>
					</div>
					
					<h4 style="float: right;"><input type="checkbox" name="chk_e"/>본 약관에 동의합니다</h4>
					<div style="height: 80px;"></div>						
				</div>
			</form>
			
			<br/>
			<div align="center" style="margin: 0 auto">
				<button type="button" onclick=
					"javascript:location.href='<%=cp %>/main.action'" style="width: 100px">취소</button>
				<button type="button" onclick=
					"javascript:location.href='<%=cp %>/newUser.action'" style="width: 100px">다음으로</button>
			</div>
	</div>
</body>
</html>