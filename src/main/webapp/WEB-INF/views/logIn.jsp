<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loginStyle.css">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<div class="main">


	<!--웹페이지 상단-->
	<header>

		<div id="logo">

			<a href="<%=request.getContextPath()%>/"> <img alt="logo"
				src="${path }/resources/img/logo.png" />
			</a>
		</div>

	</header>
	<form id="loginFrm">
		<!--로그인 부분-->
		<section class="login-wrap">

			<div class="login-id-wrap">
				<input placeholder="아이디" type="text" class="input-id" name="userId"></input>
			</div>
			<div class="login-pw-wrap">
				<input placeholder="비밀번호" type="password" class="input-pw"
					name="userPwd"></input>
			</div>
			<div class="login-btn-wrap">
				<button type="button" class="login-btn" id="loingbtn">로그인</button>
			</div>




		</section>
	</form>

	<!--간편한 로그인 부분-->
	<section class="easy-login-wrap">

		<div class="easy-login">
			<p>간편한 로그인</p>
		</div>

		<div class="easy-login-box">
			<div class="qr-login">

				<script type="text/javascript"
					src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
					charset="utf-8"></script>

				<div id="naver_id_login"></div>

				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"Z0NQW4BJEq5JCoTaqFNs",
							"http://localhost:8090/lab/callback"); // Client ID, CallBack URL 삽입
					// 단 'localhost'가 포함된 CallBack URL
					var state = naver_id_login.getUniqState();

					naver_id_login.setButton("white", 3, 95);
					naver_id_login.setDomain("http://localhost:8090/lab/login"); //  URL
					naver_id_login.setState(state);
					naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
				</script>
			</div>
		</div>


	</section>

	<section class="find-signup-wrap">

		<span class="find-id"> <a href="#" target="_blank"
			title="아이디찾기">아이디 찾기</a>
		</span> <span class="find-pw"> <a href="#" target="_blank"
			title="비밀번호 찾기">비밀번호 찾기</a>
		</span> <span class="sign-up"> <a
			href="<%=request.getContextPath()%>/join" target="_blank"
			title="회원가입">회원가입</a>
		</span>
	</section>
</div>

</body>

<script>
	$("#loingbtn").click(function() {
		
		$.ajax({
            url:'doLogin',
            type:'POST',
            data:$("#loginFrm").serialize(),
            success:function(result){
               if(result=="true"){
            	   alert("무이림에 오신것을 환영합니다.")
            	   window.location="/lab";
               }else{
            	   alert("로그인에 실패하셨습니다.");
               }
            }
        });

	});
</script>
			

</html>