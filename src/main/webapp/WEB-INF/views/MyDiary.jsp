<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 My Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/MyDiaryStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>
	<div class="dbg">
	  <div class="main_header">
                <h2 class="title">내가 쓴 일기</h2>
            </div>
	<c:if test="${not empty myDiary }">
	<form id="myDiaryFrm">
	<div class="frmDiv">
	<button type="button" class="deleteMyDiary">삭제하기</button>
	<button id="goMyList">목록으로</button>
	</div>
	</form>
	</c:if>
	<br>
	<form id="searchMyDiary">
	<input type="text" name="keyword" class="myKeyword" placeholder="검색어를 입력해주세요." value="${keyword }" >&nbsp;<button type="button" class="mySearchBtn"><img src="${path }/resources/img/search.png" class="mySearchicon"></button>
	</form>
	<table class="mydTable">
			<tr class="mdtr">
 				<th class="mdth selectAlltd" ><input type="checkbox" name="selectAll" class="selectAll">
 				<th class="mdth mydNum"> NO </th>
				<th class="mdth myContent"> 내용 </th>
				<th class="mdth myDate"> 날짜 </th>
				<th class="mdth myLike"> <img class="likeimg" src="${path }/resources/img/색변경좋아요.png"> </th>
			</tr>
	<c:if test="${not empty myDiary }">
		<c:forEach var="d" items="${myDiary}">
			<tr class="mdtr">
 				<td class="mdtd mydSelect"><input type="checkbox" name="selectChk" value="${d.diary_no }"></td>
 				<td class="mdtd mydNum">${d.diary_no }</td>
				<td class="mdtd myContent"><div class="contentmove"><a href='detaildiary?diary_no=${d.diary_no}' class="aContentLink">${d.diary_content}</a></div></td>
				<td class="mdtd myDate">${d.diary_date}</td>
				<td class="mdtd myLike">${d.like_cnt}</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty myDiary }">
		<tr class="mdtr">
			<td class="mdtd emptyDiary" colspan="5"> 등록 된 게시물이 없습니다.
			 반려식물과의 일상을 기록해보세요!</td>
		</tr>
		<tr class="mdtr">
			<td class="mdtd moveDiary" colspan="5"><a href="<%=request.getContextPath() %>/diary" class="aMoveDiary">일기 쓰러 가기</a> 
		</tr>
				</c:if>
					</table>
	        <div class="regis_page">
            <c:if test="${startPage != 1 }">
                  <a href="<%=request.getContextPath() %>/mydiary?page=${startPage-1}&keyword=${keyword}"> ◀ </a>
            </c:if>
            <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                <c:if test="${p eq currentPage}">
                   <font color="#6A60A9" size="4"><b> ${p} </b></font>
                </c:if>
                <c:if test="${p ne currentPage}">
                <c:url var="diaryChk" value="mydiary">
                	<c:param name="page" value="${p}" />
			<c:param name="keyword" value="${keyword}" />
						</c:url>
			<a href="${diaryChk}" class="aLink"><b> ${p} </b></a>
                </c:if>
             </c:forEach>
            <c:if test="${endPage < pageCnt }">
                  <a href="<%=request.getContextPath() %>/mydiary?page=${endPage+1}&keyword=${keyword}"> ▶ </a>
            </c:if>
            </div>
        </div>
            	<jsp:include page="footer.jsp"></jsp:include>

<script>
	$(function(){
			var frm = document.getElementById("myDiaryFrm");
			var mySearchfrm = document.getElementById("searchMyDiary");

 		$(".selectAll").click(function(){
			if($(this).prop('checked')){
				$("input[name='selectChk']").prop("checked", true);
			} else {
				$("input[name='selectChk']").prop("checked", false);
			}
		});	


	$("#goMyList").click(function(){  // TODO
		 $(".myKeyword").val("");
		 location.href="mydiary";
	});
		
	 	$(".deleteMyDiary").click(function(){
			var checkVal = "";
			
			var result = confirm("정말 삭제하시겠습니까?");

			if(result) {
 			$("input[name=selectChk]:checked").each(function(){
			 checkVal = $(this).val(); 
			 console.log("값" + checkVal);

        		var checkValinput = "<input type='hidden' name='checkVal' value='"+checkVal+"'>";
        		$(".frmDiv").prepend(checkValinput);
        	
 			});
      	
 			frm.action = "deletemydiary.do";
			frm.method = "post";
			frm.submit();  
			 } else {
				 history.back();
			 }
 		}); 
	 	
	 	$(".mySearchBtn").click(function(){
		console.log("클릭눌렀음");
		console.log($(".myKeyword").val());

		if ($(".myKeyword").val() == "") {
			console.log($(".myKeyword").val());
			alert("검색어가 없습니다.");                                                                                                                                                                                                                                                                                                                                                                                                        
		} else {
			mySearchfrm.action = "mydiary";
			mySearchfrm.method = "post";
			mySearchfrm.submit();
		}
	 	});
	});

		
</script>
	
</body>
</html>