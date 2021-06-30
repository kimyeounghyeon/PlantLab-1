<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayDetail.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 classDtail</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="fullmain">
<div id="main">





<h3 class="subtitle">class</h3>
	

<div id="classImg"> 
<img src= "${pageContext.request.contextPath}/resources/img/${oneVo.oneday_img }" alt="img" id="oneimg">
</div>
<form action="onedayReserve" method="post">   

<div id="null" ></div>  <!--classImg 와 classContent 사이를 띄어놓는 div-->
<div id="classContent">

<p class="classText" id="detailTitle">${oneVo.oneday_title} </p>
<p class="classText" > 가격: &ensp; ${oneVo.oneday_price}원</p>
<p class="classText">신청 인원: &ensp; ${oneVo.oneday_maxPerson} </p>
<p id="onePl" >장소 : &ensp; ${oneVo.oneday_place} &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;${oneVo.oneday_dtailPlace} </p>
<p  id="oneDate">신청기간: &ensp; ${oneVo.oneday_start } ~ ${oneVo.oneday_end }</p>
<button id="classBtn" type="submit" >신청</button>
<input type="hidden" name="onedayNo" value="${ oneVo.oneday_no}">
</form>
</div>
<br>
<br>
<br>
<br>
<strong><em class="infodetail">과정 소개</em></strong>
<hr>
<br>
${fn:replace(oneVo.oneday_content,replaceChar , "<br/>")}
<br>
<br>
<br>
<strong><em class="infodetail">수업 장소</em></strong>
<hr>
<br>
<div id="map" ></div>

</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf32a1f590525c78d662c84a7e2fd217&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
 $(function(){
	$("#classBtn").click(function(){
		location.href ="${path}/onedayReserve?onedayNo=${oneVo.oneday_no}";
	})
})  
//
var inputData = ['${oneVo.oneday_place}']
var mapContainer = document.getElementById('map'),
mapOption = {
center: new kakao.maps.LatLng(37.54699, 127.09598),
level: 3
};
var map = new kakao.maps.Map(mapContainer, mapOption);
var count = 0;
var ps = new kakao.maps.services.Places();
var bounds = new kakao.maps.LatLngBounds();
if (inputData != null) {
kewwordSearch(inputData[count]);
}
function kewwordSearch(keword) {
ps.keywordSearch(keword, placesSearchCB);
count = count + 1;
}
function placesSearchCB(data, status, pagination) {
if (status === kakao.maps.services.Status.OK) {
displayMarker(data[0]);
bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
if (count < inputData.length) {
kewwordSearch(inputData[count]);
} else if (count == inputData.length) {
setBounds();
}
}
}
function displayMarker(place) {
var marker = new kakao.maps.Marker({
map: map,
position: new kakao.maps.LatLng(place.y, place.x),
});
kakao.maps.event.addListener(marker, 'click', function () {
var position = this.getPosition();
var url = 'https://map.kakao.com/link/map/' + place.id;
window.open(url, '_blank');
});
}
function setBounds() {
map.setBounds(bounds, 90, 30, 10, 30);
}










//

/* 		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options); */
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>