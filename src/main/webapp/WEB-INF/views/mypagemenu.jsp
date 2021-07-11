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
	border: 1px solid #625854;
	list-style: none;
	background-color: #white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	 margin-left:-1px;
	 margin-top:-1px;
}

#mypagemenu .linkmenu {
	text-decoration: none;
	color: #625854;
	display: block;
	width: 400px;
	font-size: 20px;
}

#mypagemenu .linkmenu:hover {
	color: white;
	background-color: #625854;
}

#managepagemenu ul li {
	font-family: 'Jeju Myeongjo';
	border: 1px solid #625854;
	list-style: none;
	background-color: #white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	 margin-bottom:-1px;
	 margin-right: -1px;
	
}

#managepagemenu .linkmenu {
	text-decoration: none;
	color: #625854;
	display: block;
	width: 300px;
	font-size: 20px;
}

#managepagemenu .linkmenu:hover {
	color: white;
	background-color: #625854;
}

#onemenu{
	margin-top: -1px;
	border-top: none;
margin: 0;
}


</style>
<title>mypage</title>
</head>
<body>
	<c:if test="${loginMember.grade==0}">
		<div id="mypagemenu">
			<ul>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/orderList">주문 내역</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/mydiary">내가 쓴 일기</a></li>
				<li><a class="linkmenu" href="${path}/inquery">문의하기</a></li>
				<li><a class="linkmenu" href="#">구매후기</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/update">개인 정보 수정</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/delete">회원탈퇴</a></li>
				<li><a class="linkmenu"
					href="<%=request.getContextPath()%>/onedayMy" id="onemenu">클래스 예약 내역</a></li>
			</ul>
		</div>

	</c:if>
	<c:if test="${loginMember.grade==1}">
		<div id="managepagemenu">
			<ul>
				<li><a class="linkmenu" href="${path}/managerPL">상품 관리</a></li>
				<li><a class="linkmenu" href="${path}/managerOL">주문 관리</a></li>
				<li><a class="linkmenu" href="${path}/admindiary">일기 관리</a></li>
				<li><a class="linkmenu" href="${path}/mlist" style="border-left: none; ">이달의 식물 관리</a></li>
			</ul>
			<ul>
				<li><a class="linkmenu" href="${path}/inquery">문의 관리</a></li>
				<li><a class="linkmenu" href="${path}/">후기 관리</a></li>
				<li><a class="linkmenu" href="${path}/userList">회원 관리</a></li>
				<li><a class="linkmenu" href="${path}/onedayAdmin"  style="border-left: none;">클래스 관리</a></li>

			</ul>

		</div>
	</c:if>



</body>
</html>

