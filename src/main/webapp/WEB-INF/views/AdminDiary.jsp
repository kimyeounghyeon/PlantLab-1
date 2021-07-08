<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 Admin Diary</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/adminDiaryStyle.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>
	<div class="dbg">
	<c:if test="${not empty admlistDiary }">
		<form id="adminDiaryFrm">
			<div class="adFrmDiv">
				<button type="button" class="deleteAdminDiary">삭제하기</button>
			</div>
		</form>
	</c:if>
	<br>
	<form id="searchIdFrm">
	<div class="selectAdminSearch">
	<select name="search" class="adminSearch">
			<option class="adminSearch" value = "id">아이디</option>
			<option class="adminSearch" value = "content">내용</option>
	</select>
		<input type="text" name="keyword" class="admKeyword" placeholder="검색어를 입력해주세요." value="${keyword }">&nbsp;
		<button type="button" class="admSearchBtn">
			<img src="${path }/resources/img/search.png" class="admSearchicon">
		</button>
		</div>
	</form>
	<c:if test="${not empty admlistDiary }">
	<div class="listBtn">
		<button id="goList">목록으로</button>
	</div>
	</c:if>
	<table class="admdTable">
		<tr class="admdtr">
			<th class="admdth selectAlltd"><input type="checkbox"
				name="selectAll" class="selectAll">
			<th class="admdth admdNum">NO</th>
			<th class="admdth admdId">아이디</th>
			<th class="admdth admdContent">내용</th>
			<th class="admdth admdDate">날짜</th>
		</tr>
		<c:if test="${not empty admlistDiary }">
			<c:forEach var="ad" items="${admlistDiary}" varStatus="status">
				<tr class="admmdtr">
					<td class="admdtd admdSelect"><input type="checkbox"
						name="selectChk" value="${ad.diary_no }"></td>
					<td class="admdtd admdNum">${ad.diary_no }</td>
					<td class="admdtd admdId">${ad.user_id }</td>
					<td class="admdtd admdContent"><div class="admdcontentmove">
							<a href='detaildiary?diary_no=${ad.diary_no}'
								class="admdaContentLink">${ad.diary_content}</a>
						</div></td>
					<td class="admdtd admdDate">${ad.diary_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty admlistDiary }">
			<button id="list_normal">목록으로돌아가기</button>
			<tr class="admmdtr">
				<td class="admdtd emptyadmDiary" colspan="5">등록 된 게시물이 없습니다.
					반려식물과의 일상을 기록해보세요!</td>
			</tr>
			<tr class="admmdtr">
				<td class="admdtd moveadmDiary" colspan="5"><a href="<%=request.getContextPath() %>/diary" class="aMoveDiary">일기쓰러 가기</a></td>
			</tr>
		</c:if>
	</table>
	<br>
	<br>
	<div class="regis_page">
		<c:if test="${startPage != 1 }">
			<a href="<%=request.getContextPath() %>/admindiary?page=${startPage-1}&keyword=${keyword}">이전</a>
		</c:if>
		<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${p eq currentPage}">
				<font color="#6A60A9" size="4"><b> ${p} </b></font>
			</c:if>
			<c:if test="${p ne currentPage}">
				<c:url var="adminDiaryChk" value="admindiary">
					<c:param name="page" value="${p}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>
				<a href="${adminDiaryChk}" class="aLink"><b>[${p}]</b></a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="<%=request.getContextPath() %>/admindiary?page=${endPage+1}&keyword=${keyword}">다음</a>
		</c:if>
	</div>
	
</div>
	<script>
$(function(){
	var frm = document.getElementById("adminDiaryFrm");
	var searchFrm = document.getElementById("searchIdFrm");

	$(".selectAll").click(function(){
	if($(this).prop('checked')){
		$("input[name='selectChk']").prop("checked", true);
	} else {
		$("input[name='selectChk']").prop("checked", false);
	}
});	

	$("#list_normal").click(function(){  // TODO
		 $(".admKeyword").val("");
		 location.href="admindiary";
	});
	
	$(".deleteAdminDiary").click(function(){
	var checkVal = "";
	var result = confirm("정말 삭제하시겠습니까?");

	if(result) {
		$("input[name=selectChk]:checked").each(function(){
	 checkVal = $(this).val(); 
	 console.log("값" + checkVal);

	 if(checkVal!=null) {
	var checkValinput = "<input type='hidden' name='checkVal' value='"+checkVal+"'>";
	$(".adFrmDiv").prepend(checkValinput);
	
	frm.action = "deleteadmindiary.do";
	frm.method = "post";
	frm.submit();   
	 } else {
		 history.back();
	 }
	});
		 
	 }
		
	}); 
	
	
	$(".admSearchBtn").click(function(){
		console.log("클릭눌렀음");
		
		var searchVal = $(".adminSearch").val();
		console.log("셀렉트 박스 값은 " + searchVal);
		
		if ($(".admKeyword").val() == "") {
			alert("검색어가 없습니다.");
		} else {
			searchFrm.action = "admindiary";
			searchFrm.method = "post";
			searchFrm.submit();
		} 
	});
});
	</script>
</body>
</html>