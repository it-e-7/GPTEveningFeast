<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<h1>상품 리스트 페이지</h1>
	<p>${ category.name }</p>
	<ul>
		<li><a href="/evenapp/product?category=${ category.ctgrId }">전체보기</a>
		</li>
		<c:forEach var="section" items="${ category.sections }">
			<li><a
				href="/evenapp/product?category=${ category.ctgrId }&section=${ section.sectId }">
					${ section.name } </a></li>
		</c:forEach>
	</ul>

	<ul class="product-list-container" data-offset="1">
		<c:forEach var="product" items="${ productList }">
			<li><a href="/evenapp/product/${ product.productId }"> <img
					src="${ product.productImgUrl }">
					<p>${ product.productName }</p>
					<p>${ product.productPrice }</p>
			</a></li>
		</c:forEach>
	</ul>
</body>
<script src="/evenapp/resources/js/productlist.js"></script>
</html>