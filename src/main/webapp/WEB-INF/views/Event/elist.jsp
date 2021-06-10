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
</head>




<style>
.event{
border : 1px solid #E0DEC3;
margin-left: auto;
margin-right: auto;
}
.eventimg{
height : 160px;
width : 750px;
}
#ing{
width : 30px;
}
#eventsub{
width : 500px;
}
#period{
width : 200px;
}
#viewimg{
width : 5px;
}
#view{
width :15px;
}
</style>
</head>
<body>
<h2 align="center">event</h2>
 	<input type="button" value="등록하기" onclick="window.location='eventWrite.do'">
	<table class="event">
        
        <tr class="eventimg">
           	<td> ${event_tb.img}</td>
  		</tr>
  		
        <td>
            <tr id="ing">진행여부</tr>
           	<tr id="eventsub">이벤트제목</tr>
            <tr id="period"> 진행기간</tr>
		    <tr id="viewimg"><img src="" alt="이미지"></tr>
		    <tr id="view">조회수</tr>
        </td>
        
	</table>
</body>
</html>