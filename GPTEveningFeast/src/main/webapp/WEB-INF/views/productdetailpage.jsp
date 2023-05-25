<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/productdetail.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css" />


<body>
	<div class="quantity-selector">
		<button onclick="decrement()">-</button>
		<input type="number" value="0" min="0" name="product_count">
		<button onclick="increment()">+</button>
	</div>
	<button onclick="cart('${productDetail.productId}')">장바구니</button>
	<button onclick="orderPage()">바로구매</button>
	
	
	<form action="/product/${productDetail.productId}" method="get">
		<img src="${productDetail.productImgUrl}" /><br>
		${productDetail.productName}<br> 
		${productDetail.productPrice}<br>
		${productDetail.detail}
	</form>
</body>
</html>