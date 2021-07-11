<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/userListStyle.css" rel="stylesheet" />
</head>
<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="mypagemenu.jsp"></jsp:include>
<section class="setop">
	<div class="mypagelist">
	 <div class="main_header">
                <h1 class="title">회원 관리</h1>
            </div>
		<div class="search">
			<form class="search_form" action="#" method="get">
				<input class="search_bar" type="text" name="keyword"
					placeholder="회원아이디로 검색">
				<button class="search_btn" type="submit">검색</button>
			</form>
			<c:if test="${empty search }">
				<c:if test="${not empty search}">
					<h1>${search}에대한 검색 결과입니다.</h1>
					<table class="userList search">
						<tr>
							<th><input type="checkbox" id="checkall" /></th>
							<th>아이디</th>
							<th>이름</th>
							<th>핸드폰</th>
							<th>이메일</th>
							<th>주소</th>
						</tr>
						<tr>
						<td colspan="6" class="space"></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="item" /></td>
							<td>2</td>
							<td>${list.userId }</td>
							<td>${list.userName }</td>
							<td>${list.phone }</td>
							<td>${list.email }</td>
							<td>${list.address }</td>
						</tr>
					</table>
				</c:if>
			</c:if>
		</div>
		<div class=row>
			<c:if test="${empty userList}">
      등록 된 회원이 없습니다.
      </c:if>
			<c:if test="${not empty userList }">
				<form id="frmhidden">
					<table class="userList user" id="table">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkall" /></th>
								<th>아이디</th>
								<th>이름</th>
								<th>핸드폰</th>
								<th>이메일</th>
								<th>주소</th>
						</thead>
						<tr>
						<td colspan="6" class="space"></td>
						</tr>
						<tbody>
							<c:forEach items="${userList }" var="list">
								<tr>
									<td><input type="checkbox" name="item" id="item"
										value="${list.userId }" /></td>
								    <td class="id">${list.userId }</td>
									<td class="name">${list.userName }</td>
									<td class="pnum">${list.phone }</td>
									<td class="mail">${list.email }</td>
									<td class="addre">${list.address }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</c:if>
		</div>
	</div>
	<button class="Withdrawal" type="button" id="delete_btn">회원탈퇴</button>
	<br>
	<br>
	<c:if test="${startPage != 1 }">
		<a href="<%=request.getContextPath() %>/page/indexpage/user?pageNum=${startPage-1}&search=${search }">이전</a>
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="<%=request.getContextPath() %>/page/indexpage/user?pageNum=${s }&search=${search }">${s }</a>
	</c:forEach>
	<c:if test="${endPage < pageCnt }">
		<a href="<%=request.getContextPath() %>/page/indexpage/user?pageNum=${endPage+1}&search=${search }">다음</a>
	</c:if>
	
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script>


	$("#checkall").change(function(){
	    if($("#checkall").is(":checked")){
	     $("input[name='item']").prop('checked', true);
	    }else{
	     $("input[name='item']").prop('checked', false);
	    }
	});


	$(function (){
		   $("#delete_btn").click(Withdrawal);
		  
		      function Withdrawal(){
		          if($("input:checkbox[name='item']:checked")) {
		             var ids = $("#item").val();
		             console.log("테스트");
		             console.log(ids);
		             		             
	            	 var frmhidden = document.getElementById("frmhidden");
	                 frmhidden.action = "#";
	                 frmhidden.method = "post";
	                 frmhidden.submit();	                
		             } else {
		            	 console.log("실패");
		             }
		         }
		   });
		   
	
	
</script>

</html>