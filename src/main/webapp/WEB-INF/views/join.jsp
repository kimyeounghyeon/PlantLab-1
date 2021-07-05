<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 join</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/joinStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
	<jsp:include page="header.jsp"></jsp:include>
<body>

	<div class="joindiv">
		<div class="content">
			<div>
				<h1>JOIN</h1>
				<form id="frmEmp">
					<!-- ID -->
					<div class="form-group">
						<h3 class="join_title">
							<label for="userId">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" id="userId"
							name="userId" class="int" maxlength="20" onblur="onBlurId()">
						</span> <span class="error_next_box"></span>

						<div class="check_font" id="id_check"></div>
					</div>
					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for=userPwd>비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password"
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
						<span class="box int_pass_check"> <input type="password"
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
						<span class="box int_name"> <input type="text"
							id="userName" name="userName" class="int" maxlength="20">
						</span> <span class="error_next_box"></span>
						<div class="check_font" id="name_check"></div>
					</div>

					<input type="hidden" id="isValidIdCheck" value="false">
					<!-- EMAIL -->

					<div>
						<h3 class="join_title_email">
							<label for="email">본인 확인 이메일</label>
						</h3>
						<span class="box mail_input_box"><input class="mail_input"
							id="emailint" name="email" ></span>
					
						<h3 class="join_title">
							<label for="email">인증번호입력</label> <input
								class="mail_check_button" type="button" value="인증번호버튼" >
						</h3>
						<span class="mail_check_wrop" id="mail_check_input_box_false"><input
							class="mail_check_input" id="emailint2" disabled="disabled" placeholder="본인인증 확인을 해주세요 " ></span>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
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
			<button type="submit" value="회원가입" id="btn">회원가입</button>
			</form>
		</div>
	</div>
	




	<%-- <jsp:include page="footer.jsp"></jsp:include>  --%>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var code = "";

		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {

			var email = $(".mail_input").val(); // 입력한 이메일
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
                     alert("인증번호가 발송되었습니다. ")
					//console.log("data : " + data);
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;

				}

			});

		});

		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과    

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				checkResult.css("color","blue");
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				checkResult.css("color","red");
			}

		});

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

		// 모든 공백 체크
		var empJ = /\s/g;
		// 아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/; // a~z, 0~9로 시작하는 4~12자리 아이디
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호
		// 비밀번호 재확인	
		var pwreJ = /^[A-Za-z0-9]{4,12}$/; // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/; // 가~힣, 2-6 자리 한글로만 이루어진 문자
		// 휴대폰 번호 정규식
		var phoneJ = /^[0-9]{9,11}$/;

		// 아이디
		$('#userId').blur(function() {

			if (idJ.test($(this).val())) {
				console.log(idJ.test($(this).val()));
				$("#id_check").text('');
			} else {
				$('#id_check').text('아이디는 영문+숫자 4~12자리로 설정가능합니다.');
				$('#id_check').css('color', 'red');
			}
		});

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

		// 이름에 특수문자 들어가지 않도록 설정
		$("#userName").blur(function() {
			if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
			} else {
				$('#name_check').text('2~6자리 한글만 가능합니다.');
				$('#name_check').css('color', 'red');
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

		// 회원가입 버튼클릭시 이벤트
		$("#btn").click(
				function() {

					var inval_Arr = new Array(4).fill(false);

					// 비밀번호가 같은 경우 && 비밀번호 정규식
					if (($('#userPwd').val() == ($('#userPwd2').val()))
							&& pwJ.test($('#userPwd').val())) {
						inval_Arr[0] = true;
					} else {
						inval_Arr[0] = false;
					}
					// 이름 정규식
					if (nameJ.test($('#userName').val())) {
						inval_Arr[1] = true;
					} else {
						inval_Arr[1] = false;
					}

					// 휴대폰번호 정규식
					if (phoneJ.test($('#phone').val())) {
						console.log(phoneJ.test($('#phone').val()));
						inval_Arr[2] = true;
					} else {
						inval_Arr[2] = false;
					}
					if($('#emailint').val() == null){
						alert("이메일을 확인해주세요");
						inval_Arr[3] = false;
					} else{
						inval_Arr[3] = true;
					}

					var validAll = true;
					for (var i = 0; i < inval_Arr.length; i++) {

						if (inval_Arr[i] == false) {
							validAll = false;
						}
					}

					var curUserId = $("#userId").val();
					if (afterValidIdCheck != curUserId) {
						alert("아이디를 확인해주세요.");
						$("#userId").focus();
						return false;
					}

					if (validAll) {
						alert('무이림 가입을 축하드립니다!');

						var frm = document.getElementById("frmEmp");
						frm.action = "doJoin";
						frm.method = "post";
						frm.submit();

					} else {
						alert('입력한 정보들을 다시 한번 확인해주세요. ')
					}

				});

		function onBlurId() {
			$.ajax({
				url : 'isValidId',
				type : 'POST',
				data : {
					userId : $("#userId").val()
				},
				success : function(result) {
					if (result == "true") {
						// 아이디가 중복됩니다. 출력
						$("#id_check").text("아이디가 중복됩니다.");
						afterValidIdCheck = "";
					} else {
						$("#id_check").text("사용가능한 아이디입니다.");
						$('#id_check').css('color', 'blue');
						$("#isValidIdCheck").val("true");
						afterValidIdCheck = $("#userId").val();
					}
				}
			});

		}
	</script>

</body>

</html>