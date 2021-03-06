<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 Admin OnedayClass</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/Oneday/OnedayAdmin.css" rel="stylesheet" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
			<div id="fullmainA">
			<div id="mainA">
	<div class="bgdiv">
		<h2 class="subtitle">클래스 관리</h2>
		<button id="oneAdBtn">클래스 등록</button>
		<button id="oneArBtn">클래스 삭제</button>

				<div class="dback">
					<c:forEach var="o" items="${one}" varStatus="status">

						<div class="onediv">
							<label class="checkContain"> 
							<input type="checkbox"
								name="test_check" value="${o.oneday_no}"> <span
								class="checkmark"></span>
							</label> <a href="${path}/onedayupdate?onedayNo=${o.oneday_no }">
								<table class="onecontent">
									<tr class="on omgtr">
										<td class="oneimg" id=${status.index } colspan="2"><img
											src="${o.oneday_img }" class="oneimg"></td>

									</tr>

									<tr class="on contextone">
										<td class="ocontext" colspan="2">${o.oneday_title }</td>

									</tr>
								</table> <input type="hidden" name="onedayNo" value="${o.oneday_no }">
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			//등록

			$("#oneAdBtn").click(function() {
				location.href = "${path}/onedayInsert"
			});

			//삭제

			$("#oneArBtn").click(function() {
				var checkArr = []; // 배열 초기화
				$("input[name='test_check']:checked").each(function(i) {
					checkArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
					console.log(checkArr); //check box 값 알기
				});
				var obj = new Object(); //check box  type 알기
				ch = Object.prototype.toString.call(checkArr);
				console.log(ch);
				var name = $("input[name=test_check]").val();

				var allData = {
					'checkArray' : checkArr
				};

				$.ajax({
					url : "${path}/onedaydelete",
					type : "GET",
					data : allData,
					async : false,
					success : function(data) {
						console.log('return checkbox value는  : ' + data);
						alert("클래스를 삭제 하시겠습니까?.");
						location.reload();
					},
					error : function(request) {

						alert("이미 예약된 클래스입니다\n삭제할 수 없습니다.");
					}
				/* 												error : function(request, status, error) {
								 alert("code = " + request.status
								 + " message = " + request.responseText
								 + " error = " + error); 								//  error 이유를 알 수 있는 코드  
								 }  */

				});

			});

		});
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>