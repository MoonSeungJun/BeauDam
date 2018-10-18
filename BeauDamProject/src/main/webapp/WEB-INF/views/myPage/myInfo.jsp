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
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container" style="width: 800px;  margin: 0 auto">
			<div class="title_style">
				<div>
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
				
				<table style="width: 100%">
					<tr>
						<td style="padding-left: 20px"><h4>아이디</h4></td>
						<td><h4>dohwi9406</h4></td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><h4>비밀번호</h4></td>
						<td><input type="text" style="width: 200ox; height: 28px"></td>
					</tr>				
				
				</table>
				<br/>
				<button type="button" onclick="javascript:location.href='<%=cp%>/myEdit.action'" 
				style="float: right; height: 40px; border-style: none;">회원정보수정</button>

			</div>
			
	</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>