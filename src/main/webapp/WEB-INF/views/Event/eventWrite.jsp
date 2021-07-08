<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event detail</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <style>
  #ediv{
  	clear: both;
	width: 1250px;
	margin: auto;
  }
  
  #esubtn{
   width: 70%;
    height: 85px;
    border: 1px solid #ccc;
    color: black;
    background-color: #ccc;
    font-size: 20px;
    font-weight: bold;
}
#esubtn{
    cursor: pointer;
    background-color: #D5D9BA;
}

#ewriteform{
   width: 70%;
    height: 100px;
    margin: auto;
    border-left: none;
    border-right: none;
    border-top: none;
    border-bottom: none;
    border-collapse: collapse;
    border-color: #ccc;
    padding: 10px;
}
#ewriteform td:nth-child(1) span{
    margin-left: 30px;
}
#ewriteform td:nth-child(1){
    background-color: #F3EFEC;
    width: 200px;
}

#ewriteform td:nth-child(2){
  	padding-left : 10px;
  	height : 45px;
}
#ewriteform tr{
border-left : none;
border-right : none;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="eInsert" method="post" enctype="multipart/form-data">
		<div id="ediv">
			<h3 align="center">이벤트 등록하기</h3>
			<table id="ewriteform" border="1">
				<tr>
					<td ><span>이벤트 제목</span></td>
					<td><input type="text" name="event_title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td><span>배너 이미지</span></td>
					<td><input type="file"  name="upfile1"></td>
				</tr>
				<tr>
					<td><span>이벤트 내용</span></td>
					<td><input type="file"  name="upfile2"></td>
				</tr>
				<tr>
					<td ><span>이벤트 시작일</span></td>
					<td ><input type="text"  name="start_date" placeholder="yyyy.mm.dd"></td>
				</tr>
				<tr>
					<td class="mtop"><span>이벤트 종료일</span></td>
					<td><input type="text"  name="end_date" placeholder="yyyy.mm.dd"></td>
				</tr>
			</table>
			<br>
				<div align="center">
				<button id="esubtn" type="submit">등록하기</button>
				</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>