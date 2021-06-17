<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<form id="frmJoin">
		userNo<input type="text" name="userNo"><br> 아이디:<input
			type="text" name="userId" id="userId"><br> 비밀번호:<input
			type="password" name="userPwd"><br> 이름:<input
			type="text" name="userName"><br> 이메일:<input type="text"
			name="email"><br> 핸드폰:<input type="text" name="phone"><br>
		성별:<input type="text" name="grade"><br> 주소:<input
			type="text" name="address"><br> <input type="button"
			value="가입" id="btnJoin">
	</form>

	<script>
		$("#btnJoin").on("click", function() {
			var dataString = $("#frmJoin").serialize();
			// {memberId: 입력값, memberPwd:입력값.... }
			console.log("실행~");
			console.log(dataString);

			$.ajax({
				url : "doJoin",
				type : "POST",
				data : dataString,

				success : function(data) {
					if (data > 0) {
						alert("회원가입되었습니다. 로그인페이지로 이동합니다.");
						location.href = "header";
					} else {
						alert("회원가입이 되지 않았습니다. 아이디, 비밀번호를 다시 입력해 주세요.");
						$("#userId").val("").focus();
					}
				},
				error : function() {

				}

			});
		});
	</script>
</body>
</html>