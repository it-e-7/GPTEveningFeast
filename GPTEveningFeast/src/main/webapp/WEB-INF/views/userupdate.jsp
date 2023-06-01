<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/userupdate.js"></script>
</head>
<body>

	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>
	
	<p>회원정보 변경</p>
	<p>변경할 패스워드 입력</p>
	<input type="password" name="userPw" placeholder="비밀번호">
	<p>변경할 주소 입력</p>
	<input type="text" name="userAddress" placeholder="주소"><br>
	
	<button onclick="clickUpdate()">회원정보 변경</button>


</body>
</html>