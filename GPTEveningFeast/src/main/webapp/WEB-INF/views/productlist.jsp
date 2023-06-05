<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div>
				<h2>${ category.name }</h2>
				<p class="home-category">홈 > ${ category.name }</p>
			</div>
			<ul class="product-list-section-wrapper">
				<li><a href="/evenapp/product?category=${ category.ctgrId }">전체보기</a>
				</li>
				<c:forEach var="section" items="${ category.sections }">
					<li id="${ section.sectId }"><a
						href="/evenapp/product?category=${ category.ctgrId }&section=${ section.sectId }">
							${ section.name } </a></li>
				</c:forEach>
			</ul>
		</div>

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
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/productlist.js"></script>
</html>