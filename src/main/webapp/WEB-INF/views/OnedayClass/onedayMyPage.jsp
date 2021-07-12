<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 My Class</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/resources/css/OrderListStyle.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../mypagemenu.jsp"></jsp:include>

	<div id="fullmain">
	 <div class="main_header">
		<h2 class="title" style="margin: 20 0; height: 100px; padding-top: 20px;">클래스 내역</h2>
		</div>
		<!-- 예약된 클래스가 없을 경우  -->
		${nullMsg}
		<c:forEach var="one" items="${one}" varStatus="status">
			<table class="orderList">
				<tr>
					<td class="proImg" rowspan="2">
						<div class="reviewImg"
							style="max-width: 800px; position: relative;">
							<img src="${one.oneday_img }" alt="img" class="oneimg">
						</div>

					</td>
					<td rowspan="2" class="space"></td>
					<td class="proNames" colspan="3">${one.oneday_title}
						<p>
							<a
								href="<%=request.getContextPath()%>/?oneday_no=${one.oneday_no}">
							</a>
						</p>
					</td>

				</tr>

				<tr>
					<td class="proAllP proGuid"><span>요청사항</span><span>${one.oneday_request}</span>
					</td>
					<td class="proDate proGuid"><span>예약일</span><span>${one.reserv_date}</span>
					</td>

				</tr>
			</table>
			<br>
		</c:forEach>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>