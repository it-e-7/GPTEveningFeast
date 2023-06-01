<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/evenapp/resources/js/headernav.js"></script>
<link rel="stylesheet" href="/evenapp/resources/css/headernav.css">

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
	<div class="nav-right-menu-wrapper">
		<form action="search" method="get">
			<input type="text" placeholder="기본 검색" name="searchParam"> <input
				type="submit" value="검색">
		</form>
		<a href="/evenapp/cart">장바구니</a>
	</div>
</div>

