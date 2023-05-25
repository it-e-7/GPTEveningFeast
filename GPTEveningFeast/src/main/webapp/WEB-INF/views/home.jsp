<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<%@ include file="/WEB-INF/views/headernav.jsp"%>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
