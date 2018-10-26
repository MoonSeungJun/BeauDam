<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/main.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 300 ) {
			$( '.goTop' ).fadeIn();
		} else {
			$( '.goTop' ).fadeOut();
		}
	} );
	$( document ).ready( function() {
	  $( '.goTop' ).click( function() {
	    $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	    return false;
	  } );
	} );
</script>
</head>
<body>
     <div class="footer">
         <div>
              <p>
                사업자등록번호 : 113-81-17562   <Br/>
                통신판매업신고번호 : 제2011-서울종로-1012호 사업자정보확인<Br/>
                주소 : 아이티윌 15층 6강의실<Br/>   
                대표이사 : 김해나  개인정보 보호책임자 : 김해나<Br/>
                호스팅 서비스 제공자 : ㈜뷰담<Br/>
                </p>
         </div>
     </div>
     <div class="side">
         <a href="./event1.action"><img src="<%=cp%>/resources/image/beaudam/main/side.png"></a> 
     </div>
     <div class="goTop">
         <img src="<%=cp%>/resources/image/beaudam/main/goTop.png">
         <p>TOP</p>
     </div>
</body>
</html>