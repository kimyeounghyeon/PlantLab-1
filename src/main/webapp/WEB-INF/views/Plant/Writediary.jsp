<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 Write Diary</title>
<link href="${path}/resources/css/WriteDiaryStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "${path }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrbgdiv">
	<h3 class="subtitle">Write diary</h3>
	<div class="writecontent">
	<form id="diaryfrm" action="diaryInsert.do" method="post">
	<textarea name="writetext" rows="30" cols="80" id="writetext" placeholder="내용을 입력하세요"></textarea>
	<br><br><br><br>
		<button type="submit" id="dwritebtn">등록하기</button>
	</form>
	</div>
</div>


	<script>
	CKEDITOR.replace("writetext",{filebrowserUploadUrl : "${path}/imageUpload.do"});
	

	</script>

	
</body>
</html>