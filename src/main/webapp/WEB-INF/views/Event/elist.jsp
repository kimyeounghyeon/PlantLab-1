<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 event</title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
.event{
margin-left: auto;
margin-right: auto;
}
#eventimg{
height : 160px;
width : 750px;
}

#eventsub{
width : 430px;
}
#period{
width : 220px;
}
#viewimg{
width : 30px;
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
margin-left : 1140px;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="elistdiv">
	<h2 align="center">event</h2>
	<div>
 	<button type="button" id="ebtn" onclick="window.location='eventWrite.do'">등록하기</button>
 	</div>
	<table class="event">
        
        <tr id="eventimg">
           	<td colspan="4">배너사진</td>
  		</tr>
  		
        <tr>

           	<td id="eventsub">이벤트제목</td>
            <td id="period"> 진행기간</td>
		    <td id="viewimg"><img src=""></td>
		    <td id="view">조회수</td>
        </tr>
        
	</table>
	</div>
</body>
</html>