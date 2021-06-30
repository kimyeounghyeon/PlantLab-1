<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).on('click','#serarchId',function(){
	var name = $('#userName').val();
 	var phone = $('#phone').val();


 	var postData = {'userName' : name , 'phone' : phone };

	$.ajax({
        url:'serarchId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var idLists = data.userName;
        	var idLength = idLists.length
        	var idfind = idLists.substring(1, idLength-1)
       	 		 $("#idList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+idfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form>
		이름 <input type="text" name="userNmae" id="name"><br>
		핸드폰 번호 <input type="text" name="phone" id="tel"><br>

	</form>
	<button id="serarchId">아이디 찾기</button>
	<br>
	<br>

	<span id="idList"></span>
</body>

</html>