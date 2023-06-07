<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/evenapp/resources/css/home.css">
<!-- Add Swiper CSS in the head tag -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<!-- Add swiper.min.js before your script -->

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/evenapp/resources/js/home.js"></script>

</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>
	<div class="banner-wrapper">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/30/081614/ocavz.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/25/145810/qgkod.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/26/163823/qgttb.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/06/01/082506/zzzbo.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/25/145810/gjtjj.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/30/081614/uamyt.jpg?RS=1204x540">
				</div>
				<div class="swiper-slide">
					<img
						src="https://tohomeimage.thehyundai.com/DP/DP034/2023/05/30/081614/wbeud.jpg?RS=1204x540">
				</div>
			</div>
			<div class="swiper-button-wrap">
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>

	</div>
	<div class="content-wrapper">
		<div class="recommend-product-wrapper">
			<h2>오늘의 추천 상품</h2>
			<ul class="random-list">
				<c:forEach var="product" items="${random}" varStatus="status">
					<c:if test="${status.count <= 3}">
						<li id="${ product.productId }"><a
							href="/evenapp/product/${ product.productId }"> <img
								src="${ product.productImgUrl }" class="product-list-img">
								<p class="product-name">${ product.productName }</p>
						</a> <span class="product-price"> <strong> <em> <fmt:formatNumber
											value="${ product.productPrice }" pattern="#,###" />
								</em> 원
							</strong>
								<button class="cart-btn"
									onclick="cartFromList('${ product.productId }')"></button>
						</span></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
	<%@ include file="/WEB-INF/views/footer.jsp"%>

</html>
