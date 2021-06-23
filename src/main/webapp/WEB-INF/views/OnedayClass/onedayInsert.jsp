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

<h5 class="subtitle">無以林class insert</h5>


<form action="${path}/onedayInsertResult"  enctype="multipart/form-data" method="post">
<br/>
<span class="inserttag">클래스명</span>
<br/> 

<input type="text"  name="oneinsertN"  class="oneinsert"/>

<br/>
<span class="inserttag">클래스 썸네일</span>
<br/>

<div id="some" style="border: 1px solid black; display: inline-block;" >
<input type="file"    name="oneinsertS"    style="display: inline-block;" />
</div>


<!-- <span class="inserttag">클래스 이미지</span>
<br/>


<div style="border: 1px solid black; height: 30px; padding-left:5px;  "  class="oneinsert">
<input type="file"    name="oneinsertI"     />
</div> -->


<br/>


<span class="inserttag">클래스 가격 \</span>
<br/>


<input type="text" class="oneinsert"   name="oneinsertPR" />
<br/>


<span class="inserttag" >클래스 재고수량</span>
<br/>


<input type="number" class="oneinsert"    name="oneinsertM" />
<br/>

<span class="inserttag" >클래스 장소</span>
<br/>

<input type="text" class="oneinsert"    name="oneinsertP" />
<br/>


<span class="inserttag" >클래스  시작일</span>
<br/>


<input type="date" class="oneinsert"    name="oneinsertDS" />

<span class="inserttag" >클래스  마감일</span>
<br/>
<input type="date" class="oneinsert"    name="oneinsertDE" />
<br/>


<span class="inserttag" >클래스 설명</span>
<br/>


<textarea type="text" id="oneinsertT"   style="resize:none;"  name="oneinsertC"   ></textarea>
<br/>


<button id="oneIbtn" type="submit">등록</button>
</form>



</div>
</div>


</body>
</html>