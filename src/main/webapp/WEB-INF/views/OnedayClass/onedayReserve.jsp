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
				<input type="hidden" name="onedayNo" value="${OneR.oneday_no}">   <!-- oneday  no -->
				<!-- insert하기 위한 oneday_no box -->
				<p class="onedayinput" id="orn">이름</p>
				<input type="text" class="onedaybox" id="oneName" name="oneName">
				<!-- value값 넣기 -->
				<span class="onedayinput">전화번호</span> <input type="text"
					class="onedaybox" id="onePhone" name="onePhone">
				<span class="onedayinput">희망 날짜</span> <input type="text"
					class="onedaybox" id="rd" name="reservDate">
					 <span class="onedayinput">요구사항</span>
				<textarea id="oneRequest" name="oneRequest" style="resize: none;">
</textarea>
				<button id="onedayp" type="submit">결제하기</button>
				
			</form>
		</div>
	</div>




<script type="text/javascript">
console.log("${OneR.oneday_start}");

$(function(){								//공백체크
$("#onedayp").click(function(){
  if($("#oneName").val().length ==0 ) {alert("이름을 입력해주세요"); $("#oneName").focus();	return false;}
  else if($("#onePhone").val().length ==0 )  {alert("연락처를 입력해주세요"); $("#onePhone").focus();	return false;}
  else if($("#rd").val().length ==0 )  {alert("예약일을 선택해주세요");	return false;}

});
});


	

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	events:[
    		{
    			title:'${OneR.oneday_title}',
    			start:'${OneR.oneday_start}' ,
    			end: '${OneR.oneday_end}'
    			
    		}
    	] ,
    	 disableDragging : false ,
    	selectable: true ,
    	selectMirror: false,
    	  contentHeight: 575 ,
        initialView: 'dayGridMonth',
        dateClick: function(info) {
           var rd =  document.getElementById('rd');
           rd.value= info.dateStr; 
         }
      });
    
      calendar.render();
      
      
    });







</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>