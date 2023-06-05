<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/productdetail.css" />

<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>
	<div id="contents">
		<div class="innercon">
			<section class="proinfo-area">
				<div class="propic">
					<div class="propicbig">
						<div class="zoomWrapper" style="height: 624px; width:520px;">
							<img data-zoom-image="${productDetail.productImgUrl}"
								src="${productDetail.productImgUrl}" 
								style="position: absolute;"/>
						</div>
					</div>
				</div>
				<div class="proinfo">
					<h2>
						<strong>${productDetail.productName}</strong>
						<small></small>
					</h2>
					
					<div class="price" id="price_section">
						<span class="txt-price">
							<strong>
								<em>${productDetail.productPrice}</em>
								원
							</strong>
						</span>
					</div>
					<div class="detailinfo">
						<dl>
							<dt>상품선택</dt>
							<dd>
								<div class="optionarea" id="top_optionarea">
									<div class="optionls">
										<div>
											<strong class="txt-ti">
												${productDetail.productName}
											</strong>
											<div class="ea-area">
												<input type="number" id="product_cnt" value="1" min="1"
														name="product_count" readonly>
												<button type="button" class="btn-down" onclick="decrement()">-</button> 
												<button type="button" class="btn-up" onclick="increment()">+</button>
											</div>
											<span class="txt-price">
												<em>
													<fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" />
												</em>
												원
											</span>
										</div>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="buybutton" id="top_buybutton">
						<p class="txt-total">
							총 금액 
							<strong>
								<em>
									<fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" />
								</em>
								원
							</strong>
						</p>
						<div class="btns">
							<button type="button" class="btn orange bigger btn-buy" 
									onclick="cart('${productDetail.productId}')">장바구니</button>
							<button type="button" class="btn fill orange bigger btn-buy" 
									onclick="quickOrder()">바로구매</button>
						</div>
					</div>
				</div>
			</section>
		
		<!-- 페이지 윗 부분
		 -->
		
			<div class="product-detail-container">
					<input type="hidden" id="product_id"
						value="${productDetail.productId}">
			</div>
	
			<div action="/product/${productDetail.productId}" method="get">
			<%-- 	<img src="${productDetail.productImgUrl}" /> --%>
				<br>
				${productDetail.productName}<br>
				<p class="product-one-price">
					<fmt:formatNumber value="${productDetail.productPrice}"
						pattern="#,###" />
					원
				</p>
				<br> ${productDetail.detail}
			</div>
		</div>
	</div>
</body>
<script src="/evenapp/resources/js/productdetail.js"></script>
</html>