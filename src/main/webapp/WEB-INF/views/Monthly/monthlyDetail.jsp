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
.upde{
margin-left: auto;
margin-right: auto;
text-aglin : center;
width : 100px;
}
#plantimg{
width : 800px;
height : 700px;
border : 1px solid black;
margin-left: auto;
margin-right: auto;
}
#plantname{
width : 800px;
margin-left: auto;
margin-right: auto;
text-aglin : center;
}
</style>
</head>
<body>


<div id="plantimg">${monthly_tb.monthly_img}</div>
<br>
<div id= "plantname">${monthly_tb.monthly_name}</div>

	<div class="upde">
			<c:url var="eupview" value="eRenew.do">
				<c:param name="monthly_no" value="${monthly_tb.monthly_no}" />
				<c:param name="monthly_img" value="${monthly_tb.monthly_img}" />
				<c:param name="monthly_name" value="${monthly_tb.monthly_name}" />
			</c:url> 
			<c:url var="edelete" value="eDelete.do">
				<c:param name="monthly_no" value="${monthly_tb.monthly_no}" />
			</c:url> 
			<a href="${eupview}"> 수정 </a> &nbsp;&nbsp; 
			<a href="${edelete}"> 삭제 </a> &nbsp;&nbsp; 
	</div>
</body>
</html>