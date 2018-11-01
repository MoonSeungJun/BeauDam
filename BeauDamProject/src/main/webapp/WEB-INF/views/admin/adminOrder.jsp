<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeauDam Admin</title>
<link rel="stylesheet" href="<%=cp %>/resources/css/admin/admin.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">



function orderUpdate(code) {		
	
	var popUrl = "adminOrderPop.action?sale_Code=";	//팝업창에 출력될 페이지 URL
	var sale_Code = code;
	var popOption = "width=300, height=300, resizable=yes, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
	var popUrl = popUrl+sale_Code;
	
		window.open(popUrl,"",popOption);
	
}
	
	function orderSearch() {
		
		var f = document.adminOrderForm;
		
		f.action = "<%=cp%>/adminOrder.action";
		f.submit();
				
	}
	
	
	
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div class="wrapper">
<h2 class="text-center">주문 조회</h2>
<hr>
	<form action="" name="adminOrderForm" method="post">
		<table border="1" style="margin: 0 auto; text-align: center;">
			<tr>
				<td class="title">입금대기</td>
				<td class="title">결제완료</td>
				<td class="title">상품준비중</td>
				<td class="title">배송중</td>
				<td class="title">배송완료</td>
				<td class="title">환불</td>
				<td class="title">교환</td>
				<td class="title">취소</td>
			</tr>
			<tr>
				<td>${payReady }</td>
				<td>${payCompl }</td>
				<td>${ready }</td>
				<td>${ing }</td>
				<td>${compl }</td>
				<td>${refund }</td>
				<td>${change }</td>
				<td>${cancel }</td>				
			</tr>
		</table>
		<br><br>
		<table border="1" style="margin: 0 auto;">
			<tr>
				<td class="title">이름</td>
				<td>
					<input type="text" name="name" style="border: none;">
				</td>
				<td class="title">
					아이디
				</td>
				<td>
					<input type="text" name="id" style="border: none;">
				</td>
				<td class="title">
					전화번호
				</td>
				<td>
					<input type="text" name="cellphone" style="border: none;">
				</td>
				<td>
					<input type="button" value="검 색" onclick="orderSearch();">
				</td>
			</tr>
		</table>
	</form>
</div>
<br/><br/>
<form action="" name="orderView" method="post">
	<table border="1" style="margin: 0 auto; width: 90%; text-align: center;">
		<tr>
			<td class="title">
				주문번호
			</td>
			<td class="title">
				아이디
			</td>				
			<td class="title">
				이름
			</td>
			<td class="title">
				전화번호
			</td>				
			<td class="title">
				주소
			</td>	
			<td class="title">
				상품코드
			</td>		
			<td class="title">
				상품명
			</td>
			<td class="title">
				색상코드
			</td>													
			<td class="title">
				상품가격
			</td>
			<td class="title">
				수량
			</td>
			<td class="title">
				결제금액
			</td>
			<td class="title">
				주문일자
			</td>
			<td class="title">
				결제상태
			</td>	
			<td class="title">
				배송상태
			</td>					
			<td class="title">
				비고
			</td>		
		</tr>


		<c:forEach var="dto" items="${searchSaleData }"> 
			<tr>
				<td>
					${dto.sale_Code }
				</td>
				<td>
					${dto.id }
				</td>				
				<td>
					${dto.name }
				</td>
				<td>
					${dto.cellphone }
				</td>				
				<td>
					${dto.addr }
				</td>
				<td>
					${dto.code }
				</td>			
				<td>
					${dto.product_Name }
				</td>			
				<td>
					${dto.color_Code }
				</td>						
				<td>
					${dto.product_Price }
				</td>
				<td>
					${dto.qty }
				</td>
				<td>
					${dto.total_Price }
				</td>
				<td>
					${dto.saleDate }
				</td>
				
				<td>
				<c:choose>
  					<c:when test="${dto.pay_Status=='pay_ready'}">
     					입금대기
  						</c:when>
  					<c:when test="${dto.pay_Status=='pay_compl'}">
    					 결제완료
  						</c:when>
  					
  					<c:when test="${dto.pay_Status=='change'}">
     					교환
  						</c:when>
  					<c:when test="${dto.pay_Status=='refund'}">
     					환불
  					</c:when>
  					
  					<c:otherwise>
     					취소
  					</c:otherwise>
				</c:choose> 
					
					
				</td>
				
				<td>
				<c:choose>
  					<c:when test="${dto.delivery_Status=='ready'}">
     					상품 준비중
  						</c:when>
  					<c:when test="${dto.delivery_Status=='ing'}">
    					 배송중
  						</c:when>  					 					
  					<c:otherwise>
     					배송완료
  					</c:otherwise>
				</c:choose> 				
				</td>
				<td>									
					<a href="javascript:void(0);" onclick="orderUpdate(${dto.sale_Code });" style="text-decoration: none;">수정</a>
				</td>			
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>