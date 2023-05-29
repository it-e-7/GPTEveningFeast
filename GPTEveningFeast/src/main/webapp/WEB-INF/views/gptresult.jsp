<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>GPT의 추천</h3>
		<h2>${ GPTResult.menu }</h2>

		<hr>

		<span>
			<h4>준비 재료</h4> <c:forEach items="${ GPTResult.ingredients }"
				var="ingredient">
				<p>${ ingredient }</p>
			</c:forEach>
		</span>

		<c:forEach items="${ GPTResult.recipe }" var="line">
			<p>${ line }</p>
		</c:forEach>
		
		<hr>
		<button>관련상품 장바구니 담기</button>
		<p>관련상품 ${ fn:length(productResult) }건</p>
		
		<c:forEach items="${ productResult }" var="product">
			<img src="${ product.productImgUrl }"/>
			<p>${ product.productName }</p>
			<p>${ product.productPrice }</p>
		</c:forEach>

	</div>
	${ GPTResult }
	${ productResult }
</body>
</html>