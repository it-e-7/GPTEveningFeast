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

	<%@ include file="/WEB-INF/views/header.jsp"%>
	
    <h1>주문완료</h1>
    
    <h2>${signinUser.userName} 고객님, 감사합니다.\n 주문을 완료했습니다.</h2>
    <p>주문번호 ${orderProduct[0].orderId}</p>
    
    <h2>기본배송지</h2>
        <p>
            ${signinUser.userName}<br>
            ${signinUser.userAddress}
        </p>
    
    <h2>주문상품 정보<c:out value="${fn:length(orderProduct)}" /></h2>
        <c:forEach var="vo" items="${orderProduct}">
            ${vo.productName} ${vo.productCnt}개<br>
        </c:forEach>
        
        <br>
        <p>총 상품금액</p>
       		<fmt:formatNumber value="${price}" pattern="#,###" />원<br>

</body>
</html>
