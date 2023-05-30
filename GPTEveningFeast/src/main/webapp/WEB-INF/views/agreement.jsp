<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous">
</script>
<script src="/evenapp/resources/js/common.js"></script>
<script src="/evenapp/resources/js/signup.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<h1>현대식품관 회원가입</h1>
<h3>필수 약관에 동의해 주세요</h3>
<input type="checkbox" name="allAgree" id="allAgree">
<label for="allAgree">전체 동의합니다.</label><br><br>

<h3>현대식품관</h3><br>
<input type="checkbox" name="firstAgree" id="firstAgree" value="firstYes">
<label for="firstAgree"> [필수] 이용약관 동의</label><br><br>

<input type="checkbox" name="secondAgree" id="secondAgree" value="secondYes">
<label for="secondAgree"> [필수] 개인정보 수집·이용 동의</label><br><br>

<button onclick="agree()">다음</button>
<a href="/evenapp/resources/signup/signup.html">취소</a>

<script>
  
</script>

</body>
</html>
