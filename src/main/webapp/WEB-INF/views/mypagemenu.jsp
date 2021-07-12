<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#mypagemenu {
	width: 1280px;
	margin: auto;
	padding: auto;
	height: 100px;
	padding-top: 210px;
	position: static;
}

#managepagemenu {
	width: 1280px;
	margin: auto;
	padding: auto;
	height: 100px;
	padding-top: 210px;
	position: static;
}

#mypagemenu ul li {
	font-family: 'Jeju Myeongjo';
	list-style: none;
	background-color: #white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	margin-top: -1px;
}

#mypagemenu .linkmenu {
	text-decoration: none;
	color: #625854;
	display: block;
	width: 400px;
	font-size: 14px;
}

#mypagemenu .linkmenu:hover {
	color: white;
	background-color: #625854;
}

#al {
	border: solid 1px #ccc;
	border-top-left-radius: 10px;
	border-bottom: none;
}

#ai {
	border: solid 1px #ccc;
	border-top-left-radius: 10px;
	border-right: none;
}

#bl {
	border: solid 1px #ccc;
	border-left: none;
	border-bottom: none;
}

#bi {
	border: solid 1px #ccc;
	border-right: none;
}

#cl {
	border: solid 1px #ccc;
	border-top-right-radius: 10px;
	border-left: none;
	border-bottom: none;
}

#ci {
	border: solid 1px #ccc;
	border-right: none;
}

#dl {
	border: solid 1px #ccc;
}

#di {
	border: solid 1px #ccc;
	border-top-right-radius: 10px;
}

#el {
	border: solid 1px #ccc;
	border-left: none;
}

#ei {
	border: solid 1px #ccc;
	border-bottom-left-radius: 10px;
	border-right: none
}

#fl {
	border: solid 1px #ccc;
	border-bottom-right-radius: 10px;
	border-left: none
}

#fi {
	border: solid 1px #ccc;
	border-right: none;
}

#gi {
	border: solid 1px #ccc;
}

#hi {
	border: solid 1px #ccc;
	border-bottom-right-radius: 10px;
	border-left: none
}

#managepagemenu ul li {
	font-family: 'Jeju Myeongjo';
	list-style: none;
	background-color: #white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	margin-bottom: -1px;
}

#managepagemenu .linkmenu {
	text-decoration: none;
	color: #625854;
	display: block;
	width: 300px;
	font-size: 14px;
}

#managepagemenu .linkmenu:hover {
	color: white;
	background-color: #625854;
}

#onemenu {
	margin-top: -1px;
	border-top: none;
	margin: 0;
	border: solid 1px #ccc;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-top: none;
}
</style>
<title>mypage</title>
</head>
<body>
	<c:if test="${loginMember.grade==0}">
		<div id="mypagemenu">
			<ul>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/orderList" id="al">주문 내역</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/mydiary" id="bl">내가 쓴 일기</a></li>
				<li><a class="linkmenu" href="${path}/inquery" id="cl">문의하기</a></li>
				<li><a class="linkmenu" href="#" id="dl">구매후기</a></li>
				<li><a class="linkmenu" id="el"
					href="<%=request.getContextPath()%>/update">개인 정보 수정</a></li>
				<li><a class="linkmenu" id="fl"
					href="<%=request.getContextPath()%>/delete">회원탈퇴</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/onedayMy" id="onemenu">클래스
						예약 내역</a></li>
			</ul>
		</div>

	</c:if>
	<c:if test="${loginMember.grade==1}">
		<div id="managepagemenu">
			<ul>
				<li><a class="linkmenu" href="${path}/managerPL" id="ai">상품
						관리</a></li>
				<li><a class="linkmenu" href="${path}/managerOL" id="bi">주문
						관리</a></li>
				<li><a class="linkmenu" href="${path}/admindiary" id="ci">일기
						관리</a></li>
				<li><a class="linkmenu" href="${path}/mlist" id="di">이달의
						식물 관리</a></li>
			</ul>
			<ul>

				<li><a class="linkmenu" href="${path}/inquery" id="ei">문의
						관리</a></li>
				<li><a class="linkmenu" href="${path}/" id="fi">후기 관리</a></li>
				<li><a class="linkmenu" href="${path}/userList" id="gi">회원
						관리</a></li>
				<li><a class="linkmenu" href="${path}/onedayAdmin" id="hi">클래스
						관리</a></li>
				
			</ul>

		</div>
	</c:if>



</body>
</html>

