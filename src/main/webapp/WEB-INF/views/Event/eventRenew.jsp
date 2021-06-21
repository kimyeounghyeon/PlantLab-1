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
    <style>
    .eReDiv{
    clear : both;
    }
    .eretb{
    margin-left : auto;
    margin-right : auto;
    }
    #erebtn{
   	background: #625b54;
  	color : white;
 	border : none;
    }
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="eReDiv">
	
<form action="eInsert.do" method="post" enctype="multipart/form-data">

	<input type="hidden">
		<table class="eretb">
			<tr>
				<td>이벤트 제목</td>
				<td><input type="text" name="event_title" value="${event_tb.event_title}"></td>
			</tr>
			<tr>
				<td>배너 이미지</td>
				<td><input type="file" name="upfile1" value="${event_tb.banner}"></td>
			</tr>
			<tr>
			
			
				<td>이벤트 내용</td>
				<td><input type="file" name="upfile2" value="${event_tb.event_content}"></td>
			</tr>
			<tr>
				<td>이벤트 시작일</td>
				<td><input type="text" name="start_date" value="${event_tb.start_date}"></td>
			</tr>
			<tr>
				<td>이벤트 종료일</td>
				<td><input type="text" name="end_date" value="${event_tb.end_date}"></td>
			</tr>
		<tr>
		<br>	
		<td colspan = "2" align = "center"><input type="submit" id="erebtn" value="수정완료"></td>
		</tr>	
		</table>
	</form>
	</div>
</body>
</html>