<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/evenapp/resources/css/header.css">
</head>
<body>
	<c:set var="user" value="${sessionScope.signinUser}" />

	<header>
		<div class="header-wrapper">
			<a href="/evenapp">코사식품관</a>
			<c:choose>
				<c:when test="${empty user.userId}">
					<span> 
						<a href="/evenapp/signin">로그인</a> 
						<a href="/evenapp/signup">회원가입</a>
					</span>
				</c:when>
				<c:otherwise>
					<span>
						<p>${user.userName }님환영합니다!</p> 
						<a href="/evenapp/signout">로그아웃</a>
						<a href="/evenapp/">마이페이지</a>
					</span>
				</c:otherwise>
			</c:choose>
		</div>


	</header>
</body>
</html>
