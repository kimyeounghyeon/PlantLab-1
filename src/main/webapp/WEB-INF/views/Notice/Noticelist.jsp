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



	<div id="content" class="contents">


		<section id="main_section">


			<article class="aside1">
				<h3>카테고리</h3>
				<hr>
				<ul class="cateList">
					<li><a href="${path}/inquery">1:1 문의하기</a></li>
					<li><a href="${path}/nlist">공지사항</a></li>
					<li><a href="${path}/flist">자주 묻는 질문</a></li>
				</ul>
			</article>

  <div class="main_header">
                <h2 class="title">공지 사항</h2>
            </div>



			<c:if test="${empty loginMember.userName}">

				<div id="mem">회원이 아닙니다.</div>
			</c:if>




			<c:if test="${!empty loginMember}">

		

			<div class="adFrmDiv">
			<c:if test="${1==loginMember.grade}">
			<button class="wbtn" type="button" onclick="location.href='nwrite'">글쓰기</button>
			</c:if>
			</div>
	




<table class="admdTable">
							<tr class="admdtr">
								<th class="admdth admdNum">글번호</th>
								<th class="admdth admdContent">제목</th>
								<th class="admdth admdDate">작성일</th>

							</tr>
							<c:if test="${not empty list}">
							<c:forEach var="f" items="${list}">
								<tr class="admdtr">

									<td class="admdtd admdNum">${f.notice_no}</td>
									<td class="admdtd admdContent"><div class="admdcontentmove"></div><a
										href="${path}/nread?notice_no=${f.notice_no}">${f.notice_title}</a></td>

									<td class="admdtd admdDate">${f.notice_date}</td>
								</tr>

							</c:forEach></c:if>
							<tr>
								
							</tr>
						</table>

			</c:if>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
