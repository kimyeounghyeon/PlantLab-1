<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 Diary detail</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="bgdiv">
		<h3 class="subtitle">detail diary</h3>
		<br>
		<button type="button" class="dmodify">수정</button>
		<button type="button" class="ddelete">삭제</button>
		<br>
		<br>
		<div class="dback">
					<div class="ddetail" >
						<table class="ddiary">
							<tr class="dtr idtr">
								<td class="dtwrite idtd" colspan="2">${l.user_id }</td>
							</tr>
							<tr class="dtr imgtr">
								<td class="diaryimg" colspan="2"><img src="${l.diary_img_src }" class="diaryimg"></td>
								
							</tr>
							<tr class="dtr liketr">
								<td class="liketd" id="${status.index }" ><input type="hidden" class="diary_no" value=${l.diary_no }>
									<input type="hidden" class="user_no" value="${l.user_no }"><img src="${path }/resources/img/좋아요누르기전그레이.png" class="like">
								<img src="${path }/resources/img/색변경좋아요.png" class="like2"></td>
								<td class="liketdcnt">좋아요 ${likecnt }개</td>
								
							</tr>
							<tr class="dtr contexttd">
								<td class="dcontext" colspan="2">${l.diary_content }</td>
								<button type="button" class="enter1"  id="${status.index }" >들어가기</button>
							</tr>
						</table>
					</div>
		</div>
	</div>
</body>
<script>
	$(function(){
		$.ajax({
			url : "diary.do",
			type : "post",
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				
			}
		});
	});
</script>
</html>

