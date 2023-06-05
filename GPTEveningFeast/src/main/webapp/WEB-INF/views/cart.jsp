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

	<div id="contents">
		<div class="innercon">
			<div class="left-area">
				<h1 class="top-text">장바구니</h1>

				<input type="checkbox" name="allCheck" id="allCheck" checked>

				<label for="allCheck">전체 선택</label> <br> <br>

				<div class="tit toggle-ti">
					배송 <em>${fn:length(cartInfo)}</em>
				</div>
				<c:choose>
					<c:when test="${fn:length(cartInfo) == 0}">
						<div class="nodata">
							장바구니에 담긴 상품이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<div class="cont">
							<ul class="product-list vertical">
								<c:forEach var="vo" items="${cartInfo}" varStatus="loop">
									<input type=hidden id="product_id_${loop.index}"
										value="${vo.productId}">

									<div class="productContainer" index="${loop.index}">
										<div class="productInfo">
											<a href="/evenapp/product/${vo.productId}"> <input
												type="checkbox" class="productCheckbox" id="item-check-box"
												checked> <img class="productImg"
												src="${vo.productImgUrl}" alt="이미지">
											</a>
											<div class="productDetails">
												<div class="delete-name-box">
													<div class="ellipsis" id="product_name_${loop.index}">${vo.productName}</div>
													<button class="deleteButton"
														onclick="deleteCartProduct('${vo.productId}')"></button>
												</div>
												<span class="info">
													<div class="ea-area">
														<button onclick="decrement(${loop.index})">-</button>
														<input class="product_cnt" id="product_cnt_${loop.index}"
															type="number" value="${vo.productCnt}" min="1"
															name="product_count" readonly>
														<button onclick="increment(${loop.index})">+</button>
														<p id="product_price_${loop.index}" hidden>
															<fmt:formatNumber value="${vo.productPrice}"
																pattern="#,###" />
															원
														</p>
														<p id="total_price_${loop.index}">
															<fmt:formatNumber
																value="${vo.productPrice * vo.productCnt}"
																pattern="#,###" />
															원
														</p>
													</div>
													<button class="purchaseButton"
														onclick="quickOrder(${loop.index})">바로구매</button>
												</span>
											</div>
										</div>

									</div>
								</c:forEach>
							</ul>
						</div>

					</c:otherwise>
				</c:choose>

			</div>

			<div class="right-area">
				<fieldset class="price-field">
					<dl class="orderprice">
						<dt>총 상품금액</dt>
						<dd>
							<strong>
								<em id="totalAmount">
									<fmt:formatNumber value="${totalProductAmount}" pattern="#,###" />
								</em>
								원
							</strong>
						</dd>
					</dl>

					<dl>
						<dt>총 배송비</dt>
						<dd>
							<strong>
								<em id="delivery-price-text">
									<fmt:formatNumber value="0" pattern="#,###" />
								</em>
								원
							</strong>
						</dd>
					</dl>
					<p class="txt">
						주문 결제 시 배송지에 따라 배송비가 상이할 수 있습니다.
					</p>
					
					<dl class="total">
						<dt>총 결제예상금액</dt>
						<dd>
							<strong>
								<em id="last-total-price">
									<fmt:formatNumber value="0" pattern="#,###" />
								</em>
								원
							</strong>
						</dd>
					</dl>

				</fieldset>
				<button type="button" class="btn fill bigger orange btn-order"
					onclick="moveToOrder()">주문하기 ${fn:length(cartInfo)}</button>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/cart.js"></script>
</html>
