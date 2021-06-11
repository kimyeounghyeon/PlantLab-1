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
	<jsp:include page="../header.jsp"></jsp:include>
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
                        <tr>
                            <td class="proImg" rowspan="2">
                                <img src="test.jpg">
                            </td>
                            <td class="space" rowspan="2"></td>
                            <td class="proName">
                                <p>키우기쉬운 나무</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="priceGuide">
                                <p class="proNum guide">1개 / </p>
                                <p class="proPri guide">15000원</p>
                            </td>
                        </tr>

                        <tr>
                            <td class="proImg" rowspan="2">
                                <img src="test.jpg">
                            </td>
                            <td class="space" rowspan="2"></td>
                            <td class="proName">
                                <p>키우기쉬운 나무</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="priceGuide">
                                <p class="proNum guide">1개 / </p>
                                <p class="proPri guide">15000원</p>
                            </td>
                        </tr>
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
                           <span id="price">30000 원</span> 
                           <span>+</span> 
                           <span id="deliv">5000 원</span> 
                           <span>=</span> 
                           <span id="allPrice">35000 원</span>
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
                                    <input type="radio" name="payment" var="card" checked>
                                    <input type="radio" name="payment" var="bank">계좌이체
                                    <input type="radio" name="payment" var="deposit">무통장입금
                                    <input type="radio" name="payment" var="virtual">가상계좌
                                    <input type="radio" name="payment" var="phone">휴대폰결제
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div id="checkInfo">
                        <input type="checkbox" >상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
                    </div>
                    <div id="buyB">
                        <button type="button" id="buyBtn">결제하기</button>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>
</html>