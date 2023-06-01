<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/order.js"></script>
</head>
<body>

	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
    <h1>주문하기</h1>
    
    <h2>배송지 정보</h2>
        <p>
            ${signinUser.userName}<br>
            ${signinUser.userAddress}
        </p>
    
    <h2>주문상품 <c:out value="${fn:length(preOrderProduct)}" /></h2>
        <c:forEach var="vo" items="${preOrderProduct}">
            ${vo.productName} ${vo.productCnt}개<br>
        </c:forEach>
        
        <br>
        <p>총 상품금액</p>
       		<fmt:formatNumber value="${price}" pattern="#,###" />원<br>
        <button onclick="successOrder()">
        	주문하기<c:out value="${fn:length(preOrderProduct)}" />
        </button>
        
    
    <h2>결제수단</h2>
        <input type="radio" name="hpay" checked><label for="hpay">h Pay</label> 
    
</body>
</html>