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
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="all-cart-container">
	<div class="cart-container">
		<div class="left-area">
		<h1>장바구니</h1>
		
		<input type="checkbox" name="allCheck" id="allCheck" checked>
	
		<label for="allCheck">전체 선택</label>
		<br>
		<br>
	
		<div>
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
						<div class="ellipsis" id="product_name_${loop.index}">${vo.productName}</div>
						<span class="info">
							<div class="ea-area">
								<button onclick="decrement(${loop.index})">-</button>
								<input class="product_cnt" id="product_cnt_${loop.index}"
									type="number" value="${vo.productCnt}" min="1"
									name="product_count" readonly>
								<button onclick="increment(${loop.index})">+</button>
								<p id="product_price_${loop.index}" hidden>
									<fmt:formatNumber value="${vo.productPrice}" pattern="#,###" />
									원
								</p>
								<p id="total_price_${loop.index}">
									<fmt:formatNumber value="${vo.productPrice * vo.productCnt}"
										pattern="#,###" /> 원
								</p>
							</div>
							<button class="purchaseButton" onclick="quickOrder(${loop.index})">바로구매</button>
						</span>
					</div>
				</div>
				<button class="deleteButton"
					onclick="deleteCartProduct('${vo.productId}')">X</button>
				
			</div>
		</c:forEach>
		</div>
		</div>
		<div class="riget-area">
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
		
		</div>
	</div>
	</div>

</body>
<script src="/evenapp/resources/js/cart.js"></script>
</html>
