<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GPT 추천 레시피</title>
</head>
<body>

	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div>
		<h3>GPT의 추천</h3>
		<h2>${ GPTResult.menu }</h2>

		<hr>

		<span>
			<h4>준비 재료</h4> <c:forEach items="${ GPTResult.ingredients }"
				var="ingredient">
				<p>${ ingredient }</p>
			</c:forEach>
		</span>

		<c:forEach items="${ GPTResult.recipe }" var="line">
			<p>${ line }</p>
		</c:forEach>

		<hr>
		<button onclick="cartGPT()">관련상품 장바구니 담기</button>
		<p>관련상품 ${ fn:length(productResult) }건</p>

		<c:forEach items="${ productResult }" var="product">
			<a href="/evenapp/product/${ product.productId }"> <input
				type="checkbox" value="${ product.productId }" name="product">
				<img src="${ product.productImgUrl }" />
				<p>${ product.productName }</p>
				<p>${ product.productPrice }</p>
			</a>
		</c:forEach>

	</div>
</body>
<script src="/evenapp/resources/js/gptresult.js"></script>
</html>