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
<link href="https://fonts.googleapis.com/css2?family=Unna:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="bgdiv">
		<h3 class="subtitle">oneday class</h3>
		<p id="p">
			과도한 스트레스에 지친 현대인들이 자연을 알아가는 시간 <br> 원예 활동을 통해 일상에 꽃을 피워보세요
		</p>
		<div class="dback">
			<hr>
			<br> <br>
			<c:forEach var="o" items="${one}" varStatus="status">
				<div id="onediv" class="onediv">
					<a href="${path}/onedayDetail?oneday_no=${o.oneday_no}">
						<div class="oneimg" id=${status.index }>
							<img src="${o.oneday_img }" class="oneimg">
						</div>
					</a>
					<p class="ocontext">${o.oneday_title }</p>

					<input type="hidden" name="oneday_no" value="${o.oneday_no}">
					<a  id="omb" href="${path}/onedayDetail?oneday_no=${o.oneday_no}" >
						<div style="border: 1px solid black; text-align: center;" >예약하기</div>
					</a>
				</div>



			</c:forEach>

		</div>
	</div>
	<script type="text/javascript">
		/*  		$(function() {
		 $.ajax({
		 url : "onedayDetail",
		 type : "GET",
		 data : {oneday_no : '${one}.oneday_no' },
		 dataType : "json",
		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		 success : function(data){
		 console.log("원데이 main 성공했어용~");
		 var one = data.one;
		 console.log(one);
		 }
		 error : function(data) {
		 console.log("원데이 main 실패~");
		 }
		
		 
		 
		
		 }); */
		//}
		/* 			var onediv = $(".onediv");
		 var onefrm = $(".onefrm"); 
		 for (var i = 0; i < onediv.length; i++) {
		 $(onediv[i]).click(function() {
		 $(onefrm[i]).submit();	

		 })
		 } */

		/* 	 $(function(){
		 $("#onediv").click(function(){
		 $("form").submit();

		 })
		 }); 
		 }); 
		
		 */
	</script>



	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>