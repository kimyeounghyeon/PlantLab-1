<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품등록</title> <
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Product/ProductInsertStyle.css"
	rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
	<div id="content" class="contents">
		<section id="main_section">
			<!-- Store 제목 -->
			<div class="main_header">
				<h1 class="title">상품 등록</h1>
			</div>

			<div class="addPro">
				<form enctype="multipart/form-data">
					<table class="proT">
						<tr>
							<td class="proGuide">
								<p>카테고리</p>
							</td>
						</tr>
						
						<tr>
							<td><select name="pro_cate">
									<option value="p">식물</option>
									<option value="c">화분</option>
									<option value="g">소품</option>
							</select></td>
						</tr>

						<tr>
							<td class="proGuide">
								<p id="proN">상품명</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" value="" name="pro_name"></td>
						</tr>

						<tr>
							<td class="proGuide">
								<p id="proI">상품 썸네일</p>
							</td>
						</tr>
						<tr>
							<td><input type="file" name="pro_img"></td>
						</tr>

						<tr>
							<td class="proGuide">
								<p>상품상세</p>
							</td>
						</tr>
						<tr>
							<td>
								<div class="files">
									<button type="button" id="fileAdd">이미지 추가</button>
									<div class="fileList"></div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="proGuide">
								<p id="proP">판매가</p>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" value="" id="proInput">
								<input type="hidden" value="" name="pro_price">
							</td>
						</tr>

						<tr>
							<td class="proGuide">
								<p id="proS">재고 수량</p>
							</td>
						</tr>
						<tr>
							<td><input type="text" value="" name="pro_stock"></td>
						</tr>

						<tr>
							<td class="btn">
								<button type="button" class="addBtn">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	//이미지 업로드
	var fileAdd = $('#fileAdd');

	fileAdd
			.click(function() {
				var html = "<input multiple=\"multiple\" type=\"file\" name=\"pro_details\" /><br>";
				$(".fileList").append(html);
			});

	//유효성검사
	var addBtn = $('.addBtn');
	var check = [ 0, 0, 0 ];

	//상품명
	var pro_name = $('input[name=pro_name]');
	var proN = $('#proN');
	pro_name.focusout(function() {
		if (pro_name.val().length > 33) {
			$(this).focus();
			proN.html("상품명 : 33자를 초과할 수 없습니다.");
			proN.css("color", "red");
			pro_name.val(pro_name.val().substr(0, 33));
			check[0] = 0;
		} else {
			proN.html("상품명");
			proN.css("color", "black");
			check[0] = 1;
		}
	});

	//판매가
	var pro_price = $('#proInput');
	var proP = $('#proP');
	var proPSubmit = $('input[name=pro_price]');
	pro_price.focusout(function() {
		if (isNaN(pro_price.val())) {
			$(this).focus();
			proP.html("판매가 : 숫자만 가능합니다.");
			proP.css("color", "red");
			check[1] = 0;
		} else {
			proP.html("판매가");
			proP.css("color", "black");
			
			var pv = pro_price.val();
			pv =  pv.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			proPSubmit.val(pv+"원");
			
			check[1] = 1;
		}
	});

	//재고수량
	var pro_stock = $('input[name=pro_stock]');
	var proS = $('#proS');
	pro_stock.focusout(function() {
		if (isNaN(pro_stock.val())) {
			$(this).focus();
			proS.html("재고 수량 : 숫자만 가능합니다.");
			proS.css("color", "red");
			check[2] = 0;
		} else {
			proS.html("재고 수량");
			proS.css("color", "black");

			if (pro_stock.val().length > 2) {
				$(this).focus();
				proS.html("재고 수량 : 최대 99개까지 가능합니다.");
				proS.css("color", "red");
				pro_stock.val(pro_stock.val().substr(0, 2));
				check[2] = 0;
			} else {
				proS.html("재고 수량");
				proS.css("color", "black");
				check[2] = 1;
			}

		}
	});

	addBtn.click(function() {
		//상품 썸네일 체크
		var pro_image = $('input[name=pro_img]').val();
		var proI = $('#proI');

		if (!pro_image) {
			proI.html("상품 썸네일 : 사진을 필수로 첨부해야합니다.");
			proI.css("color", "red");
		} else {
			proI.html("상품 썸네일");
			proI.css("color", "black");

			//유효성검사체크
			var input = $('input[type=text]');
			var result = 0;

			for (var i = 0; i < check.length; i++) {
				if (check[i] == 0) {
					swal("다시 확인해주세요.");
					result = 0;
					break;
				} else {
					result = 1;
				}
			}

			//빈값체크
			if (result == 1) {
				for (var i = 0; i < input.length; i++) {
					if (input[i].value == "" || input[i].value == null) {
						result = 0;
						break;
					} else {
						result = 2;
					}
				}
			}

			//결과
			if (result == 2) {
				var form = $('form');
				
				form.attr("method","post");
		    	form.attr("action","proInsert");
		    	form.submit();	
			} else {
				swal("다시 확인해주세요.");
			}
		}
	});
</script>
</html>