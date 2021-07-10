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
      *{
   	font-family: 'Jeju Myeongjo';
   	color : #1e1e1e;
   }

  .eReDiv{
  	clear: both;
	width: 1250px;
	margin: auto;
  }
  
  #erebtn{
   width: 70%;
    height: 85px;
    border: 1px solid #ccc;
    color: black;
    background-color: #ccc;
    font-size: 20px;
    font-weight: bold;
}
#erebtn:hover{
    cursor: pointer;
    background-color: #D5D9BA;
}

#eretb{
   width: 70%;
    height: 100px;
    margin: auto;
    border-left: none;
    border-right: none;
    border-top: none;
    border-bottom: none;
    border-collapse: collapse;
    border-color: #ccc;
    padding: 10px;
}
#eretb td:nth-child(1) span{
    margin-left: 30px;
}
#eretb td:nth-child(1){
    background-color: #F3EFEC;
    width: 200px;
}

#eretb td:nth-child(2){
  	padding-left : 10px;
  	height : 45px;
}
#eretb tr{
border-left : none;
border-right : none;
}
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="eReDiv">
	<h3 align="center">이벤트 수정하기</h3>
	
	<form action="eUpdate" method="post" enctype="multipart/form-data">

	<input type="hidden" name="event_no" value="${event_tb.event_no}">
		<table id="eretb" border="1">
			<tr>
				<td><span>이벤트 제목</span></td>
				<td><input type="text" name="event_title" value="${event_tb.event_title}"></td>
			</tr>
			<tr>
				<td ><span>배너 이미지</span></td>
				<td><input type="file" name="upfile1" value="${event_tb.banner}"></td>
			</tr>
			<tr>
				<td><span>이벤트 내용</span></td>
				<td><input type="file" name="upfile2"  value="${event_tb.event_content}"></td>
			</tr>
			<tr>
				<td><span>이벤트 시작일</span></td>
				<td><input type="text"name="start_date" value="${event_tb.start_date}"></td>
			</tr>
			<tr>
				<td><span>이벤트 종료일</span></td>
				<td><input type="text"   name="end_date" value="${event_tb.end_date}"></td>
				</tr>
			<tr>
		</table>
			<br>	
				<div align="center">
					<button type="submit" id="erebtn">수정완료</button>
				</div>	
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