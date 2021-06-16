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
<style>
/*   .like_icon {
      background-image: url('${pageContext.request.contextPath}/resources/img/색변경좋아요.png');
  }
  .like_icon:hover {
      background-image: url('${pageContext.request.contextPath}/resources/img/색변경좋아요.png');
  }
  .unlike_icon {
      background-image: url('${pageContext.request.contextPath}/resources/img/좋아요누르기전그레이.png');
      display: none;
  } */
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<%-- 	임시테스트
	${listDiary[0].diary_no }
	${likeList} --%>
	<div class="bgdiv">
		<h3 class="subtitle">diary</h3>
		<br>
		<button type="button" class="dwirte">일기 쓰기</button>
		<br>
		<br>
		<div class="dback">
			<c:forEach var="l" items="${listDiary}" varStatus="status">
					<div class="ddiary dno_${l.diary_no }" >
						<table class="tdiary">
							<tr class="ttr idtr">
								<td class="writeid idtd" colspan="2">${l.user_id } 임시테스트bno:${l.diary_no }</td>
							</tr>
							<tr class="ttr imgtr">
								<td class="diaryimg" colspan="2"><img src="${l.diary_img_src }" class="diaryimg"></td>
							</tr>
							<tr class="ttr liketr">
								<c:set var="loop_flag" value="false" />
								<c:forEach var="item" items="${likeList}" varStatus="status">
								    <c:if test="${not loop_flag }">
								        <c:if test="${l.diary_no eq item }">
								            <c:set var="loop_flag" value="true" />
								        </c:if>
								    </c:if>
								</c:forEach>
								<c:if test="${!loop_flag}">
									<td class="liketd unlike dno_${l.diary_no }" >
										<img src="${path }/resources/img/좋아요누르기전그레이.png" class="like">
									</td>
								</c:if>
								<c:if test="${loop_flag}">
									<td class="liketd liked dno_${l.diary_no }" >
										<img src="${path }/resources/img/색변경좋아요.png" class="like">
									</td>
								</c:if>									
								<td class="liketdcnt">좋아요 ${l.like_cnt }개</td>
							</tr>
							<tr class="ttr contexttd">
								<td class="dcontext" colspan="2">${l.diary_content }</td>
							</tr>

						</table>
					</div>
				</c:forEach>
		</div>
	</div>
<!-- 	<jsp:include page="../footer.jsp"></jsp:include> -->

	<script>
		$(function() {
			//$(".liketd").addClass("show");
			//$(".like2").css("display", "none");
			var likeElementJQ = $(".liketd");
			
			likeElementJQ.click(function () {
				let thisElementJQ = $(this);
				var classValue = thisElementJQ.attr("class");
				console.log(classValue);
				let index = classValue.substring(classValue.lastIndexOf('_') + 1);
				console.log(index);
			/*
				if (thisElementJQ.hasClass("unlike")) {
					console.log("시작이야 라이크");
					$.ajax({
						url : "like.do",
						type : "post",
						data : {
							diary_no : index
						},
						success : function(data) {
							console.log("like 눌렀음");
							$("#"+index+" .like2").css("display", "block");
							$("#"+index+" .like").css("display", "none");
							$thisElement.removeClass("show");
							console.log("show 클래스 있다");
						},
						error : function() {
							alert("잘못 된 접근입니다.");
						}

					});
				} else if (thisElementJQ.hasClass("liked")) {
					console.log("딜리트 시작");
					$.ajax({
						url : "deletelike.do",
						type : "post",
						data : {
							diary_no : index
						},
						success : function(data) {
							console.log("show 클래스 없다");
							console.log("delete : " + $(".liketd#"+index+" .user_no").val());
							console.log("delete : " + $(".liketd#"+index+" .diary_no").val());
							$("#"+index+" .like2").css("display", "none");
							$("#"+index+" .like").css("display", "block");
							$("#"+index+" .liketd").addClass("show");
						},
						error : function() {
							alert("잘못 된 접근입니다.");
						}
					});
				} */
			});
		

			$(".dwirte").click(function() {
				location.href = "writediary";
			});

		});
	</script>
</body>
</html>