<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/deleteUser.css">
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>
	<section class="login-wrap">
		<h1>회원 탈퇴</h1>
		<div class="content">
			<form id="loginFrm" action="/lab/memberDelete" method="POST">
				<div class="login-id-wrap">
					<h3>
						<label for="userId">아이디</label>
					</h3>
					<span class="box int_id"> <input class="int input-id"
						type="text" id="userId" name="userId"
						value="${loginMember.userId}" readonly="readonly" />
					</span>
				</div>
				<div class="login-pw-wrap">
					<h3>
						<label for="userPwd">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input class="int input-pw"
						type="password" id="userPass" name="userPwd" placeholder="비밀번호" />
					</span>
				</div>

				<div class="login-btn-wrap">
					<button class="btn" type="submit" id="submit">회원탈퇴</button>
				</div>

			</form>
			<div></div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>