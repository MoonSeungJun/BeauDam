<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>

<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
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

	var popOption = "width=780, height=780, resizable=yes, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
</script>

</head>
<body>

<!-- 윗부분 -->
<div>
	<table border="1" align="center" style="width:25% " >
		<tr align="center">
			<td align="center">
				HOME ><a href="notification.action">고객센터</a> > 자주묻는 질문
			</td>
		</tr>
		
		<tr align="center">
			<td align="center">
				자주묻는 질문<br>
				Frequently Asked Questions
			</td>
		</tr>
			
	</table>
</div>
<br><br>
<!-- 왼쪽 사이드 메뉴바 -->

<div style="float: left; margin-left: 33%; margin-right: 10px; height: 240px;">
	<table border="1" align="center" style="height: 100%;">
		<tr>
			<td>
			  <a href="notification.action">공지사항</a>
			</td>
								
		</tr>		
		
		<tr>
			<td>
			  <a href="javascript:popupOpen();" > 1:1문의 </a>
			</td>
									
						
		</tr>
		
		<tr>
			<td>
			  <a href="faq.action">자주묻는질문</a> 
			</td>
					
						
		</tr>
		
		<tr>
			<td>
			  매장안내
			</td>
									
		</tr>
		
		<tr>
			<td>
			  찾아오시는길
			</td>
						
		</tr>
		
		<tr>
			<td>
			  쇼핑몰 이용 안내
			</td>	
		</tr>
		
		<tr>
			<td>
			  뷰담 문의 안내
			</td> 
			
		</tr>
		
		<tr>
			<td>
			  매장 입점 문의
			</td>
		</tr>
		
	</table>
</div>


<!-- faq 구문 -->
<div style="float: left; height: 255px;width: 30%;">
    <ul>
        <li class="menu">
            <a>Q.환불방법</a>
            <ul class="hide">
                <li>결제하셨던 방법 혹은 뷰담포인트로 환불가능합니다.</li>
                
            </ul>
        </li>
        
        <li class="menu">
            <a>Q.뷰담포인트사용방법</a>
            <ul class="hide">
                <li>결제시에 사용하세요.</li>
                
            </ul>
        </li>
        
    </ul>
</div>
<form action="" method="post" name="inquire">
<div>
	<input type="button" value="1:1문의하기" onclick="popupOpen();">
</div>
</form>
</body>
</html>