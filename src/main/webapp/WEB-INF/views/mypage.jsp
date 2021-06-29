<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<jsp:include page="mypagemenu.jsp"></jsp:include>
<c:if test="${!empty loginMember}">
		<h3>${loginMember.userName}님, 안녕하세요.</h3>
		</c:if>
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>