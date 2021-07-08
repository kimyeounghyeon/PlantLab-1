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

  }
  #esubtn{
  background: #625b54;
  color : white;
  border : none;
  width :75px;
  height : 28px;
  }
.ewriteform{
  margin-left : auto;
  margin-right : auto;
 
	}
.mwn{
	width : 400px;
	border : 1px solid #625b54;
	height:26px;
	}
.hei{
	height:26px; 
	}
.mtop{
	padding-top : 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="eInsert" method="post" enctype="multipart/form-data">
		<div id="ediv">
			<h3 align="center">이벤트 등록하기</h3>
			<table class="ewriteform">
				<tr>
					<td class="mtop">이벤트 제목</td>
				</tr>
				<tr>
					<td><input type="text" class="mwn" name="event_title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="mtop">배너 이미지</td>
				</tr>
				<tr>
					<td class="mwn"><input type="file" class="hei" name="upfile1"></td>
				</tr>
				<tr>
					<td class="mtop">이벤트 내용</td>
				</tr>
				<tr>
					<td class="mwn"><input type="file"  class="hei" name="upfile2"></td>
				</tr>
				<tr>
					<td class="mtop">이벤트 시작일</td>
				</tr>
				<tr>
					<td ><input type="text"  class="mwn" name="start_date" placeholder="yyyy.mm.dd"></td>
				</tr>
				<tr>
					<td class="mtop">이벤트 종료일</td>
				</tr>
				<tr class="hei">
					<td><input type="text"  class="mwn" name="end_date" placeholder="yyyy.mm.dd"></td>
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