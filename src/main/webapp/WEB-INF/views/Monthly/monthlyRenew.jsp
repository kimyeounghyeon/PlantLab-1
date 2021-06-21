<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  monthly update </title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.mupdiv{
clear : both;
}
#mupform{

margin-right:auto;
margin-left: auto;
}
#renew{
 background: #625b54;
  color : white;
  border : none;
}
.mwn{
width : 400px;
border : 1px solid #625b54;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="mupdiv">
	<form name="renewForm" action="mUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="monthly_no" value="${monthly.monthly_no}">
		<input type="hidden" name="monthly_img" value="${monthly.monthly_img}">
	
	
		<table id="mupform">
			<tr>
				<td>식물 이름</td>
			</tr>
			<tr>
				<td><input type="text" class="mwn" name="monthly_name" value="${monthly.monthly_name}"></td>
			</tr>
			<tr>
				<td>현재 식물 이미지</td>
			</tr>
			<tr>
				<td class="mwn">
					 ${monthly.monthly_img}
				</td>
			</tr>
			<tr>
				<td>식물 이미지</td>
			</tr>
			<tr>
				<td class="mwn"><input type="file" name="upfile"></td>
			</tr>
			
		</table>
		<br>
		<div align="center">
		<input type="submit" id="renew" value="등록하기">
		</div>
	</form>
	</div>
</body>
</html>