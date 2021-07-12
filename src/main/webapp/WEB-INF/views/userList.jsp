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
			<form class="searchIdFrm">
				<input class="search_bar" type="text" name="search"
					placeholder="회원아이디로 검색">
				<button type="button" class="admSearchBtn">
					<img src="${path }/resources/img/search.png" class="admSearchicon">
				</button>
			</form>
			<c:if test="${empty keyword }">
				<c:if test="${not empty keyword}">
					<h1>${keyword}에대한검색결과입니다.</h1>
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
							<td><input type="checkbox" name="selectChk" name="item"/></td>
							<td>2</td>
							<td class="id">${list.userId }</td>
									<td class="name">${list.userName }</td>
									<td class="pnum">${list.phone }</td>
									<td class="mail">${list.email }</td>
									<td class="addre">${list.address }</td>
						</tr>
					</table>
				</c:if>
			</c:if>
		</div>
		<div class=row>
			<c:if test="${empty userList}">
      <h2>등록 된 회원이 없습니다.</h2>
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
									<td><input type="checkbox" name="selectChk" id="item"
										value="${list.userNo }" /></td>
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
	<form id="adminuser">
	<div class="adFrmDiv">
	<button class="deletebtn" type="button" id="delete_btn">회원탈퇴</button>
	</div>
	</form>
	<div class="page">
	${page}
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$(function(){
    var frm = document.getElementById("adminuser");
    var searchFrm = document.getElementById("searchIdFrm");


	$("#checkall").change(function(){
	    if($("#checkall").is(":checked")){
	     $("input[name='selectChk']").prop('checked', true);
	    }else{
	     $("input[name='selectChk']").prop('checked', false);
	    }
	});
	
	$("#list_normal").click(function(){  // TODO
		 $(".Keyword").val("");
		 location.href="searchUserId";
	});
     
	$(".deletebtn").click(function(){
        var checkVal = "";
        var result = confirm("정말 삭제하시겠습니까?");

        if(result) {
         $("input[name=selectChk]:checked").each(function(){
         checkVal = $(this).val(); 
         console.log("값" + checkVal);

             var checkValinput = "<input type='hidden' name='checkVal' value='"+checkVal+"'>";
             $(".adFrmDiv").prepend(checkValinput);
          
         });
        
        frm.action = "adminDelete.do";
        frm.method = "post";
        frm.submit();  
         } else {
            history.back();
         }
      }); 
	$(".admSearchBtn").click(function() {
		console.log("클릭눌렀음");


		if ($(".search_bar").val() == "") {
			alert("검색어가 없습니다.");
		} else {
			searchFrm.action = "searchUserId";
			searchFrm.method = "post";
			searchFrm.submit();
		}
	});
});

	
		   
	
	
</script>

</html>