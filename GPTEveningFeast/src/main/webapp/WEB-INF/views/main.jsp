<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/evenapp/resources/css/main.css" />

</head>
<body>
	<h2>오늘의 추천 상품</h2>
	<table>
		<tr>
			<c:forEach var="vo" items="${random}" varStatus="status">
				<c:if test="${status.count <= 3}">
					
					<td>
					<a href="/evenapp/product/${vo.productId}">
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
					</a>
					</td>

					<!-- VO 객체의 속성 -->
				</c:if>
			</c:forEach>
		</tr>
	</table>
</body>
</html>