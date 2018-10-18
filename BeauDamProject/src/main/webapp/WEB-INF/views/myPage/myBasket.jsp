<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뷰담바구니</title>
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

td
{
	text-align: center;
}

input
{
	text-align: center;
}

a{
	text-decoration: none;
	color: black;
}

a:hover{
	text-decoration: underline;
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
</head>
<body style="font-family: SeoulHangangM">

<div id="container">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: designhouseOTFLight00">뷰담바구니</h2>
				<p style="font-family: Black Han Sans">My Cart</p>
			</div>
		</div>
		
		<div style="width: 1200px; margin: 0 auto">
			<h3 style="float: left">장바구니 내역</h3>
			<hr style="width: 1200px">
			<button type="button">삭제</button>
		</div>
		
			<br/>
			
			<table style="width: 1200px; margin: 0 auto" >
				<tr bgcolor="#EAEAEA" style="font-weight: bold; height: 30px">
					<td><input type="checkbox"></td>
					<td></td>
					<td>상품명/옵션명</td>
					<td>수량</td>
					<td>판매가</td>
					<td>주문금액</td>
					<td>적립 예정 포인트</td>
					<td>주문</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>
						<a href="">
							<img style="margin: 0 auto; width: 100px; height: 100px;" src="http://www.thesaemcosmetic.com/view/attach/product/17211/list"> 
						</a>
					</td>
					
					<td><a href="">피토 세븐 클렌징 오일 크림</a></td>
					<td>
						<button type="button">-</button>
            			<input type="text" value="1" style="width: 30px">
            			<button type="button">+</button>
            		</td>
					<td>16,000원</td>
					<td>16,000원</td>
					<td>160P</td>
					<td>
						<button type="button">바로구매</button>
						<br/><br/>
						<button type="button">삭제</button>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>
						<a href="">
							<img style="margin: 0 auto; width: 100px; height: 100px;" src="http://www.thesaemcosmetic.com/view/attach/product/17444/detail/1">
						</a>
					</td>
					<td><a href="">어반 에코 하라케케 크림</a></td>
					<td>
						<button type="button">-</button>
            			<input type="text" value="1" style="width: 30px">
            			<button type="button">+</button>
            		</td>
					<td>17,000원</td>
					<td>17,000원</td>
					<td>170P</td>
					<td>
						<button type="button">바로주문</button>
						<br/><br/>
						<button type="button">삭제</button>
					</td>
				</tr>
			</table>
			
			<div style="width: 1200px; margin: 0 auto">
				<h3>결제금액</h3>
				<hr style="width: 1200px">
				<table style="width: 1200px; margin: 0 auto">
					<tr style="font-weight: bold; height: 30px">
						<td bgcolor="#EAEAEA" >총 주문금액</td>
						<td rowspan="2">-</td>
						<td bgcolor="#EAEAEA" >할인 금액</td>
						<td rowspan="2">+</td>
						<td bgcolor="#EAEAEA" >배송비</td>
						<td rowspan="2">=</td>
						<td bgcolor="#EAEAEA" >예상 결제금액</td>
					</tr>
					
					<tr>
						<td>33,000원</td>
						<td>0원</td>
						<td>0원</td>
						<td>33,000원</td>
					</tr>
				</table>
	
				<h3>적립예정 포인트</h3>
				<hr style="width: 1200px">
				<table style="width: 100%">
					<tr style="height: 30px; font-weight: bold;">
						<td bgcolor="#EAEAEA" width="25%">구매 포인트</td>
						<td width="25%">660P</td>
						<td bgcolor="#EAEAEA" width="25%">뷰담 포인트</td>
						<td width="25%">0P</td>
					</tr>
				</table>
				<br/><br/>
				<div style="text-align: center; display: block;">
					<button type="button" style="width: 100px">선택주문</button>
					
					<button type="button" style="width: 100px">전체주문</button>
					<button type="button" style="float: right; display: block;">쇼핑 계속하기</button>
				</div>
			</div>
	</div>

</body>
</html>