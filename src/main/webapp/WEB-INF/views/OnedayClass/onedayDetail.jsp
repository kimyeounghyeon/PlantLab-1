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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayDetail.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>無以林 classDtail</title>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="fullmain">
		<div id="main">





			<h3 class="subtitle">Class Info</h3>


			<div id="classImg">
				<img src="${oneVo.oneday_img }" alt="img" id="oneimg">
			</div>
			<form action="onedayReserve" method="post">

				<div id="null"></div>
				<!--classImg 와 classContent 사이를 띄어놓는 div-->
				<div id="classContent">

					<p class="classText" id="detailTitle">${oneVo.oneday_title}</p>
					<p class="classText" id="detailPrice">가격: &ensp; ${oneVo.oneday_price}원</p>
					<p class="classText">신청 인원: &ensp; ${oneVo.oneday_maxPerson}</p>
					<p class="classText">수업 시간: &ensp; ${oneVo.oneday_Stime} ~ ${oneVo.oneday_Etime}</p>
					<p id="oneDate">신청기간: &ensp; ${oneVo.oneday_start } ~
						${oneVo.oneday_end }</p>
					<button id="classBtn" type="submit">예약</button>
					<input type="hidden" name="onedayNo" value="${ oneVo.oneday_no}">
			</form>
		</div>
		<br> <br> <br> <br> <strong><em
			class="infodetail">과정 소개</em></strong>
		<hr>
		<br> ${fn:replace(oneVo.oneday_content,replaceChar , "<br/>")} <br>
		<br> <br> <strong><em class="infodetail">수업 장소</em></strong>
		<hr>
		<br>
		<div id="map"></div>
		<p id="onePl">${oneVo.oneday_place} ${oneVo.oneday_dtailPlace}</p>

	</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf32a1f590525c78d662c84a7e2fd217&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
		$(function() {
			$("#classBtn")
					.click(
							function() {
								location.href = "${path}/onedayReserve?onedayNo=${oneVo.oneday_no}";
							})
		})
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${oneVo.oneday_place}',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0; border-radius: 3px;">${oneVo.oneday_dtailPlace}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>