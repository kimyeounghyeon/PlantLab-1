<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 Diary detail</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/DiaryStyle.css" rel="stylesheet" />
<link href="${path}/resources/css/DetailDiaryStyle.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<% String user_id = (String)session.getAttribute("userId"); %>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="bgdiv">
		<h3 class="subtitle">detail diary</h3>

		<button type="button" class="dtbtn declaration">신고하기</button>
		&nbsp;&nbsp; <br>
		<div class="dback"></div>
	</div>
	
	<div class="modal">
        <div class="modal_content">
            <form class="report">
                <input type="hidden" name="r_diary_no" value="${diary_no}">


                <h3 class="subTitle">신고사유</h3>
                <select name="report_content">
                    <option value="광고">광고 / 도배 글</option>
                    <option value="선정적">선정적 / 음란성 글</option>
                    <option value="욕설">욕설 / 인신공격</option>
                    <option value="기타">기타</option>
                </select>

                <br><br>

                <h3 class="subTitle">상세내용</h3>
                <textarea style="resize: none;" autofocus name="report_content"></textarea>
                
                <button type="button" class="rBtn" id="cancel">취소</button>
                <button type="button" class="rBtn" id="subReport">신고</button>
            </form>
        </div>
    </div>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	$(function(){
		//
		var reportM = "<c:out value="${reportM}" />";
		
		console.log("no:::"+reportM);
		if(reportM == "no"){
			 swal("이미 신고하였습니다.");
		}
		
		//신고하기 모달창
        $('.declaration').click(function(){
	    	$(".modal").fadeIn(); 
	    });
		
		$('#cancel').click(function(){
			$(".modal").fadeOut(); 
		});
		
		$('#subReport').click(function(){
			var form = $('.report');
			form.attr("method","post");
			form.attr("action","report");
			form.submit();
		});
		
		// 게시글 불러오기
		let dnoKnow = $(".knowdno").val();

		$.ajax({
			url : "detaildiary.do",
			type : "GET",
			data : {diary_no : '${diary_no}' },
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				console.log("성공했어용~");
				var detailList = data.detailList;
	            var likeList = data.likeList;
				var listComment = data.listComment;
				var user_id = data.user_id;

				var dnotice = "";
				$.each(detailList, function(i, item){
                    dnotice += "<div class = 'dtdiary' id='dno_"+item.diary_no+"'><input type='hidden' class='knowdno' value='"+item.diary_no+"'>";
                    dnotice += "<table class='dtdiarytb'><tr class='dttr dtidtr'>";
					if(user_id == item.user_id){
                    dnotice += "<td class='dtwriteid dtidtd' colspan='2'>"+item.user_id+"<button type='button' class='dtbtn ddelete'>삭제</button><button type='button' class='dtbtn dmodify'>수정</button></td></tr>";
					} else {
                    dnotice += "<td class='dtwriteid dtidtd' colspan='2'>"+item.user_id+"</td></tr>";
					}
                    dnotice += "<tr class='dttr dtimgtr'><td class='dtdiaryimgtd' colspan='2'>";
                    
					for(var k=0; k<item.diaryImgVO.length; k++) {
                    dnotice += "<img src='"+item.diaryImgVO[k].diary_img_src+"' class='dtdiaryimg mySlides'>";
					}
					
                    dnotice += "</td></tr>";
                    if(item.diaryImgVO.length>1){
                    dnotice += "<a class='w3-btn-floating' style='position:absolute; top:600px; left:550px;' onclick='plusDivs(-1)'> ❮ </a>";
                    dnotice += "<a class='w3-btn-floating' style='position:absolute; top:600px; right:550px;' onclick='plusDivs(1)'> ❯ </a>";
                    }
                    dnotice += "<tr class='dttr dtliketr'>"
                    var loop_flag = false;
                    for(var j=0; j<likeList.length; j++){
                       if(item.diary_no == likeList[j]){
                    	   console.log(likeList[j]);
                          loop_flag = true;
                          break;
                       }
                    }
                    if(loop_flag) {
                       dnotice += "<td class='liketd liked dno_"+item.diary_no+"'><img src='${path }/resources/img/색변경좋아요.png' class='like'>";
                    } else {
                       dnotice += "<td class='liketd unlike dno_"+item.diary_no+"'><img src='${path }/resources/img/좋아요누르기전그레이.png' class='like'>";
                    }
                    dnotice += "<td class='dtliketdcnt'>좋아요 "+item.like_cnt+"개</td></tr>";
                    dnotice += "<tr class='dttr dtcontenttr'><td class='dtdcontent' colspan='2'>"+item.diary_content+"</td></tr>";
                    dnotice += "<tr class='dttr dtinsertcommtr'><td class='dtinsertcommwriter'>"+user_id+"</td><td class='dtinsertcommcontent'><input type='text' class='writecomment' placeholder='댓글을 입력해주세요.'><button type='button' class='dtbtn insertcomm'>등록</button></td></tr>";
                 });
				
				if(listComment != null) {
				$.each(listComment, function(i, item){
					if(user_id == item.user_id){
                    dnotice += "<tr class='dttr dtlistcommtr'><td class='commwriter'>"+item.user_id+"</td><input type='hidden' class='comm_no' value='"+item.comm_no+"'><td class='dtlistcomm'><span class='spanComm'>"+item.comm_comment+"</span><button type='button' class='dtbtn commdelete'> &#10005 </button><button type='button' class='dtbtn commmodify'>수정</button></td></tr>";
 
					} else {
                    dnotice += "<tr class='dttr dtlistcommtr'><td class='commwriter'>"+item.user_id+"</td><input type='hidden' class='comm_no' value='"+item.comm_no+"'><td class='dtlistcomm'><span class='spanComm'>"+item.comm_comment+"</span></td></tr>";
					}
				});
				
				}
               	 dnotice += "</table></div>";
        	   	  $(".dback").append(dnotice);
	               showDivs(slideIndex);

        	   	  
			console.log("문제 없어요~");
			},

			error : function(data) {
				console.log("에러일 때 데이터" + data);
	               alert("로그인 후 이용해주세요");
	               location.href="login";
			}
		});
		
		
		// 좋아요
		$(document).on("click", ".liketd", function(){
			let thisElementJQ = $(this);
			let thisNextJQ = $(this).next();
			var dnoDiv = thisElementJQ.parents(".dtdiary");
			
			var idValue = dnoDiv.attr("id");
			
			console.log("아이디 밸류 " + idValue);
			let index = idValue.substring(idValue.lastIndexOf('_') + 1);
			console.log("인덱스 : " + index);
				
			
		if ($(".liketd").hasClass("unlike")) {
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
		               alert("로그인 후 이용해주세요");
		               location.href="login";
				}

			});
			
		// 좋아요 해제
		} else if ($(".liketd").hasClass("liked")) {
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
		               alert("로그인 후 이용해주세요");
		               location.href="login";
				},
			});
		} 
	});
	
	// 수정 페이지
		$(document).on("click", ".dmodify", function(){
		let dnoKnow = $(".knowdno").val();
		
		location.href="modifydiary?diary_no="+dnoKnow;
	});
	
	
	// 댓글 등록
		$(document).on("click", ".insertcomm", function(){
		let dnoKnow = $(".knowdno").val();
		console.log("dnoKnow는?" + dnoKnow);
		$.ajax({
			url : "insertComment.do",
			type : "POST",
			data : { diary_no : dnoKnow,
					comm_comment : $(".writecomment").val(),
 					comm_no : $(".comm_no").val()
					},
 			dataType : "json",
		success : function(data) {
				console.log(data);
				data = data[0];
				console.log("data" + data);
				$(".dtinsertcommtr").after("<tr class='dttr dtlistcommtr'><td class='writecomment commwriter'>"+data.user_id+"</td><td class='dtlistcomm'>"+data.comm_comment+"<button type='button' class='dtbtn commdelete'> &#10005 </button><button type='button' class='dtbtn commmodify'>수정</button></td></tr>");
				$(".writecomment").val("");
			},
			error : function(data) {
	               alert("로그인 후 이용해주세요");
	               location.href="login";
			}
		});
	});
	
 		// 댓글 수정
		$(document).on("click", ".commmodify", function(){
			console.log("찍어라~");
			var thisComm = $(this);
			var thisCommentBox = thisComm.parents(".dtlistcommtr");
			console.log(thisCommentBox);
			var thisCommentTd = thisCommentBox.find(".spanComm");  
			var thisCommentBtn = thisCommentBox.find(".dtbtn");  

			var thisCommentTx = thisCommentTd.text();
			
			thisCommentTd.empty();
			thisCommentBtn.remove();
			
			thisCommentTd.append("<input type='text' class='modifycomment' value='"+thisCommentTx+"'>&nbsp;&nbsp;&nbsp; <button type='button' class='dtbtn modcommsucc'>수정하기</button>");
		});
	
 		
 		
 		// 댓글 수정 확인
		$(document).on("click", ".modcommsucc", function(){

		console.log("댓글 수정 또 누르면~~");
		let dnoKnow = $(".knowdno").val();
		var thisComm = $(this);
		
		
			// 댓글 번호 찾기
		var findParent = thisComm.parents(".dtlistcommtr");
		var findChild = findParent.find(".comm_no");
		var thisComm_no = findChild.val();
		
		
		
			// 수정할 댓글 내용 찾기
		var findParent2 = thisComm.parents(".spanComm");
		var findComment = findParent2.find(".modifycomment").val();
		var thisComment = findComment;
		
		
		var thisCommentBox = thisComm.parents(".dtlistcommtr");
		var thisCommentTd = thisCommentBox.find(".dtlistcomm");
		var thisCommentTdMo = thisCommentBox.find(".spanComm");		
		
		
			$.ajax({
			url : "modifyComment.do",
			type : "post",
			data : {
					diary_no : dnoKnow,
					comm_no : thisComm_no,
					comm_comment : thisComment
				},
			dataType : "json",
			success : function(data){

				var listComment = data.listComment;
				var user_id = data.user_id;
				
				
				
				if(listComment != null) {
					$(".dtlistcommtr").remove();
					var commentHtml = "";
					
					$.each(listComment, function(i, item){
						commentHtml+="<tr class='dttr dtlistcommtr'>";
						commentHtml+="<td class='commwriter'>"+item.user_id+"</td>";
						console.log(item.comm_no);
						commentHtml+="<input type='hidden' class='comm_no' value='"+item.comm_no+"'>";
						commentHtml+="<td class='dtlistcomm'>";
						commentHtml+="<span class='spanComm'>"+item.comm_comment+"</span>";  // 댓글내용
					if(user_id == item.user_id) {
						commentHtml+="<button type='button' class='dtbtn commdelete'> &#10005 </button>";
						commentHtml+="<button type='button' class='dtbtn commmodify'>수정</button></td></tr>";
					} else {
						commentHtml+="</td></tr>"
					}

						});
					$(".dtinsertcommtr").after(commentHtml);
				}
				
			},
			error : function(data) {
				alert("수정에 실패했습니다 ~ " + data);
			}
			
		});		
		});
		
		
		// 댓글 삭제
			$(document).on("click", ".commdelete", function(){
				let dnoKnow = $(".knowdno").val();
				var thisComm = $(this);
				console.log(thisComm);
				
				var findParent = thisComm.parents(".dtlistcommtr");
				console.log(findParent);
				
				var findChild = findParent.find(".comm_no");
				
				var thisComm_no = findChild.val();
				console.log(thisComm_no);

				
				$.ajax({
					url : "deleteComment.do",
					type : "post",
					data : { diary_no : dnoKnow,
							 comm_no : thisComm_no
							},
					success : function(){
						alert("댓글이 삭제되었습니다.");
						location.href = "detaildiary?diary_no="+dnoKnow;
					},
					error : function(){
						
					}
						});
					});


	
	// 글 삭제
		$(document).on("click", ".ddelete", function(){
		console.log("딜리트 할거야 글삭제!!");
		let dnoKnow = $(".knowdno").val();
		$.ajax({
			url : "deletediary.do",
			type : "post",
			data : {diary_no : dnoKnow	
			},
			success : function(){
				alert("글 삭제가 완료되었습니다.");
				location.href="diary";
			},
			error : function(){
				alert("글 삭제에 실패했습니다. 관리자에게 문의해주시기 바랍니다.");
			}

		});
	});

	});
</script>
<script>
var slideIndex = 1;


function plusDivs(n) {
    showDivs(slideIndex += n);
};

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
};
</script>
</html>

