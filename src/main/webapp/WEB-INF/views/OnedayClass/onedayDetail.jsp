<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/font.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayDetail.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 classDtail</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="fullmain">
<div id="main">





<h3 class="subtitle">class</h3>
	
<div id ="classInto">
${oneVo.oneday_title}
</div>

<div id="classImg"> 
<img src= "${oneVo.oneday_img }" alt="img">
</div>
<div id="null" ></div>  <!--classImg 와 classContent 사이를 띄어놓는 div-->
<div id="classContent">
<textarea id="classText" style="resize: none; " disabled readonly="readonly">

${oneVo.oneday_content}

신청기간: ${oneVo.oneday_start } ~ ${oneVo.oneday_end }

</textarea>
</div>
<br>

<button id="classBtn" type="button" >신청</button>



</div>

</div>

<script type="text/javascript">
/*  $(function(){
	$("#classBtn").clik(function(){
		location.href = "onedaySubmit";
		
		
		
	})
	
	
	
})  */
</script>


</body>
</html>