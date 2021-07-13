<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 Write Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/WriteDiaryStyle.css" rel="stylesheet" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "${path }/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrbgdiv">
	<h3 class="subtitle">Write diary</h3>
	<div class="writecontent">
	<form id="diaryfrm" action="diaryInsert.do" method="POST" enctype="multipart/form-data">
   <div class="file">
      <button type="button" id="fileAdd">이미지 추가</button>
          <div class="fileList">
                    		
           </div>
           <br>
           </div>
           <br><br><br><br>
           <div class="textAreaDiv">
    <textarea name="writetext" rows="30" cols="80" id="writetext" placeholder="내용을 입력하세요" >
	</textarea>
	</div>
	<br><br><br>
		<button type="button" id="dwritebtn">등록하기</button>
		<br><br><br>
	</form>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>

	<script>
	//이미지 업로드
	var cnt = 0;
	var id = 0;
	
	$("#fileAdd").click(function(){
		cnt += 1;
		var html = "<br><label class=\"labels\" for=\""+cnt+"\">파일 추가</label>";
		html += "<input multiple=\"multiple\" id=\""+cnt+"\" type=\"file\" name=\"diary_img_srcs\" />";
		html += "<input class=\"upload-name\" id=\"in"+cnt+"\" value=\"파일선택\"><br>";
		$(".fileList").append(html);
		
		$(".labels").click(function(){
			id = $(this).attr('for');
			console.log('id11::'+id);
			

			$('#'+id).on('change',function(){
				console.log('id33::'+id);
				 var fileName = $('#'+id).val();
				 $("#in"+id).val(fileName);
			});
		});
		
		
	});

	      var ckeditor_config = {
	      resize_enaleb : false,
	      height : "400px",
	      enterMode : CKEDITOR.ENTER_BR,
	      };			
	</script>
	<script>
	CKEDITOR.replace("writetext", ckeditor_config);
	
	$(document).on("click", "#dwritebtn", function(){
	var cv = CKEDITOR.instances.writetext.getData();
	console.log(cv);
	var frm = $("#diaryfrm");
	
	frm.submit();
	

	});
	</script>

	
</body>
</html>