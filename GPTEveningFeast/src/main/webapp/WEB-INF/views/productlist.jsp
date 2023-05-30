<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/productlist.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
<%-- 	<%@ include file="/WEB-INF/views/headernav.jsp"%> --%>

	<button onclick="scrollList()">스크롤 !</button>
	<h1>상품 리스트 페이지</h1>
	<p>${ category.name }</p>
	<ul>
		<li>
			<a href="/evenapp/product?category=${ category.ctgrId }">전체보기</a>
		</li>
		<c:forEach var="section" items="${ category.sections }">
			<li>
				<a href="/evenapp/product?category=${ category.ctgrId }&section=${ section.sectId }">
					${ section.name }
				</a>
			</li>
	</c:forEach>
	</ul>
	
	<div class="product-list-container" data-offset="1">
		<c:forEach var="product" items="${ productList }">
			<a href="/evenapp/product/${ product.productId }">
				<img src="${ product.productImgUrl }">
				<p>${ product.productName }</p>
				<p>${ product.productPrice }</p>
			</a>
		</c:forEach>
	</div>
</body>
</html>