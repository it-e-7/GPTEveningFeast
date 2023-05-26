<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	</div>
	${ GPTResult }
</body>
</html>