
<!-- 글쓰기랑 글 업데이트는 null값이 들어왔을때나 공백에 관한 코드를 넣어주자 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트래용</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Noticeupdate.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



</head>
<body>
<body><jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
	<nav class="tbb">
		<table >
			<tr>
				<td>카테고리</td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/#">1:1 문의하기</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/nlist.do">공지사항</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/">자주 묻는 질문</a></td>
			</tr>
		</table>
	</nav>

	<c:if test="${empty loginMember.userName}">
		<div id="mem">회원이 아닙니다.</div>
	</c:if>
	<!-- 요기 이미지라두 넣고싶다.. -->

<c:if test="${loginMember.grade==1}">
<table class="fom">
<tr><td class="wr">수정하기</td></tr>
<tr><td><form name="update" method="POST" action="${path}/nnupdate.do">
<input type="hidden" name="notice_no" value="${data.notice_no}">
<input type="hidden" name="user_no" value="${loginMember.grade}">
<div><input name="notice_title" size="81" value="${data.notice_title}" type="text"/></div></td></tr>
<tr><td><textarea name="notice_content" id="notice_content" rows="8"
							cols="80">${data.notice_content}</textarea></td></tr>
<tr><td class="wbtn"><button type="submit">수정</button></td></tr>
</form></table>

</c:if>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>