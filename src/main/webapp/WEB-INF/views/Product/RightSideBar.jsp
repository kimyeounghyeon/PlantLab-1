<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h4 class="recentCnt">1</h4>
                <ul class="recentList">
                    <li class="recentImg">
                        <a href="42_finalProView.html">
                            <img src="test.jpg"/>
                        </a>
                    </li>
                </ul>
                <p class="next">▼</p>
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