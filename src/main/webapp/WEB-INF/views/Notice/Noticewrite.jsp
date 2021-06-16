<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<head>
<script>

$(document).ready(function(){
    $("#btnSave").click(function(){
        //var title = document.form1.title.value; ==> name속성으로 처리할 경우
        //var content = document.form1.content.value;
        //var writer = document.form1.writer.value;
        var title = $("#notice_title").val();
        var content = $("#notice_content").val();
  
        if(title == ""){
            alert("제목을 입력하세요");
            document.form1.title.focus();
            return;
        }
        if(content == ""){
            alert("내용을 입력하세요");
            document.form1.content.focus();
            return;
        }
   
    });
});
</script>
</head>
<body>
<h2>게시글 작성</h2>
<form name="form1" method="POST" action="${path}/noticeinsert">
    <div>
        제목
        <input name="title" id="notice_title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용
        <textarea name="content" id="notice_content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
   
    <div style="width:650px; text-align: center;">
        <input type="submit" id="btnSave"/>
        <button type="reset">취소</button>
    </div>
</form>

</body>
</html>