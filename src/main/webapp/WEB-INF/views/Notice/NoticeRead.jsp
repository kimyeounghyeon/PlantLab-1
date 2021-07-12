<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>읽기에욤</title>
<link href="${path}/resources/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/NoticeRead.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>





</head>
<body><jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.
</div></c:if>
<nav class="tbb">
<table>
			<tr>
				<td>카테고리</td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/inquery">1:1 문의하기</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/nlist">공지사항</a></td>
			</tr>
			<tr class="cateList">
				<td><a href="${path}/flist">자주 묻는 질문</a></td>
			</tr>
		</table></nav>


 <c:if test="${!empty loginMember}">
<table class="maintb" >
<tr><td class="h2"colspan="4">공지 사항</td></tr>
<tr>
<td class="sub"colspan="4">${read.notice_title}</td>
</tr>
<tr ><td class="datetb" colspan="2">${read.notice_date}</td>
<c:if test="${loginMember.grade==1}">
<td class="kan"><input class="wbtn" type ="button" value="수정" id =edit onclick="nupdate(${read.notice_no})"/></td>
<td class="kan" id="del"><input class="wbtn" type="button" value="삭제" onclick ="ndelete(${read.notice_no})"></td>
</c:if></tr>

<tr><td colspan="4" class="content">${read.notice_content}</td></tr>
<tr><td colspan="4" class="btn"><button type ="button" class="btnsave" onclick="location.href='nwrite'">목록으로 돌아가기</button></td></tr>

</table>


</c:if>
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