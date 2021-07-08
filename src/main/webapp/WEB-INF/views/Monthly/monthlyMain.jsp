<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event detail</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#plantimg{
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
	.mmain{
	clear : both;
	}
	.plantimg{
	width : 500px;
	height : 650px;
	margin-top : 5px;
	margin-left: auto;
	margin-right: auto;
	}
	#plantname{
	width : 500px;
	font-size:20px;
	margin-left: auto;
	margin-top : 10px;
	margin-right: auto;
	text-aglin : center;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div class="mmain">
<h2 align="center">이달의 식물</h2>
<div class="plantimg">
<img class="plantimg" src="<%=request.getContextPath() %>/resources/img/${monthly.monthly_img}"></div>
<br>
<div id= "plantname" align="center">'${monthly.monthly_name}'</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
