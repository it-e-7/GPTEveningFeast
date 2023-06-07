<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/evenapp/resources/css/mypage.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="my-page-wrapper">
			<div class="left-nav-bar">
				<h2>마이페이지</h2>

				<h4>주문 관리</h4>
				<ul>
					<li>
						<a href="/evenapp/order/orders">주문 내역</a>
					</li>
				</ul> 
				<h4>나의 정보</h4>
				<ul>
					<li>
						<a href="/evenapp/update">회원정보 변경</a>
					</li>
				</ul>
			</div>

			<div class="my-page-content-wrapper">
				<h1>마이 페이지</h1>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/mypage.js"></script>
</html>