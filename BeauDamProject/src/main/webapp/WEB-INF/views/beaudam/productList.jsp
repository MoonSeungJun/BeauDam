<%@ page language="java" contentType="text/html; charset=UTF-8"
session="true" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>list</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/beaudam/list.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
.page {
	background-color: fuchsia; 
	margin: 30px auto 0 auto; 
	width: 960px;
	text-align: center;
}
.page ol {
	overflow: hidden;
}
.page li {
	width: 34px;
	height: 34px;
	border: 1px solid gray;
	float: left;
}
.pageing {
	padding: 30px;
	text-align: center;
	margin-top: 30px;
}
.pageing ol {
	overflow: hidden; 
	display: inline-block; 
	padding: 0;
	margin: 0;
	
}
.pageing li {
	width: 34px;
	height: 34px;
	line-height: 34px;
	float: left;
	border: 1px solid #d7d5d5;
}
.pageing li:hover {
       background-color: rgba( 237, 237, 237, 0.5 ); 
}
</style>

<script type="text/javascript">	
// $(document).ready(function(){
// 	var brand = '${brand}';		
// 	brand = brand.replace("[","");
// 	brand = brand.replace("]","");
// 	var arr = new Array();	
// 	arr = brand.split(",");	
	
// 	var temp = "";
// 	var val = "";

// 	for(var i=0;i<arr.length;i++){	
// 		temp = arr[i];
// 		temp = temp.trim();
		
// 		$('input:checkbox[name=brand]').each(function() {			
// 			val = this.value;	
// 			if(val.toString() === temp.toString()){
// 	            this.checked = true; //checked 처리
// 			}				     
// 		 });
// 	}	
// });
window.onload = function() {
	var brand = '${brand}';		
	brand = brand.replace("[","");
	brand = brand.replace("]","");
	var arr = new Array();	
	arr = brand.split(",");	
	
	var temp = "";
	var val = "";

	for(var i=0;i<arr.length;i++){	
		temp = arr[i];
		temp = temp.trim();
		
		$('input:checkbox[name=brand]').each(function() {			
			val = this.value;	
			if(val.toString() === temp.toString()){
	            this.checked = true; //checked 처리
			}				     
		 });
	}	
}
	
	
	function submit(listUrl,page) {
		
		var pageNum = page;
		var listUrl = listUrl;			
		var f= document.productListForm;	
		$("input:checkbox[name=brand]:checked").each(function(){
			brand.push($(this).val()+",");			
		});		
		f.action= listUrl+"pageNum="+pageNum;	
		f.submit();
		
		
	}
	
	
	function searchBrand() {
		var pageNum = '1';
		var brand = new Array();
		var value = $('#value').val();
		var type = $('#type').val();		
		var f= document.productListForm;	
		
		if(!value){
		 	value = '';
		}
		if(!type){
			type = '';
		}				
		
		
		$("input:checkbox[name=brand]:checked").each(function(){
			brand.push($(this).val()+",");			
		});		
		if (brand==""){
			alert("브랜드를 선택해주세요.");
			return;
		}		
		
		if(type != ""){
			
			f.action= "<%=cp%>/searchProductList.action?type="+type+"&pageNum=1";				
		}
		
		if(value != ""){
			
			f.action= "<%=cp%>/searchProductList.action?value="+value+"&pageNum=1";	
			
		}		
		
		f.submit();	
		
	}
</script>


</head>
<body>
<jsp:include page="./mainTop.jsp" />
	
<c:if test="${!empty searchValue  }">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background.jpg');">
	    <p>검색결과</p>
	</div>
</c:if>

<c:if test="${empty searchValue }">
	
	<c:if test="${searchType== 'Shadow'||searchType== 'Mascara'||searchType== 'Liner'||searchType== 'Eyelashes'}">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_eye.jpg');">
	    <p>EYE MAKEUP</p>
	</div>
	</c:if>
	
	<c:if test="${searchType== 'BB'||searchType== 'Base'||searchType== 'Blush'||searchType== 'Contouring/Highlighter'||searchType== 'Cushion'||searchType== 'Primer'||searchType== 'Foundation'||searchType== 'Pact'}">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_skin.jpg');">
	    <p>SKIN MAKEUP</p>
	</div>
	</c:if>
	<c:if test="${searchType== 'Balm'||searchType== 'Gloss'||searchType== 'Stick'||searchType== 'Tint' }">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_lip.png');">
	    <p>LIP MAKEUP</p>
	</div>	
	</c:if>
	<c:if test="${searchType== 'Pads'||searchType== 'Swab'||searchType== 'Curler'||searchType== 'Puff'||searchType== 'Brush' }">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_acc.jpg');">
	    <p>ACCESSORY</p>
	</div>
	</c:if>
	<c:if test="${searchType== 'Cleansing'||searchType== 'Water'||searchType== 'Peeling' }">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_cleansing.jpg');">
	    <p>CLEANSING</p>
	</div>	
	</c:if>
	<c:if test="${searchType== 'Wash'||searchType== 'Sheet' }">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_pack.jpg');">
	    <p>PACK</p>
	</div>	
	</c:if>
	<c:if test="${searchType== 'Perfume'}">
	<div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_perfume.jpg');">
	    <p>PERFUME</p>
	    
	</div>		
	</c:if>
</c:if>
	<div class="type">
		<h3>${searchType}</h3>
	</div>	
	<div class="brand">
		<form action="" method="post" name="productListForm">
	    <table class="brandname">
	    	<tr>
	    		<th style="font-size: 20px; padding: 10px;">BRAND</th>
	            <td colspan="2" style="text-align: right; marg">
	            	<input type="button" value="조회" onclick="searchBrand();" style="margin-right: 30px; border: none; padding: 5px;">
	            	<input type="hidden" id="value" name="searchValue" value="${searchValue }">
	            	<input type="hidden" id="type" name="searchType" value="${searchType }">
	            	<input type="hidden" id="brand" name="brand" value="${brand }">
	            	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum }">
	            </td>
	        </tr>                
	        <tr>
	        	
	            <td><input type="checkbox" name="brand" id="Nature Republic" value="Nature Republic"> NATURE REPUBLIC</td>
	            <td><input type="checkbox" name="brand" id="The Face Shop" value="The Face Shop"> THE FACE SHOP</td>
	            <td><input type="checkbox" name="brand" id="Apieu" value="Apieu"> A'PIUE</td>
	        </tr>
	        <tr>
	            <td><input type="checkbox" name="brand" value="Etude" id="Etude"> ETUDE HOUSE</td>
	            <td><input type="checkbox" name="brand" value="Innisfree" id="Innisfree"> INNISFREE</td>	           
	        </tr>	
	    </table>
	    </form>
	</div>
	<div class="bestlist">
		<ul>
			<li>
				<div>
					<a href="<%=cp %>/productDetail.action"><img class="bestlist_img" alt="" src="<%=cp%>/resources/image/beaudam/main/sample1.jpg"></a>
					<p style="font-size: 20px; color: #ff4d4d; font-family: 'YiSunShinDotumM';">BEST 01</p>
					솔솔 말린 솔방울
					<p style="color: #ee782f; font-size: 20px; font-family: 'YiSunShinDotumM';">5,000원</p>
				</div>
			</li>
			<li>
				<div>
					<a href="<%=cp %>/productDetail.action"><img class="bestlist_img" alt="" src="<%=cp%>/resources/image/beaudam/main/sample2.jpg"></a>
					<p style="font-size: 20px; color: #ff4d4d; font-family: 'YiSunShinDotumM';">BEST 02</p>
					솔솔 말린 솔방울
					<p style="color: #ee782f; font-size: 20px; font-family: 'YiSunShinDotumM';">5,000원</p>
				</div>
			</li>
			<li>
				<div>
					<a href="<%=cp %>/productDetail.action"><img class="bestlist_img" alt="" src="<%=cp%>/resources/image/beaudam/main/sample3.jpg"></a>
					<p style="font-size: 20px; color: #ff4d4d; font-family: 'YiSunShinDotumM';">BEST 03</p>
	      				솔솔 말린 솔방울
	      			<p style="color: #ee782f; font-size: 20px; font-family: 'YiSunShinDotumM';">5,000원</p>
	      		</div>
	      	</li>
		</ul>
	</div> 
	<div class="list"> 
	
	총 <font style="color: #ff4d4d">${count }개</font>의 상품이 있습니다.
		<ul>
			<c:forEach var="dto" items="${searchProductList }">
			<li>
				<div class="listitem" id="${dto.brand }"style="display: block;">
					<a href="${detailUrl }&code=${dto.code}"><img alt="" src="<%=cp %>/thumbImg/${dto.thumb_Img}"></a>
					<p style="color: gray;">${dto.brand }</p>
					<p>${dto.product_Name }</p>
					<p style="color: #ee782f; font-size: 20px; font-family: 'YiSunShinDotumM';">${dto.product_Price }원</p>
				</div>
			</li>			
			</c:forEach>
		</ul>
	</div>
	<div class="pageing">
		<a><img alt="" src="<%=cp%>/resources/image/beaudam/productList/pre.gif"></a>
		<ol>
			<c:if test="${!empty pageIndexList }">
				${pageIndexList }
			</c:if>
			<c:if test="${empty pageIndexList }">
				다른 상품을 검색해 주세요
			</c:if>
			
		</ol>
		<a><img alt="" src="<%=cp%>/resources/image/beaudam/productList/next.gif"></a>
	</div>
	<jsp:include page="./mainBottom.jsp" />
	</body>
</html>