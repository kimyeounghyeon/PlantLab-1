<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>無以林 Admin Diary</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
</head>
<body>
	<table class="admdTable">
			<tr class="admdtr">
<!-- 				<th class="mdth selectAlltd"><input type="checkbox" name="selectAll" class="selectAll">
 -->			<th class="admdth admdNum"> NO </th>
				<th class="admdth admdContent"> 아이디 </th>
				<th class="admdth admdDate"> 내용 </th>
				<th class="admdth admdLike"> 날짜 </th>
			</tr>
		<c:forEach var="d" items="${listDiary}">
			<c:set var="i" value="${i+1 }" />
			<tr class="mdtr">
<%-- 				<td class="mdtd mydSelect"><input type="checkbox" name="selectChk[]" value="${d.diary_no }"></td>
 --%>			<td class="admdtd admdNum">${i}</td>
				<td class="admdtd admdContent"><div class="admdcontentmove"><a href='detaildiary?diary_no=${d.diary_no}' class="admdaContentLink">${d.diary_content}</a></div></td>
				<td class="admdtd admdDate">${d.diary_date}</td>
				<td class="admdtd admdLike">${d.like_cnt}</td>
			</tr>
		</c:forEach>
	</table>
	<br><br>
	            <div class="regis_page">
            <c:if test="${startPage != 1 }">
                  <a href="<%=request.getContextPath() %>/admindiary?page=${startPage-1}">이전</a>
            </c:if>
            <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                <c:if test="${p eq currentPage}">
                   <font color="#6A60A9" size="4"><b>[${p}]</b></font>
                </c:if>
                <c:if test="${p ne currentPage}">
                <c:url var="listDiaryChk" value="listDiary">
                	<c:param name="page" value="${p}" />
						</c:url>
							<a href="${diaryChk}" class="aLink"><b>[${p}]</b></a>
<%--                    <a href="<%=request.getContextPath() %>/mydiary?page=${endPage+1}"></a><font color="gray" size="4"><b>[${p}]</b></font></a>
 --%>                </c:if>
             </c:forEach>
            <c:if test="${endPage < pageCnt }">
                  <a href="<%=request.getContextPath() %>/admindiary?page=${endPage+1}">다음</a>
            </c:if>
            </div>

<script>
	$(function(){
/* 		$(".selectAll").click(function(){
			if($(".selectAll").prop("checked")){
				$("input[name='selectChk']").prop("checked", true);
			} else {
				$("input[name='selectChk']").prop("checked", false);
			} */
		});
</script>
</body>
</html>