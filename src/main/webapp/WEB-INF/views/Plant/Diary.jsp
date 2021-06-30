<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/DiaryStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
	 	<jsp:include page="../footer.jsp"></jsp:include> 

	<script>
		$(function() {
			console.log("들어왔습니당~");
			$.ajax({
	            url : "diary.do",
	            type : "post",
	            data : {diary_no : '${diary_no}'},
	            dataType : "json",
	            success : function(data) {
	               console.log("diary data 읽어나옴");
	               console.log(data);
	               
	               var listDiary = data.listDiary;
	               var likeList = data.likeList;
	               
	               console.log("listDiary는 " + listDiary);
	               console.log("listDiary length 는 " + listDiary.length);
	               console.log("likeList는 " + likeList);
	               console.log("likeList length 는 " + likeList.length);
	               
	               var dnotice = "";
	                  if(listDiary == null || data.cnt == 0){
	                     dnotice = "<p>게시글이 없습니다. <br> 첫 일기의 주인공이 되어주세요! </p>";
	                      $(".dback").append(dnotice);
	                   } else {
	                           $.each(listDiary, function(i, item){
	                              dnotice += "<div class = 'ddiary' id='dno_"+item.diary_no+"'>";
	                              dnotice += "<table class='tdiary'><tr class='ttr idtr'>";
	                              dnotice += "<td class='writeid idtd' colspan='2'>"+item.user_id+"</td></tr>";
	                              dnotice += "<tr class='ttr imgtr'><td class='diaryimg' colspan='2'><a href='detaildiary?diary_no="+item.diary_no+"'><img src='"+item.diary_img_src+"' class='diaryimg'></a></td></tr>";
	                              dnotice += "<tr class='ttr liketr'>"
	                              var loop_flag = false;
	                              for(var j=0; j<likeList.length; j++){
	                                 if(item.diary_no == likeList[j]){
	                                    loop_flag = true;
	                                    break;
	                                 }
	                              }
	                              if(loop_flag) {
	                                 dnotice += "<td class='liketd liked dno_"+item.diary_no+"'><img src='${path }/resources/img/색변경좋아요.png' class='like'>";
	                              } else {
	                                 dnotice += "<td class='liketd unlike dno_"+item.diary_no+"'><img src='${path }/resources/img/좋아요누르기전그레이.png' class='like'>";
	                              }
	                              dnotice += "<td class='liketdcnt'>좋아요 "+item.like_cnt+"개</td></tr>";
	                              dnotice += "<tr class='ttr contenttd'><td class='dcontent' colspan='2'><a href='detaildiary?diary_no="+item.diary_no+"'>"+item.diary_content+"</td></tr></table></div>";
	                           });
	                       }
	                       $(".dback").append(dnotice);
	                   
	            },
	            error : function(data) {
	               console.log("에러일 때 데이터" + data);
	               alert("잘못 된 접근입니다.");
	            }
	         });
			
			
			
			
			$(document).on("click", ".liketd", function(){
				let thisElementJQ = $(this);
				let thisNextJQ = $(this).next();
				console.log("this는 뭐게" + thisElementJQ);
				var dnoDiv = $(this).parents(".ddiary");
				var idValue = dnoDiv.attr("id");
				console.log("아이디 밸류 " + idValue);

 				let index = idValue.substring(idValue.lastIndexOf('_') + 1);
 				console.log("인덱스 : " + index);
				
				

				
		
				if (thisElementJQ.hasClass("unlike")) {
					console.log("시작이야 라이크");
					$.ajax({
						url : "insertlike.do",
						type : "post",
 						data : {diary_no : index},
 						success : function(data) {
							console.log("like 눌렀음");
							console.log(data + "개");
						 	$(".liketd.dno_"+index).removeClass("unlike");
							$(".liketd.dno_"+index).addClass("liked");
							thisElementJQ.children('.like').attr("src", "${path }/resources/img/색변경좋아요.png");
							thisNextJQ.html("좋아요 "+data+"개");

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
						data : {diary_no : index},
						success : function(data) {
							console.log("unlike 눌렀음");
							console.log(data + "개");
						 	$(".liketd.dno_"+index).removeClass("liked");
							$(".liketd.dno_"+index).addClass("unlike");
							thisElementJQ.children('.like').attr("src", "${path }/resources/img/좋아요누르기전그레이.png");
							thisNextJQ.html("좋아요 "+data+"개");
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