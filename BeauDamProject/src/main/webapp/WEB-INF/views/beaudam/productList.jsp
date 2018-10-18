<%@ page language="java" contentType="text/html; charset=UTF-8"
session="false" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>


<!DOCTYPE HTML>
<html>
    <head>
        <title>list</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%=cp%>/resources/css/beaudam/list.css">
        <link rel="stylesheet" href="./resources/css/beaudam/main.css">
    </head>
    <body>
    	<jsp:include page="./mainTop.jsp" />
        <div class="head" style="background-image: url('<%=cp%>/resources/image/beaudam/productList/background_eye.jpg');">
            <p>EYE MAKEUP</p>
        </div>
        <div class="brand">
            <table class="brandname">
            	<tr>
            		<th style="font-size: 20px; padding: 10px;">BRAND</th>
                    <!-- <td colspan="2" style="text-align: right;"><input type="button" value="조회"></td> -->
                </tr>
                <tr>
                    <td><input type="checkbox"> NATURE REPUBLIC</td>
                    <td><input type="checkbox"> THE FACE SHOP</td>
                    <td><input type="checkbox"> A'PIUE</td>
                </tr>
                <tr>
                    <td><input type="checkbox"> ETUDE HOUSE</td>
                    <td><input type="checkbox"> INNISFREE</td>
                    <td><input type="checkbox"> HOLIKA HOLIKA</td>
                </tr>

            </table>
        </div>
        <div class="bestlist">
        	<ul>
        		<li>
        			<div>
        				<img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg">
        				<p style="font-size: 20px; color: #ff4d4d">BEST 01</p>
        				솔솔 말린 솔방울
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div>
        				<img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg">
        				<p style="font-size: 20px; color: #ff4d4d">BEST 02</p>
        				솔솔 말린 솔방울
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div>
        				<img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg">
        				<p style="font-size: 20px; color: #ff4d4d">BEST 03</p>
        				솔솔 말린 솔방울
        				<p>5,000원</p>
        			</div>
        		</li>
        	</ul>
        </div>
		<div class="list">
		총 <font style="color: #ff4d4d">14개</font>의 상품이 있습니다.
        	<ul>
        		<li>
        			<div class="listitem">
        				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></a>
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></a>
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></a>
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></a>
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<a href=""><img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg"></a>
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg">
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        		<li>
        			<div class="listitem">
        				<img alt="" src="<%=cp%>/resources/image/beaudam/main/bestitem_sample.jpg">
        				<p>솔솔 말린 솔방울</p>
        				<p>5,000원</p>
        			</div>
        		</li>
        	</ul>
        </div>
        <jsp:include page="./mainBottom.jsp" />
    </body>
</html>