<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event renew</title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<form action="eInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" value="event_title"></td>
			</tr>
			<tr>
				<td>배너 첨부파일</td>
				<td><input type="text" name="banner"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="event_content"></td>
			</tr>
			<tr>
				<td>시작일</td>
				<td><input type="text" value="start_date"></td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><input type="text" value="end_date"></td>
			</tr>
			
			
		</table>
		<input type="submit" value="등록하기">
	</form>
</body>
</html>