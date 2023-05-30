<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/headernav.js"></script>
<link rel="stylesheet" href="/evenapp/resources/css/headernav.css">
</head>
<body>
	<div class="header-nav-container">
		<button>카테고리</button>
		<div class="category-popup">
			<nav class="ctgr-list">
				<ul class="ctgr"></ul>
			</nav>
		</div>
		<form action="gpt" method="post">
			<input type="text" placeholder="GPT 검색" name="searchParam"> <input
				type="submit" value="검색">
		</form>
		<form action="search" method="get">
			<input type="text" placeholder="기본 검색" name="searchParam"> <input
				type="submit" value="검색">
		</form>
		<a href="/evenapp/cart">장바구니</a>
	</div>
</body>
</html>