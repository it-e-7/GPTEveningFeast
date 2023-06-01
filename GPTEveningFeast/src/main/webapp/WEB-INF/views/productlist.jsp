<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
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
	<div class="product-list-category-wrapper">
		<h1>${ category.name }</h1>
		<ul class="product-list-section-wrapper">
			<li><a href="/evenapp/product?category=${ category.ctgrId }">전체보기</a>
			</li>
			<c:forEach var="section" items="${ category.sections }">
				<li><a
					href="/evenapp/product?category=${ category.ctgrId }&section=${ section.sectId }">
						${ section.name } </a></li>
			</c:forEach>
		</ul>
	</div>

		<ul class="product-list-container" data-offset="1">
			<c:forEach var="product" items="${ productList }">
				<li>
					<a href="/evenapp/product/${ product.productId }"> 
						<img src="${ product.productImgUrl }" class="product-list-img">
						<p>${ product.productName }</p>
						<p>${ product.productPrice }</p>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/productlist.js"></script>
</html>