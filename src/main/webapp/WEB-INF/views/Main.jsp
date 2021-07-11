<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
	<link href="${path}/resources/css/header.css" rel="stylesheet"/>
	<link href="${path}/resources/css/footer.css" rel="stylesheet"/>
	<link href="${path}/resources/css/MainStyle.css" rel="stylesheet"/>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/rainyday.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="content" class="contents">
		<section id="main_section">
			<div class="main_header">
		    </div>
			<div class="rain front-row"></div>
	      		<img src="${path}/resources/img/plantLab_Main.gif" id="mainImg">
	    	<div class="rain back-row"></div>
		</section>		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	$(function(){
		var city = "Seoul";
		var api = "https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=6eeeca0f172d44be534f5fbeb8d3d809";

		
		$.ajax({
		    url: api,
		    dataType: "json",
		    type: "GET",
		    async: "false",
		    success: function(resp) {
		        console.log(resp);
		        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
		        console.log("현재습도 : "+ resp.main.humidity);
		        console.log("날씨 : "+ resp.weather[0].main );
		        console.log("상세날씨설명 : "+ resp.weather[0].description );
		        console.log("날씨 이미지 : "+ resp.weather[0].icon );
		        console.log("바람   : "+ resp.wind.speed );
		        console.log("나라   : "+ resp.sys.country );
		        console.log("도시이름  : "+ resp.name );
		        console.log("구름  : "+ (resp.clouds.all) +"%" );      
		        
		        if(resp.weather[0].main == 'Rain'){
		        	makeItRain();
		        }else{
		        }
		    }
		});
		
		
	});
</script>
<script>
var makeItRain = function() {
	  //clear out everything
	  $('.rain').empty();

	  var increment = 0;
	  var drops = "";
	  var backDrops = "";

	  while (increment < 100) {
	    //couple random numbers to use for various randomizations
	    //random number between 98 and 1
	    var randoHundo = (Math.floor(Math.random() * (98 - 1 + 1) + 1));
	    //random number between 5 and 2
	    var randoFiver = (Math.floor(Math.random() * (5 - 2 + 1) + 2));
	    //increment
	    increment += randoFiver;
	    //add in a new raindrop with various randomizations to certain CSS properties
	    drops += '<div class="drop" style="left: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
	    backDrops += '<div class="drop" style="right: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
	  }

	  $('.rain.front-row').append(drops);
	  $('.rain.back-row').append(backDrops);
	}

	$('.splat-toggle.toggle').on('click', function() {
	  $('body').toggleClass('splat-toggle');
	  $('.splat-toggle.toggle').toggleClass('active');
	  makeItRain();
	});

	$('.back-row-toggle.toggle').on('click', function() {
	  $('body').toggleClass('back-row-toggle');
	  $('.back-row-toggle.toggle').toggleClass('active');
	  makeItRain();
	});

	$('.single-toggle.toggle').on('click', function() {
	  $('body').toggleClass('single-toggle');
	  $('.single-toggle.toggle').toggleClass('active');
	  makeItRain();
	});
</script>
</html>