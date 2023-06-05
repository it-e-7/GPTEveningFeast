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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	<div class="form-content">
		<input id="userAddress" type="text" name="userAddress" placeholder="서울특별시 종로구 창경궁로 254">
		<input type="button" class="btn-address" onclick="addressSearch()" value="주소 찾기"><br>
	</div>
	
	<div class="form-label">
		<label for="userAddress">상세 주소</label>
	</div>
	<div class="form-content">
		<input type="text" name="detailAddress" id="detailAddress" placeholder="(동, 호수)">
		<input type="text" name="extraAddress" id="extraAddress" placeholder="">
	</div>
	<br>

	<button onclick="clickUpdate()">회원정보 변경</button>


</body>
</html>