<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
	
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/productdetail.js"></script>

<link rel="stylesheet" type="text/css" href="/evenapp/resources/css/main.css" />

<body>
	<div class="quantity-selector">
    <p id="product_name">${productDetail.productName}</p>

    <button onclick="decrement()">-</button>
    <input id="product_cnt" type="number" value="1" min="1" name="product_count" disabled>
    <button onclick="increment()">+</button>

    <p id="product_price">
        <fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" />원
    </p>
</div>



	<p id="total_price">
		<fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" />원
	</p>
	
	<button onclick="cart('${productDetail.productId}')">장바구니</button>
	<button onclick="orderPage()">바로구매</button>

	<div action="/product/${productDetail.productId}" method="get">
		<img src="${productDetail.productImgUrl}" /><br>
		${productDetail.productName}<br> ${productDetail.productPrice}<br>
		${productDetail.detail}
	</div>
</body>
</html>