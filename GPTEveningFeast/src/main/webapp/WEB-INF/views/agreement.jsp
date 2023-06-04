<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/evenapp/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="/evenapp/resources/css/agree.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>

	<div class="innercon">
		<div class="content-box">
			<h3>현대식품관 회원가입</h3>
		</div>
		<div class="line-box">
			<div class="line-box-content">
				<h3 class="bold">현대식품관<br>필수 약관에 동의해 주세요</h3>
			</div>
			<div class="line-box-content">
				<div class="agree-box">
					<div class="agree-content">
						<input type="checkbox" name="allAgree" id="allAgree">
						<label for="allAgree"></label>
						<p class="agree-bold">전체 동의합니다.</p>
					</div>
					<div class="agree-content">
						<h3 class="agree-bold">현대식품관</h3>
					</div>
					<div class="agree-content">
						<input type="checkbox" name="firstAgree" id="firstAgree" value="firstYes">
						<label for="firstAgree"></label>
						<p class="agree">[필수] 이용약관 동의</p>
					</div>
					<div class="agree-content">
						<input type="checkbox" name="secondAgree" id="secondAgree"value="secondYes">
						<label for="secondAgree"></label>
						<p class="agree">[필수] 개인정보 수집·이용 동의</p>
					</div>
				</div>
				<div class="agree-box">
					<button onclick="agree()">다음</button>
					<button onclick="location.href='/evenapp/signup'">취소</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/signup.js"></script>
</html>
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/evenapp/resources/css/agree.css" />
<title>회원가입</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<div class="content-wrapper">
		<div id="wrap">
			<div class="innercon">
				<h3>현대식품관 회원가입</h3>
				<div class="linearea">
					<section class="member">
						<div class="line-box-content">
							<h3 class="agree-large">
								현대식품관<br>필수 약관에 동의해 주세요
							</h3>
						</div>
						<div class="line-box-content">
							<div class="agree-box">
								<div class="agree-content">
									<input type="checkbox" name="allAgree" id="allAgree"> <label
										for="allAgree"></label>
									<p class="agree-bold">전체 동의합니다.</p>
								</div>
								<hr>
								<div class="agree-content">
									<h3 class="agree-bold">현대식품관</h3>
								</div>
								<div class="agree-content" id="agree-content-space">
									<input type="checkbox" name="firstAgree" id="firstAgree"
										value="firstYes"> <label for="firstAgree"></label>
									<p class="agree">[필수] 이용약관 동의</p>
								</div>
								<div class="agree-content">
									<input type="checkbox" name="secondAgree" id="secondAgree"
										value="secondYes"> <label for="secondAgree"></label>
									<p class="agree">[필수] 개인정보 수집·이용 동의</p>
								</div>
							</div>
							
						</div>
							<div class="btn-box">
								<button onclick="location.href='/evenapp/signup'" class="btn-cancel">취소</button>
								<button onclick="agree()" class="btn-next">다음</button>
							</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/signup.js"></script>
</html>
