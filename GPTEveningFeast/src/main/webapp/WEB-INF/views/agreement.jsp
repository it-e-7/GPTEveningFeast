<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/signup.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="content-wrapper">
		<div id="wrap">
			<h3>현대식품관 회원가입</h3>
			<div class="linearea">
				<div class="terms">
					<h3>
						현대식품관<br>필수 약관에 동의해 주세요
					</h3>
					<div class="checkbox">
						<input type="checkbox" name="allAgree" id="allAgree"> <label
						for="allAgree"></label>전체 동의합니다.
					</div>
					<hr>
					<div class="line">
						<h3>현대식품관</h3>
					</div>
					<div class="checkbox">
						<input type="checkbox" name="firstAgree" id="firstAgree" value="firstYes"><label for="firstAgree"></label>[필수] 이용약관 동의
					</div>
					<div class="checkbox">
						<input type="checkbox" name="secondAgree" id="secondAgree" value="secondYes"><label for="secondAgree"></label>[필수]개인정보 수집·이용 동의 
					</div>
					
					<button onclick="agree()">다음</button>
					<a href="/evenapp/signup">취소</a>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/signup.js"></script>
</html>
