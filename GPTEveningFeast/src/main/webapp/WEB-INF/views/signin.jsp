<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>

	<p>로그인</p>
	<p>아이디와 패스워드를 입력해주세요</p>
	<input type="text" name="userId" placeholder="아이디">
	<input type="password" name="userPw" placeholder="비밀번호">
	<button onclick="clickSignin()">로그인</button>
	<a href="/evenapp/signup">회원가입</a>


</body>
<script src="/evenapp/resources/js/signin.js"></script>
</html>