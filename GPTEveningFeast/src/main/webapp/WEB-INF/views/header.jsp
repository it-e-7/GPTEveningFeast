<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<script src="/evenapp/resources/js/common.js"></script>
<link rel="stylesheet" href="/evenapp/resources/css/main.css">
<link rel="stylesheet" href="/evenapp/resources/css/header.css">

<c:set var="user" value="${sessionScope.signinUser}" />

<header>
	<div class="header-wrapper">
		<a href="/evenapp">코사식품관</a>
		<span class="auth-menu-wrapper grey1">
		<c:choose>
			<c:when test="${empty user.userId}">
				<a href="/evenapp/signin">로그인</a> 
				<a href="/evenapp/signup">회원가입</a>
			</c:when>
			<c:otherwise>
				<p class="grey3">${user.userName }님환영합니다!</p> 
				<a href="/evenapp/signout" class="grey3">로그아웃</a>
				<a href="/evenapp/mypage">마이페이지</a>
			</c:otherwise>
		</c:choose>
		</span>
	</div>

</header>

