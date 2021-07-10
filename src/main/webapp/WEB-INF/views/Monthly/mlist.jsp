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
*{
    font-family: 'Jeju Myeongjo';
    color: #625b54;
}

.mlistdiv{
  clear: both;
  width: 1250px;
  margin: auto;
  text-align : center;
  
}
#subtn{
  background: #625b54;
  color : white;
  border : none;
  margin-left : 810px;
  width :75px;
  height : 28px;

}
.mlisttb{

  border: solid 1px #ccc;
  border-radius: 10px;
  padding: 10px;
  margin: auto;

  
}
.mimg{
width : 150px;
height : 170px;
padding  : 5px;
}
#mdate{
width : 200px;
}
.mupde{
width : 100px;
}

.space{
    height: 20px;
    border-bottom: solid 1px #ccc;
  }
 .tGuid{
    font-weight: bold;
}
 .main_header{
    text-align: center;
    height: 130px;
    line-height: 100px;
    padding-top: 20px;
 }
 .mlisttb{
    border: solid 1px #ccc;
    border-radius: 10px;
    padding: 10px;
    margin: auto;
    width: 900px;
}
 .voGuid{
    height: 40px;
}
.page{
    width: 80%;
    margin: auto;
    height: 100px;
    clear: both;
    text-align: center;
    line-height: 100px;
}
.page li{
    list-style: none;
    display: inline;
    margin: 0px 20px;
    font-size: 18px;
}

.page li:hover{
    font-weight: bold;
}

li.now{
    font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../mypagemenu.jsp"></jsp:include>
<div class="mlistdiv">

 <div class="main_header">
      <h2 class="title">이달의 식물</h2>
  </div>
<button id="subtn" type="button" onclick="window.location='mWrite'">등록하기</button>
<br>
<br>
	<table class="mlisttb">
		<tr class="bottomline" >
			<td class="tGuid">No</td>
			<td class="tGuid">식물이름</td>
			<td class="tGuid">식물사진</td>
			<td class="tGuid">작성일</td>
			<td class="tGuid">기능</td>
	
		</tr>
		<tr>
		  <td colspan="5" class="space"></td>
		</tr>
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center"><br>
				<br> 저장된 글이 없습니다.<br>
				<br></td>
			</tr>
		</c:if>
		<c:if test="${listCount ne 0}">
			 <c:forEach var="vo" items="${list}">
				<tr class="bottomline">
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
		
	</table>
		<!-- 앞 페이지 번호 처리 -->
		<br>
		<div class="page">
		<ul>
			<c:if test="${currentPage <= 1}">
			<li>◀</li>
			</c:if> 
			
 				<c:if test="${currentPage > 1}">
					<c:url var="molistST" value="mlist">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<li><a href="${molistST}">◀</a></li>
				</c:if>
				 <!-- 끝 페이지 번호 처리 --> 
				 <c:set var="endPage" value="${maxPage}" />
				 <c:forEach var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<li>${p}</li>
					</c:if>
				
				</c:forEach>
				
				 <c:if test="${currentPage >= maxPage}">
				 <li>▶</li>
				 </c:if>
				 <c:if test="${currentPage < maxPage}">
					<c:url var="molistEND" value="mlist">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<li><a href="${molistEND}">▶</a></li>	
				</c:if>
			</ul>
		</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>