<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 Store</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/Product/ProductListStyle.css" rel="stylesheet"/>
	<link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div id="content" class="contents">
		<section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林 식물</h1>
                <!-- <h4 class="subTitle">식 물</h4> -->
            </div>

            <!-- Stroe 카테고리(왼쪽바) -->
            <article class="aside1">
                <h3>카테고리</h3>
                <hr>
                <ul class="cateList">
                    <li><a href="${path}/product?cate=p">식물</a></li>
                    <li><a href="${path}/product?cate=m">관리제품</a></li>
                    <li><a href="${path}/product?cate=g">원예용품</a></li>
                </ul>
            </article>

            <!-- Store 최근본 상품(오른쪽바) -->
            <%@include file ="RightSideBar.jsp" %>

			<article class="main_article">
				<input type="hidden" id="order" value="${nowOrder}">
                <div class="orderby">
                    <ul class="orderList">
                        <li><a id="new" href="${path}/product?cate=${nowCate}&orderby=new">최신순</a></li>
                        <li><a id="best" href="${path}/product?cate=${nowCate}&orderby=best">판매량순</a></li>
                        <li><a id="low" href="${path}/product?cate=${nowCate}&orderby=low">낮은 가격순</a></li>
                        <li><a id="high" href="${path}/product?cate=${nowCate}&orderby=high">높은 가격순</a></li>
                    </ul>
                </div>
                
                <div class="search">
                    <form name="proListF">
                   		<input type="hidden" name="page" value="${currentPage}"> 
	                    <input type="text" id="searchInput" name="keyword" placeholder=" 검색어">
	                    <input type="button" value="검색" id="serachBtn">
                    </form>
                </div>
				
                <div class="pro">
                	<c:if test="${empty proList}">
                		<div class="proList"><h2>&nbsp;상품이 존재하지 않습니다.</h2></div>
                	</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="vo" items="${proList}" varStatus="status">
							<div class="proList">
		                        <ul class="list">
		                            <li class="proImg">
		                                <a href="${path}/productView?proNo=${vo.pro_no}">
		                                    <img src="${vo.pro_image}"/>
		                                </a>
		                            </li>
		                            <li class="proName"><a href="${path}/productView">${vo.pro_name}</a></li>
		                            <li class="proPri">${vo.pro_price}</li>
		                        </ul>
		                    </div>
						</c:forEach> 
					</c:if>
                </div>
                
                <c:if test="${not empty currentPage}">
                	<div class="page">
	                    <ul>
	                    	<c:if test="${currentPage <= 1}">
	                    		<li>◀</li>
	                    	</c:if>
	                    	<c:if test="${currentPage > 1}">
	                    		<c:url var="plistST" value="/product?cate=${nowCate}&orderby=${nowOrder}">
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
									<c:url var="plistchk" value="/product?cate=${nowCate}&orderby=${nowOrder}">
										<c:param name="page" value="${p}" />
									</c:url>
									<li><a href="${plistchk}">${p}</a></li>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">
								<li>▶</li>
							 </c:if> 
							<c:if test="${currentPage < maxPage}">
								<c:url var="plistEND" value="/product?cate=${nowCate}&orderby=${nowOrder}">
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
	<div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>

<script>
	$(function(){
		//정렬 리스트에 클래스 부여
		var order = $('#order').val();
		var nowO = $('#'+order);
		nowO.addClass('nowOrder');
		
		//검색
	    var search = $('#searchInput');
	    var serachBtn = $('#serachBtn');
		var form = $('form[name=proListF]');
		
	    serachBtn.click(function(){
	       searchNull();
	    });
	
	    search.keyup(function(event){
	        if(event.keyCode == 13){
	            searchNull();
	        }
	    });
	
	    function searchNull(){
	        if(search.val() == ""){
	            swal("검색어를 입력해주세요!", "", "info");
	        }else{
	        	form.method = "get"
	        	form.action = "/product";
	        	form.submit();
	        }
	    };
	});
</script>
</html>