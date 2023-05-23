<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="resources/js/signin.js"></script>
</head>
<body>

	<p>로그인</p>
	<p>아이디와 패스워드를 입력해주세요</p>
	<input type="text" name="userId" placeholder="아이디">
	<input type="password" name="userPw" placeholder="비밀번호">
	<button onclick="clickSignin()">로그인</button>
	<a href="/evenapp/signup">회원가입</a>


</body>
</html>