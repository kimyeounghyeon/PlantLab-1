<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path}/resources/css/FullCalendar/main.css" rel="stylesheet" />
<script src="${path}/resources/js/FullCalendar/main.js"></script>
<!-- fullcalendar css -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayReserve.css"
	rel="stylesheet" />
<!-- main page css  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<meta charset="UTF-8">
<title>Class Reserve</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<div id="fullmain">
		<div id="main">

			<form action="onedayReserveRS" method="post">
				<h3 class="subtitle">Class Reserve</h3>

			<div id="calendar"></div>

				<span></span>
				<!-- <div id="oneContent"></div> -->


				<!-- d -->
				<input type="hidden" name="onedayNo" value="${OneR} ">
				<!-- insert하기 위한 oneday_no box -->
				<p class="onedayinput" id="orn">이름</p>
				<input type="text" class="onedaybox" id="oneName" name="oneName">
				<!-- value값 넣기 -->
				<span class="onedayinput">전화번호</span> <input type="text"
					class="onedaybox" id="onePhone" name="onePhone"> <span
					class="onedayinput">요구사항</span>
				<textarea id="oneRequest" name="oneRequest" style="resize: none;">
</textarea>
				<button id="onedayp" type="submit">결제하기</button>
				<input type="text" name="reservDate">   <!-- 달력 클릭시 값(날짜)이 (가)넘어오게  히든으로 바꾸기-->
			</form>
		</div>
	</div>




<script type="text/javascript">


$(function(){								//공백체크
$("#onedayp").click(function(){
  if($("#oneName").val().length ==0 ) {alert("이름을 입력해주세요"); $("#oneName").focus();	return false;}
  else if($("#onePhone").val().length ==0 )  {alert("연락처를 입력해주세요"); $("#onePhone").focus();	return false;}

});
});

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

//





</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>