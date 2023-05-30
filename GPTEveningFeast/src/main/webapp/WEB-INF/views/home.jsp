<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/common.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%@ include file="/WEB-INF/views/headernav.jsp"%>
	
	<h2>오늘의 추천 상품</h2>
	<table>
		<tr>
			<c:forEach var="vo" items="${random}" varStatus="status">
				<c:if test="${status.count <= 3}">

					<td><a href="/evenapp/product/${vo.productId}">
							<table>

								<tr>
									<td><img src="${vo.productImgUrl}" alt="이미지"></td>
								</tr>
								<tr>
									<td class="ellipsis">${vo.productName}</td>
								</tr>
								<tr>
									<td class="ellipsis"><fmt:formatNumber
											value="${vo.productPrice}" pattern="#,###" />원</td>
								</tr>

							</table>
					</a></td>

					<!-- VO 객체의 속성 -->
				</c:if>
			</c:forEach>
		</tr>
	</table>

	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
