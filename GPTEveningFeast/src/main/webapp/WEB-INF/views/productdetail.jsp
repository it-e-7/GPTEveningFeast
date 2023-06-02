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
	href="/evenapp/resources/css/productdetail.css" />

<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="product-detail-container">
			<img src="${productDetail.productImgUrl}" />
			<div class="detail-quantity-btn-wrapper">
				<div>
					<div>
						<p>${productDetail.productName}</p>
						<p>${productDetail.productPrice}</p>
					</div>
					<div>
						<div class="quantity-selector">
							<p id="product_name">${productDetail.productName}</p>
							<input type="hidden" id="product_id"
								value="${productDetail.productId}">
							<div class="quantity-price-wrapper">
								<span>
									<button onclick="decrement()">-</button> <input
									id="product_cnt" type="number" value="1" min="1"
									name="product_count" disabled>
									<button onclick="increment()">+</button>
								</span>
								<p id="product_price">
									<fmt:formatNumber value="${productDetail.productPrice}"
										pattern="#,###" />
									원
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="price-btn-wrapper">
					<p id="total_price">
						<fmt:formatNumber value="${productDetail.productPrice}"
							pattern="#,###" />
						원
					</p>
					
					<div class="btn-wrapper">
						<button onclick="cart('${productDetail.productId}')">장바구니</button>
						<button onclick="quickOrder()">바로구매</button>
					</div>
				</div>
			</div>
		</div>

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