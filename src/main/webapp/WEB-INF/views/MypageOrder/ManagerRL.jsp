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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    		background-color: white;
    		border: solid 1px #ccc;
    	}
    	
    	.delBtn:hover{
    		background-color: #625b54;
    		color: white;
    		border: none;
    		box-shadow: 2px 2px 2px #ccc;
    		cursor: pointer;
    	}
    	
    	.search {
			height : 35px;
			border : none;
			margin-left:130px;
			margin-bottom: 25px;
		}
	
		.search ::-ms-expand {
		display: none;
		}
		
		.keyword {
			border-left : none;
			border-right : none;
			border-top : none;
			border-bottom : 1px solid #6a6560;
			width : 300px;
			text-align : center;
		}
		
		.selectSearch {
			margin-left : 65px;
			margin-bottom : 0px;
		}
		
		.searchBtn {
			border : none;
			background-color : white;
			padding : 0px;
		}
		
		.searchBtn:hover {
			cursor:pointer;
		}
		
		.searchicon {
			width : 20px;
			height : 20px;
			bottom : 5px;
			padding : 0px;
		}
		
		.searchResult {
			text-align : center;
			font-weight : bold;
			font-size : 17pt;
			color : #625b54;
		}
		
		.regis_page{
    		margin: auto;
    		text-align: center;
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
            	<div class="search">
                    <form name="proListF">
                   		<input type="hidden" name="page" value="${currentPage}"> 
	                    <input type="text" id="searchV" name="keyword" class="keyword" placeholder="리뷰 번호를 입력해주세요.">&nbsp;
	                    <button type="button" class="searchBtn">
	                    	<img src="${path }/resources/img/search.png" class="searchicon">
	                    </button>
                    </form>
                </div>
            
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
		               			<td class="tGuid">회원 번호</td>
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
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.user_no}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.rv_title}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/revieWrite?buy_no=${vo.buy_no}&new=mody">${vo.rv_date}</a></td>
				               			<td class="voGuid"><button type="button" id="${status.index}" class="delBtn">삭제</button></td>
		               				</tr>
		                    	</form>
	                    	</c:forEach>
			            </table>
                    </c:if>
                    <br>
                </div>
                <br>
                    
                 <div class="regis_page">
					<c:if test="${startPage != 1 }">
						<a href="${path}/reviewList?page=${startPage-1}"> ◀ </a>
					</c:if>
					<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${p eq currentPage}">
							<font color="#6A60A9" size="4"><b> ${p} </b></font>
						</c:if>
						<c:if test="${p ne currentPage}">
							<c:url var="adminDiaryChk" value="reviewList">
								<c:param name="page" value="${p}" />
								<c:param name="keyword" value="${keyword}" />
							</c:url>
							<a href="${adminDiaryChk}" class="aLink"><b>[${p}]</b></a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="<%=request.getContextPath() %>/reviewList?page=${endPage+1}"> ▶ </a>
					</c:if>
				</div>
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
		
		//검색
	    var search = $('#searchV');
	    var serachBtn = $('.searchicon');
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
	        	form.action = "reviewList";
	        	form.submit();
	        }
	    };
	});
</script>
</html>