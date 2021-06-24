<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 OnedayClass</title>
<link href="${path}/resources/css/Oneday/OnedayMain.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="bgdiv">
		<h3 class="subtitle">oneday class</h3>
		<div class="dback">
		
		<form id="onefrm" action="onedayDetail" method="post">
		
			<c:forEach var="o" items="${one}" varStatus="status">

				<div id="onediv" class="onediv">
					<%-- <a	 href="${path}/onedayDetail?oneday_no=${o.oneday_no}"> --%>
						<table class="onecontent">
							<tr class="on omgtr">
								<td class="oneimg" id=${status.index } colspan="2"><img
									src="${pageContext.request.contextPath}/resources/img/${o.oneday_img }" class="oneimg"></td>

							</tr> 

							<tr class="on contextone">
								<td class="ocontext" colspan="2">${o.oneday_title }</td>
								<input type="hidden" name="oneday_no" value="${o.oneday_no}">

							</tr>

						</table>
					<!-- </a> -->
				</div>
			</c:forEach>
			</form>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$("#onediv").click(function(){
		
		/* location.href("${path}/onedayDetail"); */
		$("form").submit();
		
		
		
	})
	
	
});

</script>

</body>
</html>