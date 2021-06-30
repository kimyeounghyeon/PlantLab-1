<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성이래용</title>
<head>

</head>
<body>
<h2>게시글 작성</h2>

<c:if test="${loginMember.grade==1}">
<form name="form1" method="POST" action="${path}/ninsert.do">
    <div>
<!-- 파일 2 적용하기!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
        제목<input type="hidden" name="user_no" id="user_no" value="${loginMember.userNo}">
      
        <input name="notice_title" id="notice_title" size="80" placeholder="제목을 입력해">
    </div>
    <div>
        내용
        <textarea name="notice_content" id="notice_content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
   
    <div style="width:650px; text-align: center;">
        <input type="submit" id="btnSave"/>
        <button type="reset">취소</button>
    </div>
</form>
</c:if>
</body>
</html>

