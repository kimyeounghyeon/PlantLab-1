<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>無以林 주문</title>
	<link href="${path}/resources/css/OrderStyle.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%-- <jsp:include page="../header.jsp"></jsp:include> --%>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林</h1>
            </div>

            <article class="main_article">
                <div class="order">
                    <h3>주문상세내역</h3>
                    <table class="orderList">
                    	<c:forEach  var="vo" items="${cartList}" varStatus="status">
                    		 <tr>
	                            <td class="proImg" rowspan="2">
	                                <img src="${vo.pro_image}">
	                            </td>
	                            <td class="space" rowspan="2"></td>
	                            <td class="proName">
	                                <p>${vo.pro_name}</p>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="priceGuide">
	                                <p class="proNum guide">${vo.pro_cnt} </p>개 /
	                                <p class="proPri guide"></p>
	                                <input type="hidden" value="${vo.pro_price}" class="voPrice">
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </table>
                    
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
                           <input type="hidden" class="inputV" id="priceIn" value="${total}">
                           <input type="hidden" class="inputV" id="delivIn" value="${deliv}">
                        </p>
                    </div>
                </div>

                <div class="order order2">
                    <h3>주문자 정보</h3>
                    <form class="orderer ord1">
                        <table border="1">
                            <tr>
                                <td><span>주문하시는 분</span></td>
                                <td><input type="text" readonly></td>
                            </tr>
                            <tr>
                                <td><span>연락처</span></td>
                                <td>
                                    <input type="text">
                                    <span class="alert">숫자만 입력해주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <td><span>이메일</span></td>
                                <td><input type="text"></td>
                            </tr>
                        </table>
                    </form>
                    <br><br>
                    
                    <h3>배송정보</h3>
                    <label class="checkContain">
                        <input type="checkbox" name="prock">
                        <span class="checkmark"></span>
                        <span>주문자와 동일</span>
                    </label>
                    <form class="orderer ord2">
                        <table border="1">
                            <tr>
                                <td><span>받는분</span></td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td><span>주소</span></td>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>
                            <tr>
                                <td><span>연락처</span></td>
                                <td>
                                    <input type="text">
                                    <span class="alert">숫자만 입력해주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <td><span>배송 시 요청사항</span></td>
                                <td><input type="text"></td>
                            </tr>
                        </table>
                    </form>
                    <br><br>

                    <h3>결제정보</h3>
                    <form class="orderer ord3">
                        <table border="1">
                            <tr>
                                <td><span>상품합계</span></td>
                                <td><input type="text" readonly></td>
                            </tr>
                            <tr>
                                <td><span>배송비</span></td>
                                <td>
                                    <input type="text" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td><span>결제금액</span></td>
                                <td><input type="text" readonly></td>
                            </tr>
                        </table>
                    </form>
                    <br><br>

                    <h3>결제수단/결제</h3>
                    <form class="orderer ord4">
                        <table border="1">
                            <tr>
                                <td><span>결제방법</span></td>
                                <td id="paymentMethod">
                                    <div>
                                        <input type="radio" name="payment" var="card" id="card" checked>
                                        <label for="card">신용/체크카드</label>
                                        <br>
                                        <input type="radio" name="payment" var="deposit" id="deposit">
                                        <label for="deposit">무통장입금</label>
                                        <br>
                                        <input type="radio" name="payment" var="phone" id="phone">
                                        <label for="phone">휴대폰결제</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="payment" var="bank" id="bank">
                                        <label for="bank">계좌이체</label>
                                        <br>
                                        <input type="radio" name="payment" var="virtual" id="virtual">
                                        <label for="virtual">가상계좌</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div id="checkInfo">
                        <input type="checkbox" id="infock" >
                        <label for="infock">상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                    </div>
                    <div id="buyB">
                        <button type="button" id="buyBtn">결제하기</button>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>
<script>
	$(function(){
		//상품목록 금액계산
		var voPrice = $('.voPrice');
		var proNum = $(".proNum");
		var proPri = $(".proPri");
		
		for(var i = 0; i < voPrice.length; i++){
	        var val = voPrice[i].value;
	        
	        val = val.substring(0,val.indexOf('원'));
	    	val = val.replace(',','');
	      
	        var num = proNum[i].textContent;
	        val = val*num;
	        
	        val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	         
	        proPri[i].append(val+"원");
	    }//금액계산
	    
	    //총금액 계산
		var inputV = $('.inputV');
	    var prSpan = $('.prSpan');
	    var allPrice = $('#allPrice');
	    
	    var val = (inputV[0].value*1) + (inputV[1].value*1);
	    val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	allPrice.append(val+"원");
	    
	    for(var i=0; i<inputV.length; i++){
	    	var val = inputV[i].value;
	    	
	    	val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    	console.log("val확인:"+val);
	    	 
	    	prSpan[i].append(val+"원");
	    }
	});
</script>
</html>