<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event detail</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
   *{
   	font-family: 'Jeju Myeongjo';
   	color : #1e1e1e;
   }
   .ref  :visited {
   text-decoration : none;
   color : gray;
   }
    .edetaildiv{
   	clear: both;
	width: 1250px;
	margin: auto;
	
    }
    .edetailtb{
    margin-left : auto;
    margin-right : auto;
    border-collapse: collapse;
    }
    .eupde{
    text-align : center;
    }
    #e_title{
    color: #1E262C;
    margin-bottom: 5px;
    font-weight : bold;
    font-size: 25px;
    }
    
    #cimg{
    width : 15px;
    height :  15px;
    }
    .ctd{
    padding-top : 10px;
    padding-bottom : 10px;
    line-height : 100%;
    }
    #trbottom{
    height : 25px;
    border-bottom : .5px solid #efefef;
    }
    #eimg{
    width : 15px;
    height: 15px;
    }
    #lm{
    float: right;
    width : 50px;
    }
    #mtop{
    padding-top : 10px;
    }
   
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="edetaildiv">
	<table class="edetailtb">
	<input type="hidden" name="event_views" value="${event_views}">
		<tr>
			<td colspan="2" id="e_title">${event_tb.event_title}</td>
		</tr>
		<tr id="trbottom">
			<td class="ctd" ><img id="cimg" src="${path}/resources/img/calendar.png"> ${event_tb.start_date}~${event_tb.end_date}
			<td class="ctd" id="lm"><img id="eimg" src="${path}/resources/img/eye.png">&nbsp;${event_tb.event_views}</td>
		</tr>
		<tr id="imgtr">
			<td id ="mtop" colspan="2"><img class="mimg" src="<%=request.getContextPath() %>/resources/img/${event_tb.event_content}"></td>
		</tr>
		<tr>
			<td colspan="2"class='eupde'>
				<c:url var="eupview" value="eRenew">
					<c:param name="event_no" value="${event_tb.event_no}" />
					<c:param name="event_title" value="${event_tb.event_title}" />
					<c:param name="start_date" value="${event_tb.start_date}" />
					<c:param name="end_date" value="${event_tb.end_date}" />
					<c:param name="event_views" value="${event_tb.event_views}" />
					<c:param name="event_content" value="${path}/resources/img/${event_tb.event_content}" />
					<c:param name="banner" value="${path}/resources/img/${event_tb.banner}" />
				</c:url> 
				<c:url var="edelete" value="eDelete">
					<c:param name="event_no" value="${event_tb.event_no}" />
				</c:url> 
				<c:if test="${loginMember.grade==1}">
					<a class="ref" href="${eupview}"> 수정 </a> &nbsp;&nbsp; 
					<a class="ref" href="${edelete}"> 삭제 </a> &nbsp;&nbsp; 
				</c:if>
			</td>
		</tr>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>