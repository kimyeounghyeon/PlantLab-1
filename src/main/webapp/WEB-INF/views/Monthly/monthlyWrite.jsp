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

  }
  #subtn{
  background: #625b54;
  color : white;
  border : none;
  width :75px;
  height : 28px;
  }
  .writeform{
  margin-left : auto;
  margin-right : auto;

  }
  .mwn{
    width : 400px;
	border : 1px solid #625b54;
	height:26px;
  }
  .mtop{
	padding-top : 10px;
	}
   </style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
	<form action="mInsert" method="post" enctype="multipart/form-data">
		<div id="mdiv">
			<h3 align="center">이달의 식물 등록하기</h3>
			<table class="writeform">
				<tr>
					<td class="mtop">식물 이름</td>
				<tr>
				</tr>
					<td><input type="text" class="mwn" name="monthly_name" placeholder="이름을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="mtop">식물 이미지</td>
				</tr>
				<tr>
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