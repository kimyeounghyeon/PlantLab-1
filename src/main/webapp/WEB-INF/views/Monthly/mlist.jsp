<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  monthly list</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function showInsertForm() {
	location.href = "mWrite";
}
</script>
<style>
.mlistdiv{
  clear: both;
  margin-left : auto;
  margin-right : auto;
  text-align : center;
  
}
#subtn{
  background: #625b54;
  color : white;
  border : none;
  margin-left : 1140px;
}
.mlisttb{
 margin-left : auto;
 margin-right : auto;
 width : 800px;
  
}
.mimg{
width : 150px;
height : 170px;
padding : 3px;
}
#mdate{
width : 200px;
}
.mupde{
width : 100px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="mlistdiv">

<h2 align="center" >이달의 식물</h2>
<button id="subtn"type="button" onclick="window.location='mWrite'">등록하기</button>
	<table class="mlisttb">
		<tr>
			<td>No</td>
			<td>식물이름</td>
			<td>식물사진</td>
			<td>작성일</td>
			<td>기능</td>
	
		</tr>
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br>
				<br> 게시판에 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>
		<c:if test="${listCount ne 0}">
			 <c:forEach var="vo" items="${list}">
				<tr>
					<td align="center">${vo.monthly_no}</td>
					<td><a href="mDetail?monthly_no=${vo.monthly_no}">${vo.monthly_name}</a></td>
					<td class="mimg" align="center"><a href="mDetail?monthly_no=${vo.monthly_no}">
					<img class="mimg" src="<%=request.getContextPath() %>/resources/img/${vo.monthly_img}">
					</a>
					</td>
					<td id="mdate" align="center">${vo.monthly_date}</td>
					
					<td class="mupde">
					
					<c:url var="mupview" value="mRenew">
						<c:param name="monthly_no" value="${vo.monthly_no}" />
						<c:param name="monthly_img" value="${pageContext.request.contextPath}/resources/img/${vo.monthly_img}" />
						<c:param name="monthly_name" value="${vo.monthly_name}" />
					</c:url> 
					<c:url var="mdelete" value="mDelete">
						<c:param name="monthly_no" value="${vo.monthly_no}" />
					</c:url> 
					<a href="${mupview}"> 수정 </a> &nbsp;&nbsp; 
					<a href="${mdelete}"> 삭제 </a>
					</td>
				</tr>
		</c:forEach>
		</c:if>
		
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan=6">
			<c:if test="${currentPage <= 1}">이전&nbsp; </c:if> 
			
 				<c:if test="${currentPage > 1}">
					<c:url var="molistST" value="mlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${molistST}">이전</a>
				</c:if>
				 <!-- 끝 페이지 번호 처리 --> 
				 <c:set var="endPage" value="${maxPage}" />
				 <c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						${p}
					</c:if>
				
				</c:forEach>
				
				 <c:if test="${currentPage >= maxPage}">다음 </c:if>
				 <c:if test="${currentPage < maxPage}">
					<c:url var="molistEND" value="mlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${molistEND}">다음</a>	
				</c:if>
			</td>
		</tr>
	</table>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>