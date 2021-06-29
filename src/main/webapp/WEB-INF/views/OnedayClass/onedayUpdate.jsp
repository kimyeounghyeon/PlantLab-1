<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/font.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayInsert.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<meta charset="UTF-8">
<title>無以林 class Add Insert</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>




<div id="fullmain">
<div id="main">

<h5 class="subtitle">AD Class Update</h5>
<form action="${path}/onedayUpdateRs"  enctype="multipart/form-data" method="post"> 
<br/>
<input type="hidden"  name="oneno"  class="oneinsert"  value="${one.oneday_no}"/>
<span class="inserttag">클래스명</span>
<br/> 

<input type="text"  name="oneinsertN"  class="oneinsert"  value="${one.oneday_title}"/>

<br/>
<span class="inserttag">클래스 썸네일</span>
<br/>
<input type="file"  id="updateInput"  name="oneinsertS"  />

<div id="some" style="border: 1px solid black; display: inline-block;" >
<img src= "${pageContext.request.contextPath}/resources/img/${one.oneday_img }" alt="img" id="some_IMG">
</div>

<br/>


<span class="inserttag" style="margin-top: 20px;">클래스 가격 </span>
<br/>


<input type="text" class="oneinsert"   name="oneinsertPR" value="${one.oneday_price}" />
<br/>


<span class="inserttag" >클래스 재고수량</span>
<br/>


<input type="number" class="oneinsert"    name="oneinsertM"  value=  "${one.oneday_maxPerson}"/>
<br/>

<span class="inserttag" >클래스 장소</span>
<br/>

<input type="text" class="oneinsert"    name="oneinsertP"  value="${one.oneday_place}"/>
<br/>


<span class="inserttag" >클래스  시작일</span>
<br/>


<input type="date" class="oneinsert"    name="oneinsertDS"  value="${one.oneday_start}"/>

<span class="inserttag" >클래스  마감일</span>
<br/>
<input type="date" class="oneinsert"    name="oneinsertDE" value="${one.oneday_end}" />
<br/>


<span class="inserttag" >클래스 설명</span>
<br/>


<textarea type="text" id="oneinsertT"   style="resize:none;"  name="oneinsertC"   >${one.oneday_content}</textarea>
<br/>


<button id="oneIbtn" type="submit">수정</button>
</form> 



</div>
</div>


</body>
</html>