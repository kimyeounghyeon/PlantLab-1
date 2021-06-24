<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>無以林 join</title>
<link href="${path}/resources/css/joinStyle.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="joindiv">
		<div class="content">
			<div>
				<h1>JOIN</h1>
				<form id="frmEmp">
					<!-- ID -->
					<div class="form-group">
						<h3 class="join_title">
							<label for="userId">아이디</label> 
						<!-- 	<input class="id_chk_re"
								type="button" value="중복확인" onclick="idCheck()"> -->
						</h3>
						<span class="box int_id"> <input type="text" id="userId"
							name="userId" class="int" maxlength="20">
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
						</span> <span class="error_next_box"></span>
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
					<!-- GENDER -->
		<!-- 			<div>
						<h3 class="join_title">
							<label for="grade">성별</label>
						</h3>
						<span class="box gender_code"> <input id="grade"
							name="grade" class="sel">

						</span> <span class="error_next_box">필수 정보입니다.</span>
						<div class="check_font" id="gender_check"></div>
					</div> -->
					<!-- EMAIL -->
					<div>
						<h3 class="join_title_email">
							<label for="email">본인 확인 이메일<span class="optional"></span></label>
							<!-- 						<input class="mail_chk_re" type="button" value="중복확인"
								onclick="mailCheck()"> -->
						</h3>
						<span class="box int_email"> <input type="text" id="email"
							name="email" class="int" maxlength="100" placeholder="이메일 ">
						</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
						<div class="check_font" id="mail_check"></div>
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
							<label for="address">주소</label>
						</h3>
						 <input type="text" id="address"
							name="address" class="int" maxlength="16">
					</div>
					<button type="submit" value="회원가입" id="btn">회원가입</button>
				</form>
			</div>
		</div>
	</div>


	<script>
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
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 가운데 @ 무조건 들어가야댐
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 

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
				$('#pnum_check').text('휴대폰번호를 확인해주세요');
				$('#pnum_check').css('color', 'red');
			}
		});

		// 이메일
		$('#email').blur(function() {
			if (mailJ.test($(this).val())) {
				console.log(mailJ.test($(this).val()));
				$("#mail_check").text('');
			} else {
				$('#mail_check').text('이메일주소를 확인해주세요');
				$('#mail_check').css('color', 'red');
			}
		});

	/* 	var idck = 0;
		$(function() {
			//idck 버튼을 클릭했을 때 
			$("#id_check").click(function() {

				//userid 를 param.
				var userid = $("#userId").val();

				$.ajax({
					async : true,
					type : 'POST',
					data : userId,
					url : "idcheck.do",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if (data.cnt > 0) {

							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
							$("#divInputId").addClass("has-error")
							$("#divInputId").removeClass("has-success")
							$("#userid").focus();

						} else {
							alert("사용가능한 아이디입니다.");
							//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
							$("#divInputId").addClass("has-success")
							$("#divInputId").removeClass("has-error")
							$("#userpwd").focus();
							//아이디가 중복하지 않으면  idck = 1 
							idck = 1;

						}
					},
					error : function(error) {

						alert("error : " + error);
					}
				});
			});
		}); */

		$(function() {

			$('#btn').click(function() {

				var check = DosignUp();
				if (check == true) {
					var frm = document.getElementById("frmEmp");
					frm.action = "doJoin";
					frm.method = "post";
					frm.submit();

				}
			});

			function DosignUp() {

				var userId = $("#userId").val();
				var userPwd = $("#userPwd").val();
				var userPwd2 = $("#userPwd2").val();
				var userName = $("#userName").val();

				if (userId.length == 0) {
					alert("아이디를 입력해 주세요");
					$("#userId").focus();
					return false;
				}

				if (userPwd.length == 0) {
					alert("비밀번호를 입력해 주세요");
					$("#userPwd").focus();
					return false;
				}

				if (userPwd != userPwd2) {
					alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
					$("#userPwd2").focus();
					return false;
				}

				if (userName.length == 0) {
					alert("이름을 입력해주세요");
					$("#userName").focus();
					return false;
				}
				if (confirm("회원가입을 하시겠습니까?")) {
					alert("회원가입을 축하합니다");
					return true;

				}

			}
		});
	</script>

</body>
</html>