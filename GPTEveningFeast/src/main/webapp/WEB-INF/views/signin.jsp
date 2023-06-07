<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/evenapp/resources/js/signin.js"></script>

<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/signin.css" />
<title>로그인</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="content-wrapper">
		<div class="innercon">
			<h3>로그인</h3>
			<p class="login-text">아이디와 패스워드를 입력해주세요</p>

			<div class="input-section">
				<div class="icon-center">
					<img src="/evenapp/resources/img/usericon.png" class="signin-icon">
				</div>
				<input type="text" name="userId" placeholder="아이디">
			</div>

			<div class="input-section">
				<div class="icon-center">

					<img src="/evenapp/resources/img/pwicon.png" class="signin-icon">
				</div>
				<input type="password" name="userPw" placeholder="비밀번호">
			</div>

			<div class="btn-wrap">
				<button onclick="clickSignin()" class="btn-signin">로그인</button>
				<button onclick="window.location.href='/evenapp/signup'" class="btn-signup">회원가입</button>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
