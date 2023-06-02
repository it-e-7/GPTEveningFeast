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
				<h3>회원가입</h3>
				<div class="linearea">
					<section class="member">
						<div class="inst">
							<img id="logo" src="/evenapp/resources/img/logo.png"
								class="logo-img"> <strong>코사식품관 일반회원</strong>
							<p>
								코사식품관에서만 사용 가능한 아이디를 만듭니다.<br> 단, 통합 멤버십 Kosa.Point(포인트)
								적립/사용이 제한됩니다.<br> 코사식품관 일반회원은 신규회원 혜택 및 웰컴케어 프로그램 참여가
								제한됩니다.
							</p>
						</div>
						<form action="/evenapp/signup/agreement" method="GET">
							<button id="btn" type="submit">일반회원가입</button>
						</form>
					</section>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
