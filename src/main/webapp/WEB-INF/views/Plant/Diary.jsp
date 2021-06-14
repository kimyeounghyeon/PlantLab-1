<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 Diary</title>
<link href="${path}/resources/css/DiaryStyle.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="bgdiv">
		<h3 class="subtitle">diary</h3>
		<br>
		<button type="button" class="dwirte">일기 쓰기</button>
		<br>
		<br>
		<div class="dback">
			<c:forEach var="l" items="${list}" varStatus="status">
					
					<div class="ddiary" >
						<table class="tdiary">
							<tr class="ttr idtr">
								<td class="writeid idtd" colspan="2">${l.user_id }</td>
							</tr>
							<tr class="ttr imgtr">
								<td class="diaryimg" colspan="2"><img src="${l.diary_img_src }" class="diaryimg"></td>
								
							</tr>
							<tr class="ttr liketr">
								<td class="liketd" id=${status.index } ><img src="${path }/resources/img/좋아요누르기전그레이.png" class="like">
								<img src="${path }/resources/img/색변경좋아요.png" class="like2"></td>
								<td class="liketdcnt">좋아요 개</td>
								
							</tr>
							<tr class="ttr contexttd">
								<td class="dcontext" colspan="2">${l.diary_content }</td>
								
							</tr>
							<tr>
								<td><input type="hidden" id="diary_no" value=${l.diary_no }>
									<input type="hidden" id="user_no" value=${l.user_no }></td>
							</tr>
						</table>
					</div>
				</c:forEach>
		</div>
	</div>




	<script>
		$(function() {
			$(".like2").css("display", "none");
			$(".liketd").addClass("show");
			var like = $(".liketd");
			var index;
			
			like.click(function () {
				index = $(this).attr("id");
				console.log(index);
				
				var debug_01 = $(this).hasClass("show");
				var $thisElement  =$(this);
				
				if ($thisElement.hasClass("show")) {
					$.ajax({
						url : "like.do",
						type : "post",
						data : {
							user_no : $("#user_no").val(),
							diary_no : $("#diary_no").val()
						},
						success : function() {
							$("#"+index+" .like2").css("display", "block");
							$("#"+index+" .like").css("display", "none");
							$thisElement.removeClass("show");
							console.log("show 클래스 있다");
						},
						error : function() {
							alert("잘못 된 접근입니다.");
						}

					});
				} else if (!$thisElement.hasClass("show")) {
					console.log($(".liketd").className);
					console.log("딜리트 시작");
					$.ajax({
						url : "deletelike.do",
						type : "post",
						data : {
							user_no : $("#user_no").val(),
							diary_no : $("#diary_no").val()
						},
						success : function() {
							console.log("show 클래스 없다");
							$("#"+index+" .like2").css("display", "none");
							$("#"+index+" .like").css("display", "block");
							$("#"+index).addClass("show");
						},
						error : function() {
							alert("잘못 된 접근입니다.");
						}
					});
				}
			})
			
			$(document).on('click', '.liketd', function(){
				
			});
 
			$(".dwirte").click(function() {
				location.href = "writediary";
			});

		});
	</script>
</body>
</html>