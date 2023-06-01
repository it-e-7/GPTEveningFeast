<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/cart.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<h1>장바구니</h1>
	<!-- 총 상품금액 및 주문하기 버튼 -->
	<div class="totalAmount">
		<p>
			총 상품금액:
			<fmt:formatNumber value="${totalProductAmount}" pattern="#,###" />
			원
		</p>
		<button class="orderButton" onclick="moveToOrder()">주문하기
			${fn:length(cartInfo)}</button>
	</div>
	<br>

	<input type="checkbox" name="allCheck" id="allCheck" checked>

	<label for="allCheck">전체 선택</label>
	<br>
	<br>

	<c:forEach var="vo" items="${cartInfo}" varStatus="loop">
		<input type=hidden id="product_id_${loop.index}"
			value="${vo.productId}">

		<div class="productContainer" index="${loop.index}">
			<div class="productInfo">
				<a href="/evenapp/product/${vo.productId}"> <input
					type="checkbox" class="productCheckbox" checked> <img
					class="productImg" src="${vo.productImgUrl}" alt="이미지">
				</a>
				<div class="productDetails">
					<div class="ellipsis" id="product-name">${vo.productName}</div>
					<div>
						<button onclick="decrement(${loop.index})">-</button>
						<input class="product_cnt" id="product_cnt_${loop.index}" 
							type="number" value="${vo.productCnt}" min="1" 
							name="product_count" readonly>
						<button onclick="increment(${loop.index})">+</button>
					</div>
					<div class="ellipsis">
						<p id="product_price_${loop.index}">
							<fmt:formatNumber value="${vo.productPrice}" pattern="#,###" />
							원
						</p>
						<p id="total_price_${loop.index}">
							<fmt:formatNumber value="${vo.productPrice * vo.productCnt}"
								pattern="#,###" />
							원
						</p>
					</div>
				</div>
			</div>
			<button class="deleteButton" onclick="deleteCartProduct('${vo.productId}')">X</button>
			<button class="purchaseButton" onclick="quickOrder(${loop.index})">바로구매</button>
		</div>
	</c:forEach>

</body>
<script src="/evenapp/resources/js/cart.js"></script>
</html>
