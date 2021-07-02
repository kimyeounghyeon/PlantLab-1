<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>無以林 주문</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
	<link href="${path}/resources/css/header.css" rel="stylesheet"/>
	<link href="${path}/resources/css/Product/OrderStyle.css" rel="stylesheet"/>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include><%--  --%>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林</h1>
            </div>

            <article class="main_article">
            <form class="orderer">        	
                <div class="order">
                    <h3>주문상세내역</h3>
                    <table class="orderList">
                    	<c:if test="${not empty oneRsVo}">
                    		<input type="hidden" name="rsCheck" value="rs">
                    		<tr>
	                            <td class="proImg" rowspan="2">
	                                <img src="${pageContext.request.contextPath}/resources/img/${oneRsVo.oneday_img}">
	                            </td>
	                            <td class="space" rowspan="2"></td>
	                            <td class="proName">
	                                <p>${oneRsVo.oneday_title}</p>
	                                <input type="hidden" name="oneday_no" value="${oneRsVo.oneday_no}">
	                                <input type="hidden" name="oneday_request" value="${oneRsVo.oneday_request}">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="priceGuide">
	                                <p class="proNum guide">1 </p>개 /
	                                <p class="proPri guide"></p>
	                                <input type="hidden" value="${oneRsVo.oneday_price}" class="voPrice">
	                            </td>
	                        </tr>
                    	</c:if>
                    	
                    	
                    	<c:if test="${not empty cartList and empty oneRsVo}">
                    	<input type="hidden" name="rsCheck" value="ca">
                    	<c:forEach  var="vo" items="${cartList}" varStatus="status">
                    		 <tr>
	                            <td class="proImg" rowspan="2">
	                                <img src="${vo.pro_image}">
	                            </td>
	                            <td class="space" rowspan="2"></td>
	                            <td class="proName">
	                                <p>${vo.pro_name}</p>
	                                <input type="hidden" name="pro_no" value="${vo.pro_no}">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="priceGuide">
	                                <p class="proNum guide">${vo.pro_cnt} </p>개 /
	                                <p class="proPri guide"></p>
	                                <input type="hidden" value="${vo.pro_cnt}" name="pro_num">
	                                <input type="hidden" value="${vo.pro_price}" class="voPrice">
	                            </td>
	                        </tr>
                    	</c:forEach>
                    	</c:if>
                    	
                    	<c:if test="${cartList eq null and empty oneRsVo}">
                    	<input type="hidden" name="rsCheck" value="ca">
                    		<tr>
	                            <td class="proImg" rowspan="2">
	                                <img src="${proList.pro_image}">
	                            </td>
	                            <td class="space" rowspan="2"></td>
	                            <td class="proName">
	                                <p>${proList.pro_name}</p>
	                                <input type="hidden" name="pro_no" value="${proList.pro_no}">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="priceGuide">
	                                <p class="proNum guide">${cart.pro_cnt}</p>개 /
	                                <p class="proPri guide"></p>
	                                <input type="hidden" value="${cart.pro_cnt}" name="pro_num">
	                                <input type="hidden" value="${proList.pro_price}" class="voPrice">
	                            </td>
	                        </tr>
                    	</c:if>
                    </table>
                    
                    
                    <c:if test="${empty oneRsVo }">
                    <div class="allPriceGuide">
                        <p class="guide">
                            <span>상품총가</span> 
                            <span></span>
                            <span>배송비</span> 
                            <span></span>
                            <span>총금액</span>
                        </p>
                       <p>
                           <span id="price" class="prSpan"></span> 
                           <span>+</span> 
                           <span id="deliv" class="prSpan"></span> 
                           <span>=</span> 
                           <span id="allPrice"></span>
                           <input type="hidden" name="buy_totalprice" value="">
                           <input type="hidden" class="inputV" id="priceIn" value="${total}">
                           <input type="hidden" class="inputV" id="delivIn" value="${deliv}">
                        </p>
                    </div>
                    </c:if>
                    
                    <c:if test="${not empty oneRsVo }">
                    <div class="allPriceGuide">
                        <p class="guide">
                            <span>상품총가</span> 
                            <span></span>
                            <span>배송비</span> 
                            <span></span>
                            <span>총금액</span>
                        </p>
                       <p>
                           <span id="price" class="prSpan"></span> 
                           <span>+</span> 
                           <span id="deliv" class="prSpan"></span> 
                           <span>=</span> 
                           <span id="allPrice"></span>
                           <input type="hidden" class="inputV" id="priceIn" value="${oneRsVo.oneday_price}">
                           <input type="hidden" class="inputV" id="delivIn" value="0">
                        </p>
                    </div>
                    </c:if>
                </div>

                <div class="order order2">
                    <h3>주문자 정보</h3>
                        <table border="1" class="orderT">
                            <tr>
                                <td><span>주문하시는 분</span></td>
                                <td>
                                	<input type="text" class="info" name="user_name" value="${user.userName}" readonly>
                                	<input type="hidden" name="user_no" value="${user.userNo}" readonly>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><span>연락처</span></td>
                                <td>
                                    <input type="text" class="info phone"   name="phone" value="${user.phone}">
                                    <span class="alert"><p>숫자만 입력해주세요.<p></span>
                                </td>
                            </tr>
                            <tr>
                                <td><span>이메일</span></td>
                                <td><input type="text" class="info" name="buy_email" value="${user.email}"></td>
                            </tr>
                        </table>
                    <br><br>
                    
                    <h3>배송정보</h3>
                    <label class="checkContain">
                        <input type="checkbox" name="prock">
                        <span class="checkmark"></span>
                        <span>주문자와 동일</span>
                    </label>
                        <table border="1" class="orderT">
                            <tr>
                                <td><span>받는분</span></td>
                                <td><input type="text" class="info" name="buy_rc_name"></td>
                            </tr>
                            <tr>
                                <td><span>주소</span></td>
                                <td>
                                	<input type="text" class="info" id="sample6_postcode" placeholder="우편번호">
                                    <button type="button"id="addB">우편번호 찾기</button><br>
                                    <input type="text" class="info" id="sample6_address" placeholder="주소"><br>
                                    <input type="text" class="info"  id="sample6_detailAddress" placeholder="상세주소">
                                    <input type="text" class="info" id="sample6_extraAddress" placeholder="참고항목">
                                    <br><input type="hidden" name="buy_rc_address" value="">
                                </td>
                            </tr>
                            <tr>
                                <td><span>연락처</span></td>
                                <td>
                                    <input type="text" class="info phone" name="buy_rc_phone">
                                    <span class="alert"><p>숫자만 입력해주세요.<p></span>
                                </td>
                            </tr>
                            <tr>
                                <td><span>배송 시 요청사항</span></td>
                                <td><input type="text" class="info" name="buy_requests" value="없음"></td>
                            </tr>
                        </table>
                    <br><br>

                    <h3>결제정보</h3>
                        <table border="1" class="orderT">
                            <tr>
                                <td><span>상품합계</span></td>
                                <td><input type="text" class="proInfo" readonly></td>
                            </tr>
                            <tr>
                                <td><span>배송비</span></td>
                                <td>
                                    <input type="text" class="proInfo" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td><span>결제금액</span></td>
                                <td><input type="text" class="proInfo" readonly></td>
                            </tr>
                        </table>
                    <br><br>

                    <h3>결제수단/결제</h3>
                    
                        <table border="1" class="orderT">
                            <tr>
                                <td><span>결제방법</span></td>
                                <td id="paymentMethod">
                                    <div>
                                        <input type="radio" name=buy_paymentmethod value="card" id="card" checked>
                                        <label for="card">신용/체크카드</label>
                                        <br>
                                       
                                        <input type="radio" name="buy_paymentmethod" value="phone" id="phone">
                                        <label for="phone">휴대폰결제</label>
                                        <br>
                                         
                                        <input type="radio" name="buy_paymentmethod" value="trans" id="bank">
                                        <label for="bank">계좌이체</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="buy_paymentmethod" value="vbank" id="virtual">
                                        <label for="virtual">가상계좌</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    <div id="checkInfo">
                        <input type="checkbox" id="infock" >
                        <label for="infock">상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                    </div>
                    <div id="buyB">
                        <button type="button" id="buyBtn">결제하기</button>
                    </div>
                </div>
                
                </form>
            </article>
        </section>
    </div>
</body>
<script>
	$(function(){
		//유효성검사
		var phoneJ = /^[0-9]{9,11}$/;
		
		var phoneInput = $(".phone");
		phoneInput.focusout(function(){
			 if(!phoneJ.test($(this).val())){
                 console.log('형식에 맞지 않습니다.');
                 var text = $(this).next().find('p');
                 text.css("color","red");
                 $(this).focus();
                 console.log("3::"+text.css("color"));
             }else{
                 console.log('사용가능합니다.');
             }
             
			console.log(phoneJ.test($('#phone').val()));
			
		});
		
		
		
		//주문자 체크박스
		var prock = $('input[name=prock]');
		prock.click(function(){
			if(prock.prop('checked')){
				$('input[name=buy_rc_name]').val($('input[name=user_name]').val());
				$('input[name=buy_rc_phone]').val($('input[name=phone]').val());
			}			
		})
		
		//버튼 클릭시 체크박스 여부
		var buyBtn = $('#buyBtn');
		var infock = $('#infock');
		var orderer = $('.orderer');
		var saveTotal;
		var buy_rc_address = $('input[name=buy_rc_address]');
		var payCheck = false;
		
		buyBtn.click(function(){
			if(!infock.prop('checked')){
				swal("구매진행에 동의해주세요","", "info");
			}else{
				var check = false;
				
				for(var i=0; i<$('.info').length;i++){
					console.log("사이즈:"+$('.info').length);
					
					if($('.info')[i].value == ""){
						//console.log(i+"번 빈칸ㅇㅇ");
						check = false; break;
					}else{
						//console.log(i+"번 빈칸ㄴ");
						check = true;
					} 
				}
				
				if(!check){
					swal("빈칸없이 값을 입력해주세요","", "info");
				} else{
					var saveA = buy_rc_address.val();
					saveA += " "+$('#sample6_detailAddress').val();
					buy_rc_address.val(saveA);
					
					var method=$("input:radio[name='buy_paymentmethod']:checked").val();
					
					if(method == 'deposit'){
						
					}else{
						iamport(method);
					}
				}
			}
		});
		
		
		//상품목록 금액계산
		var voPrice = $('.voPrice');
		var proNum = $(".proNum");
		var proPri = $(".proPri");
		var proInfo = $(".proInfo");
		
		
		if(voPrice.val().indexOf('원') != -1){
			console.log("숫자아님~");
			for(var i = 0; i < voPrice.length; i++){
		        var val = voPrice[i].value;
		        
		        val = val.substring(0,val.indexOf('원'));
		    	val = val.replace(',','');
		    	
		        var num = proNum[i].textContent;
		        val = val*num;
		        
		        val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		         
		        
		        proPri[i].append(val+"원");
		    }//금액계산
		}else{
			console.log("숫자임~");
			var text = voPrice.val();
			text =  text.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			proPri[0].append(text+"원");
		}
		
	    
	    //총금액 계산
		var inputV = $('.inputV');
	    var prSpan = $('.prSpan');
	    var allPrice = $('#allPrice');
	    
		
	    var vals = (inputV[0].value*1) + (inputV[1].value*1);
	    saveTotal = vals;
	    var buy_totalprice = $('input[name=buy_totalprice]');
	    vals =  vals.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   
	    proInfo[2].value = vals+"원";
	    buy_totalprice.val(vals+"원");
    	allPrice.append(vals+"원");
	    
	    for(var i=0; i<inputV.length; i++){
	    	var val = inputV[i].value;
	    	
	    	val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    	
	    	proInfo[i].value = val+"원";
	    	prSpan[i].append(val+"원");
	    }
	    
	    //주소API
	    var addB = $('#addB');
	    addB.click(function(){
	    	new daum.Postcode({
	            oncomplete: function(data) {
	            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	                
	                buy_rc_address.val("("+data.zonecode+")"+addr);
	            }
	        }).open();
	    });
	    
	    
	    //결제API
	    var rsCheck = $("input[name=rsCheck]").val();
	    var proName = $(".proName p");
	    var proNameR;
	    
	    if(proName.length>1){
	    	proNameR = proName[0].innerHTML + " 외 " + (proName.length-1) ;
	    }else{
	    	proNameR = proName.text();
	    }
	    
	    
	    function iamport(method){
	    	//가맹점 식별코드
			IMP.init('imp77086696');
			IMP.request_pay({
			    pg : '이니시스',
			    pay_method : method,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : proNameR, //결제창에서 보여질 이름
			    amount : saveTotal, //실제 결제되는 가격
			    buyer_email : $('input[name=buy_email]').val(),
			    buyer_name : $('input[name=user_name]').val(),
			    buyer_tel : $('input[name= phone]').val(),
			    buyer_addr : $('input[name=buy_rc_address]').val().substring(1,$('input[name=buy_rc_address]').val().lastIndexOf(")")),
			    buyer_postcode : $('input[name=buy_rc_address]').val().substring($('input[name=buy_rc_address]').val().lastIndexOf(")")+1)
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         
			        swal({
				        title: "오류!",
				        text: msg,
				        icon: "info",
				        buttons: "확인"
					}).then(function(){
						  payCheck = true;
					});
			    }
			    

				
				if(payCheck = true){
					console.log("진입~");
					var form = $('.orderer');
					if(rsCheck == 'ca'){
						form.attr("method","post");
			        	form.attr("action","orderInsert");
			        	form.submit();
					}else{
						form.attr("method","post");
			        	form.attr("action","onedayReserveF");
			        	form.submit();
					}
					
				};
			});
		} 
	});
</script>
</html>