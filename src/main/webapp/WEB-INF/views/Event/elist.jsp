<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 event</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
 *{
font-family: 'Jeju Myeongjo';
color : #1e1e1e;
}
.ref :visited {
text-decoration : none;
color : gray;
}
.event{
margin-left: auto;
margin-right: auto;
}
.eventbanner{
height : 280px;
width :950px;
margin : 1.5px;
border-radius : 30px;
}

#eventsub{
width : 720px;
font-size : 20px;
font-weight : bold;
}

#period{
width : 170px;
}
#viewimg{
width : 20px;
line-height : 100%;
}
#eimg{
height : 20px;
margin : 2px;
width : 20px;
}
#view{
width :50px;
}
.elistdiv{
	clear: both;
	width: 1250px;
	margin: auto;
	
}

#ebtn{
	border: 1px solid black;
	padding: 3px;
	width: 100px;
	cursor: pointer;
	height: 50px;
	background-color: EAEBE7;
	background : white;
	margin-right :30px;
}


#ebtn:hover {
	background-color: #625b54;
	color: white;
	border: 1px solid #625b54;
}
#etd{
text-align : right;
width : 700px;

}
</style>
</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="elistdiv">
	<h2 align="center">event</h2>
	<div>
 	</div>
	<table class="event">
  		<tr>
  			<c:if test="${loginMember.grade==1}">
  			<td id="etd"  colspan="4">
 				<button type="button" id="ebtn" onclick="window.location='eWrite'">등록하기</button>
       		</td>
       		</c:if>
       	</tr>
         
        <c:forEach var="vo" items="${list}">
        <tr>
           	<td colspan="4">
	           	<a class="ref" href="eDetail?event_no=${vo.event_no}">
	           		<img class="eventbanner" src="<%=request.getContextPath() %>/resources/img/${vo.banner}">
	           	</a>
           	</td>
  		</tr>
		<tr>
           	<td id="eventsub"><a class="ref" href="eDetail?event_no=${vo.event_no}">&nbsp;&nbsp;${vo.event_title}</a></td>
            <td id="period">${vo.start_date}~${vo.end_date}</td>
		    <td id="viewimg"><img id="eimg" src="${path}/resources/img/eye.png"></td>
		    <td id="view">${vo.event_views}</td>
        </tr>
        </c:forEach>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>


