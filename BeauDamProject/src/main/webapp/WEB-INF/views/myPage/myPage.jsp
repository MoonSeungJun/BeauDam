<!-- 제작자 : 허도휘 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Beaudam</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<style type="text/css">
/* Web Fonts */

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

.float_container {
    overflow: hidden;
    box-sizing: border-box;
    padding-right: 10px;
    padding-left: 10px;
    margin: 0 auto;
    width: 1200px;
}

.lnb_mypage .user_info {
    overflow: hidden;
    border: 1px solid #e4eaed;
    border-bottom: 0;
    padding: 10px 13px 11px 19px;
    height: 35px;
    line-height: 38px;
}

p, label, span, strong, i, em, a, textarea, input, select {
    color: inherit;
    font: inherit;
    line-height: inherit;
}

.lnb_mypage .user_benefit {
    background-color: #facdca;
    line-height: 1;
}

.lnb_mypage .user_point {
    padding-top: 20px;
    padding-bottom: 20px;
    text-align: center;
}

.lnb_mypage .user_point .title {
    font-size: 15px;
    margin-bottom: 8px;
    color: #9a9a9a;
}

.lnb_mypage .point_result .point {
    display: inline;
    font-weight: bold;
    font-size: 40px;
}

.float_container .point:after {
    content: "p";
    font-size: 20px;
    color: #000;
}

.lnb_mypage .benefit_result {
    padding: 15px 19px 16px;
    border-top: 1px solid #f6e6e6;
}

.lnb_mypage .benefit_result dl dt {
    font-size: 15px;
    float: left;
    color: #9a9a9a;
}

p, label, span, strong, i, em, a, textarea, input, select {
    color: inherit;
    font: inherit;
    line-height: inherit;
}

.lnb_mypage .benefit_result dl dd span {
    font-family: "Gotham";
    font-weight: bold;
    font-size: 20px;
}

.lnb_mypage .point_result {
    display: inline-block;
    margin-left: -6px;
    padding-left: 33px;
    height: 33px;
    line-height: 30px;
    vertical-align: bottom;
}

.lnb_mypage .setting_btn {
    float: right;
    margin-top: 6px;
    margin-right: 7px;
}

.lnb_mypage .point_result .point {
    display: inline;
    font-weight: bold;
    font-size: 40px;
}

.float_container .point {
    font-family: "Gotham";
    font-weight: bold;
    font-size: 1em;
    color: #ef402e;
}

.float_container .lnb_menu {
    overflow: hidden;
    border: 1px solid #e4eaed;
}

.lnb_menu nav>ul>li>a i {
    position: absolute;
    background-position: 0 0;
    background-repeat: no-repeat;
    width: 24px;
    height: 24px;
    left: -40px;
    top: 0;
    bottom: 0;
}

p, label, span, strong, i, em, a, textarea, input, select {
    color: inherit;
    font: inherit;
    line-height: inherit;
}

div {
    display: block;
}

.lnb_menu nav>ul>li>a {
    font-size: 20px;
    font-weight: bold;
    letter-spacing: -1.6px;
    position: relative;
    display: block;
    color: #000;
}

a {
    text-decoration: none;
}

ul, li, ol {
    list-style-type: none;
}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, address, big, cite, code, del, dfn, em, img, ins, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, button, figure {
    font-family: 'SeoulHangangM','맑은 고딕','돋움','​dotum',sans-serif;
    font-smoothing: antialiased;
    border: 0 none;
    font-size: 14px;
    letter-spacing: -1px;
    margin: 0;
    padding: 0;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

ul, menu, dir {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.float_container .float_right {
    float: right;
    background-color: #fff;
    margin-left: 20px;
    width: 900px;
}

.float_container .float_conts {
    overflow: hidden;
    border: 1px solid #e4eaed;
}

.float_title {
    font-size: 20px;
    position: relative;
    overflow: hidden;
    padding: 20px 18px;
    box-sizing: border-box;
    height: 60px;
    line-height: 1;
}

.mypage_index .float_title .status {
    margin-left: 0;
    padding-left: 20px;
    padding-top: 3px;
    border-left: 0;
}
.float_title .status {
    font-weight: bold;
    font-size: 16px;
    margin-left: 20px;
    padding-left: 29px;
    border-left: 1px solid #e4eaed;
    color: #9a9a9a;
    display: block;
    float: left;
    
}

.float_title dl dt, .float_title dl dd {
    display: inline;
    font-size: 1em;
}

.float_title .status dt~dt:before {
    content: "/";
    padding-right: 3px;
}

.more {
    font-size: 14px;
    font-weight: bold;
    float: right;
    padding-right: 20px;
    margin-right: 2px;
    margin-top: 7px;
}

.mypage_index .infobox {
    margin-bottom: 40px;
    padding: 60px 0;
    text-align: center;
}
.float_conts .infobox {
    height: 170px;
    line-height: 1;
    box-sizing: border-box;
    background-color: #c8e1ed;
    padding-left: 40px;
    padding-top: 30px;
}

.mypage_index .title_content {
    position: relative;
    overflow: hidden;
}

.float_conts .title_content {
    overflow: hidden;
    margin-bottom: 15px;
}

.title_content {
    overflow: hidden;

}
.mypage_index .list_style1 {
    margin-bottom: 40px;
}

.mypage_index .info_manager {
    padding: 34px 0;
}
.float_conts .div_style {
    overflow: hidden;
    margin-bottom: 38px;
    border-top: 1px solid #000;
    border-bottom: 1px solid #cad3d8;
}

.float_conts .div_style.col2>* {
    width: 50%;
}
.mypage_index .info_manager dl {
    padding: 10px 0 11px 48px;
    line-height: 1;
    background-position: 19px 6px;
    background-repeat: no-repeat;
}
.float_conts .div_style>* {
    float: left;
    box-sizing: border-box;
}

.t_l {
    text-align: left !important;
}

td{
	text-align: center;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

</style>
</head>
<body>

	<div style="padding-bottom: 80px;">
		<div class="title_style">
			<div class="title_area">
				<h2 style="font-family: designhouseOTFLight00">마이뷰담</h2>
				<p style="font-family: Black Han Sans">My the BEAUDAM</p>
			</div>
		</div>
		
		<div class="float_container">
			<div style="background-color: white; width: 260px; float: left" class="lnb_mypage">
			<!-- 사용자 정보 -->
				<div class="user_info">
					<div style="float: left;">
						<i>
							<img src="/beaudam/resources/image/myPage/profile.jpg" height="33px" align="top">
						</i>
						<span style="font-size: 18px;">dohwi9406</span>
					</div>
					<a href="/"  class="setting_btn">
						<img src="/beaudam/resources/image/myPage/setting.jpg" height="30px" align="bottom">
					</a>
				</div>
				
				<div class="user_benefit">
					<div class="user_point">
						<div class="title">
							<h3>뷰담포인트</h3>
						</div>
						<div>
							<p class="point" style="font-size: 40px;"><img src="/beaudam/resources/image/myPage/point.jpg" height="33px" align="top">0</p>						
						</div>
					</div>
					<div class="benefit_result" style="height: 40px">
						<dl>
							<dt style="float: left">구매포인트</dt>
							<dd>
								<span style="float: right;">0</span>
							</dd>
						</dl>
						<dl>
							<dt style="float: left">쿠폰</dt>
							<dd>
								<span style="float: right;">0</span>
							</dd>						
						</dl>
					</div>			
				</div>
				
				<!-- 좌측 메뉴바 -->
				<div class="lnb_menu">
			        <nav>
			            <ul>
			                <li><a href="/page/mythesaem/order"><i class="lnb01"></i>나의 주문 현황</a></li><!-- 활성화 class="on"추가 -->
			                <li>
			                    <a href="javascript:;"><i class="lnb02"></i>나의 쇼핑 혜택</a>
			                    <ul class="sub_lnb">
			                        <li><a href="">포인트 조회</a></li><!-- 활성화 class="on"추가 -->
			                        <li><a href="">쿠폰 조회</a></li>
			                    </ul>
			                </li>
			                <li>
			                    <a href="javascript:;"><i class="lnb03"></i>나의 활동 보기</a>
			                    <ul class="sub_lnb">
			                        <li><a href="">위시리스트</a></li><!-- 활성화 class="on"추가 -->
			                        <li><a href="">이벤트관리</a></li>
			                        <li><a href="">1:1문의내역</a></li>
			                        <li><a href="">나의 피부정보</a></li>
			                    </ul>
			                </li>
			                <li>
			                    <a href="javascript:;"><i class="lnb04"></i>나의 정보</a>
			                    <ul class="sub_lnb">
			                        <li><a href="/page/mythesaem/member/address">배송지 관리</a></li><!-- 활성화 class="on"추가 -->
			                        <li><a href="/page/mythesaem/member/modify">개인정보수정</a></li>
			                        <li><a href="/page/mythesaem/member/leave">회원탈퇴</a></li>
			                    </ul>
			                </li>
			               </ul>
			        </nav>
			    </div>
			</div>
			<!-- 우측 정보부분 -->
			<div class="float_right">
				<div class="float_conts">
				<!-- 마이페이지 INDEX -->
					<div class="float_title">
						<span style="display: block; float:left; font-size: 14pt; font-weight: bold">
							나의 주문 현황
						</span>
						<dl class="status" style="margin-top: 3px;float: left">
							<dt>
								<a href="">취소</a>
							</dt>
							<dd style="margin-left: 4px;">0</dd>
							<dt>
								<a href="">반품</a>
							</dt>
							<dd style="margin-left: 4px;">0</dd>
						    <dt>
						    	<a href="">교환</a>
						    </dt>
                            <dd style="margin-left: 4px;">0</dd>
						</dl>
						<a href="" class="more">MORE+</a>
					</div>
					<div class="infobox">
						<div style="font-weight: bold;">
							<table border="1" style="width: 100%;">
								<tr>
									<td>
										<a href="" class="step1">
											<img style="width: 40px" src="/beaudam/resources/image/myPage/hour.jpg"/>
										</a>
									</td>
									<td rowspan="3">▶</td>
									<td>
										<a href="" class="step2">
											<img style="width: 60px" src="/beaudam/resources/image/myPage/pay.jpg"/>
										</a>
									</td>
									<td rowspan="3">▶</td>
									<td>
										<a href="" class="step3">
											<img style="width: 40px" src="/beaudam/resources/image/myPage/box.jpg"/>
										</a>
									</td>
									<td rowspan="3">▶</td>
									<td>
										<a href="" class="step4">
											<img style="width: 60px" src="/beaudam/resources/image/myPage/delivery.jpg"/>
										</a>
									</td>
									<td rowspan="3">▶</td>
									<td>
										<a href="" class="step5">
											<img style="width: 60px" src="/beaudam/resources/image/myPage/smile.jpg"/>
										</a>
									</td>
								</tr>
								<tr>
									<td>입금대기</td>
									<td>결제완료</td>
									<td>배송준비중</td>
									<td>배송중</td>
									<td>배송완료</td>
								</tr>
								<tr>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							
							</table>
						</div>
                       
                    </div>
                    
                    <div class="mypage_index_conts">
                        <div class="title_content" style="padding: 20px 18px;">
                            <span style="display: block; float:left; font-size: 12pt; font-weight: bold">
								나의 보유 현황
							</span>
                        </div>
                        <div class="div_style col3 possession">
                        	<table border="1" style="width: 100%; height: 200px;">
                        		<tr style="font-weight: bold; font-size: 12pt;">
                        			<td width="33%">뷰담 포인트</td>
                        			<td width="33%">구매 포인트</td>
                        			<td width="33%">쿠폰</td>
                        		</tr>
                        		<tr>
                        			<td class="point">0</td>
                        			<td class="point">0</td>
                        			<td>0</td>
                        		</tr>
                        	
                        	</table>
                        </div>

                        <div class="title_content">
                            <h3>1:1 문의 내역</h3>
                            <a class="more" href="/page/mythesaem/activity/counsel">MORE +</a>
                        </div>
                        <div style="overflow: hidden;">
                            <table>
                                <caption>1:1 문의 내역</caption>
                                <colgroup>
                                    <col style="width:8%;">
                                    <col style="width:16%;">
                                    <col style="width:46%;">
                                    <col style="width:14%;">
                                    <col style="width:16%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">문의유형</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                            <td colspan="5" class="data_none1">
                                                <p>등록한 내역이 없습니다.</p>
                                                <div class="btn">
                                                    <a href="/page/mythesaem/activity/counsel/form" class="bc_grey-h_30-w_100">1:1 문의하기</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                            </table>
                        </div>


                        
                    </div>
					
				</div>
			
			</div>
		</div>
		
		
		
		
		
	</div>

</body>
</html>