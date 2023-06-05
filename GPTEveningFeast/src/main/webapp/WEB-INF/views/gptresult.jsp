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
<link rel="stylesheet" href="/evenapp/resources/css/gptresult.css">
</head>
<body>

	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
	<div class="gpt-result-title-wrapper">
		<p>GPT가 요리를 완성했어요 !</p>
		<h1>GPT의 추천 레시피</h1>
		<h1>${ GPTResult.menu }</h1>
	</div>
	<div class="gpt-result-container">
	<div class="mbox">
		<div class="nav-button-wrapper">
			<span class="nav-button active" onclick="clickIngredient()" id="ingred-nav">재료</span>
			<span class="nav-button" onclick="clickRecipe()" id="recipe-nav">조리방법</span>
		</div>
		<div class="ingredient-wrapper">
			<ul>
			<h2>준비 재료</h2>
			<c:forEach items="${ GPTResult.ingredients }" var="ingredient">
				<li>
				<img src="resources/img/ico-checklist.png" style="margin-right: 11px;">
				${ fn:replace(ingredient, "=", " ") }
				</li>
			</c:forEach>
			</ul>
		</div>
		
		<div class="recipe-wrapper">
			<ul>
			<c:forEach items="${ GPTResult.recipe }" var="line" varStatus="status">
				<li>
				<h2>STEP${ status.count }</h2>
				${ line }
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	</div>
	<div class="gpt-product-list-container">
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
	</div>
</body>
<script src="/evenapp/resources/js/gptresult.js"></script>
</html>