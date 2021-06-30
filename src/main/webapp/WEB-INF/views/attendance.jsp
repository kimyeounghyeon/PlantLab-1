<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 출석 이벤트 </title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
.adiv{
clear : both;
}
.aimg{
margin-left : auto;
margin-right : auto;
}
.abtn{
margin-left : auto;
margin-right : auto;
border: none;
background : none;
}
</style>
</head>
<body>
<jsp:include page="./header.jsp"></jsp:include>
<div class="adiv">
<div class="aimg"></div>
<div><button type="button" class="abtn">출석 완료</button></div>
</div>
</body>
<script type="text/javascript">

		$(".abtn").click(function() {
			$.ajax({
				url : "attendance.do",
				type : "post",
				data : { user_no :  '122' },
				//dataType : "json",
				success : function(data) {
					var aa = data;
					console.log( "aa는 : " + aa);
					var attimg="";
					
					if( aa < 10) {
						attimg = "<img src='${path}/resources/img/1.jpg'>";
					}else if ( 10 <= aa <20 ){
						attimg = "<img src='${path}/resources/img/2.jpg'>";						
					}else if ( 20 <= aa <27){
						attimg = "<img src='${path}/resources/img/3.jpg'>";
					}else if ( aa=  28){
						attimg = "<img src='${path}/resources/img/4.jpg'>";
					}
					  $(".aimg").html(attimg);
					},
				error : function() {
					alert("잘못 된 접근입니다.");
				}
			});
			});
</script>
</html>