=]<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event detail</title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#plantimg{
width : 600px;
height : 700px;
border : 1px solid black;
margin-left: auto;
margin-right: auto;
}
#plantname{
width : 600px;
margin-left: auto;
margin-right: auto;
text-aglin : center;
}
.mmain{
clear : both;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div class="mmain">
<h2 align="center">이달의 식물</h2>
<div id="plantimg">식물이미지</div>
<br>
<div id= "plantname" align="center">식물이름</div>
</div>
</body>
</html>
