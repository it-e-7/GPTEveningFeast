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
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
<%-- 	<%@ include file="/WEB-INF/views/headernav.jsp"%> --%>

	<h1>주문목록</h1>
	
	<p>주문날짜 출력</p>
	<p>일반배송 <c:out value="${fn:length(orderProduct)}" />건</p>	
	<p>결제완료</p>
	
	<c:forEach var="vo" items="${orderProduct}" varStatus="loop">
		<img src="${vo.productImgUrl}">
		<p>${vo.productName}</p>
		<p id="order-list-price_${loop.index}">
		<fmt:formatNumber value="${vo.productPrice*vo.productCnt}" pattern="#,###" />
							원
		</p>
		<p id="order-list-cnt_${loop.index}">${vo.productCnt} 개</p>
		<br>
	</c:forEach>
	
	결제금액
	<p id="order-list-total-price">
		<fmt:formatNumber value="${price}" pattern="#,###" />원
	</p>
	
	<p>주문번호 ${orderProduct[0].orderId}</p>
	
</body>
</html>