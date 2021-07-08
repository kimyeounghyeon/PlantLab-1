<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  이달의 식물 write</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <style>
  #mdiv{
	clear: both;
	width: 1250px;
	margin: auto;
	

  }
  #subtn{
    width: 70%;
    height: 85px;
    border: 1px solid #ccc;
    color: black;
    background-color: #ccc;
    font-size: 20px;
    font-weight: bold;
}

#subtn:hover{
    cursor: pointer;
    background-color: #D5D9BA;
}
  .writeform{
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
  .writeform td:nth-child(1) span{
    margin-left: 30px;
}
 .writeform td:nth-child(1){
    background-color: #F3EFEC;
    width: 200px;
}

 .writeform td:nth-child(2){
  	padding-left : 10px;
  	height : 45px;
}
.writeform tr{
border-left : none;
border-right : none;
}

   </style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
	<form action="mInsert" method="post" enctype="multipart/form-data">
		<div id="mdiv">
			<h3 align="center">이달의 식물 등록하기</h3>
			<table class="writeform" border="1">
				<tr>
					<td class="mtop"><span>식물 이름</span></td>
					<td><input type="text" class="mwn" name="monthly_name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="mtop"><span>식물 이미지</span></td>
					<td class="mwn"><input type="file" name="upfile"></td>
				</tr>
			</table>
			<br>
				<div align="center">
				<button id="subtn" type="submit">등록하기</button>
				</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>