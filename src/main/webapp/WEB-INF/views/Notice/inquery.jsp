<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林  1:1 inquery</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

* {
	font-family: 'Jeju Myeongjo';
}
a {
	text-decoration: none;
	color: black;
}

#content {
	clear: both;
	width: 1250px;
	margin: auto;
	overflow: hidden;
	margin-bottom: 100px;
}
#main_section {
	clear: both;
}

.aside1 {
	float: left;
	width: 120px;
	height: 250px;
	position: relative;
	top: 25.5px;
	margin-right: 15px;
}

.aside1 hr {
	border: solid 1px #625b54;
	margin-top: -5px;
}

ul.cateList {
	list-style: none;
	padding: 0px;
	text-align: left;
}

ul.cateList li a:hover {
	font-weight: bold;
	color: #ADBA85;
}

ul.cateList li, ul.recentList li {
	margin: 20px 10px;
}
.fnadiv{
clear : both;
}
#first{
font-size:20px;
}
#second{
font-size:15px;
}
.aside1 h3, .aside2 h3 {
	text-align: center;
}

.location{
padding-left : 400px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../mypagemenu.jsp"></jsp:include>

<div id="content" class="contents">


		<section id="main_section">
<div class="fnadiv">
<article class="aside1" style="margin-top: -20px;">
				<h3>카테고리</h3>
				<hr>
				<ul class="cateList">
					<li><a href="${path}/inquery">1:1 문의하기</a></li>
					<li><a href="${path}/nlist">공지사항</a></li>
					<li><a href="${path}/flist">자주 묻는 질문</a></li>
				</ul>
			</article>
<h2 class="location">1:1 문의하기</h2>
<div class="location" id="first">질문이 있으십니까?</div>
<br><br>
<div class="location" id="second">무이림 지원 커뮤니티에서 질문에 대한 <br> 답변을 얻으실 수 있습니다.</div>
<br><br>
<div class="location"><a href="http://pf.kakao.com/_XJWxns" onclick="void chatChannel();" target='_blank'>지금 시작 하기 > </a></div>
</div></section></div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
	<script type="text/javascript">
		function chatChannel() {
			Kakao.Channel.chat({
				channelPublicId : '_XJWxns',
			})
		}
	</script>
</html>