<link href="${path}/resources/css/font.css" rel="stylesheet" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/Oneday/OnedayAply.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 class apply</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="fullmain">
<div id="main">





<h3 class="subtitle">class</h3>
<%-- <c:forEach var="o" items="${one}" varStatus="status"> --%>
	
<div id ="classInto">
${one.oneday_title}
</div>

<div id="classImg"> 
<img src= "${one.oneday_img }" alt="img">
</div>
<div id="null" ></div>  <!--classImg 와 classContent 사이를 띄어놓는 div-->
<div id="classContent">
${one.oneday_content}
<br>
정원: ${one.oneday_maxPerson }
<br>
신청기간: ${one.oneday_start } ~ ${one.oneday_end }
</div>

<button id="classBtn" type="button" >신청</button>


<%-- </c:forEach> --%>


</div>
</div>

<script type="text/javascript">
/* $(function(){
	$("#classBtn").clik(function(){
		location.href = "onedaySubmit";
		
		
		
	})
	
	
	
}) */
</script>


</body>
</html>