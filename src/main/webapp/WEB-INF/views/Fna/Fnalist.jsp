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

.tbb table {
	font-weight: bold;
	position: relative;
	color: black;
}

.tbb {
	width: 150px;
	left: 0px;
	margin-top: 50px;
	height: 250px;
	float: left;
	position: relative;
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
	position: relative;
	width: 50px;
	height: 15px;
	top: 50px;
	text-align: center;
}

.fnadiv {
	clear: both;
}

.maintb {
	margin-left: auto;
	margin-right: auto;
	width : 700px;
	border-collapse: collapse;
}
.wbtn{
border : none;
text-align:right;
background :  #625854;
color : white;
margin-left : 915px;
height : 25px;
}
#fnaq{
width : 600px;
font-size :20px;
font-weight : bold;
}
.udbtn{
background : none;
border : none;
color : #625854;
}
#trunder{
border-bottom : 1px solid #625854;
height : 100px;
}
#trtop{
border-top :0.4px solid #625854;

}
.fmargin{
padding-top : 10px;
padding-bottom : 10px;
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




	<!-- 도저히 못하겠다,, ul 형태로 다시짜보자..-->
	<div class="fnadiv">
		<nav class="tbb">
			<table>
				<tr>
					<td>카테고리</td>
				</tr>
				<tr>
					<td><hr style="width: 100px; float: left;"></td>
				</tr>

				<tr class="cateList">
					<td><a href="${path}/#">1:1 문의하기</a></td>
				</tr>
				<tr class="cateList">
					<td><a href="${path}/nlist.do">공지사항</a></td>
				</tr>
				<tr class="cateList">
					<td><a href="${path}/flist">자주 묻는 질문</a></td>
				</tr>
			</table>
		</nav>
		<c:if test="${empty loginMember.userName}">

			<div id="mem">회원이 아닙니다.</div>
		</c:if>

		<c:if test="${!empty loginMember}">
			<h2 align="center">자주 묻는 질문</h2>
			<c:if test="${1==loginMember.grade}">
				<button class="wbtn" type="button" onclick="location.href='fwrite'">글쓰기</button>
			</c:if>
			<br>
			<br>
			<table class="maintb">
				<c:forEach var="f" items="${viewAll}">
					<tr id="trtop" >
						<td class="fmargin" id="fnaq">Q .${f.fna_title}</td>
						<c:if test="${1==loginMember.grade}">
						<td class="fmargin">
							<button type="submit" class="udbtn" onclick="fupdate()">수정</button>
							<button type="submit" class="udbtn" onclick="fdelete()">삭제</button>
						</td>
							
							<form name="del" action="fdelete" method="POST">
								<input type="hidden" name="fna_no" value="${f.fna_no}" />
							</form>
						</c:if>
					</tr>
					<tr id="trunder">
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;${f.fna_content}</td>
					</tr>

				</c:forEach>
			</table>

			<div class="paging" style="display: block; text-align: center;">
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
							<a href="${path}/flist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="${path}/flist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</c:if>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function fdelete() {
		var chek = confirm("정말 삭제하시겠습니까?");
		if (chek) {
			function submit() {
				document.forms["fna_no"].submit();
			}
		};
	}
</script>

</html>