<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${path}/resources/css/header.css" rel="stylesheet"/>
	<link href="${path}/resources/css/MainStyle.css" rel="stylesheet"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/rainyday.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content" class="contents">
		<section id="main_section">
			<div class="rain front-row"></div>
	      		<img src="${path}/resources/img/mainImg.png" id="mainImg">
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

</html>