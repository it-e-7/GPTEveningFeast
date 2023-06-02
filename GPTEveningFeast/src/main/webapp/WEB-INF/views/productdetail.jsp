<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />

<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="quantity-selector">
		<p id="product_name">${productDetail.productName}</p>
		<input type="hidden" id="product_id" value="${productDetail.productId}">
		<button onclick="decrement()">-</button>
		<input id="product_cnt" type="number" value="1" min="1"
			name="product_count" disabled>
		<button onclick="increment()">+</button>

		<p id="product_price">
			<fmt:formatNumber value="${productDetail.productPrice}"
				pattern="#,###" />
			원
		</p>
	</div>



	<p id="total_price">
		<fmt:formatNumber value="${productDetail.productPrice}"
			pattern="#,###" />
		원
	</p>

	<button onclick="cart('${productDetail.productId}')">장바구니</button>
	<button onclick="quickOrder()">바로구매</button>

	<div action="/product/${productDetail.productId}" method="get">
		<img src="${productDetail.productImgUrl}" /><br>
		${productDetail.productName}<br> 
		<p class="product-one-price">
			<fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" /> 원
		</p><br>
		${productDetail.detail}
	</div>
</body>
<script src="/evenapp/resources/js/productdetail.js"></script>
</html>