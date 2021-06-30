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
	<link href="${path}/resources/css/footer.css" rel="stylesheet"/>
		<link href="${path}/resources/css/header.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
#mem{
padding-top:100px;
text-align: center;}
h3{text-align:center}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>

		<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.</div></c:if>
		<c:if test="${!empty loginMember}">
		<h3>${loginMember.userName}님 환영합니다.</h3></c:if>
		
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>