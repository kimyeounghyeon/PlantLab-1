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

	<form action="modifydiary.do" method="POST" enctype="multipart/form-data" id="modifyFrm">

	<c:forEach var="d" items="${detailDiary }" varStatus="status">
	<input type="hidden" name="diary_no" value="${d.diary_no }">
 	<input multiple="multiple" type="file" name="diaryModImg"  style= "display: inline-block;" value="${d.diary_img_src }"/>
	<textarea name="modifytext" rows="30" cols="80" id="modifytext"g >${d.diary_content }</textarea>
	</c:forEach>
	<br><br><br><br>
	<button type="button" id="dmodifybtn">수정하기</button>
	</form>
	</div>
	</div>
		<script>
	      var ckeditor_config = {
	      resize_enaleb : false,
	      height : "400px",
	      enterMode : CKEDITOR.ENTER_BR,
	      };			
	</script>
	<script>
	CKEDITOR.replace("modifytext",ckeditor_config);
	
	
	$(function(){
		$("#dmodifybtn").click(function(){
			var modifyFrm = document.getElementById("modifyFrm");
			modifyFrm.submit();
		});

	});
	</script>
</body>
</html>