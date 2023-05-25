<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <%-- Access the attribute directly without assigning to a variable --%>
    <c:set var="user" value="${sessionScope.signinUser}" />

    <header>
        <div>
            <c:choose>
                <c:when test="${empty user.userId}">
                    <a href="/evenapp/signin">로그인</a>
                    <a href="/evenapp/signup">회원가입</a>
                </c:when>
                <c:otherwise>
                    <p>${user.userName }님 환영합니다!</p>
                    <a href="/evenapp/signout">로그아웃</a>
                    <a href="/evenapp/">마이페이지</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div>
            <div>
                <p>카테고리</p>
                <ul>
                    <li>쌀</li>
                    <li>고기</li>
                </ul>
            </div>
            <input type="text" placeholder="GPT 검색"> <input type="text" placeholder="기본 검색">
        </div>
    </header>
</body>
</html>
