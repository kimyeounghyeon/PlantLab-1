<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林  1:1 inquery</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.fnadiv{
clear : both;
}
#first{
font-size:20px;
}
#second{
font-size:15px;
}
.tbb {
font-weight:bold;
	width: 150px;
	height: 250px;
	position: relative;
	margin-left:50px;
	color: black;
	float: left;
}
.location{
padding-left : 400px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../mypagemenu.jsp"></jsp:include>
<div class="fnadiv">
<h2 class="location">1:1 문의하기</h2>
	<nav class="tbb">
		<table>
			<tr>
				<td>카테고리</td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>

			<tr class="cateList">
				<td><a href="${path}/inquery">1:1 문의하기</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/nlist.do">공지사항</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/">자주 묻는 질문</a></td>
			</tr>
		</table>
	</nav>
<div class="location" id="first">질문이 있으십니까?</div>
<br><br>
<div class="location" id="second">무이림 지원 커뮤니티에서 질문에 대한 <br> 답변을 얻으실 수 있습니다.</div>
<br><br>
<div class="location"><a href="${path}/">지금 시작 하기 > </a></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>