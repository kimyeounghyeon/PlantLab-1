<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林  event detail</title>
    <link href="${path}/resources/css/font.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function showInsertForm() {
	location.href = "mWrite.do";
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
  width : 850px;
  
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="mlistdiv">

<h2 align="center" >이달의 식물</h2>
<button id="subtn"type="button" onclick="window.location='mWrite.do'">등록하기</button>
	<table class="mlisttb">
		<tr>
			<td>No</td>
			<td>식물이름</td>
			<td>작성일</td>
	
		</tr>
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="3" align="center"><br>
				<br> 게시판에 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>
			<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<!--  <td align="center">${status.count}</td>-->
					<td align="center">${vo.monthly_no}</td>
					<td align="center">
					<a href="mDetail.do?monthly_no=${vo.monthly_no}&page=${currentPage}">
							&nbsp;${vo.monthly_name} </a></td>
					<td align="center">${vo.monthly_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan=3">
			<c:if test="${currentPage <= 1}">이전&nbsp; </c:if> 
 				<c:if test="${currentPage > 1}">
					<c:url var="molistST" value="mlist.do">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${molistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
				 <c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						${p}
					</c:if>
				<!-- 	<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="mlist.do">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if> 
				</c:forEach>-->
				
				 <c:if test="${currentPage >= maxPage}">다음 </c:if>
				  <c:if test="${currentPage < maxPage}">
					<c:url var="molistEND" value="mlist.do">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${molistEND}">[다음]</a>
				</c:if></td>
		</tr>
	</table>
</div>
</body>
</html>