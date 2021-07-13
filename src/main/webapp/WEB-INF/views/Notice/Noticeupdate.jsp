
<!-- 글쓰기랑 글 업데이트는 null값이 들어왔을때나 공백에 관한 코드를 넣어주자 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트래용</title>
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
	text-align: left;
	margin-left: 310px;
}

.dtdiarytb {
	border: 1px solid #e2e2e2;
	margin: auto;
	border-collapse: collapse;
	border-left: none;
	border-right: none;
	height: 400px;
	border-bottom: none;
}

.tbtitle {
	border: none;
	font-size: 17px;
}

.titler {
	border: 1px solid #e2e2e2;
	height: 50px;
	border-left: none;
	border-right: none;
}

textarea {
	border: none;
	margin:10px;
}

.bor {
	border-bottom: 1px solid #e2e2e2;
	text-align: left;
	vertical-align: top;
}

#wbtn {
background-color: #625b54;
	color: white;
	border: 2px solid #625b54;
	width: 100px;
	cursor: pointer;
	height: 45px;
	
	
	z-index: 1;
	
	

}
.bbor {border:none;
   }
   
   
  .bbor::-webkit-scrollbar {
  width: 6px;
}
.bbor::-webkit-scrollbar-track {
  background-color: transparent;
}
.bbor::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: #BDBDBD;
}
.bbor::-webkit-scrollbar-button {
  width: 0;
  height: 0;
}


.mar {
	text-align: center;
}
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
				<h3 class="title">수정하기</h3>
			</div>

			<c:if test="${!empty loginMember}">




				<c:if test="${loginMember.grade==1}">



<form name="update" method="POST"action="${path}/nnupdate">
					<table class="dtdiarytb">

						<tr class="titler">
							<td>
									<input type="hidden" name="notice_no" value="${data.notice_no}">
									<input type="hidden" name="user_no"
										value="${loginMember.grade}">
									<div>
										<input class="tbtitle" name="notice_title" size="81"
											value="${data.notice_title}" type="text" />
									</div></td>
						</tr>
						<tr class="bor">
							<td><textarea name="notice_content" id="notice_content" class="bbor"
									rows="15" cols="100">${data.notice_content}</textarea></td>
						</tr>
						<tr>
							<td class="mar"><button class="btnsave" id="wbtn"
									type="submit">수정</button></td>
						</tr>
					
					</table>
	</form>
				</c:if>

			</c:if>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>