<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/rainyday.js"></script>
	<style>
		#content{
		    width: 1250px;
		    margin: auto;
		    clear: both;
		}
		
		#main_section{
			width:100%;
			margin: auto;
		}
		
		#main_section img{
			width: 100%;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content" class="contents">
		<section id="main_section">
			<img src="${path}/resources/img/mainImg.png" id="mainImg">
		</section>		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
    function rain(){
        var image = document.getElementById('mainImg');
        
        image.onload = function() {
            var rainyDay = new RainyDay({
                image: this
            })
            RainyDay.rain([
                [8,55,2]
            ],100);
        }
    }

    //rain();
</script>

</html>