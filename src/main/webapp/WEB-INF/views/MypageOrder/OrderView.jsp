<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>無以林 주문 상세 내역</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${path}/resources/css/OrderViewStyle.css"/>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">주문상세내역</h1>
            </div>

            <article class="main_article">
                

                <div>
                    <h3>주문 상세 내역</h3>
                    <table class="orderView" border="1">
                        <tr>
                            <td><span>주문번호</span></td>
                            <td><input type="text" id="orderNo" readonly value="${order.buy_no}"></td>
                        </tr>
                        <tr>
                            <td><span>주문일자</span></td>
                            <td><input type="text" id="orderDate" readonly value="${order.buy_date}"></td>
                        </tr>
                        <tr>
                            <td><span>주문자</span></td>
                            <td><input type="text" readonly value="${order.user_name}"></td>
                        </tr>
                        
                    </table>
                </div>
                <br><br><br>
                <div>
                    <h3>결제 정보</h3>
                    <table class="orderView" border="1">
                        <tr>
                            <td><span>총 주문 금액</span></td>
                            <td><input type="text" readonly value="${order.buy_totalprice}"></td>
                        </tr>
                        <tr>
                            <td><span>결제수단</span></td>
                            <td>
                            	<c:choose>
                            		<c:when test="${order.buy_paymentmethod eq 'card'}">
                            			<input type="text" readonly id="paymentV" value="신용/체크카드">
                            		</c:when>
                            		<c:when test="${order.buy_paymentmethod eq 'phone'}">
                            			<input type="text" readonly id="paymentV" value="휴대폰결제">
                            		</c:when>
                            		<c:when test="${order.buy_paymentmethod eq 'trans'}">
                            			<input type="text" readonly id="paymentV" value="계좌이체">
                            		</c:when>
                            		<c:otherwise>
                            			<input type="text" readonly id="paymentV" value="가상계좌">
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </table>
                </div>

                <br><br><br>
                <div>
                    <h3>주문 상품 정보</h3>
                    	<c:forEach var="vo" items="${detailList}" varStatus="status">
                    <c:if test="${vo.oneday_title == null}">
                    
                 		   <table class="orderList">
	                        <tr>
	                            <td class="proImg" rowspan="2">
	                               <a href="${path}/productView?proNo=${vo.pro_no}">
	                               		<img src="${vo.pro_image}" />
	                               </a>
	                            </td>
	                            <td rowspan="2" class="space"></td>
	                            <td class="proNames" colspan="2">
	                                <p><a href="${path}/productView?proNo=${vo.pro_no}">${vo.pro_name}</a></p>
	                            </td>
	                            <td rowspan="2" class="space"></td>
	                        </tr>
	                        <tr>
	                            <td class="proAllP proGuid">
	                                <span class="proNum">
	                                	구매수량 : ${vo.pro_num}개 /
	                                </span>
	                                <span class="proPri">
	                                	
	                                </span>
	                                <input type="hidden" class="pro_num" value="${vo.pro_num}">
	                                <input type="hidden" class="pro_price" value="${vo.pro_price}">
	                            </td>
	                            <td class="proDate proGuid">
	                                <span>구매 날짜</span><span>${order.buy_date}</span>
	                            </td>
	                        </tr>
	                        <tr><td><br></td></tr>
                    </table>
                    </c:if>
                        </c:forEach>
                <!-- 클래스 상세 -->
                    	<c:forEach var="vo" items="${detailList}" varStatus="status">
                    	   <c:if test="${vo.oneday_title != null}">
                                <table class="orderList">
	                        <tr>
	                            <td class="proImg" rowspan="2">
	                               <a href="${path}/onedayDetail?oneday_no=${vo.reserv_no}">
	                               		<img src="${vo.oneday_img}" />
	                               </a>
	                            </td>
	                            <td rowspan="2" class="space"></td>
	                            <td class="proNames" colspan="2">
	                                <p> <a href="${path}/onedayDetail?oneday_no=${vo.reserv_no}">${vo.oneday_title}</a></p>
	                            </td>
	                            <td rowspan="2" class="space"></td>
	                        </tr>
	                        <tr>
	                            <td class="proAllP proGuid">
	                            <span></span>
	                                <span>
	                                	 ${vo.oneday_price} 원
	                                </span>
	                            </td>
	                            <td class="proDate proGuid">
	                                <span>구매 날짜</span><span>${order.buy_date}</span>
	                            </td>
	                        </tr>
	                        <tr><td><br></td></tr>
                    </table>
                </c:if>
                        </c:forEach>
                </div>
                <br><br><br>
                <div>
                
                   <c:if test="${order.reserv_no == 0}">
                    <h3>배송지 정보</h3>
                    <table class="orderView" border="1">
                        <tr>
                            <td><span>받는 분</span></td>
                            <td><input type="text" readonly value="${order.buy_rc_name}"></td>
                        </tr>
                        <tr>
                            <td><span>우편번호</span></td>
                            <td>
                            	<input type="hidden" id="add" value="${order.buy_rc_address}">
                            	<input type="text" readonly id="post">
                            </td>
                        </tr>
                        <tr>
                            <td><span>주소</span></td>
                            <td><input type="text" readonly id="addV"></td>
                        </tr>
                        <tr>
                            <td><span>휴대전화</span></td>
                            <td><input type="text" readonly value="${order.buy_rc_phone}"></td>
                        </tr>
                        <tr>
                            <td><span>배송 메세지</span></td>
                            <td><input type="text" readonly value="${order.buy_requests}"></td>
                        </tr>
                    </table>
                    </c:if>
                    
                    
                    
                         <c:if test="${order.reserv_no != 0}">
                    <c:forEach var="vo" items="${detailList}" varStatus="status">
                          <h3>예약 정보</h3>
                         <table class="orderView" border="1">
                        <tr>
                            <td><span>수강생</span></td>
                            <td><input type="text" readonly value="${order.buy_rc_name}"></td>
                        </tr>
                        <tr>
                            <td><span>수강생 전화번호</span></td>
                              <td><input type="text" readonly value="${order.buy_rc_phone}"></td>
                        </tr>
                        <tr>
                            <td><span>예약일</span></td>
                             <td><input type="text" readonly value="${vo.reserv_date}"></td>
                        </tr>
                        <tr>
                            <td><span>요청사항</span></td>
                            <td><input type="text" readonly value="${vo.oneday_request}"></td>
                        </tr>
                        <tr>
                          <td><span>클래스 주소</span></td>
                            <td><input type="text" readonly value="${vo.oneday_place} ${vo.oneday_dtailplace}"></td>
                        </tr>
                    
                    </table>
                       </c:forEach>
                       </c:if>
                </div>
            </article>
        </section>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
console.log("${detailList[0].reserv_no}");
	$(function(){
		//주문번호
		var orderNo = $('#orderNo');
		
		var no = orderNo.val();
		var orderDate = $('#orderDate').val();
		
		orderDate = change(orderDate);
		
		orderNo.val(orderDate+no);
		
		//금액계산
		var proPri = $('.proPri'); //출력창
		var pro_num = $('.pro_num').val(); //값
		var pro_price = $('.pro_price');
		
		for(var i = 0; i < pro_num.length; i++){
            var valP = changeM(pro_price[i].value);
            
          	var hap = pro_num[i] * valP;
          	
          	hap =  hap.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
             
          	proPri[i].append(hap+"원");
        }
		
		//주소
		var add = $('#add').val();
		var post = $('#post');
		var addV = $('#addV');
		
		var postValue = add.substring(1,add.indexOf(')'));
		post.val(postValue);
		
		var addValue = add.substring(add.indexOf(')')+1,add.length);
		addV.val(addValue);
		
		
		function changeM(text){
			text = text.substring(0,text.indexOf('원'));
			text = text.replace(',','');
			
			return text;
		}
		
		function change(text){
			text = text.replace(/[^\d]+/g, "");
			return text;
		}
	});

</script>
</html>