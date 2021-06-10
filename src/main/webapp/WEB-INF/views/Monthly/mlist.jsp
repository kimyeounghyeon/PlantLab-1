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
</head>
<body>
<h2>이달의 식물</h2>

<input type="button" value="등록하기" onclick="window.location='monthlyWrite.do'">
	<table>
		<tr>
			<td>No</td>
			<td>식물이름누르면디테일</td>
			<td>작성일</td>
	
		</tr>
		<tr>
			<td>${monthly_tb.monthly_no}</td>
			<td>${monthly_tb.monthly_name}</td>
			<td>${monthly_tb.monthly_date}</td>
	
		</tr>
	</table>

</body>
</html>