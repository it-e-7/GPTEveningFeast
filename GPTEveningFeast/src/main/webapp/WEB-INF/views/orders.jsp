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
<script src="/evenapp/resources/js/order.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%-- 	<%@ include file="/WEB-INF/views/headernav.jsp"%> --%>

	<h1>주문목록</h1>


	<p>결제완료</p>
	<c:set var="prevDate" value="" />
	<c:set var="orderCount" value="0" />

	<c:forEach var="vo" items="${orderList}" varStatus="loop">
		<c:if test="${vo.date != prevDate}">

			<c:if test="${not loop.first}">
				<p>일반배송 ${orderCount}건</p>
								결제금액
				<p class="order-list-total-price">
					<fmt:formatNumber value="${price}" pattern="#,###" /> 원
				</p>
				</div>
			</c:if>

			<div class="order-list-wrapper">
				<p>주문날짜 ${vo.date}</p>
			<c:set var="orderCount" value="0" />
				
		</c:if>
		<div class="order-product-wrapper">
			<img src="${vo.productImgUrl}">
			<p>${vo.productName}</p>
			<p class="order-list-price">
				<fmt:formatNumber value="${vo.productPrice}" pattern="#,###" />
				원
			</p>
			<p class="order-list-cnt">${vo.productCnt}개</p>
		</div>
		<c:set var="prevDate" value="${vo.date}" />
		<c:set var="orderCount" value="${orderCount + 1}" />
	</c:forEach>

	<p>주문번호 ${orderList[0].orderId}</p>

</body>
</html>