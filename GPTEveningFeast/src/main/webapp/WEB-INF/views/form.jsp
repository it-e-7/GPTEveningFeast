<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous">
	
</script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/signup.js"></script>
</head>
<body>
	<h1>현대식품관 회원가입</h1>

	아이디<input type="text" name="userId" onchange="changeId()"> 
	이름<input type="text" name="userName">

	<button onclick="validateUniqueUserId()" type="button">중복확인</button>
	<br>
	<br> 비밀번호
	<input type="password" name="userPw" oninput="checkPw()">
	<br> 비밀번호 확인
	<input type="password" name="pwCheck" oninput="checkPw()">
	<br>
	<br> 생년월일 및 성별
	<input type="date" name="userBirth">
	<br>
	<br>
	<input type="radio" name="userSex" id="female" value="여성">
	<label for="female">여성</label>
	<input type="radio" name="userSex" id="male" value="남성">
	<label for="male">남성</label>
	<br> 주소
	<input type="text" name="userAddress">
	<br>
	<a href="/evenapp/resources/signup/signup.html">취소</a>
	<button onclick="submitForm()">가입하기</button>
</body>
</html>