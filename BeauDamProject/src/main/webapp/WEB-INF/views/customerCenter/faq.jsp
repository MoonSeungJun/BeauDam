<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/customerCenter/customCenter.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>
<script>
	var jx = jQuery.noConflict();
    // html dom 이 다 로딩된 후 실행된다.
     jx(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
         jx(".menu>a").click(function(){
            var submenu =  jx(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
    
  //1:1문의연결팝업
    function popupOpen(){

	var popUrl = "inquire.action";	//팝업창에 출력될 페이지 URL
	var popOption = "width=600, height=490, toolbar=no, menubar=no, scrollbars=no, resizable=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
	}
    

    function faqMove1() {
    	$('#answer1').css('display','');
	}
    
	function faqMove2() {
    	$('#answer2').css('display','');
	}
	
	function faqMove3() {
    	$('#answer3').css('display','');
	}
	
	function faqMove4() {
    	$('#answer4').css('display','');
	}
    
	//비로그인 시 , 로그인 필요 문구 출력
	function tooltip() {
		$(document).ready(function(){
    		$('#[data-toggle="tooltip"]').tooltip();   
		});
	}
	
</script>
</head>
<body>
<jsp:include page="../beaudam/mainTop.jsp" />
<div class="wrapper">
	<!-- 메뉴바 -->
	<div class="menubar">
		<div class="menu" style="width: 660px; margin: 50px auto;">
			<ul class="menu_ul" style="overflow: hidden;">
				<li style="border-left: 1px solid #ddd; background-image: url('/beaudam/resources/image/customerCenter/custom1.png');"><a href="<%=cp%>/notification.action">공지사항</a></li>
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom2.png');"><a href="<%=cp%>/faq.action">자주 묻는 질문</a></li>
			<c:if test="${!empty id }">
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png');"><a href="javascript:popupOpen();">1:1 상담 문의</a></li>
			</c:if>
			<c:if test="${empty id }"> 
				<li style="background-image: url('/beaudam/resources/image/customerCenter/custom3.png');"><a data-toggle="tooltip" title="로그인이 필요합니다">1:1 상담 문의</a></li>
			</c:if>
			</ul>
		</div>
	</div>
	<!-- faq 구문 -->
	<div style="border-top: 1px solid #e4eaed; border-bottom: 1px solid #e4eaed;" class="faq">
		<ul>
	        <li class="menu_q">
	           <a href="javascript:void(0)" onclick="faqMove1();">환불 방법</a>
	            <ul style="display: none;" id="answer1">
	                <li class="menu_a"><a href="javascript:void(0)">결제했던 방법 혹은 뷰담포인트로 환불가능합니다.</a></li>   
	            </ul>
	        </li>
		    <li class="menu_q">
		    	<a href="javascript:void(0)" onclick="faqMove2();">뷰담 포인트 사용 방법</a>
	            <ul style="display: none;" id="answer2">
	                <li class="menu_a"><a href="javascript:void(0)">결제 시 결제창에서 사용하시면 됩니다.</a></li>
	            </ul>
	        </li>
	        <li class="menu_q">
		    	<a href="javascript:void(0)" onclick="faqMove3();">개명 시, 회원정보 변경은 어떻게 하나요?</a>
	            <ul style="display: none;" id="answer3">
	                <li class="menu_a"><a href="javascript:void(0)">1:1 상담 문의하기에 남겨주시면 소중한 고객님의 정보 확인 후 수정 완료 해드립니다.</a></li>
	            </ul>
	        </li>
	           <li class="menu_q">
		    	<a href="javascript:void(0)" onclick="faqMove4();">등급이 올라가려면 어떻게 하나요?</a>
	            <ul style="display: none;" id="answer4">
	                <li class="menu_a"><a href="javascript:void(0)">등급은 결제금액을 기준으로 매월 초 자동 조정 됩니다.</a></li>
	            </ul>
	        </li>
	 	</ul>
	</div>
</div>
<jsp:include page="../beaudam/mainBottom.jsp" />
</body>
</html>