<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트래용</title>

<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
.fupdiv{
claer : both;
}
.btnsave{
  background: #625b54;
  color : white;
  border : none;
  margin-left : 710px;
  width :75px;
  height : 28px;
}
</style>
</head>
<body>
<body><jsp:include page="../header.jsp"></jsp:include>
<div class="fupdiv">
<h3 align ="center" >자주묻는 질문</h3>
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
				<td><a href="${path}/flist">자주 묻는 질문</a></td>
			</tr>
		</table>
	</nav>

		<table class="fom">
		<form name="fupdate" method="POST" action="${path}/fupdate">
			<tr>
				<td class="wr">수정하기</td>
			</tr>
			<tr>
				<input type="hidden" name="fna_no" value="${data.fna_no}">
				<input type="hidden" name="user_no" value="${loginMember.grade}">
				<td><textarea name="fna_title" id="fna_title" rows="8" cols="80"
							placeholder=" 질문을 입력해주세요.">${data.fna_title}</textarea></td>
			</tr>
			<tr>
				<td><textarea name="fna_content" id="fna_content"
						rows="8" cols="80">${data.fna_content}</textarea></td>
			</tr>
		</table>
				<button class="btnsave" type="submit">수정완료</button>
		</form>

</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>