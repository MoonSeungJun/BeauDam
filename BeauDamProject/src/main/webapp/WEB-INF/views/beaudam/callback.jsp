<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>NaverLoginTest</title>
<script type="text/javascript">
	var result = ${result};
	var result = result.toJSONString();
	alert(typeof result);
	alert(result);
	var obj = JSON.parse(result);
	document.getElementById("demo").innerHTML = obj.email;
	
</script>
</head>
<body>
    <br>
    <div style="text-align:center">
		${result }
		<a href="${url}"><img src="/naverlogintutorial/resources/image/네이버 아이디로 로그인_로그아웃_White.PNG" height=40/></a>
    </div>
</body>
</html>