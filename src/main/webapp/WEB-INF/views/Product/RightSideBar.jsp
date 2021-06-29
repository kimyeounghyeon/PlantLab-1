<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<article class="aside2">
                <h3>최근 본 상품</h3>
                <c:if test="${not empty viewPro}">
                <h4 class="recentCnt">
                	<c:if test="${fn:length(viewPro) < 3}">${fn:length(viewPro)} </c:if>
                	<c:if test="${fn:length(viewPro) >= 3}">3</c:if>
                </h4>
                <ul class="recentList">
                	<c:forEach var="vo" items="${viewPro}" varStatus="status" begin="0" end="2">
	                    <li class="recentImg">
	                         <a href="${path}/productView?proNo=${vo.pro_no}">
	                            <img src="${vo.pro_image}"/>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
                </c:if>
    </article>
    
    
    <%-- <%
	    // 쿠키값 가져오기
	    Cookie[] cookies = request.getCookies() ;
	     
	    if(cookies != null){
	         
	        for(int i=0; i < cookies.length; i++){
	            Cookie c = cookies[i] ;
	             
	            // 저장된 쿠키 이름을 가져온다
	            String cName = c.getName();
	             
	            // 쿠키값을 가져온다
	            String cValue = c.getValue() ;
	            %><%= "이름,값 : "+ cName + cValue %><%
	        }
	    }
	%> --%>
</body>
<script>
	$(function(){
		/* $.ajax({
		    url: '/proView',
		    type : "get",
		    success : function(result) {
		           
		    },
		    error : function() {
		        alert('error');
		    }
		}); */
	});
</script>
</html>