<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event renew</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    .eReDiv{
    clear : both;
    }
    .eretb{
    margin-left : auto;
    margin-right : auto;
    }
    #erebtn{
   	background: #625b54;
  	color : white;
 	border : none;
    }
   .mwn{
	width : 400px;
	border : 1px solid #625b54;
	}
	
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="eReDiv">
	
<form action="eUpdate" method="post" enctype="multipart/form-data">

	<input type="hidden" name="event_no" value="${event_tb.event_no}">
		<table class="eretb">
			<tr>
				<td>이벤트 제목</td>
			</tr>
			<tr>
				<td><input type="text" class="mwn" name="event_title" value="${event_tb.event_title}"></td>
			</tr>
			<tr>
				<td>배너 이미지</td>
			</tr>
			<tr>
				<td class="mwn"><input type="file" name="upfile1" value="${event_tb.banner}"></td>
			</tr>
			<tr>
				<td>이벤트 내용</td>
			</tr>
			<tr>
				<td class="mwn"><input type="file" name="upfile2" value="${event_tb.event_content}"></td>
			</tr>
			<tr>
				<td>이벤트 시작일</td>
			</tr>
			<tr>
				<td><input type="text" class="mwn"name="start_date" value="${event_tb.start_date}"></td>
			</tr>
			<tr>
				<td>이벤트 종료일</td>
			</tr>
			<tr>
				<td><input type="text"  class="mwn" name="end_date" value="${event_tb.end_date}"></td>
				</tr>
			<tr>
			<br>	
			<td colspan = "2" align = "center"><button type="submit" id="erebtn">수정완료</button></td>
			</tr>	
		</table>
	</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">


	$("#erebtn").click(function(){
		swal("수정이 완료되었습니다.","", "info");
	}

</script>

</script>
</html>