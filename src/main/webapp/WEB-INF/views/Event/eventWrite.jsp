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
	<script src = "${path}/resources/ckeditor/ckeditor.js"></script>
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
				<td>내용</td>
				<td><textarea name="event_content" rows="30" cols="80" id="eventwrite"></textarea></td>
			</tr>
			
			<script>
	CKEDITOR.replace("event_content",{filebrowserUploadUrl : "${path}/imageUpload.do"});
	
	$(function(){
		$("#ewritebtn").click(function(){
			var ewritefrm = document.getElementById("ewritebtn");
			ewritefrm.action="";
				
			});
		});
	});
	
	$("#ewritebtn")
	</script>
			
			<tr>
				<td>시작일</td>
				<td><input type="text" value="start_date" placeholder="yyyy.mm.dd"></td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><input type="text" value="end_date" placeholder="yyyy.mm.dd"></td>
			</tr>
			
			
		</table>
		<input type="submit" value="등록하기">
	</form>
</body>
</html>