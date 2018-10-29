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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
	<script type="text/javascript">
		var IMP = window.IMP;
		IMP.init('XXXXXX');
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
			pay_method : 'card', // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
			merchant_uid : 'test',
			name : '주문명:test#1',
			amount : 33000,
			buyer_email : 'xxxx@gmail.com',
			buyer_name : '유용빈',
			buyer_tel : '010-4241-XXXX',
			buyer_addr : 'XX',
			buyer_postcode : '143-193'
			}, function(rsp) {
			if ( rsp.success ) {
			    var msg = '결제가 완료되었습니다.';
			    msg += '고유ID : ' + rsp.imp_uid;
			    msg += '상점 거래ID : ' + rsp.merchant_uid;
			    msg += '결제 금액 : ' + rsp.paid_amount;
			    msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
			    var msg = '결제에 실패하였습니다.';
			    msg += '에러내용 : ' + rsp.error_msg;
			}
		});
	</script>
</body>
</html>