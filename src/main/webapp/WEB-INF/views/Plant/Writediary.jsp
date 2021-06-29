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
	<form id="diaryfrm" action="diaryInsert.do" method="POST" enctype="multipart/form-data">
	<textarea name="writetext" rows="30" cols="80" id="writetext" placeholder="내용을 입력하세요" >
	</textarea>
	<br><br><br><br>
		<button type="button" id="dwritebtn">등록하기</button>
	</form>
	</div>
</div>

	<script>
	      var ckeditor_config = {
	      resize_enaleb : false,
	      height : "400px",
	      enterMode : CKEDITOR.ENTER_BR,
	      shiftEnterMode : CKEDITOR.ENTER_P,
		  filebrowserUploadUrl : "${path}/fileupload"
	      };			
	</script>
	<script>
	CKEDITOR.replace("writetext", ckeditor_config);
	
	$(document).on("click", "#dwritebtn", function(){
	var cv = CKEDITOR.instances.writetext.getData();
/*  	$.ajax({
		url : "diaryInsert.do",
		type : "post",
		data : { writetext : $("#writetext").val() },
		dataType : "json",
		success : function(){
			
		}; */
		
		
/* 	}); 
	console.log(cv);
	console.log(cv.src()); */
	});
	</script>

	
</body>
</html>