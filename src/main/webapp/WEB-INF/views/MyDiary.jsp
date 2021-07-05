<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 My Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/MyDiaryStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>
	
	<table class="mydTable">
			<tr class="mdtr">
				<th class="mdth mydNum"> NO </th>
				<th class="myContent"> 내용 </th>
				<th class="myDate"> 날짜 </th>
				<th class="myLike"> 좋아요 </th>
			</tr>
		<c:forEach var="d" items="${mydiary}">
			<c:set var="i" value="${i+1 }" />
			<tr class="mdtr">
				<td class="mydNum">${i}</td>
				<td class="myContent"><div class="contentmove"><a href='detaildiary?diary_no=${d.diary_no}'>${d.diary_content}</a></div></td>
				<td class="myDate">${d.diary_date}</td>
				<td class="myLike">${d.like_cnt}</td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>