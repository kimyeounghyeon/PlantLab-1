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

table {
	
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

		<div class="tablearticle">
			<table class="maintb" border=1>

				<tr>
					<td style="height: 100px;">자주 묻는 질문</td>
					<td><article class="btn">
							<c:if test="${1==loginMember.grade}">
								<button class="wbtn" type="button"
									onclick="location.href='fwrite'">글쓰기</button>

							</c:if>
						</article></td>
				</tr>

				<c:forEach var="f" items="${viewAll}">
					<tr>
						
						<td >질문 :${f.fna_title}</td>
						<td>	<c:if test="${1==loginMember.grade}">

								<form name="del" action="fdelete" method="POST">
									<input type="hidden" name="fna_no" value="${f.fna_no}" />
									<button type="submit" onclick="fdelete()">삭제</button>
							</form>
						
							
							</c:if>
							</td>
					</tr>
					<tr>
						<td colspan="2">A답변:${f.fna_content}</td>
					</tr>
					<tr>
					
						
					
							

					</tr>
				</c:forEach>

			</table>

		</div>
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

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
<script type="text/javascript">





 function fdelete(){
	var chek = confirm("정말 삭제하시겠습니까?");
	if(chek){function submit() {
	    document.forms["fna_no"].submit();
	}	
	 	};
}


</script>

</html>