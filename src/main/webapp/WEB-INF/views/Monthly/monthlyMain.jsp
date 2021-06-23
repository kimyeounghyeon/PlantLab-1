<%@ page language="java" contentType="text/html; charset=UTF-8"
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
height : 850px;
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
	.plantimg{
	width : 600px;
	height : 850px;
	margin-left: auto;
	margin-right: auto;
	}
	#plantname{
	width : 600px;
	margin-left: auto;
	margin-right: auto;
	text-aglin : center;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div class="mmain">
<div class="plantimg"><img class="plantimg" src="<%=request.getContextPath() %>/resources/img/${monthly.monthly_img}"></div>

<div id= "plantname" align="center">${monthly.monthly_name}</div>
</div>
</body>
</html>
