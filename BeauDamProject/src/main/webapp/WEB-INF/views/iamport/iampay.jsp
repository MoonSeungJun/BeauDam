<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
		var IMP = window.IMP;
		IMP.init('imp26718021');
		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			/*
			    'kakao':카카오페이,
			    'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제), 
			    'nice':나이스, 
			    'jtnet':jtnet, 
			    'uplus':LG유플러스,
			    'danal':다날
			,*/
			pay_method : '${payType}', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${pName}',
			amount : '100',
// 			amount : '${payResult}',
			buyer_email : '${member.email }',
			buyer_name : '${member.name }',
			buyer_tel : '${member.cellphone }',
			buyer_addr : '${member.city } ${member.street }',
			buyer_postcode : '${member.zip }'
			}, function(rsp) {
			if ( rsp.success ) {
				var params = {'payType':'${payType}','id':'${id}', 'msg':'${msg}','code':'${code}'};	
				var basket = {'payResult':'${payResult}','coupon':'${coupon}','point':'${point}','lists':'${lists}','qty':'${qty}'};		
				
			    var msg = '결제가 완료되었습니다.';
			    msg += '고유ID : ' + rsp.imp_uid;
			    msg += '상점 거래ID : ' + rsp.merchant_uid;
			    msg += '결제 금액 : ' + rsp.paid_amount;
			    msg += '카드 승인번호 : ' + rsp.apply_num;
			    alert(msg);
			    
				var method = method || "post";	    
			    var form = document.createElement("form");
			    
			    form.setAttribute("method", method);
			    form.setAttribute("action", 'payOK.action');
			    
			    for(var key in params) {
			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", key);
			        hiddenField.setAttribute("value", params[key]);
			        form.appendChild(hiddenField);
			        
			    }
			    for(var key in basket) {
			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", key);
			        hiddenField.setAttribute("value", basket[key]);
			        form.appendChild(hiddenField);
			        
			    }
			    document.body.appendChild(form);
			    form.submit();			    

			} else {
// 				var params = {'payType':'${payType}','id':'${id}', 'msg':'${msg}','code':'${code}'};	
// 				var basket = {'payResult':'${payResult}','coupon':'${coupon}','point':'${point}','lists':'${lists}','qty':'${qty}'};				

// 			    var msg = '결제가 완료되었습니다.';
// 			    msg += '고유ID : ' + rsp.imp_uid;
// 			    msg += '상점 거래ID : ' + rsp.merchant_uid;
// 			    msg += '결제 금액 : ' + rsp.paid_amount;
// 			    msg += '카드 승인번호 : ' + rsp.apply_num;
// 			    alert(msg);
			    
// 				var method = method || "post";	    
// 			    var form = document.createElement("form");
			    
// 			    form.setAttribute("method", method);
// 			    form.setAttribute("action", 'payOK.action');
			    
// 			    for(var key in params) {
// 			        var hiddenField = document.createElement("input");
// 			        hiddenField.setAttribute("type", "hidden");
// 			        hiddenField.setAttribute("name", key);
// 			        hiddenField.setAttribute("value", params[key]);
// 			        form.appendChild(hiddenField);
			        
// 			    }
// 			    for(var key in basket) {
// 			        var hiddenField = document.createElement("input");
// 			        hiddenField.setAttribute("type", "hidden");
// 			        hiddenField.setAttribute("name", key);
// 			        hiddenField.setAttribute("value", basket[key]);
// 			        form.appendChild(hiddenField);
			        
// 			    }
// 			    document.body.appendChild(form);
// 			    form.submit();		
			    var msg = '결제에 실패하였습니다.';
			    msg += '에러내용 : ' + rsp.error_msg;
			    alert(msg);
			
			    window.location.href = "/beaudam/myBasket.action";
			}
		});
	</script>
	
</body>
</html>