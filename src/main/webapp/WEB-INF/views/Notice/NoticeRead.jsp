<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>읽기에욤</title>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.

</div>
</c:if>
 <c:if test="${!empty loginMember}">
		환영합니다
<table border=1 >

<tr>
<th>${read.notice_title}</th>
</tr>
<tr><td>${read.notice_date}</td></tr>
<tr><td>${read.notice_content}</td></tr>
<tr><td>
<input type="button" value="목록가자" id=back onclick="window.location='nlist.do'">

<c:if test="${loginMember.grade==1}">
<input type ="button" value="수정하자" id =edit onclick="nupdate(${read.notice_no})"/>
<input type="button" value="삭제" onclick ="ndelete(${read.notice_no})">
</c:if>
</td></tr>


</table>

</c:if>
</body>
<script> function ndelete(notice_no){
	var chek = confirm("정말 삭제하시겠습니까?");
	if(chek){location.href="ndelete.do?notice_no="+notice_no};
}
function nupdate(notice_no){
	location.href="nupdate.do?notice_no="+notice_no}

</script>
</html>