<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />



<!--  화면 크기 줄이고 늘리는거에 따라 다 따로노는 현상이 있음 이거 수정해야함 
카테고리 옆에 테이블이 잘 안들어감..이것도 해결해야함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 notice</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Noticelist.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>

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
	<c:if test="${empty loginMember.userName}">

		<div id="mem">회원이 아닙니다.</div>
	</c:if>

	<c:if test="${!empty loginMember}">

		<article class="tableaticle">
			<table class="maintb">
			<tr><td colspan="3" class="wr"><h3>공지사항</h3></td></tr>
				<tr class="sub">
					<th>글번호</th>
					<th class="no" style="text-align: center;">제목</th>
					<th>작성일</th>

				</tr>
				<c:forEach var="f" items="${list}">
					<tr>

						<td>${f.notice_no}</td>
						<td class="bo"><a
							href="${path}/nread.do?notice_no=${f.notice_no}">${f.notice_title}</a></td>

						<td>${f.notice_date}</td>
					</tr>

				</c:forEach>
			<tr><td colspan=3><article class="btn"><c:if test="${1==loginMember.grade}">
							<button class="wbtn" type="button"
								onclick="location.href='nwrite.do'">글쓰기</button>
						</c:if></article></td></tr>
			</table>
			
		</article>


	</c:if>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
