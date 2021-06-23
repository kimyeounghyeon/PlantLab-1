<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  monthly detail</title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	
	.plantimg{
	width : 500px;
	height : 650px;
	margin-left: auto;
	margin-right: auto;
	}
	#plantname{
	width : 500px;
	margin-left: auto;
	margin-right: auto;
	text-aglin : center;
	}
	.mdediv{
	clear:both;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div class="mdediv">
<div class="plantimg"><img class="plantimg" src="<%=request.getContextPath() %>/resources/img/${monthly.monthly_img}"></div>

<br>

<div id= "plantname" align="center">${monthly.monthly_name}</div>

</div>
</body>
</html>