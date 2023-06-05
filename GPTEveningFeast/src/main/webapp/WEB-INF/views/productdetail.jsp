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
								<em>
									<fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" />
								</em>
								원
							</strong>
						</span>
					</div>
					<div class="detailinfo">
						<dl style="display: flex; flex-direction: row;">
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
						<input type="hidden" class="product-one-price" 
								value="${productDetail.productPrice}">
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
		
		<!-- 페이지 윗 부분   -->
		
			<div class="prodetailcont" style="min-height: 363px;">
				<input type="hidden" id="product_id" value="${productDetail.productId}">
				<div class="prodetail-area">
					<div class="tab-menu protabs"
						 style="position: absolute; inset: 0px auto auto 0px;">
						 <div class="active" style="width: 25%;">
						 	<span>상세정보</span>
						 </div>
					</div>
					<section id="p_proDetail" class="tab-contents prodetail active">
						 	<div class="detailcont" action="/product/${productDetail.productId}" method="get">
								${productDetail.detail}
							</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/evenapp/resources/js/productdetail.js"></script>
</html>