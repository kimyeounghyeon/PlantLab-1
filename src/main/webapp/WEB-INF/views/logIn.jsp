<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:if test="${!empty loginMember}">
		<h3>${loginMember.userName}님 환영합니다.</h3>
				<form action="logout" method="post">
			<button>로그아웃</button>
   </form>
	</c:if>
</body>
</html>