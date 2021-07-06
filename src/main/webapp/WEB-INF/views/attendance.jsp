<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 출석 이벤트 </title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
.adiv{
clear : both;
}
.aimg{
margin-left : auto;
margin-right : auto;
text-align : center;
}
.abtn{
margin-left : auto;
margin-right : auto;
text-align : center;
font-size: 30px;
text-align : center;
border : none;
background-color:#D5D9BA;
width : 300px;
padding : 5px;
border-radius : 20px;
}
.img{
text-align : center;
margin-left : auto;
margin-right : auto;

}

.etb{
margin-left : auto;
margin-right : auto;
}
.btntd{
text-align : center;
}
.mention{

}
#fir{
text-align : center;
font-size: 27px;
}
.sec{
text-align : center;
font-size: 20px;
}
</style>
</head>
<body>
<jsp:include page="./header.jsp"></jsp:include>
<c:if test="${empty loginMember.userName}">
<div class="adiv">
<h2 align ="center">로그인 후 이용 바랍니다 .</h2>
</div>
</c:if>
 <c:if test="${!empty loginMember}">
<div class="adiv">
<h2 align="center">출석 이벤트</h2>
<div class="mention">
<!-- <div id="fir">꽃을 피우자!</div>
<br>-->
<div class="sec">꽃에 매일 물을 주세요~</div>
<br>
<div class="sec">30개의 물방울을 모으면 꽃이 완전히 활짝 피고, 선물을 받을 수 있어요.</div>
</div>
	<table class=etb>
		<tr>
			<td class="aimg"></td>
		</tr>
		<tr>
			<td class="btntd"><button type="button" class="abtn">물주기!</button></td>
		</tr>
	</table>
</div>
</c:if>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(".abtn").click(function() {
		$.ajax({
			url : "attendance.do",
			type : "post",
			data : { user_no :  '${user_no}' },
			//dataType : "json",
			success : function(data) {
				var aa = data;
				console.log( "aa는 : " + aa);
				var attimg="";
				$(".aimg").html("");
				if( aa < 10) {
					attimg = "<img class='img' src='${path}/resources/img/1.jpg'>";
				}else if ( 10 <= aa <20 ){
					attimg = "<img class='img' src='${path}/resources/img/2.jpg'>";						
				}else if ( 20 <= aa <27){
					attimg = "<img class='img' src='${path}/resources/img/3.jpg'>";
				}else if ( aa=  28){
					attimg = "<img class='img' src='${path}/resources/img/4.jpg'>";
				}
				$(".aimg").html(attimg);
				},
			error : function() {
				alert("잘못 된 접근입니다.");
			}
		});
	});
		//사진 보여주는 
		
			$.ajax({
				url : "attendance2",
				type : "post",
				data : { user_no :  '${user_no}' },
				//dataType : "json",
				success : function(data) {
					var aa = data;
					console.log( "aa는 : " + aa);
					var attimg="";
					
					if( aa < 10) {
						attimg = "<img class='img' src='${path}/resources/img/1.jpg'>";
					}else if ( 10 <= aa && aa <20 ){
						attimg = "<img class='img' src='${path}/resources/img/2.jpg'>";						
					}else if ( 20 <= aa && aa <27){
						attimg = "<img class='img' src='${path}/resources/img/3.jpg'>";
					}else if ( aa=  28){
						attimg = "<img class='img' src='${path}/resources/img/4.jpg'>";
					}
					  $(".aimg").html(attimg);
					},
				error : function() {
					alert("잘못 된 접근입니다.");
				}
			});
			
</script>
</html>