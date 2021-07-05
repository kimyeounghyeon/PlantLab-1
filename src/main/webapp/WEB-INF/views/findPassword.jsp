<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/loginStyle.css">
<body>
	<div class="main">
		<header>
			<div id="logo">
				<a href="<%=request.getContextPath()%>/"> <img alt="logo"
					src="${path }/resources/img/logo.png" />
				</a>
			</div>
		</header>

		<form method="post" class="loginFrm" action="find_password"
			name="findform">
			<section class="login-wrap">
			<div class="login-id-wrap">
					<input placeholder="아이디" type="text" class="input-id"
						name="userId" required />
				</div>
				<div class="login-id-wrap">
					<input placeholder="이름" type="text" class="input-id"
						name="userName" required />
				</div>
				<div class="login-pw-wrap">
					<input placeholder="핸드폰" type="text" class="input-pw" name="phone"
						required />
				</div>
				<div class="login-btn-wrap">
					<button type="submit" class="login-btn" id="loingbtn">찾기</button>
				</div>
			</section>
			<section class="find-signup-wrap">
				<span class="find-id"> <a
					href="<%=request.getContextPath()%>/find_id_form" target="_blank"
					title="아이디찾기">아이디 찾기</a>
				</span> <span class="sign-up"> <a
					href="<%=request.getContextPath()%>/join" target="_blank"
					title="회원가입">회원가입</a>
				</span>
			</section>

			<!-- 정보가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
				opener.document.findform.userName.value = "";
				opener.document.findform.phone.value = "";
				</script>
				<h3>일치하는 정보가 존재하지 않습니다.</h3>
			</c:if>

			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
				<h3>찾으시는 비밀번호는 "${userPwd}" 입니다.</h3>
				<div class="form-label-group">
					<input class="login-btn" type="button" value="확인"
					 onclick="updatePassword()">
				</div>
			</c:if>

		</form>
	</div>

	<script>
		function updatePassword() {
			location.href = "/lab/";
		}
	</script>
</body>
</html>