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
.event{
margin-left: auto;
margin-right: auto;
}
.eventbanner{
height : 200px;
width : 750px;
margin : 1.5px;
border-radius : 30px;
}

#eventsub{
width : 470px;
}
#period{
width : 200px;
}
#viewimg{
width : 30px;
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
}
#ebtn{
border : none;
color : white;
background: #625b54;
}
#etd{
text-align : right;
width : 750px;
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
	           	<a href="eDetail?event_no=${vo.event_no}">
	           		<img class="eventbanner" src="<%=request.getContextPath() %>/resources/img/${vo.banner}">
	           	</a>
           	</td>
  		</tr>
		<tr>
           	<td id="eventsub"><a href="eDetail?event_no=${vo.event_no}">&nbsp;&nbsp;${vo.event_title}</a></td>
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


