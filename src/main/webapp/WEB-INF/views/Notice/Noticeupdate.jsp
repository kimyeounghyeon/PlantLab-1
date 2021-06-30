<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트래용</title>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	
	글 수정할꺼야....
	<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.</div></c:if>
<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.

</div>
</c:if>
<c:if test="${loginMember.grade==1}">

<form name="update" method="POST" action="${path}/nnupdate.do">
<input type="hidden" name="notice_no" value="${data.notice_no}">
<input type="hidden" name="user_no" value="${loginMember.grade}">
<div><input name="notice_title" value="${data.notice_title}" type="text"/></div>
<div><input name="notice_content" value="${data.notice_content}" type="text"/></div>
<button type="submit">수정</button>
</form>
<div></div>
</c:if>
</body>
</html>

<!-- 파일 2 적용하기 제발 !~~~ -->