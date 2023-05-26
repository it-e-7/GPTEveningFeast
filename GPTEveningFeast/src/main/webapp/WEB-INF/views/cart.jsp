<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous">
	
</script>
<script src="/evenapp/resources/js/productdetail.js"></script>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/cart.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
	<h1>장바구니</h1>
	<c:forEach var="vo" items="${cartInfo}" varStatus="loop">
		<div class="productContainer">
			<div class="productInfo">
				<a href="/evenapp/product/${vo.productId}"> <input
					type="checkbox" class="productCheckbox"> <img
					class="productImg" src="${vo.productImgUrl}" alt="이미지">
				</a>
				<div class="productDetails">
					<div class="ellipsis">${vo.productName}</div>
					<div>
						<button onclick="decrement(${loop.index})">-</button>
						<input class="product_cnt" id="product_cnt_${loop.index}" type="number"
							value="${vo.productCnt}" min="1" name="product_count" disabled>
						<button onclick="increment(${loop.index})">+</button>
					</div>
					<div class="ellipsis">
						<fmt:formatNumber value="${vo.productPrice}" pattern="#,###" />
						원
					</div>
				</div>
			</div>
			<div class="deleteButton">X</div>
		</div>
	</c:forEach>

</body>
</html>

</html>
