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
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link href="${path}/resources/css/Product/ProductListStyle.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    	.addPro{
    		cursor:pointer;
    		background-color: #ccc;
    		font-size: 15px;
    		border:solid 1px #ccc;
    		margin-top:54px;
    		margin-right: 20px;
    		width:100px;
    		height:100px;
    		float:right;
    		border-radius: 10px;
    	}
    	
    	.addPro:hover{
    		background-color: #ADBA85;
    	}
    	
    	.managerPro{
    		margin-left:150px;
    	}
    </style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
    <div id="content" class="contents">
		<section id="main_section">
            <!-- Stroe 카테고리(왼쪽바) -->
            <article class="aside1">
                <h3>카테고리</h3>
                <hr>
                <ul class="cateList">
                    <li><a href="${path}/managerPL?cate=p">식물</a></li>
                    <li><a href="${path}/managerPL?cate=c">화분</a></li>
                    <li><a href="${path}/managerPL?cate=g">소품</a></li>
                </ul>
            </article>

			<article class="main_article">
                <div class="search">
                    <form name="proListF">
                   		<input type="hidden" name="page" value="${currentPage}"> 
	                    <input type="text" id="searchInput" name="keyword" placeholder=" 검색어">
	                    <input type="button" value="검색" id="serachBtn">
                    </form>
                </div>
                
                <button type="button" class="addPro" onClick="${path}/proInsert">추가하기</button>
				
                <div class="pro managerPro">
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
	                    		<c:url var="plistST" value="/managerPL?cate=${nowCate}&orderby=${nowOrder}">
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
									<c:url var="plistchk" value="/managerPL?cate=${nowCate}&orderby=${nowOrder}">
										<c:param name="page" value="${p}" />
									</c:url>
									<li><a href="${plistchk}">${p}</a></li>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">
								<li>▶</li>
							 </c:if> 
							<c:if test="${currentPage < maxPage}">
								<c:url var="plistEND" value="/managerPL?cate=${nowCate}&orderby=${nowOrder}">
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
		//상품추가 이동
		
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
	        if(search.val() == "" || search.val() == null){
	            swal("검색어를 입력해주세요!", "", "info");
	        }else{
	        	form.method = "get"
	        	form.action = "/managerPL";
	        	form.submit();
	        }
	    };
	});
</script>
</html>