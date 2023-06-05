<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<div class="content-wrapper">
		<p>GPT가 요리를 완성했어요 !</p>
		<h2>GPT의 추천 레시피</h2>
		<h2>${ GPTResult.menu }</h2>

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
		
		<ul class="product-list-container">
			<c:forEach items="${ productResult }" var="product">
				<li id="${ product.productId }">
				<a href="/evenapp/product/${ product.productId }"> 
					<img src="${ product.productImgUrl }" class="product-list-img">
					<p class="product-name">${ product.productName }</p>
				</a> 
				<span class="product-price"> 
					<strong> 
						<em> 
							<fmt:formatNumber value="${ product.productPrice }" pattern="#,###" />
						</em> 원
					</strong> 
					<input type="checkbox" value="${ product.productId }" name="product">
				</span></li>
			</c:forEach>
		</ul>
	</div>
</body>
<script src="/evenapp/resources/js/gptresult.js"></script>
</html>