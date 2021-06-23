<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/font.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayReserve.css" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<meta charset="UTF-8">
<title>無以林 Class Reserve</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


<div id="fullmain">
<div id="main">

<h3 class="subtitle">class</h3>


<div id="calendar" > 달력들어갈 자리</div>

<span></span>
<!-- <div id="oneContent"></div> -->
<!-- <input type="hidden" id="oneday_no" name="oneday_no">  --> <!-- insert하기 위한 oneday_no box -->
<p class="onedayinput" >이름</p>
<input type="text" class="onedaybox" name="oneName"  >   <!-- value값 넣기 --> 
<span class="onedayinput">전화번호</span>
<input type="text" class="onedaybox" name="onePhone">
<span class="onedayinput">요구사항</span>
<textarea id="oneRequest" name="oneRequest"  style="resize: none; ">
</textarea>
<button id="onedayp" type="button">결제하기</button>
</div>
</div>

<script type="text/javascript">
$(function(){
	$("#onedayp").click(function(){
		
		location.href ="${path}/Order/* ?onedayNo=${oneVo.oneday_no}?} */";
		
	})
	
	
	
	
	
})


</script>
</body>
</html>