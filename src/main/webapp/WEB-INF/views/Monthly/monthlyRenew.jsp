<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  monthly update </title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.mupdiv{
clear : both;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="mupdiv">
	<form name="renewForm" action="mUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="monthly_no" value="${monthly.monthly_no}">
		<input type="hidden" name="monthly_img" value="${monthly.monthly_img}">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="monthly_name" value="${monthly.monthly_name}"></td>
			</tr>
			<tr>
				<td>이전 첨부파일</td>
				<td>
					 ${monthly.monthly_img}
				</td>
			</tr>
			<tr>
				<td>변경할 첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			
		</table>
		<input type="submit" id="renew" value="등록하기">
	</form>
	</div>
</body>
</html>