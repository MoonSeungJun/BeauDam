<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
    <head>
   	<meta charset="utf-8">
    <link rel="stylesheet" href="./resources/css/beaudam/productDetail.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="<%=cp %>/resources/js/jquery-1.11.3.min.js"></script>
	<style>
		.star-input>.input,
		.star-input>.input>label:hover,
		.star-input>.input>input:focus+label,
		.star-input>.input>input:checked+label {
			display: inline-block;
			vertical-align: middle;
			background:
				url('<%=cp%>/resources/image/beaudam/productDetail/grade_img.png')
				no-repeat;
		}
		
		.star-input {
			display: inline-block;
			white-space: nowrap;
			width: 225px;
			height: 40px;
			line-height: 30px;
		}
		
		.star-input>.input {
			display: inline-block;
			width: 150px;
			background-size: 150px;
			height: 28px;
			white-space: nowrap;
			overflow: hidden;
			position: relative;
		}
		
		.star-input>.input>input {
			position: absolute;
			width: 1px;
			height: 1px;
			opacity: 0;
		}
		
		star-input>.input.focus {
			outline: 1px dotted #ddd;
		}
		
		.star-input>.input>label {
			width: 30px;
			height: 0;
			padding: 28px 0 0 0;
			overflow: hidden;
			float: left;
			cursor: pointer;
			position: absolute;
			top: 0;
			left: 0;
		}
		
		.star-input>.input>label:hover, .star-input>.input>input:focus+label,
			.star-input>.input>input:checked+label {
			background-size: 150px;
			background-position: 0 bottom;
		}
		
		.star-input>.input>label:hover ~label{
			background-image: none;
		}
		
		.star-input>.input>label[for="p1"] {
			width: 30px;
			z-index: 5;
		}
		
		.star-input>.input>label[for="p2"] {
			width: 60px;
			z-index: 4;
		}
		
		.star-input>.input>label[for="p3"] {
			width: 90px;
			z-index: 3;
		}
		
		.star-input>.input>label[for="p4"] {
			width: 120px;
			z-index: 2;
		}
		
		.star-input>.input>label[for="p5"] {
			width: 150px;
			z-index: 1;
		}
		
		.star-input>output {
			display: inline-block;
			width: 60px;
			font-size: 18px;
			text-align: right;
			vertical-align: middle;
		}
	</style>
	<script type="text/javascript">
		
		$(document).ready(function () {
			
			var f = document.reviewForm;
			
			f.score.value = 0;
			
			if($('#flag').val()==1){
				
				$('html, body').animate({
					scrollTop: $('#scroll').offset().top
					});
				
			}

		});

  			function amountminus() {
  				if($('#amount').val() == 0){
  					alert("수량은 0개 이상이어야 합니다.");
  					return;
  				}
  				$('#amount').val(parseInt($('#amount').val())-1);
  				change();
  				
			}
  			
  			function amountplus() {
  				var qty = ${dto.qty};
				if(parseInt($('#amount').val()) >= qty){
  					alert("재고가 부족합니다.");
  					return;
  				}
  				$('#amount').val(parseInt($('#amount').val())+1);
  				

  				change();
			}
  		
  			
  			function change() {
				
  				var amount = parseInt($('#amount').val());  				
				var product_Price = ${dto.product_Price};
  				$('#total_Price').html(amount * product_Price);  				
  				
			}
  			
  			function insertBasket(code) {
  				var amount = parseInt($('#amount').val()); 				
  				
  				var id = '${id}';
				if(id == ''){
  					alert("로그인 하세요");
  					return;
  				}
  				
  				if(amount == 0){
  					alert("갯수를 확인해 주세요");
  					return;
  				}  				
  				
  				$.ajax({
  					
  					type:'POST',
  					url: 'insertBasket.action',
  					data:{
  						'amount':amount,
  						'code':code
  					},  			
  					async:false,
  					dataType: "text",
  					complete: function() {
						if(confirm('장바구니에 추가되었습니다. 장바구니로 이동 할까요?')==true){
							window.location.href = "/beaudam/myBasket.action";
						}else{
							return;
						}
					}
  					
  				});
  				
			}
  			
			function buyNow(code) {
				
				var id = '${id}';
				if(id == ''){
  					alert("로그인 하세요");
  					return;
  				}
				
				var amount = parseInt($('#amount').val()); 				
  				
  				if(amount == 0){
  					alert("갯수를 확인해 주세요");
  					return;
  				}  			
				$.ajax({
  					
  					type:'POST',
  					url: 'insertBasket.action',
  					data:{
  						'amount':amount,
  						'code':code
  					},  			
  					async:false,
  					dataType: "text",
  					complete: function() {
  						window.location.href="/beaudam/myBasket.action";
					}
  					
  				});
				
			}
			
			function checkLogin(){
				
				alert("로그인을 한 경우에 리뷰작성이 가능합니다!");
				
				var popupX = (window.screen.width/2)-(815/2);
				var popupY= (window.screen.height/2)-648;
				
				window.open("<%=cp%>/login.action?popup=1",
						'로그인',
						'width=815, height=648, toolbar=no, menubar=no, scrollbars=no, resizable=no, left='
						+ popupX 
						+ ', top=' + popupY 
						+ ', screenX=' + popupX 
						+ ', screenY= '+ popupY);
				
			}
			

			function sendReview(){
				
				var f = document.reviewForm;
				
				f.action = "<%=cp%>/review.action";
				f.submit();				
				
			}
			
			function clickStar(){
				
				var f = document.reviewForm;
				
				f.score.value = $("input[type='radio'][name='star']:checked").val();
				
			}
			
			function deleteReview(){
				
				var f = document.reviewForm;
				
			    $.ajax({
			        url: "<%=cp%>/deleteReview.action",
			        type:"post", 
			        data: {
			        	"num": $("#reviewno").val(),
			        	"searchType" : f.searchType.val(),
			        	"searchValue" : f.searchValue.val(),
			        	"reviewPageNum" : "",
			        	"pageNum" : f.pageNum.val(),
			        	"code" : f.code.val()
			        	},
			        success: function(result){
			            if (result=="OK") {
			                alert("댓글삭제완료");
			            } else{
			                alert("댓글삭제실패");
			            }
			        }
			    })
			}
			
			
  		
  	</script>
  		
    </head>
    <body>
    <jsp:include page="./mainTop.jsp" />
        <div class="container">
            <div class="wrapper">
                <div class="left">
                    <img src="<%=cp %>/thumbImg/${dto.thumb_Img}">
                </div>
                <div class="right">
        			<div class="right_header">
        				<h3 style="color: gray; margin-bottom: 5px;">${dto.brand }</h3>
                        <h2>${dto.product_Name }</h2>
                    </div>
                    <div class="right_content">
                       	<dl>
                           	<dt>판매가</dt>
                           	<dd>${dto.product_Price }원</dd>
                       	</dl>
                       	<dl>
                           	<dt>배송비</dt>
                           	<dd>2.500원 <!--<br/>(15,000원 이상 주문시 무료배송) --></dd>
                       	</dl>
                       	<dl>
                           	<dt>포인트</dt>
                           	<dd>${point } point</dd>
                        </dl>
                    	<dl>
                       		<dt>수량 선택</dt>
                       		<dd>
                       		<img alt="" src="<%=cp %>/resources/image/beaudam/productDetail/minus.gif" onclick="amountminus();">
                           	<input type="text" name="amount" id="amount" value="0" style="width: 40px; height: 20px; background-color: transparent; text-align: center; border: none;" readonly="readonly"/>
                           	<img alt="" src="<%=cp %>/resources/image/beaudam/productDetail/plus.gif" onclick="amountplus();">
                           	
                       		</dd>
                    	</dl>
                    </div>
                    <div class="result">
                        <dl>
                            <dt>금액 합계</dt>
                            <dd class="gray" ><span id="total_Price" style="margin-left: 10px;">0</span>원</dd>
                        </dl>
                    </div>
                    <div class="buy">                         
                        <span><a href="javascript:void(0);" onclick="insertBasket('${dto.code}');"><img class="cart_button" src="<%=cp %>/resources/image/beaudam/productDetail/cart_2.png"></a></span>
                        <span><a href="javascript:void(0);" onclick="buyNow('${dto.code}')"><img class="buy_button" src="<%=cp %>/resources/image/beaudam/productDetail/buy.png""></a></span>
                    </div>
                </div>  
            </div>
        </div>
        <div class="detail">
        	<hr>
        	<h4 style="font-weight: bold; margin-bottom: 20px;">상세정보</h4>
        	<img class="detailimg" src="<%=cp %>/detailImg/${dto.detail_Img}">

        </div>
        <!-- 리뷰 댓글 -->
        <div style="height: 10px" id="scroll"></div>
        <div class="review">
        	<div class="review_container">
        		<div class="review_button"style="margin-top: 20px;">
		        	<p>뷰담 고객 리뷰</p>
		        	<div class="container">
		        	<c:if test="${empty id }">
		        	    <button type="button" 
			        		class="btn btn-info btn-lg" onclick="checkLogin();"
			        		style="border: none; float: right; background-color: #f0ad4e; width: 80px; padding: 5px; font-size: 13px; " >
			        		리뷰쓰기
			        	</button>
		        	</c:if>
		        	<c:if test="${!empty id }">
			        	<button type="button" 
			        		class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" 
			        		style="border: none; float: right; background-color: #f0ad4e; width: 80px; padding: 5px; font-size: 13px; " >
			        		리뷰쓰기
			        	</button>
		        	</c:if>
		  
					
  						<!-- Modal -->
	    				<div class="modal fade" id="myModal" role="dialog">
	       					<div class="modal-dialog">
	     					<!-- Modal content-->
	            				<div class="modal-content" style="width: 500px;">
	                				<div class="modal-header">
				                    	<button type="button" class="close" data-dismiss="modal">&times;</button>
				                    	<span class="modal-title" style="font-weight: bold">리뷰쓰기</span>
	                				</div>
	                				<form name="reviewForm" method="post">
			                			<div class="modal-body">
											<span class="star-input">
												<span class="input" onchange="clickStar();">
											    	<input type="radio" name="star" value="1" id="p1">
											    	<label for="p1">1</label>
											    	<input type="radio" name="star" value="2" id="p2">
											    	<label for="p2">2</label>
											    	<input type="radio" name="star" value="3" id="p3">
											    	<label for="p3">3</label>
											    	<input type="radio" name="star" value="4" id="p4">
											    	<label for="p4">4</label>
											    	<input type="radio" name="star" value="5" id="p5">
											    	<label for="p5">5</label>
											  	</span>
											  	<input type="hidden" name="score"/>
											</span>
											<input type="text" name="pageNum" value="${pageNum }"/>
											<input type="text" name="searchType" value="${searchType }"/>
											<input type="text" name="searchValue" value="${searchValue }"/>
											<input type="text" name="code" value="${dto.code }"/>
			                				<input type="text" name="sale_Code" value="${saleCode }"/>
			                				<input type="text" name="flag" id="flag" value="${flag }"/>
			                    			<textarea style="width: 100%;" name="review" placeholder="리뷰를 작성해 주세요! 사랑합니다 고객님♡ "></textarea>
			                			</div>
		                				<div class="modal-footer">
				                    		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="sendReview();" style="background-color: #f0ad4e; color: white; font-weight: bold; border: none;">등록하기</button>
				                    		<button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; ">취소하기</button>
		                				</div>
	                				</form>
	            				</div>
	       					</div>
	    				</div>
					</div>
        		</div>
        		<ul>
        			<c:forEach var="dto" items="${review }">
        			<li>
        				<div class="review_wrapper">
	        				<div class="review_info">
	        					<c:choose>
	        						<c:when test="${dto.score==0 }">
	        							<span>
	        								<c:forEach var="i" begin="0" end="4">
	        									<img src="<%=cp%>/resources/image/beaudam/productDetail/lineheart.png" width="10"/>
	        								</c:forEach>
	        							</span>
	        						</c:when>       						
	        						<c:otherwise>
	        							<span>
	        								<c:forEach var="j" begin="0" end="${dto.score -1 }">
	        									<img src="<%=cp%>/resources/image/beaudam/productDetail/heart.png" width="10"/>
	        								</c:forEach>
	        								<c:forEach var="k" begin="1" end="${5 - dto.score }">
	        									<img src="<%=cp%>/resources/image/beaudam/productDetail/lineheart.png" width="10"/>
	        								</c:forEach>
	        							</span>
	        						</c:otherwise>
	        					</c:choose>
	        					<span id="reviewno">${dto.id }</span>
	        					<span style="color: gray">${dto.created }</span>
	        				</div>
	        				<div class="review_data">
	        					 ${dto.review }
	        					 <div>
	        					<c:if test="${id eq dto.id }">
	        						<button type="button" onclick="deleteReview();">x</button>
	        					</c:if>
	        					 </div>
	        				</div>

        				</div>
        			</li>
        			<hr>
        			</c:forEach>
        		</ul>
        	</div>
        	<div style="text-align: center">
        		${reviewIndexList }
        	</div>
        </div>
        <jsp:include page="./mainBottom.jsp" />
    </body>
</html>