<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action = "/product/${productDetail.productId}" method="get">
	<img src="${productDetail.productImgUrl}"/><br>
	${productDetail.productName}<br>
	${productDetail.productPrice}<br>
	${productDetail.detail}
</form>
</body>
</html>