<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
		</div>
	</div>
	<h1>회원가입</h1>

	<form action="/evenapp/signup/agreement" method="GET">
		<button type="submit">회원가입</button>
	</form>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>