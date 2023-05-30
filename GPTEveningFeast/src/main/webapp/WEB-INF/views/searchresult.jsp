<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%@ include file="/WEB-INF/views/headernav.jsp"%>

	<h1>${ searchParam } 검색 결과</h1>
	
	<c:forEach var="product" items="${ productList }">
		<a href="/evenapp/product/${ product.productId }">
			<img src="${ product.productImgUrl }">
			<p>${ product.productName }</p>
			<p>${ product.productPrice }</p>
		</a>
	</c:forEach>
</body>
</html>