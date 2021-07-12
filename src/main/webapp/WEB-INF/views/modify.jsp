<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/ModifyStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="mypagemenu.jsp"></jsp:include>
<body>

	<div class="joindiv">
		<div class="content">
			<div>
				<h1>개인 정보 수정</h1>
				<form id="frmEmp">
					<!-- ID -->
					<div class="form-group">
						<h3 class="join_title">
							<label for="userId">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" class="int" name="userId" id="userId"
							value="${loginMember.userId}" readonly="readonly">
						</span>
					</div>
					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for=userPwd>비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password" style="font-family: none;"
							id="userPwd" name="userPwd" class="int" maxlength="20"> <span
							id="alertTxt">사용불가</span>
						</span> <span class="error_next_box"></span>
						<div class="check_font" id="pass_check"></div>
					</div>


					<!-- PW2 -->
					<div>
						<h3 class="join_title">
							<label for="userPwd2">비밀번호 재확인</label>
						</h3>
						<span class="box int_pass_check"> <input type="password" style="font-family: none;"
							id="userPwd2" name="userPwd2" class="int" maxlength="20">
						</span> <span class="error_next_box"></span> <span id="alert-success"
							style="display: none; color: blue;">비밀번호가 일치합니다.</span> <span
							id="alert-danger" style="display: none; color: red;">비밀번호가
							일치하지 않습니다.</span>
						<div class="check_font" id="passre_check"></div>
					</div>
					<!-- NAME -->
					<div>
						<h3 class="join_title">
							<label for="userName">이름</label>
						</h3>
						<span class="box int_name"> <input type="text" class="int"
							value="${loginMember.userName}" readonly="readonly">
						</span>
					</div>

					<!-- EMAIL -->

					<div>
						<h3 class="join_title_email">
							<label for="email">이메일</label>
						</h3>
						<span class="box mail_input_box"><input type="text"
							class="int" value="${loginMember.email}" readonly="readonly">
						</span>

					</div>


					<!-- MOBILE -->
					<div>
						<h3 class="join_title">
							<label for="phone">휴대전화</label>
						</h3>
						<span class="box int_mobile"> <input type="tel" id="phone"
							name="phone" class="int" maxlength="16" placeholder="숫자만 입력해주세요 ">
						</span> <span class="error_next_box"></span>
						<div class="check_font" id="pnum_check"></div>
					</div>
					<!-- address -->
					<div>
						<h3 class="join_title">
							<label for="address">우편번호</label> <input class="add_chk_re"
								type="button" value="우편번호찾기" id="add"
								onclick="execDaumPostcode();">
						</h3>
						<span class="box int_address"> <input type="number"
							id="address" name="address" class="int" maxlength="8">
						</span>
						<h3 class="join_title">
							<label for="address">주소</label>
						</h3>
						<span class="box int_address"> <input type="text"
							id="address2" name="address" class="int" maxlength="16">
						</span>
						<h3 class="join_title">
							<label for="address">상세주소</label>
						</h3>
						<span class="box int_address"> <input type="text"
							id="address3" name="address" class="int" maxlength="16"
							placeholder="정확히 입력해주세요 ">
						</span>
					</div>
					<!-- 가입 버튼  -->
					<button type="submit" value="정보수정" id="btn" onclick="onBlurId();">정보수정</button>
				</form>
			</div>
		</div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include> 	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var afterValidIdCheck = "";
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('address').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address2').value = fullRoadAddr;
				document.getElementById('address2').focus();
			}
		}).open();
	}

	var pwJ = /^[A-Za-z0-9]{4,12}$/; // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호
	// 비밀번호 재확인	
	var pwreJ = /^[A-Za-z0-9]{4,12}$/; // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호

	var phoneJ = /^[0-9]{9,11}$/;

	// 비밀번호
	$('#userPwd').blur(function() {
		if (pwJ.test($(this).val())) {
			console.log(pwJ.test($(this).val()));
			$("#pass_check").text('');
		} else {
			$('#pass_check').text('비밀번호는 영문+숫자 4~12자리로 설정가능합니다.');
			$('#pass_check').css('color', 'red');
		}
	});

	// 비밀번호 확인
	$('#userPwd2').focusout(function() {
		var pwd1 = $("#userPwd").val();
		var pwd2 = $("#userPwd2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block', 'red');
			}
		}
	});

	// 휴대전화
	$('#phone').blur(function() {
		if (phoneJ.test($(this).val())) {
			console.log(phoneJ.test($(this).val()));
			$("#pnum_check").text('');
		} else {
			$('#pnum_check').text('휴대폰번호를 확인해주세요.');
			$('#pnum_check').css('color', 'red');
		}
	});

	$("#btn").click(function() {

				var inval_Arr = new Array(2).fill(false);

				// 비밀번호가 같은 경우 && 비밀번호 정규식
				if (($('#userPwd').val() == ($('#userPwd2').val()))
						&& pwJ.test($('#userPwd').val())) {
					inval_Arr[0] = true;
				} else {
					inval_Arr[0] = false;
				}
				// 휴대폰번호 정규식
				if (phoneJ.test($('#phone').val())) {
					console.log(phoneJ.test($('#phone').val()));
					inval_Arr[1] = true;
				} else {
					inval_Arr[1] = false;
				}
				var validAll = true;
				for (var i = 0; i < inval_Arr.length; i++) {

					if (inval_Arr[i] == false) {
						validAll = false;
					}
				}

				if (validAll) {
					alert('정보수정 완료 다시 로그인 해주세요!');

					var frm = document.getElementById("frmEmp");
					frm.action = "doUpdate";
					frm.method = "post";
					frm.submit();

				} else {
					alert('입력한 정보들을 다시 한번 확인해주세요. ')
				}

			});
	
	    
	


	
</script>
	</body>
</html>
