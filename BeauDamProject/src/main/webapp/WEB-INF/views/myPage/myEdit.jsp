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
}

button:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}


</style>
</head>
<body style="font-family: SeoulHangangM">

	<div id="container">
			<div class="title_style">
				<div>
					<a href="<%=cp %>/main.action" style="text-decoration: none; color: black; font-family: 'designhouseOTFLight00';"><h3>뷰티를 담다 뷰ː담</h3></a> 
					<h2 style="font-family: designhouseOTFLight00">회원정보수정</h2>
					<p style="font-family: Black Han Sans">Edit Information</p>
				</div>
			</div>
			
			<div style="width: 800px; margin: 0 auto">				
				<div style="box-sizing: border-box; padding: 23px 30px 25px 28px; background-color: #f4f7f8; border: 1px solid #e4eaed">
					<p>· 개명을 하신 회원님은 <b>고객센터</b>를 통해서 문의해주시기 바랍니다.</p>
				</div>
				<h3 style="float: left">정보수정</h3>
				<p style="color: red; float: right;"> * 필수입력사항</p>
				<hr style="width: 800px">
				<table style="width: 650px">
					<tr>
						<td width="150px" style="padding-left: 20px"><b>아이디</b></td>
						<td>dohwi9406</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>이름</b></td>
						<td><input type="text" value="허도휘" disabled="disabled"/></td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>닉네임</b></td>
						<td><input type="text" value="도비"/></td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>성별</b></td>
						<td>
							<input type="radio">남
							<input type="radio" checked="checked">여
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>생년월일</b></td>
						<td>
							<select>
								<option>1994년</option>								
							</select>
							<select>
								<option>06월</option>								
							</select>
							<select>
								<option>11일</option>								
							</select>
							<input type="radio" checked="checked">양력
							<input type="radio">음력
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>비밀번호</b></td>
						<td>
							<button type="button">비밀번호 변경</button>
							<!-- 비밀번호 변경 버튼을 누르면 모달로 현재 비밀번호,
							새 비밀번호, 새 비밀번호 입력을 받을꺼에욤!!! -->
						</td>
					</tr>
					<tr>
						<td rowspan="2" style="padding-left: 20px"><b>주소</b></td>
						<td>
							<input type="text" readonly="readonly" id="sample4_postcode" placeholder="우편번호" value="02259"/>
							<button type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br/>
							<span id="guide" style="color:#999"></span>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" readonly="readonly" id="sample4_roadAddress" placeholder="도로명주소" value="서울시 용마산로 60가길 11"/>
							<input type="text" placeholder="상세주소" value="A동 401호"/>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>휴대폰번호</b></td>
						<td>
							<select>
								<option value="010">010</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="011">011</option>
							</select>
							<input type="text" value="6720"/>
							<input type="text" value="3060"/>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>전화번호</b></td>
						<td>
							<select>
	                            <option value="">(선택)</option>
	                            <option value="02">02</option>
	                            <option value="031">031</option>
	                            <option value="032">032</option>
	                            <option value="033">033</option>
	                            <option value="041">041</option>
	                            <option value="042">042</option>
	                            <option value="043">043</option>
	                            <option value="044">044</option>
	                            <option value="049">049</option>
	                            <option value="051">051</option>
	                            <option value="052">052</option>
	                            <option value="053">053</option>
	                            <option value="054">054</option>
	                            <option value="055">055</option>
	                            <option value="061">061</option>
	                            <option value="062">062</option>
	                            <option value="063">063</option>
	                            <option value="064">064</option>
	                            <option value="070">070</option>
                            </select>
							<input type="text">
							<input type="text">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px"><b>이메일주소</b></td>
						<td>
							<input type="text" value="dohwi9406"/>
							@
							<input type="text" value="naver.com">
							<select style="width:120px;">
                              <option value="">직접입력</option>
                              <option value="dreamwiz.com">dreamwiz.com</option>
                              <option value="hanmail.net">hanmail.net</option>
                              <option value="hotmail.com">hotmail.com</option>
                              <option value="korea.com">korea.com</option>
                              <option value="gmail.com">gmail.com</option>
                              <option value="nate.com">nate.com</option>
                              <option value="naver.com">naver.com</option>
                              <option value="yahoo.co.kr">yahoo.co.kr</option>
                            </select>
						</td>
					</tr>
				</table>
				
				
				<h3 style="float: left">부가정보 입력</h3>
				<hr style="width: 800px">
				<table>
					<tr>
						<td rowspan="2" width="150px" style="padding-left: 20px"><b>SMS 수신동의</b></td>
						<td>SMS를 통해 이벤트 등 각종 소식을 받으시겠습니까?</td>
					</tr>
					<tr>
						<td>
							<input type="radio" checked="checked" >동의
							<input type="radio">동의하지 않음
						</td>
					</tr>
					<tr>
						<td rowspan="2" style="padding-left: 20px"><b>이메일 수신동의</b></td>
						<td>뷰담에서 제공하는 각종 소식을 이메일로 받으시겠습니까?</td>
					</tr>
					<tr>
						<td>
							<input type="radio" checked="checked" >동의
							<input type="radio">동의하지 않음
						</td>
					</tr>
				</table>
			</div>
			
			<br/>
			<div align="center" style="margin: 0 auto">
				<button type="button" onclick=
				"javascript:location.href='<%=cp %>/myPage.action'" style="width: 60px">취소</button>
				<button type="button" style="width: 60px">수정</button>
			</div>
	</div>
</body>
</html>