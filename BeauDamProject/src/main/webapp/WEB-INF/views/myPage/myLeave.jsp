<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function leave() {
	
	f = document.myLeave;
	var result = confirm("정말로 탈퇴하시겠습니까?");
	
	if(result) {
		alert("탈퇴 되었습니다.");
		f.action = "<%=cp%>/main.action";
	}
	else {
		alert("탈퇴 취소되었습니다.");	
		f.action = "<%=cp%>/main.action";
	}
	
	f.submit();
	
}

</script>
<body>
<form action="" name="myLeave">
	<table border="1">
	
		<tr>
			<td colspan="2"><b style="font-size: 20px;">회원탈퇴</b>
		</tr>
		
		<tr>
			<td colspan="2">
				고객님께서 회원탈퇴를 원하시다니 저희 더샘 서비스가 많이 부족하고 미흡했나 봅니다.<br/> 
				불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br/> 
				아울러 회원탈퇴 시 아래 사항을 숙지해 주시기 바랍니다.
			</td>
		</tr>
	
		<tr>
			<td colspan="2">
				<table>
				
					<tr>
						<td style="background-color: #e6e4e6">
							<b style="font-size: 17px;">유의사항</b><br/>
							
							*회원탈퇴를 하시면 보유하고 계신 포인트는 자동 소멸됩니다.<br/>
							*회원탈퇴는 온라인/오프라인 통합 탈퇴이므로 추후 멤버쉽카드 사용이 불가능합니다.<br/>
							*회원탈퇴시 고객님께서 보유하셨던 포인트 등은 모두 삭제되며 모든 내역, 구매 정보, 기타 활동 정보는 바로 삭제됩니다.<br/> 
							 (단, 해킹 및 본인의 의사와 상관없이 이뤄진 탈퇴는 고객센터로 문의해 주시기 바랍니다.)<br/>
							*이벤트 참여는 탈퇴 이후 자동 탈락을 기본으로 하며 이전 당첨에 있어서는 경품 발송이 진행됩니다.<br/>
							*회원탈퇴 시에는 탈퇴 일 이후 15일 동안 재가입이 불가능합니다.<br/>
							*회원탈퇴 후 재가입은 가능하지만 한 번 탈퇴한 아이디는 다시 사용하실 수 없습니다.
						</td>
					</tr>
				
				</table>
			</td>
		</tr>

		<tr>
			<td colspan="2"><b style="font-size: 20px;">본인확인</b>
		</tr>
	
		<tr>
			<td>
				<b>아이디</b>
			</td>
			
			<td>
				beaudam
			</td>
		</tr>
		
		<tr>
			<td>
				<b>비밀번호</b>
			</td>
			
			<td>
				<input type="text">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button onclick="leave();">회원탈퇴하기</button>
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>