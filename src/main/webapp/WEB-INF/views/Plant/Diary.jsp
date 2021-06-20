<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<br> <br>
		<div class="dback"></div>
	</div>
	<!-- 	<jsp:include page="../footer.jsp"></jsp:include> -->

	<script>
		$(function() {
			//$(".liketd").addClass("show");
			//$(".like2").css("display", "none");
			$.ajax({
				url : "diary.do",
				type : "post",
				dataType : "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					var listDiary = data.listDiary;
					console.log("diary data 읽어나옴");
					console.log(data);
					console.log("listDiary는 " + listDiary);
					var dnotice = "";
			         if(listDiary == null || data.cnt == 0){
			        	 dnotice = "<p>게시글이 없습니다. <br> 첫 일기의 주인공이 되어주세요! </p>";
			             $(".dback").append(dnotice);
			          } else {
			                  $.each(listDiary, function(i, item){
			                	  var loop_flag = false;
			                	  dnotice += "<div class = 'ddiary dno_"+item.diary_no+"'>";
			                	  console.log("뭘까" + item.diary_no);
			                	  dnotice += "<table class='tdiary'><tr class='ttr idtr'>";
			                	  dnotice += "<td class='writeid idtd' colspan='2'>"+item.user_id+"</td></tr>";
			                	  console.log("뭘까 id" + item.user_id);
			                	  dnotice += "<tr class='ttr imgtr'><td class='diaryimg' colspan='2'><img src='"+item.diary_img_src+"' class='diaryimg'></td></tr>";
			                	  console.log("뭘까 이미지" + item.diary_img_src);
			                	  dnotice += "<tr class='ttr liketr'>"
			                	  console.log("뭘까 글번호" + item.diary_no);
			                	  dnotice += "<c:set var='loop_flag' value='true' />";
			                	  dnotice += "<c:if test='${!loop_flag}'><td class='liketd unlike' ><img src='${path }/resources/img/좋아요누르기전그레이.png' class='like'></td></c:if>";
			                	  dnotice += "<c:if test='${loop_flag}'><td class='liketd liked'><img src='${path }/resources/img/색변경좋아요.png' class='like'></td></c:if>";
			                	  dnotice += "<td class='liketdcnt'>좋아요"+item.like_cnt+" 개</td></tr>";
			                	  console.log("뭘까 좋아요" + item.like_cnt);
			                	  dnotice += "<tr class='ttr contenttd'><td class='dcontent' colspan='2'>"+item.diary_content+"</td></tr></table></div>";
			                	  console.log("뭘까 내용" + item.diary_content); 
			                  });
			              }
			                     $(".dback").append(dnotice);
			                     
			          
				},
				error : function(data) {
					console.log("에러일 때 데이터" + data);
					alert("잘못 된 접근입니다.");
				}
			});
			
			
			
			
			var likeElementJQ = $(".liketd");
			
			likeElementJQ.click(function () {
				let thisElementJQ = $(this);
				var classValue = thisElementJQ.attr("class");
				console.log(classValue);
				let index = classValue.substring(classValue.lastIndexOf('_') + 1);
				console.log(index);
		
				if (thisElementJQ.hasClass("unlike")) {
					console.log("시작이야 라이크");
					$.ajax({
						url : "insertlike.do",
						type : "post",
						data : {
							diary_no : index
						},
						success : function(data) {
							console.log("like 눌렀음");
							console.log(data + "개");
							$(".liketd.dno_"+index).removeClass("unlike");
							$(".liketd.dno_"+index).addClass("liked");
							thisElementJQ.children('.like').css("src", "${path }/resources/img/색변경좋아요.png");
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
							console.log("unlike 눌렀음");
							console.log(data + "개");
							$(".liketd.dno_"+index).removeClass("liked");
							$(".liketd.dno_"+index).addClass("unlike");
							thisElementJQ.children('.like').css("src", "${path }/resources/img/좋아요누르기전그레이.png");
							console.log("show 클래스 있다");
						},
						error : function() {
							alert("잘못 된 접근입니다.");
						}
					});
				} 
			});
		

			$(".dwirte").click(function() {
				location.href = "writediary";
			});

		});
	</script>
</body>
</html>