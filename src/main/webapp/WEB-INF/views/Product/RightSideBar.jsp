<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
 