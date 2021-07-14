<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>無以林 notice detail</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<!-- <link href="${path}/resources/css/NoticeRead.css" rel="stylesheet" />
-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
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
#edit {
	margin-left: 20px
}
.main_header {
	position: relative;
	text-align: left;
	margin-left: 300px;
}
.wbtn {
	background-color: #625b54;
	color: white;
	border: 2px solid #625b54;
	width: 100px;
	cursor: pointer;
	height: 45px;
	z-index: 1;
}
.dtdiarytb {
	border: 1px solid #e2e2e2;
	margin: auto;
	margin-left:300px;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
	height: 350px;
	width:750px;
	border-bottom: none;
	overflow:auto;
}
.dtdiarytb .admdtr {
	border: 1px solid #e2e2e2;
	border-left: none;
	border-right: none;
	
}
.dtbtn {
	border: none;
	background-color: white;
	font-weight: bold;
	display: inline-table;
	font-size: 17px;
	padding: 0;
}
.dtbtn:hover {
	cursor: pointer;
}
.ddelete {
	float: right;
	padding-top:10px;
}
.bor {
	border-bottom: 1px solid #e2e2e2;
	text-align: left;
	vertical-align: top;
}
.ed{margin-right:100px;}
.dtdiary {
	height: 50px;
}
.da {
	vertical-align: top;
	margin:100px;
}
.mar {
	height: 50px;
	text-align: center;
	
}
.nbor {
	border-bottom: none;
	
}
#texthe {
	font-size: 20px;
}
.bbor {border:none;
font-size:15px;

   }
   textarea{-webkit-box-shadow: 0px 12px 12px -7px rgba(204,204,204,1);
-moz-box-shadow: 0px 12px 12px -7px rgba(204,204,204,1);
box-shadow: 0px 12px 12px -7px rgba(204,204,204,1);}
   


</style>

</head>
<body><jsp:include page="../header.jsp"></jsp:include>
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
				<h3 class="title">공지 사항</h3>
			</div>

			<c:if test="${!empty loginMember}">










				<table class="dtdiarytb" >

					<tr class="admdtr"id="shadow" >
						<td class="dtdiary" id="texthe" colspan="3">${read.notice_title}</td>
					</tr>



					<tr class="dtdiary"  >
						<td class="da">${read.notice_date}
						<c:if test="${loginMember.grade==1}">

							<input class="dtbtn ddelete"
								type="button" value="수정" id=edit
								onclick="nupdate(${read.notice_no})" /><input type="button"
								class="dtbtn ddelete" value="삭제"
								onclick="ndelete(${read.notice_no})"></c:if></td>
						
					</tr>




					<tr class="bor">
						<td class="bbor" style="white-space:pre;">${read.notice_content}</td>
					</tr>


					<tr class="nbor" >
						<td colspan="3" class="mar"><div class="mmar">
								<button type="button" class="wbtn"
									onclick="location.href='nlist'">
									목록으로<br>돌아가기
								</button>
							</div></td>
					</tr>

				</table>


			</c:if>
		</section>
	</div>





	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script> function ndelete(notice_no){
	var chek = confirm("정말 삭제하시겠습니까?");
	if(chek){location.href="ndelete?notice_no="+notice_no};
}
function nupdate(notice_no){
	location.href="nupdate?notice_no="+notice_no}
</script>
</html>