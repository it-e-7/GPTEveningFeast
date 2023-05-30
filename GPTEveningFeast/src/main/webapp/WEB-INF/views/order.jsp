<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		${user.userName}<br> ${user.userAddress}
	</p>

	<h2>주문상품</h2>
	<c:forEach var="vo" items="${preOrderProduct}">
			${vo.productName} ${vo.productCnt}
		</c:forEach>


	<h2>결제수단</h2>
</body>
</html>