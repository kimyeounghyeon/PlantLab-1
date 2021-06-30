<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Noticewrite.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>게시글작성이래용</title>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../mypagemenu.jsp"></jsp:include>

	<nav class="tbb">
<table>
			<tr>
				<td >카테고리</td>
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
		</table></nav>



	<c:if test="${empty loginMember.userName}">
		<div id="mem">회원이 아닙니다.</div>
	</c:if>

<!-- 제목과 내용이 null 일때 안내도 해줘야함  -->

	<c:if test="${loginMember.grade==0}">
관리자가 아닙니다.
</c:if>
	<c:if test="${loginMember.grade==1}">
		<div class="tb">
			<table class="fom">
			<tr><td class="wr">글쓰기</td></tr>
				<tr><td><form name="form1" method="POST" action="${path}/ninsert.do">
					<div>
						<input type="hidden"  name="user_no" id="user_no"
							value="${loginMember.userNo}"> <input name="notice_title"
							id="notice_title" size="80" placeholder="제목을 입력해 주세요.">
					</div></td></tr>
					<tr><td><div>

						<textarea name="notice_content" id="notice_content" rows="8"
							cols="80" placeholder=" 내용을 입력해주세요."></textarea>
					</div>
					<div class="wbtn">
						<button type="submit" id="btnSave">글 등록</button>

					</div>
				</form></td></tr>
			</table>
		</div>

	</c:if>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

