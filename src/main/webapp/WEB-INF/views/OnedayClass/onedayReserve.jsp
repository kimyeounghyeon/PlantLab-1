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
<link href="${path}/resources/css/Oneday/OnedayReserve.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
	
<!-- main page css  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<meta charset="UTF-8">
<title>class reserve</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="fullmainR">
	
		<div id="mainR">

			<form action="onedayReserveRS" method="post">
				<h3 class="subtitle">class reserve</h3>

			<div id="calendar"></div>



				<!-- d -->
				<input type="hidden" name="onedayNo" value="${OneR.oneday_no}">   <!-- oneday  no -->
				<!-- insert하기 위한 oneday_no box -->
				<p class="onedayinput" id="orn">Name</p>
				<input type="text" class="onedaybox" id="oneName" name="oneName" value="${user.userName}" >
				<!-- value값 넣기 -->
				<span class="onedayinput">Phone number</span> <input type="text"
					class="onedaybox" id="onePhone" name="onePhone" value="${user.phone}" >
				<span class="onedayinput">Date</span> <input type="text"
					class="onedaybox" id="rd" name="reservDate">
					 <span class="onedayinput">Request</span>
				<textarea  id="oneRequest" name="oneRequest" style="resize: none;">
</textarea>
				<button id="onedayp" type="submit">결제하기</button>
				
			</form>
			
		
	<div class="showhide">		
			<span id="refund" onclick="openClose1();">환불 사항▲   </span>
<div id="refundT" >
<hr class="rh">
[국내 환불규정] 
<br>

&emsp; - 신청 마감 4일 이전 취소시 : 전액 환불 <br>

&emsp; - 신청 마감 3일 이전 취소시 : 결제 금액의 20% 배상 후 환불 <br>

&emsp; - 신청 마감 2일 이전 취소시 : 결제 금액의 40% 배상 후 환불 <br>

&emsp; - 신청 마감 1일 이전 취소시 : 결제 금액의 50% 배상 후 환불 <br>

&emsp; - 신청 마감 이후 취소시, 또는 당일 불참 : 환불 불가 <br> <br>


※ 신청 마감일은 무엇인가요? <br>

&emsp; 호스트님들이 장소 대관, 강습, 재료 구비 등 클래스 진행을 준비하기 위해, 클래스 참여일보다 일찍 신청을 마감합니다. <br>

&emsp; 환불은 참여일이 아닌 신청 마감일 기준으로 이루어집니다. 클래스마다 신청 마감일이 다르니, 꼭 날짜와 시간을 확인 후 결제해주세요! : ) <br> <br>

[환불 방법] <br>
&emsp; -1:1 고객 센터를 이용해주세요 <br>

</div>
</div>

<br>
<br>
<br>

<div class="showhide">
<span id="cancel" onclick="openClose2();">취소 사항▼     </span>


<div id="cancelT" >
<hr class="rh">
[취소 방법] <br>
&emsp; 1. 해당 클래스를 결제한 계정으로 로그인 <br>

&emsp; 2. 마이 - 클래스 신청내역 <br>

&emsp; 3. 취소를 원하는 클래스 상단 체크박스 선택 - 취소 <br>
</div>
</div>			
		</div>
	</div>




<script type="text/javascript">
console.log("${OneR.oneday_start}");
console.log("${user.userName}");
console.log("${user.phone}");
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
    	  contentHeight: 615 ,
        initialView: 'dayGridMonth',
        dateClick: function(info) {
           var rd =  document.getElementById('rd');
           rd.value= info.dateStr; 
         }
      });
    
      calendar.render();
      
      
    });

function openClose1() {
    if(document.getElementById('refundT').style.display === 'block') {
      document.getElementById('refundT').style.display = 'none';
      document.getElementById('refund').innerText= '환불 사항▼ ';
    } else {
      document.getElementById('refundT').style.display = 'block';
      document.getElementById('refund').innerText= '환불 사항▲ ';
    }
  }
function openClose2() {
    if(document.getElementById('cancelT').style.display === 'block') {
      document.getElementById('cancelT').style.display = 'none';
      document.getElementById('cancel').innerText= '취소 사항▼ ';
    } else {
      document.getElementById('cancelT').style.display = 'block';
      document.getElementById('cancel').innerText= '취소 사항▲ ';
    }
  }





</script>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>