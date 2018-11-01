<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function orderUpdate(code) {		
	
	var delState = $('#delivery_Status option:selected').val();
	var payState = $('#pay_Status option:selected').val();
	var sale_Code = code;	
// 	alert(payState +"  " +delState + "  " +  sale_Code);
	$.ajax({
		
		type:'post',
		data: {'delState':delState,'payState':payState,'sale_Code':sale_Code},
		url: '/beaudam/adminOrderUpdate.action',
		success: function() {
			alert('변경 되었습니다.');
			window.location.href = "/beaudam/adminOrder.action";
		},
		error: function() {
			
		}		
		
	});		
	opener.parent.location="/beaudam/adminOrder.action";
	window.close();
	
}
	
	



</script>






</head>
<body>

<form action="" name="updateForm" method="post">
	<table>
		<tr>
			<td>
				결제상태
			</td>
			<td>
				배송상태
			</td>
		</tr>
		<tr>
			<td>
				<select id="pay_Status">
						<option value="pay_ready">입금대기</option>
						<option value="pay_compl">결제완료</option>
						<option value="change">교환</option>
						<option value="refund">환불</option>
						<option value="cancel">취소</option>									
					</select>
			</td>
			<td>
			<select id="delivery_Status">
						<option value="ready">상품 준비중</option>
						<option value="ing">배송중</option>
						<option value="compl">배송완료</option>				
					</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="javascript:void(0);" onclick="orderUpdate('${sale_Code}');" style="text-decoration: none;">수정</a>
			</td>	
		</tr>	
	</table>
</form>
</body>
</html>