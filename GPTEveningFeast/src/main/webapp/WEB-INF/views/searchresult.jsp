<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<h1>${ searchParam }검색결과</h1>

	<div class="product-list-container" data-offset="1">
		<c:forEach var="product" items="${ productList }">
			<a href="/evenapp/product/${ product.productId }"> <img
				src="${ product.productImgUrl }">
				<p>${ product.productName }</p>
				<p>${ product.productPrice }</p>
			</a>
		</c:forEach>
	</div>
</body>
<script src="/evenapp/resources/js/productlist.js"></script>
</html>