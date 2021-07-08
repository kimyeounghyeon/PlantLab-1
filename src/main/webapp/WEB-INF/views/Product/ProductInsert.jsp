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
			
			<!-- 상품등록 -->
			<c:if test="${check eq 'new' }">
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
			</c:if>
			
			<!-- 상품수정 -->
			<c:if test="${check eq 'mod' }">
				<div class="main_header">
					<h1 class="title">상품 수정</h1>
				</div>
				
				<div class="addPro">
					<form enctype="multipart/form-data">
						<input type="hidden" value="${pro.pro_no}" name="pro_no">
						<table class="proT">
							<tr>
								<td class="proGuide">
									<p>카테고리</p>
								</td>
							</tr>
							
							<tr>
								<input type="hidden" value="${pro.pro_cate}" name="cate">
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
								<td><input type="text" value="${pro.pro_name}" name="pro_name"></td>
							</tr>
	
							<tr>
								<td class="proGuide">
									<p id="proI">상품 썸네일</p>
								</td>
							</tr>
							<tr>
								<td class="thum">
									<input type="hidden" value="${pro.pro_image}" name="pro_image">
									<img src="${pro.pro_image}" style="width:50px" id="imgThum">
	                        		<button type="button" id="imgThumB">삭제</button>
	                        		<br>
								</td>
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
										
										<div class="fileList">
											<c:if test="${not empty proD}">
					                        	<c:forEach var="vo" items="${proD}" varStatus="status">
					                        		<img src="${vo.pro_detail}" style="width:50px" id="img${status.index}">
					                        		<button type="button" class="delProD" id="${status.index}">삭제</button>
					                        		<br>
					                        	</c:forEach>
				                        	</c:if>
										</div>
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
									<input type="hidden" value="${pro.pro_price}" name="pro_price">
								</td>
							</tr>
	
							<tr>
								<td class="proGuide">
									<p id="proS">재고 수량</p>
								</td>
							</tr>
							<tr>
								<td><input type="text" value="${pro.pro_stock}" name="pro_stock"></td>
							</tr>
	
							<tr>
								<td class="btn">
									<button type="button" class="modyBtn">수정</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	//수정하기 이미지 삭제 ajax
	var pro_no = $('input[name=pro_no]').val();
	var imgSrc = $('input[name=pro_image]');
	var delProD = $('.delProD');
	var imgThumB = $('#imgThumB');
	var id = '';
	var src = '';
	
	//섬네일 삭제
	imgThumB.click(function(){
		var thum = $('.thum');
		imgSrc.val('del');
		thum.empty();
		thum.append("<input type=\"file\" name=\"pro_img\">");
	});
	
	//상세삭제
	delProD.click(function(){
		id = $(this).attr('id');
		console.log("id:::"+id);
		
		src = $('#img'+id).attr("src");
		console.log("src:::"+src);
		$.ajax({
			url:"imgDel.do",
			data : {pro_no : pro_no,
				pro_detail : src},
			type:"post",
			dataType : "json",
			success:function(data){
	           var fileList = $('.fileList');
	           fileList.empty();
	           
               var html = "";
               $.each(data, function(i, item){
            	    html += "<img src='"+item+"' style=\"width:50px\" id=\"img+${status.index}\">";
            	    html += "<button type=\"button\" class=\"delProD\" id=\"${status.index}\">삭제</button>";
           			html += "<br>";
               });
               
               fileList.append(html);
			},
			error : function(request, status, errorData){ 
				
			}
		}); 
	});

	
	//이미지 업로드
	var fileAdd = $('#fileAdd');
	var cnt = 0;
	
	var id = 0;
	fileAdd.click(function(){
		cnt += 1;
		var html = "<br><label class=\"labels\" for=\""+cnt+"\">파일 추가</label>";
		html += "<input multiple=\"multiple\" id=\""+cnt+"\" type=\"file\" name=\"pro_details\" />";
		html += "<input class=\"upload-name\" id=\"in"+cnt+"\" value=\"파일선택\"><br>";
		$(".fileList").append(html);
		
		$(".labels").click(function(){
			id = $(this).attr('for');
			console.log('id11::'+id);
			

			$('#'+id).on('change',function(){
				console.log('id33::'+id);
				 var fileName = $('#'+id).val();
				 $("#in"+id).val(fileName);
			});
		});
		
		
	});

	//유효성검사
	var addBtn = $('.addBtn');
	var check = [ 0, 0, 0 ];

	var cate = $('input[name=cate]').val();
	var pro_cate = $('select');
	
	pro_cate.val(cate).prop("selected",true);
	
	
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
	
	var pv = proPSubmit.val();
	pv = pv.substring(0,pv.indexOf('원'));
	pv = pv.replace(',','');
	pro_price.val(pv);
	
	pro_price.focusout(function() {
		if (isNaN(pro_price.val())) {
			$(this).focus();
			proP.html("판매가 : 숫자만 가능합니다.");
			proP.css("color", "red");
			check[1] = 0;
		} else {
			proP.html("판매가");
			proP.css("color", "black");
			
			if (pro_price.val().length > 6) {
				$(this).focus();
				proP.html("판매가 : 최대 999,999원까지 가능합니다.");
				proP.css("color", "red");
				pro_price.val(pro_price.val().substr(0,6));
				check[1] = 0;
			} else {
				proP.html("판매가");
				proP.css("color", "black");
				var pv = pro_price.val();
				pv =  pv.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				proPSubmit.val(pv+"원");
				check[1] = 1;
			}
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

	//수정하기 버튼 클릭시
	$('.modyBtn').click(function() {
		//상품 썸네일 체크
		if(imgSrc.val() != 'del'){
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
		    	form.attr("action","proModi");
		    	form.submit();
				
			} else {
				swal("다시 확인해주세요.");
			}
		}else{
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
			    	form.attr("action","proModi");
			    	form.submit();
				} else {
					swal("다시 확인해주세요.");
				}
			}
		}
	});
	
	//추가하기 버튼 클릭시
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