<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>無以林 리뷰리스트</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${path}/resources/css/OrderListStyle.css"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    	.managerList{
    		text-align: center;
    	}
    	.tGuid{
    		font-weight: bold;
    	}
    	
    	.space{
    		height: 20px;
    		border-bottom: solid 1px #ccc;
    	}
    	
    	.voGuid{
    		height: 40px;
    	}
    	
    	.delBtn{
    		background-color: #625b54;
    		color: white;
    		border: none;
    		box-shadow: 2px 2px 2px #ccc;
    		cursor: pointer;
    	}
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">리뷰 내역</h1>
            </div>

            <article class="main_article">
                <div>
                	<c:if test="${empty reviewList}">
                		<table class="orderList">
                			<tr>
                				<td>
                					<h3>작성된 리뷰가 없습니다.</h3>
                				</td>
                			</tr>	
                		</table>
                	</c:if>
                	
                	<c:if test="${not empty reviewList}">
		               <table class="orderList managerList">
		               		<tr>
		               			<td class="tGuid">리뷰 번호</td>
		               			<td class="tGuid">상품번호</td>
		               			<td class="tGuid rtitle">리뷰 제목</td>
		               			<td class="tGuid">작성일</td>
		               		</tr>
		               		<tr>
		               			<td colspan="4" class="space"></td>
		               		</tr>
                			<c:forEach  var="vo" items="${reviewList}" varStatus="status">
		                    	<form id="form${status.index}">
		                    		<input type="hidden" name="new" value="mody">
		                    		<input type="hidden" name="rv_no" value="${vo.rv_no}">
		                    		<input type="hidden" name="buy_no" value="${vo.buy_no}">
		                    		<input type="hidden" name="rv_star" value="${vo.rv_star}">
			                   		<tr>
			                   			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.rv_no}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/productView?proNo=${vo.pro_no}">${vo.pro_no}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.rv_title}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.rv_date}</a></td>
				               			<td class="voGuid"><button type="button" id="${status.index}" class="delBtn">삭제</button></td>
		               				</tr>
		                    	</form>
	                    	</c:forEach>
			            </table>
                    </c:if>
                    <br>
                    
                    <br>
                    <div class="proFoot">
                        <p>이용해주셔서 감사합니다.<br>상품의 이용방법, 주문취소 등에 대한 문의는 고객센터를 이용해 주세요.</p>
                    </div>
                </div>
                <br>
                    
                 <c:if test="${not empty currentPage}">
                	<div class="page">
	                    <ul>
	                    	<c:if test="${currentPage <= 1}">
	                    		<li>◀</li>
	                    	</c:if>
	                    	<c:if test="${currentPage > 1}">
	                    		<c:url var="plistST" value="/reviewList">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<li> <a href="${plistST}">◀</a></li>
	                    	</c:if>
	                    	
	                    	<c:set var="endPage" value="${maxPage}" /> 
							<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
								<c:if test="${p eq currentPage}">
									<li>${p}</li>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="plistchk" value="/reviewList">
										<c:param name="page" value="${p}" />
									</c:url>
									<li><a href="${plistchk}">${p}</a></li>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">
								<li>▶</li>
							 </c:if> 
							<c:if test="${currentPage < maxPage}">
								<c:url var="plistEND" value="/reviewList">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<li><a href="${plistEND}">▶</a></li>
							</c:if>
	                    </ul>
	                </div>
                </c:if>
            </article>
        </section>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	$(function(){
		var delBtn = $('.delBtn');
		var id = '';
		
		delBtn.click(function(){
			id = $(this).attr('id');
			var form = $('#form'+id);
			
			form.attr("method","post");
        	form.attr("action","reviewDel");
        	form.submit();
		});
	});
</script>
</html>