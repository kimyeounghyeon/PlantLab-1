
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />



<!--  화면 크기 줄이고 늘리는거에 따라 다 따로노는 현상이 있음 이거 수정해야함 
카테고리 옆에 테이블이 잘 안들어감..이것도 해결해야함 -->

<head>
<meta charset="UTF-8">
<title>無以林 notice</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Noticelist.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@charset "UTF-8";

* {
	font-family: 'Jeju Myeongjo';
}

a {
	text-decoration: none;
	color: black;
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

.aside1 h3, .aside2 h3 {
	text-align: center;
}

ul.cateList li, ul.recentList li {
	margin: 20px 10px;
}

#content{
	clear : both;
	width : 1250px;
	margin : auto;	
	  overflow:hidden;
	  		margin-bottom:100px;
}

#main_section{
    clear: both;
}

.main_header{
position:relative;
margin-left:600px;

}


.wbtn{
 float: right;
	width: 100px;
	cursor: pointer;
    height: 45px;
    margin-top:-40px;
    margin-bottom:10px;
    background-color: white;
	z-index: 1;
	border : 1px solid #ccc;
display:inline;
	margin-right:141px;}	
	.wbtn:hover {
	background-color: #625b54;
	color: white;
	border: 1px solid #625b54;
}
	
	
	
	.admdTable {
	clear : both;
    border: solid 1px #ccc;
    border-radius: 10px;
    padding: 10px;
    margin: auto;
    width: 70%;
    margin-left:100px;
    position: relative;
display: inline-table;
}


.admdtr{
	border : 1px solid gray;
}

.admdtd {
	text-align : center;
}

.admdNum {
	width : 80px;
}

.admdContent {
	width : 720px;
	height : 60px;
	white-space: nowrap;
	overflow : hidden;
	text-overflow: ellipsis;
}

.admdDate {
	width : 150px;
}

.admdth {
	border-bottom : 1px solid #ccc;
}


.admdcontentmove {
	width : 820x;
	height : 20px;
	white-space: nowrap;
	overflow : hidden;
	text-overflow: ellipsis;
	line-height : 20px;
	margin-right: 5px;

	text-align:center;
}</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>



	<div id="content" class="contents">


		<section id="main_section">


			<article class="aside1" style="margin-top:-20px;">
				<h3>카테고리</h3>
				<hr>
				<ul class="cateList">
					<li><a href="${path}/inquery">1:1 문의하기</a></li>
					<li><a href="${path}/nlist">공지사항</a></li>
					<li><a href="${path}/flist">자주 묻는 질문</a></li>
				</ul>
			</article>

  <div class="main_header">
                <h2 class="title">공지 사항</h2>
            </div>



			<c:if test="${empty loginMember.userName}">

				<div id="mem">회원이 아닙니다.</div>
			</c:if>


			
		


			<c:if test="${!empty loginMember}">

			<div class="adFrmDiv">
			<c:if test="${1==loginMember.grade}">
			<button class="wbtn" type="button" onclick="location.href='nwrite'">글쓰기</button>
			</c:if>
			</div>
	




<table class="admdTable">
							<tr class="admdtr">
								<th class="admdth admdNum">글번호</th>
								<th class="admdth admdContent" id="mmm">제목</th>
								<th class="admdth admdDate">작성일</th>

							</tr>
								
				<c:if test="${empty list}">
		
			<tr>
				<td colspan="3"> 저장된 글이 없습니다.<br>
				<br></td>
	</tr>	</c:if>
							<c:if test="${not empty list}">
							<c:forEach var="f" items="${list}"  varStatus="status">
								<tr class="admdtr">

									<td class="admdtd admdNum">${f.notice_no}</td>
									<td class="admdtd admdContent"><div class="admdcontentmove"><a
										href="${path}/nread?notice_no=${f.notice_no}">${f.notice_title}</a></div></td>

										<td class="admdtd admdDate">${f.notice_date}</td>
								
								</tr>

							</c:forEach></c:if>
							<tr>
								
							</tr>
						</table></c:if>
		
	</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
