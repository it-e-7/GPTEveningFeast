<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%@ include file="/WEB-INF/views/headernav.jsp"%>

	<h1>상품 리스트 페이지</h1>
	<p>${ category.name }</p>
	<c:forEach var="section" items="${ category.sections }">
		<a href="/evenapp/products?category=${ category.ctgrId }&section=${ section.sectId }">
			${ section.name }
		</a>
	</c:forEach>
	<c:forEach var="product" items="${ productList }">
		<a href="/evenapp/product/${ product.productId }">
			<img src="${ product.productImgUrl }">
			<p>${ product.productName }</p>
			<p>${ product.productPrice }</p>
		</a>
	</c:forEach>
</body>
</html>