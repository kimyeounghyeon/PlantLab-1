<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>����� Diary</title>
<link href="${path}/resources/css/DiaryStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="bgdiv">
	<h3 class="title">diary</h3>
	<br>
	<button type="button" class="dwirte">�ϱ� ����</button>
	<br>
	<div class="dback">
			<div class="ddiary">
				<table class="tdiary">
					<tr class="ttr idtr">
						<td class="writeid idtd" colspan="2">���̵�</td>
					</tr>
					<tr class="ttr imgtr">
						<td class="diaryimg" colspan="2">�̹���</td>
					</tr>
					<tr class="ttr liketr">
						<td class="like liketd"><img src="${path }/resources/img/���ƿ䴩�������׷���.png" class="like"></td>
						<td class="liketdcnt">���ƿ� ��</td>
					</tr>
					<tr class="ttr contexttd">
						<td class="dcontext" colspan="2">����</td>
					</tr>
				</table>
			</div>
	</div>
</div>
</body>
</html>