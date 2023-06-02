<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/evenapp/resources/js/headernav.js"></script>
<link rel="stylesheet" href="/evenapp/resources/css/headernav.css">

<div class="header-nav-container">
	<div class="category-wrapper">
		<span class="category-btn-wrapper">
			<img src="/evenapp/resources/img/category.png">
			<button class="category-btn grey3">카테고리 전체보기</button>
		</span>
		<div class="category-popup">
			<nav class="ctgr-list">
				<ul class="ctgr"></ul>
			</nav>
		</div>
	</div>
	<form action="gpt" method="post" class="search-form">
		<input type="text" placeholder="GPT 검색" name="searchParam"> 
		<input type="submit" class="search-btn" value="">
	</form>
	<div class="nav-right-menu-wrapper">
		<form action="search" method="get" class="search-form">
			<input type="text" placeholder="기본 검색" name="searchParam">
			<input type="submit" class="search-btn" value="">
		</form>
		<a href="/evenapp/cart">
			<img src="/evenapp/resources/img/cart.png">
		</a>
	</div>
</div>

