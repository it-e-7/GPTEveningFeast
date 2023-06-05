<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현대식품관 회원가입</title>

<link href="/evenapp/resources/css/main.css" rel="stylesheet" />
<link href="/evenapp/resources/css/form.css" rel="stylesheet" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="content-wrapper">
		<div class="wrap">
			<h1 class="signup-title">현대식품관 회원가입</h1>
			<div class="form-wrapper">
				<div class="inner-content">
					<div class="form-title">
						<h3 class="h3-large">가입정보를 입력해 주세요.</h3>
					</div>
					<div class="form-label">
						<p class="bold">회원정보</p>
						<p>*필수입력사항</p>
					</div>
					<hr>
					<div class="form-label">
						<label for="userId">아이디 *</label>
					</div>
					<div class="form-content">
						<input id="userId" type="text" name="userId" onchange="changeId()">
						<button class="btn-validation" onclick="validateUniqueUserId()"
							type="button">중복확인</button>
					</div>

					<div class="form-label">
						<label for="userName">이름 *</label>
					</div>
					<div class="form-content">
						<input id="userName" type="text" name="userName">
					</div>

					<div class="form-label">
						<label for="userPw">비밀번호 *</label>
					</div>
					<div class="form-content">
						<input id="userPw" type="password" name="userPw"
							oninput="checkPw()">
					</div>

					<div class="form-label">
						<label for="pwCheck">비밀번호 확인 *</label>
					</div>
					<div class="form-content">
						<input id="pwCheck" type="password" name="pwCheck"
							oninput="checkPw()">
					</div>

					<div class="form-label">
						<label for="userBirth">생년월일 및 성별 *</label>
					</div>
					<div class="form-content">
						<input id="userBirth" type="date" name="userBirth">
						<div class="radio-button-wrapper">
							<input type="radio" id="female" name="userSex" value="여성"
								class="hidden-radio"> <label for="female"
								class="styled-radio-button">여성</label>
						</div>
						<div class="radio-button-wrapper">
							<input type="radio" id="male" name="userSex" value="남성"
								class="hidden-radio"><label for="male"
								class="styled-radio-button">남성</label>
						</div>
					</div>


					<div class="form-label">
						<label for="userAddress">주소</label>
					</div>
					<div class="form-content">
						<input id="userAddress" type="text" name="userAddress">
					</div>
					<div class="form-content">
						<hr>
						<div class="form-buttons">
						<button class="btn-cancel"
							onclick="window.location.href='/evenapp/signup'">취소</button>
						<button class="btn-submit" onclick="submitForm()">가입하기</button>
						</div>
					</div>
				
				</div>

			</div>
		</div>
	</div>

</body>
<script src="/evenapp/resources/js/signup.js"></script>
</html>
