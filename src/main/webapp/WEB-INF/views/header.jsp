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
	href="<%=request.getContextPath()%>/resources/css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
* {
	font-family: 'Jeju Myeongjo';
	color: #625b54;
	line-height: 30px;
}

#fullmain {
	width: 1280px;
	margin: 0 auto;
	padding: 0;
	clear: both;
}

#main {
	width: 1250px;
	margin: 0 auto;
	padding: 0;
}

#mainTop {
	margin-top: 30px;
	padding: 0;
	margin-left: 40px;
	margin-right: 0;
	float: right;
}

#logo {
	clear: both;
	float: left;
}

#mainTab {
	float: right;
	margin-right: 0;
	padding: 0;
	font-size: 20px;
}

a {
	text-decoration: none;
}

.top {
	margin-right: 0;
	margin-left: 30px;
	font-size: 14px;
}

#logo {
	margin-top: 10px;
	float: left;
	display: inline;
}

#tab {
	height: 100px;
	margin-top: 30px;
	float: right;
	display: inline;
}

.tablinks {
	float: left;
	list-style: none;
	display: inline-block;
	margin-left: 80px;
	font-size: 18px;
	position: relative;
	width: 60px;
	text-align: right;
}

#subtab {
	padding-top: 10px;
	padding-bottom: 10px;
	width: 70px;
	text-align: center;
	list-style: none;
	position: relative;
	font-size: 18px;
	display: none;
	z-index: 1;
}

#subtab a {
	margin-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
	list-style: none;
	position: relative;
	font-size: 18px;
	z-index: 1;
	display: block;
}

#plant:hover #subtab {
	display: block;
}

.Tab:hover {
	color: #969592;
}

.sub:hover {
	color: #969592;
}
</style>


</head>
<body>
	<div id="fullmain">
		<div id="main">
			<!-- header top -->

			<div id="mainTop">
				<a href="#" class="top">cart</a> <a href="#" class="top">my</a> <a
					href="#" class="top" class="header-btn button" id="loginbtn">login</a>
				<a href="<%=request.getContextPath()%>/join" class="top">join</a>
			</div>


			<!-- 로그인 모달창 -->
			<div class="loginmodal">
				<div class="form">
					<span class=close>X</span>
					<p class="pabouttitle">LOGIN</p>
					<br>
					<span class="smsg">-</span><br>
					<br>
					<form class="login-form" id="frm">
						<input type="text" placeholder="id" name="id" /> <input
							type="password" placeholder="password" name="passwd" /> <br>
						<button class="btnsearch" id="btnLogin">login</button>
						<p class="message">
							<a href="<%=request.getContextPath()%>/page/member/searchIdNPw.jsp">ID/PW찾기</a>		
						</p>
					</form>
				</div>
			</div>
			<!-- 모달 끝! -->

			<!--  logo -->
			<!--  logo 이미지 넣기 -->

			<div id="logo">
				<img alt="logo" src="${path }/resources/img/logo.png" />
			</div>


			<!-- header의 tab 버튼 -->
			<div id="tab">
				<div class="tablinks" id="plant">
					<a href="#" class="Tab">Plant</a>
					<div id="subtab">
						<a href="#" id="subtabM" class="sub">Mission</a> <a href="#"
							class="sub">Diary</a>
					</div>
				</div>
				<div class="tablinks">
					<a href="#" class="Tab">Class</a>
				</div>
				<div class="tablinks">
					<a href="#" class="Tab">Event</a>
				</div>
				<div class="tablinks">
					<a href="${path}/product" class="Tab">Store</a>
				</div>
			</div>
		</div>


	</div>



	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(function() {
			$("#loginbtn").click(login);
			$(".close").click(loginclose);
			$("#amyPage").click(function() {
				location.href = '#';
			});

			function login() {
				$(".loginmodal").css("display", "block");
				$(".form").css("display", "block");
			}
			;

			function loginclose() {
				$(".loginmodal").css("display", "none");
			}
			;

			$("#btnLogin").click(function() {
				any = 1;
				var frm = document.getElementById("frm");
				frm.action = "#";
				frm.method = "post";
				frm.submit();
			});

		});
	</script>


</body>
</html>