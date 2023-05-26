<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form>
			<input type="text" placeholder="GPT 검색" name="searchParam"> <input
				type="submit" value="검색">
		</form>
		<form>
			<input type="text" placeholder="기본 검색" name="searchParam"> <input
				type="submit" value="검색">
		</form>
	</div>
</body>
</html>