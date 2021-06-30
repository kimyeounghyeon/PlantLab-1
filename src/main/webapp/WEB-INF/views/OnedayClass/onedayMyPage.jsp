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
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayMyPage.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 My Class</title>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="fullmain">
		<div id="main">
		<h5 class="subtitle">My Oneday Class</h5>
			<!-- 예약된 클래스가 없을 경우  -->
			${nullMsg}
			<c:forEach var="one" items="${one}" varStatus="status">
				<label class="checkContain"> <input type="checkbox"
					name="test_check" value="${one.oneday_no}"> <span
					class="checkmark"></span>
				</label>
				<table id ="myOneTabel" >
				<tr>
				<td rowspan="3"  id="myImg">
				<div class="oneimg"><img src="${one.oneday_img }"  alt="img" class="oneimg"></div>
				</td>
				<td  class="oTD" id="myOne">${one.oneday_title}</td>
				</tr>
				
				<tr>
				<td  class="oTD" id="myOneP">${one.oneday_price} 원</td>
				</tr>
				
				<tr>
				<td class="oTD" id="myOneD">예약일 :${one.reserv_date}</td>
				</tr>
				
				</table>
				
<br>
			</c:forEach>
			<button id="oneCancel">클래스 취소</button>
			<script>		
			
			$(function() {
						//취소

			$("#oneCancel").click(function() {
				var checkArr = []; // 배열 초기화
				$("input[name='test_check']:checked").each(function(i) {
					checkArr.push($(this).val());						 // 체크된 것만 값을 뽑아서 배열에 push
					console.log(checkArr);   							 //check box 값 알기
				});
				var obj = new Object(); 								 //check box  type 알기
				ch = Object.prototype.toString.call(checkArr);
				console.log(ch);
				var name = $("input[name=test_check]").val(); 

				var allData = {
					'checkArray' : checkArr
				};

				$.ajax({
					url : "${path}/onedayCancle",
					type : "GET",
					data : allData,
					async:false,
					success : function(data) {
						console.log('return checkbox value는  : ' + data);
						alert("삭제되었습니다.");
						location.reload();
					},
					error : function(request){
						
						alert("만료 시간이 끝났습니다. 취소하실 수 없습니다.");
						}
					});
				
				})
			})
					</script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>