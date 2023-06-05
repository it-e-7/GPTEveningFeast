<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/evenapp/resources/css/home.css">
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="recommend-product-wrapper">
			<h2>오늘의 추천 상품</h2>
			<ul class="random-list">
				<c:forEach var="product" items="${random}" varStatus="status">
					<c:if test="${status.count <= 3}">
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
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
