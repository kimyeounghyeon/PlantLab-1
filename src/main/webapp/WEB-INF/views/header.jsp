<%@page import="com.plant.lab.member.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<div id="fullmain">
		<div id="main">
			<!-- header top -->
             <div id="mainTop">
				<a href="#" class="top">cart</a> 
				<a href="${path}/mypage.do" class="top">my</a>
				<c:choose>
					<c:when test="${sessionScope.loginMember!=null}">
						<a href="${path}/logout" class="top">logout</a> 
					</c:when>
					<c:otherwise>
						<a href="<%=request.getContextPath()%>/login" class="top">login</a>  
					</c:otherwise> 
				</c:choose>
		
       
				<a href="<%=request.getContextPath()%>/join" class="top">join</a>
			</div>

			<!--  logo -->

			<div id="logo"><a href="${path }/Main">
				<img alt="logo" src="${path }/resources/img/logo.png" /></a>
			</div>


			<!-- header의 tab 버튼 -->
			<div id="tab">
				
				<div class="tablinks" id="plant">
					<a href="${path}/mMain" class="Tab">Plant</a>
					<div id="subtab">
						<a href="${path}/attendance" id="subtabM" class="sub">Mission</a> 
						<a href="${path }/diary" class="sub">Diary</a>
					</div>
				</div>
				<div class="tablinks">
					<a href="${path}/onedayMain" class="Tab">Class</a>
				</div>
				<div class="tablinks">
					<a href="${path}/elist.do" class="Tab">Event</a>
				</div>
				<div class="tablinks">
					<a href="${path}/product" class="Tab">Store</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
