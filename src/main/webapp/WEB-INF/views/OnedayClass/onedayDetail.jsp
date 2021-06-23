<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
	
<%-- <div id ="classInto">
${oneVo.oneday_title}
</div> --%>

<div id="classImg"> 
<img src= "${oneVo.oneday_img }" alt="img">
</div>
<div id="null" ></div>  <!--classImg 와 classContent 사이를 띄어놓는 div-->
<div id="classContent">
<p>${oneVo.oneday_title} </p>
<p class="classText" > 가격: ${oneVo.oneday_price}원</p>
<p class="classText">신청 인원: ${oneVo.oneday_maxPerson} </p>
<p  class="classText">장소 :    ${oneVo.oneday_place} </p>
<p  class="classText">신청기간: ${oneVo.oneday_start } ~ ${oneVo.oneday_end }</p>
<button id="classBtn" type="button" >신청</button>
</p>
</div>
<br>
<br>
<br>
<br>
${fn:replace(oneVo.oneday_content,replaceChar , "<br/>")}
사진 넣기




</div>

</div>

<script type="text/javascript">
 $(function(){
	$("#classBtn").click(function(){
		location.href ="${path}/onedayReserve?onedayNo=${oneVo.oneday_no}";
		
		
		
	})
	
	
	
})  
</script>


</body>
</html>