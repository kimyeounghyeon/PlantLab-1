<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<div id="fullmain">
		<div id="main">
			<!-- header top -->

			<div id="mainTop">
				<a href="#" class="top">cart</a> <a href="#" class="top">my</a> <a
					href="<%=request.getContextPath()%>/login" class="top">login</a>
				<a href="<%=request.getContextPath()%>/join" class="top">join</a>
			</div>

			<!--  logo -->
			<!--  logo 이미지 넣기 -->

			<div id="logo">
				<img alt="logo" src="${path }/resources/img/logo.png" />
			</div>


			<!-- header의 tab 버튼 -->
			<div id="tab">
				<div class="tablinks" id="plant">
					<a href="${path}/mMain.do" class="Tab">Plant</a>
					<div id="subtab">
						<a href="#" id="subtabM" class="sub">Mission</a> 
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