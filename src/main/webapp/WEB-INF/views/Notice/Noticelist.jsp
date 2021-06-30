<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>無以林 notice</title>
	<link href="${path}/resources/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
   
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>

 
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

#mem{
padding-top:300px;
text-align: center;}

table{
margin:auto;
    width: 700px;
    height: 200px;
    padding_top:400px;
    position:relative;
 

 
 </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<c:if test="${empty loginMember.userName}">
<div id="mem">회원이 아닙니다.

</div>
</c:if>

 <c:if test="${!empty loginMember}">
		<jsp:include page="../mypagemenu.jsp"></jsp:include>
<div>
	<table border=1 >
    <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성일</th>
       
    </tr>
    <c:forEach var="f" items="${list}">
    <tr>
  
        <td>${f.notice_no}</td>
        <td><a href="${path}/nread.do?notice_no=${f.notice_no}">${f.notice_title}</a></td> 
       
        <td>${f.notice_date}</td>
  </tr>    
  <tr> 
    </c:forEach>
     </table>
 <c:if test="${1==loginMember.grade}">
		<button type="button" onclick="location.href='nwrite.do'">글쓰기얌</button>
		</c:if>	
 </div>
</c:if>	
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>	