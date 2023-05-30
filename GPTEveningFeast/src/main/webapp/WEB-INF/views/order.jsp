<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>
	
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
        <p>총 상품금액 </p>
        <button onclick="orderButton()">
        	주문하기<c:out value="${fn:length(preOrderProduct)}" />
        </button>
        
    
    <h2>결제수단</h2>
        <input type="radio" name="hpay" checked><label for="hpay">h Pay</label> 
    
</body>
</html>
