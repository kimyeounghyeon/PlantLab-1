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
<form name="modifyForm" action="eUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${board.board_num}">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" value="monthly_name"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			
		</table>
		<input type="submit" value="등록하기">
	</form>
</body>
</html>