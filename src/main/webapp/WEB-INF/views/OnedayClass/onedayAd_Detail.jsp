<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/font.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayAdDeatil.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 Admin Dtail</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="fullmain">
<div id="main">



<div id="oneAImg"></div>

<input type="text" class="AOne" value="">   	<!-- 클래스 번호 히든으로 바꾸기 -->
<input type="text" class="AOne" value="">   	<!-- 클래스 이름 -->
<input type="text" class="AOne" value="">	 	<!-- 클래스 가격 -->
<button type="button" id="upBtn">수정</button>												<!-- 수정버튼  -->
<button type="button" id="RmBtn">삭제</button>												<!-- 삭제 버튼 -->

<script type="text/javascript">

$(function(){
	$("#upBtn").click(function(){
		
		
	
	})
	
	$("#RmBtn").click(function(){
		
		
	
	})

	
	
	
	
})




</script>
</body>
</html>