<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 modify Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/DiaryStyle.css" rel="stylesheet" />
<link href="${path}/resources/css/ModifyDiaryStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "${path }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="mdbgdiv">
	<h3 class="subtitle">Modify diary</h3>
	<div class="modifycontent">
	<!-- TODO : form 태그 주소 변경  -->
	<form action="diarymodify.do" method="GET" enctype="multipart/form-data">
	<textarea name="modifytext" rows="30" cols="80" id="modifytext"></textarea>
	<br><br><br><br>
	<button type="button" id="dmodifybtn">등록하기</button>
	</form>
	<script>
	CKEDITOR.replace("modifytext",{filebrowserUploadUrl : "${path}/comm/ckUpload"});
	
	$(function(){
		});
	</script>
</body>
</html>