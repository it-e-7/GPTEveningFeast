<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/evenapp/resources/css/mypage.css" />
</head>
<body>
	<div class="top-area">
		<div class="inner">
			<%@ include file="/WEB-INF/views/header.jsp"%>
			<%@ include file="/WEB-INF/views/headernav.jsp"%>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="my-page-wrapper">
			<%@ include file="/WEB-INF/views/mypagenav.jsp"%>

			<div class="my-page-content-wrapper">
				<h2>${ signinUser.userName }님</h2>

				<h3 style="margin-top: 22px;">최근 본 레시피</h3>
				
				<c:if test="${ empty historyList }">
					<div class="history-wrapper">
						<div class="no-data">
							<img src="/evenapp/resources/img/excmark.png">
							<p>최근 본 레시피가 없습니다.</p>
						</div>
					</div>
				</c:if>
				
				<c:forEach var="history" items="${ historyList }" varStatus="loop1">
					<div class="history-wrapper">
						<div>
							<p style="font-size: 13px; color: #747572;">검색 키워드 : ${ history.keyword }</p>
							<h2>${ history.menuName }</h2>
						</div>
						<span>
							<h4 style="width:320px">재료</h4>
							<h4 style="width:560px">조리 방법</h4>
						</span>
						<div class="ingredients-recipe-wrapper">
							<ul class="ingredients-wrapper">
							
								<c:forEach var="ingredient" items="${ history.ingredientList }"
									varStatus="loop2">
									<li>${ ingredient }</li>
								</c:forEach>
							</ul>

							<ul class="recipe-wrapper">
								<c:forEach var="line" items="${ history.recipeList }"
									varStatus="loop2">
									<li>
										<h5>STEP${ loop2.count }</h5>
										<p>${ line }</p>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
<script src="/evenapp/resources/js/mypage.js"></script>
</html>