<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
#fullmain {
	width: 1280px;
	margin: 0 auto;
	padding: 0;
}

#main {
	width: 1250px;
	margin: 0 auto;
	padding: 0;
}

#mainTop {
	margin-top: 30px;
	padding: 0;
	margin-left: 40px;
	margin-right: 0;
	float: right;
}

#logo {
	clear: both;
	float: left;
}

#mainTab {
	float: right;
	margin-right: 0;
	padding: 0;
	font-size: 20px;
}

a {
	text-decoration: none;
	

}

.top{
margin-right: 0;
margin-left: 30px;

}
#logo{
margin-top:10px;
float: left;
display: inline;
}

#tab {

	height: 100px;
	margin-top:30px;
	float:right;
	display: inline;
}

.null{
margin: 0;
width:60px;
display: inline-block;
clear: both;

}
.tablinks{
   float:left;
	list-style: none;
	display: inline-block;
	margin-left: 80px;
	font-size: 25px;
	position: relative;
	


}

#subtab{
    margin:0;
    padding-top:10px;
    padding-bottom:10px;
 	text-align: -webkit-match-parent;
	list-style: none; 
	position: relative;
	font-size: 25px;
	 display: none; 
	 z-index: 1;
}


#subtab a{
     padding-top:10px;
    padding-bottom:10px;
   text-align: center;
	list-style: none; 
	font-size: 25px;
	position: relative;
	margin:0;
	z-index: 1;
	display: block;
 }



#plant:hover #subtab{
display: block;
}  



</style>


</head>
<body>
	<div id="fullmain">
		<div id="main">
			<!-- header top -->
			<div id="mainTop">
				<a href="#" class="top">cart</a>
				<a href="#" class="top">my</a>
				<a href="#" class="top">login</a>
				<a href="#" class="top">join</a>
			</div>



			<!--  logo -->
			<!--  logo 이미지 넣기 -->
			
			<div id="logo">
			<img alt="logo" src="resources/img/924de6d81ff1f97a.png"/>
			</div>


			<!-- header의 tab 버튼 -->
			<div id="tab">
				<div class="tablinks"  id="plant" style="width: 90px; text-align: center;"><a href="#">Plant</a>
					<div id="subtab">
				     <a href="#" id="subtabM" class="sub">Mission</a> 
					 <a href="#" class="sub">Diary</a>
				    </div>
				</div>
				<div class="tablinks"><a href="#">Class</a></div>
				<div class="tablinks"><a href="#">Event</a></div>
				<div class="tablinks"><a href="#">Store</a></div>
				</div>	
			</div>
			
	
			</div>
			
			

		</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>