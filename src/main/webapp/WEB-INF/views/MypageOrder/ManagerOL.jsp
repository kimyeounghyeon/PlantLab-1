<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>無以林 주문 내역</title>
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
    </style>
    <style>
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
                <h1 class="title">주문 내역</h1>
            </div>

            <article class="main_article">
                <div>
                	<c:if test="${empty orderList}">
                		<table class="orderList">
                			<tr>
                				<td>
                					<h3>주문내역이 없습니다.</h3>
                				</td>
                			</tr>	
                		</table>
                	</c:if>
                	
                	<c:if test="${not empty orderList}">
		               <table class="orderList managerList">
		               		<tr>
		               			<td class="tGuid">주문번호</td>
		               			<td class="tGuid">주문자</td>
		               			<td class="tGuid">주문 합계</td>
		               			<td class="tGuid">주문 날짜</td>
		               		</tr>
		               		<tr>
		               			<td colspan="4" class="space"></td>
		               		</tr>
                			<c:forEach  var="vo" items="${orderList}" varStatus="status">
		                    	<form>
			                   		<tr>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/OrderView?buy_no=${vo.buy_no}">${vo.buy_no}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/OrderView?buy_no=${vo.buy_no}">${vo.buy_rc_name}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/OrderView?buy_no=${vo.buy_no}">${vo.buy_totalprice}</a></td>
				               			<td class="voGuid"><a href="<%=request.getContextPath()%>/OrderView?buy_no=${vo.buy_no}">${vo.buy_date}</a></td>
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
                    
                 <div class="regis_page">
					<c:if test="${startPage != 1 }">
						<a href="${path}/managerOL?page=${startPage-1}"> ◀ </a>
					</c:if>
					<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${p eq currentPage}">
							<font color="#6A60A9" size="4"><b> ${p} </b></font>
						</c:if>
						<c:if test="${p ne currentPage}">
							<c:url var="adminDiaryChk" value="managerOL">
								<c:param name="page" value="${p}" />
							</c:url>
							<a href="${adminDiaryChk}" class="aLink"><b>[${p}]</b></a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="<%=request.getContextPath() %>/managerOL?page=${endPage+1}"> ▶ </a>
					</c:if>
				</div>
            </article>
        </section>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	$(function(){
		
		});
</script>
</html>