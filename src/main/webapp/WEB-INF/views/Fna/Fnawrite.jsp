<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.fwrdiv{
clear : both;
}
.fom{
margin-left: auto;
margin-right : auto;
width : 800px;
}
#btnSave{
  background: #625b54;
  color : white;
  border : none;
  margin-left : 710px;
  width :75px;
  height : 28px;
}
#fna_content{
resize:none;
}
#fna_title{
resize:none;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div class="fwrdiv">
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





	<!-- 제목과 내용이 null 일때 안내도 해줘야함  -->
		<div class="tb">
			<form name="form1" method="POST" action="${path}/finsert">
				<table class="fom">
					<tr>
						<td>질문</td>
					</tr>
					<tr>
						<input type="hidden" name="user_no" id="user_no" value="${loginMember.userNo}">
						<td><textarea name="fna_title" id="fna_title" rows="8" cols="80"
									placeholder=" 질문을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<td>답변
						</td>
					</tr>
					<tr>
						<td><textarea name="fna_content" id="fna_content" rows="8" cols="80"
									placeholder=" 답변을 입력해주세요."></textarea></td>
					</tr>
				</table>
				<button type="submit" id="btnSave">글 등록</button>
			</form>
		</div>


	</div>
</body>
</html>