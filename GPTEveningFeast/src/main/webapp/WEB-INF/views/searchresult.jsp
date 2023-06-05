<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="/evenapp/resources/css/productlist.css">
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<h1>'${ searchParam }' 검색결과</h1>

		<div class="filter-wrapper">
			<div>
				<p>새벽배송</p>
				<p>브랜드직송</p>
			</div>
			<div>
				<p>추천순</p>
				<p>인기상품순</p>
				<p>신상품순</p>
				<p>낮은가격순</p>
				<p>높은가격순</p>
			</div>
		</div>

		<ul class="product-list-container" data-offset="1">
			<c:forEach var="product" items="${ productList }">
				<li id="${ product.productId }">
					<a href="/evenapp/product/${ product.productId }"> 
					<img src="${ product.productImgUrl }" class="product-list-img">
						<p class="product-name">${ product.productName }</p> 
					</a>
					<span class="product-price">
						<strong> 
							<em>
								<fmt:formatNumber value="${ product.productPrice }" pattern="#,###" />
							</em> 
							원
						</strong>
						<button class="cart-btn" onclick="cartFromList('${ product.productId }')">
						</button>
					</span>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
<script src="/evenapp/resources/js/productlist.js"></script>
</html>