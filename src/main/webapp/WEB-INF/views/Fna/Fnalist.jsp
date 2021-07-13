<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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
.main_header {
	position: relative;
	margin-left: 600px;
}
.tablearticle {

	position: relative;
	float: right;
	border-collapse: collapse;
	border-top: 1px solid #ffffff;
	height: 200px;
}
.tablearticle table {

	width: 500px;
	position: relative;
}
.paging {
	width: 50px;
	height: 15px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
.fnadiv {
	clear: both;
}
.maintb {-webkit-box-shadow: 30px 31px 9px -18px rgba(232,232,232,1);
-moz-box-shadow: 30px 31px 9px -18px rgba(232,232,232,1);
box-shadow: 30px 31px 9px -18px rgba(232,232,232,1);
	margin-left: auto;
	margin-right: auto;
	width: 70%;
	border-collapse: collapse;
	
}
.wbtn {
	float: right;
	width: 100px;
	cursor: pointer;
	height: 45px;
	margin-top: -40px;
	margin-bottom: 10px;
	background-color: white;
	z-index: 1;
	border: 1px solid #ccc;
	display: inline;
	margin-right: 124px;
}
.wbtn:hover {
	background-color: #625b54;
	color: white;
	border: 1px solid #625b54;
}
#del {
	float: right;
	width: 60px;
	cursor: pointer;
	height: 35px;
	background-color: white;
	z-index: 1;
	border: 1px solid #ccc;
}
#del:hover {
	background-color: #625b54;
	color: white;
	border: 1px solid #625b54;
}
#fnaq {
	width: 750px;
	font-size: 17px;
	
}
.udbtn {
	background: none;
	border: none;
	color: #625854;
}
#trunder {
-webkit-box-shadow: inset 28px 17px 8px -28px rgba(204,204,204,1);
-moz-box-shadow: inset 28px 17px 8px -28px rgba(204,204,204,1);
box-shadow: inset 28px 17px 8px -28px rgba(204,204,204,1);
	border-bottom: 1px solid #625854;
	height: 100px;
}
#trtop {
-webkit-box-shadow: inset 27px 27px 8px -28px rgba(204,204,204,1);
-moz-box-shadow: inset 27px 27px 8px -28px rgba(204,204,204,1);
box-shadow: inset 27px 27px 8px -28px rgba(204,204,204,1);	
	border-top: 0.4px solid #625854;
}
.fmargin {
	padding-top: 10px;
	padding-bottom: 30px;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "flist?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>

	<div id="content" class="contents">


		<section id="main_section">


			<article class="aside1" style="margin-top: -20px;">
				<h3>카테고리</h3>
				<hr>
				<ul class="cateList">
					<li><a href="${path}/inquery">1:1 문의하기</a></li>
					<li><a href="${path}/nlist">공지사항</a></li>
					<li><a href="${path}/flist">자주 묻는 질문</a></li>
				</ul>
			</article>

			<div class="main_header">
				<h2 class="title">자주 묻는 질문</h2>
			</div>

			<c:if test="${empty loginMember.userName}">

				<div id="mem">회원이 아닙니다.</div>
			</c:if>

			<c:if test="${!empty loginMember}">
			
			
				<c:if test="${empty viewAll}">
		
			
				<br> 저장된 글이 없습니다.<br>
				<br>
		</c:if>
			
			
			
			
			
				<c:if test="${1==loginMember.grade}">
					<button class="wbtn" type="button" onclick="location.href='fwrite'">글쓰기</button>
				</c:if>
				<br>
				<br>
				<table class="maintb">
					<c:forEach var="f" items="${viewAll}">
						<tr id="trtop">
							<td class="fmargin" id="fnaq">&nbsp;&nbsp;&nbspQ .${f.fna_title}</td>
							<c:if test="${1==loginMember.grade}">
								<td class="fmargin">
									<form name="form2" action="fupdate" method="GET">
										<input type="hidden" name="fna_no" value="${f.fna_no}" />
										<button type="submit" class="up"
											onclick="location.href='fupdate'" id="del">수정</button>
									</form>
								</td>
								<td class="fmargin">
									<form name="form1" action="fdelete" method="POST">
										<input type="hidden" name="fna_no" value="${f.fna_no}" />
										<button type="submit" class="del" id="del">삭제</button>
									</form>
								</td>

							</c:if>
						</tr>
						<tr id="trunder">
							<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;A. ${f.fna_content}</td>
						</tr>
<br>
					</c:forEach>
				</table>
				
				<br>
				<br>
				<div class="paging">
					<c:if test="${paging.startPage != 1 }">
						<a
							href="${path}/flist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="${path}/flist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="${path}/flist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</c:if>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$("form").on("submit", function() {
		var fna_no = $(this).find('[name=number]').val();
	});
	function fupdate(fna_no) {
		location.href = "fupdate?fna_no=" + fna_no
	}
</script>

</html>