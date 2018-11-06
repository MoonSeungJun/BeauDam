<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
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
  		<script type="text/javascript">
  		
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
						alert("장바구니에 담겼습니다.");
					}
  					
  				});
  				
			}
  			
			function buyNow(code) {
				
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
        <div class="review">
        	<div class="review_container">
        		<div class="review_button" style="margin-top: 20px;">
		        	<p>뷰담 고객 리뷰</p>
		        	<div class="container">
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="border: none; float: right; background-color: #f0ad4e; width: 80px; padding: 5px; font-size: 13px; " >리뷰쓰기</button>
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
			                    			<textarea style="width: 100%;" name="review" placeholder="리뷰를 작성해 주세요! 사랑합니다 고객님♡ "></textarea>
			                			</div>
		                				<div class="modal-footer">
				                    		<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #f0ad4e; color: white; font-weight: bold; border: none;">등록하기</button>
				                    		<button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; ">취소하기</button>
		                				</div>
	                				</form>
	            				</div>
	       					</div>
	    				</div>
					</div>
        		</div>
        		<ul>
        			<li>
        				<div class="review_wrapper">
	        				<div class="review_info">
	        					<span>♥♥♥♥♡</span>
	        					<span>kimhn93</span>
	        					<span style="color: gray">2018.10.19</span>
	        				</div>
	        				<div class="review_data">
	        					 뷰담 화이팅 
	        				</div>
        				</div>
        			</li>
        			<hr>
        			<li>
        				<div class="review_wrapper">
	        				<div class="review_info">
	        					<span>♥♥♥♥♡</span>
	        					<span>kimhn93</span>
	        					<span style="color: gray">2018.10.19</span>
	        				</div>
	        				<div class="review_data">
	        					 열일하거라 기능팀 
	        				</div>
        				</div>
        			</li>
        			<hr>
        		</ul>
        	</div>
        </div>
        <jsp:include page="./mainBottom.jsp" />
    </body>
</html>