<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/signup.css" />
<title>회원가입</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="content-wrapper">
		<div id="wrap">
			<div class="innercon">
				<h3>회원가입 완료</h3>
				<div class="linearea">
					<section class="member">
						<div class="inst">
							<img id="logo" src="/evenapp/resources/img/logo.png"
								class="logo-img"> <strong>코사식품관 일반회원</strong>
							<p>
								코사식품관의 회원가입을 진심으로 환영합니다.
							</p>
						</div>
						<button id="btn" onclick="window.location.href='/evenapp/signin'">로그인 페이지로 이동</button>
					</section>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
