<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 cart</title>
    <link href="${path}/resources/css/CartStyle.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林 cart</h1>
                <!-- <h4 class="subTitle">식 물</h4> -->
            </div>

            <article class="main_article">
                <div class="cart">
                    <label class="checkContain">
                        <input type="checkbox" id="allcheck">
                        <span class="checkmark"></span>
                        
                    </label>

                    <div class="cartList">  
                        <form>
                        	<c:if test="${empty cartList}">
                        		<h3>상품이 존재하지 않습니다.</h3>
                        	</c:if>
                        	<c:if test="${not empty cartList}">
                        		<c:forEach  var="vo" items="${cartList}" varStatus="status">
                        			<table class="prolist">
		                                <tr>
		                                    <td class="proCheck" rowspan="3">
		                                        <label class="checkContain">
		                                            <input type="checkbox" name="prock">
		                                            <span class="checkmark"></span>
		                                        </label>
		                                    </td>
		                                    <td class="proImg" rowspan="3">
		                                        <img src="${vo.pro_image}">
		                                    </td>
		                                    <td class="space" rowspan="3"></td>
		                                    <td class="proName" colspan="3">
		                                        <p>${vo.pro_name}</p>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td class="proGuide" colspan="2">
		                                        <p>수량</p>
		                                    </td>
		                                    <td class="proCnt pro" colspan="2">
		                                        <span>${vo.pro_cnt}</span>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td class="proGuide" colspan="2">
		                                        <p>가격</p>
		                                    </td>
		                                    <td class="proPri pro" colspan="2">
		                                        <p><span>${vo.pro_price}</span></p>
		                                        <input type="hidden" value="${vo.pro_price}" class="voPrice">
		                                    </td>
		                                </tr>
		                            </table>	
		                            
                        		</c:forEach>
                        	</c:if>
                        	
                        	<hr>
                        	
                            <table class="infoT">
                                <tr>
                                    <td colspan="2">
                                        <p class="info">총 상품 가격</p>
                                        <p id="proAllP" class="price">0원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p class="info">배송비</p>
                                        <p id="deliv" class="price">5000원</p>
                                        <p id="delivContent">얼마이상 구매시 배송비는 0원 <br> 단 제주도 어쩌고저쩌고</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p class="info">최종 결제 금액</p>
                                        <p id="allPrice" class="price">0원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="buyBG">
                                        <button class="infoBtn infoB" id="choseDel">선택상품 삭제</button>
                                    </td>
                                    <td>
                                        <button class="infoBtn infoB" id="choseBuy">선택상품 구매</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="buyBG"> 
                                        <button type="button" class="infoBtn" id="allBuy" onClick="location.href='44_finalOrder.html'">전체상품구매</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>
<script>
    $(function(){
    	//금액 계산
    	var voPrice = $('voPrice').val();
		
        for(var i = 0; i<voPrice.size(); i++){
	    	voPrice[i] = value.substring(0,value.indexOf('원'));
	    	voPrice[i] = value.replace(',','');
        	cosole.log(i+"번 : "+voPrice);
        }
    	
       /*  addB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();

            if(numPri !='(품절)'){
            	 numPri = numChange(numPri);
                 numPri = numPri.replace(/[^\d]+/g, "");
                 
                 if(numVal == stock){
                 	swal("최대 "+stock+"개 까지만 가능합니다!", "현재 남은수량 : " + stock+"개", "info");
                 }else{
                	 numVal = (numVal*1)+1;
                     numPri = (numPri*1)+(price*1);
                 }
                 
                 numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
             
                 num.text(numVal);
                 allPrice.text(numPri+"원");
            }
        });*/
    	
    	
    	 
        // 체크박스
        var allcheck = $('#allcheck');
        var prock = $('input[name=prock]');

        //전체체크 선택시
        allcheck.click(function(){
            if($(this).prop('checked')){
                prock.prop('checked',true);
            }else{
                prock.prop('checked',false);
            }
        });

        //개별체크시
        prock.click(function(){
            var cnt = $("input[name=prock]:checked").length;
            console.log
            if(prock.length == cnt){
                allcheck.prop('checked',true);
            }else{
                allcheck.prop('checked',false);
            }
        })
    })
</script>
</html>