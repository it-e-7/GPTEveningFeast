<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/evenapp/resources/css/mypage.css" />
<link rel="stylesheet" href="/evenapp/resources/css/orders.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="my-page-wrapper">
			<div class="left-nav-bar">
				<h2>마이페이지</h2>

				<h4>주문 관리</h4>
				<ul>
					<li><a href="/evenapp/order/orders">주문 내역</a></li>
				</ul>
				<h4>나의 정보</h4>
				<ul>
					<li><a href="/evenapp/update">회원정보 변경</a></li>
				</ul>
			</div>

			<div class="my-page-content-wrapper">
				<p style="font-size: 23px;">주문목록</p>

				<c:if test="${ empty orderList }">
					<div class="no-data">
						<img src="/evenapp/resources/img/excmark.png">
						<p>주문 내역이 없습니다.</p>
					</div>
				</c:if>
				<c:set var="prevOrderId" value="" />
				<c:set var="orderCount" value="0" />

				<c:forEach var="vo" items="${orderList}" varStatus="loop">
					<c:if test="${vo.orderId != prevOrderId}">
					<c:if test="${not loop.first}">

			</div>
			<div class="order-info-wrapper">
				<p style="color: #454545;">일반배송 ${orderCount}건</p>
				<p style="font-size: 23px; padding-top: 12px; color: #454545;">결제완료</p>
			</div>
		</div>
		
		<div class="order-footer">
		<p>주문번호 ${vo.orderId}</p>
		<div class="order-price-wrapper">
			<p style="font-weight: 700;">결제금액</p>
			<p class="order-list-total-price">
				<fmt:formatNumber value="${price}" pattern="#,###" />
				
			</p>
		</div>
		</div>
	</div>
	</c:if>

	<div class="order-list-wrapper">
		<p class="order-date">${ vo.date }</p>
		<c:set var="orderCount" value="0" />
		<div class="order-list-info-wrapper">
			<div class="order-product-list-wrapper">

				</c:if>
				<a href="/evenapp/product/${ vo.productId }">
					<div class="order-product-wrapper">

						<img src="${vo.productImgUrl}">
						<div class="product-info-wrapper">
							<p style="font-size: 18px; color: #767572;">${vo.productName}</p>
							<span class="product-price-wrapper">
								<p class="order-list-price">
									<fmt:formatNumber value="${vo.productPrice}" pattern="#,###" />
									원
								</p>
								/
								<p class="order-list-cnt">${vo.productCnt}개</p>
							</span>
						</div>

					</div>
				</a>
				<c:set var="prevOrderId" value="${vo.orderId}" />
				<c:set var="orderCount" value="${orderCount + 1}" />
				
				<c:if test="${loop.last}">

			</div>
			<div class="order-info-wrapper">
				<p style="color: #454545;">일반배송 ${orderCount}건</p>
				<p style="font-size: 23px; padding-top: 12px; color: #454545;">결제완료</p>
			</div>
		</div>
		
		<div class="order-footer">
		<p>주문번호 ${vo.orderId}</p>
		<div class="order-price-wrapper">
			<p style="font-weight: 700;">결제금액</p>
			<p class="order-list-total-price">
				<fmt:formatNumber value="${price}" pattern="#,###" />
				
			</p>
		</div>
		</div>
	</div>
	</c:if>
				</c:forEach>


			</div>
		</div>
	</div>



</body>
<script src="/evenapp/resources/js/order.js"></script>
<script src="/evenapp/resources/js/mypage.js"></script>
</html>