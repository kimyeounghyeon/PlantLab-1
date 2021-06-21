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
    .edetaildiv{
    clear: both;
    }
    .edetailtb{
    margin-left : auto;
    margin-right : auto;
    }
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="edetaildiv">
	<table class="edetailtb">
		<tr>
			<td>${event_tb.event_title}</td>
		</tr>
		<tr>
			<td>${event_tb.start_date}~${event_tb.end_date}</td>
		</tr>
		<tr>
			<td>${event_tb.event_content}</td>
		</tr>
		<tr>
			<td>
			<c:url var="eupview" value="eRenew.do">
					<c:param name="event_no" value="${event_tb.event_no}" />
					<c:param name="event_title" value="${event_tb.event_title}" />
					<c:param name="start_date" value="${event_tb.start_date}" />
					<c:param name="end_date" value="${event_tb.end_date}" />
					<c:param name="event_content" value="${event_tb.event_content}" />
					<c:param name="banner" value="${event_tb.banner}" />
						
				</c:url> 
				<c:url var="edelete" value="eDelete.do">
					<c:param name="event_no" value="${event_tb.event_no}" />
				</c:url> 
				<a href="${eupview}"> 수정 </a> &nbsp;&nbsp; 
				<a href="${edelete}"> 삭제 </a> &nbsp;&nbsp; 
			</td>
		</tr>
	</table>
	</div>
</body>
</html>