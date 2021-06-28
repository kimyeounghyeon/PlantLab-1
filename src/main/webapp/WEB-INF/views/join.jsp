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
		<!-- 	<input id="idckeck" class="id_chk_re"
								type="button" value="중복확인" ">  -->
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
							<label for="address">우편번호</label>
					<input class="add_chk_re" type="button" value="우편번호찾기"
								id="add" onclick="execDaumPostcode();"> 
						</h3>
						 <input type="text" id="address"
							name="address" class="int" maxlength="16">
							<h3 class="join_title">
							<label for="address">주소</label>
						</h3>		
							 <input type="text" id="address2"
							name="address" class="int" maxlength="16">
							<h3 class="join_title">
							<label for="address">상세주소</label>
						</h3>		
							 <input type="text" id="address3"
							name="address" class="int" maxlength="16" placeholder="정확히 입력해주세요 ">
							
					</div>
					<!-- 가입 버튼  -->
					<button type="submit" value="회원가입" id="btn">회원가입</button>
				</form>
			</div>
		</div>
	   
	    	
	    
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address2').value = fullRoadAddr;
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>




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