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
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>주문일자</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>주문자</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        
                    </table>
                </div>
                <br><br><br>
                <div>
                    <h3>결제 정보</h3>
                    <table class="orderView" border="1">
                        <tr>
                            <td><span>총 주문 금액</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>결제수단</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                    </table>
                </div>

                <br><br><br>
                <div>
                    <h3>주문 상품 정보</h3>
                    <table class="orderList">
                        <tr>
                            <td class="proImg" rowspan="2">
                                <img src="test.jpg">
                            </td>
                            <td rowspan="2" class="space"></td>
                            <td class="proNames" colspan="2">
                                <p><a href="">상품 이름출력~~</a></p>
                            </td>
                            <td rowspan="2" class="space"></td>
                        </tr>
                        <tr>
                            <td class="proAllP proGuid">
                                <span class="proNum">구매수량 : 1개 /</span>
                                <span class="proPri">15000원</span>
                            </td>
                            <td class="proDate proGuid">
                                <span>구매 날짜</span><span>2020-20-20</span>
                            </td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td class="proImg" rowspan="2">
                                <img src="test.jpg">
                            </td>
                            <td rowspan="2" class="space"></td>
                            <td class="proNames" colspan="2">
                                <p><a href="">상품 이름출력~~</a></p>
                            </td>
                            <td rowspan="2" class="space"></td>
                        </tr>
                        <tr>
                            <td class="proAllP proGuid">
                                <span class="proNum">구매수량 : 1개 /</span>
                                <span class="proPri">15000원</span>
                            </td>
                            <td class="proDate proGuid">
                                <span>구매 날짜</span><span>2020-20-20</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <br><br><br>
                <div>
                    <h3>배송지 정보</h3>
                    <table class="orderView" border="1">
                        <tr>
                            <td><span>받는 분</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>우편번호</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>주소</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>휴대전화</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td><span>배송 메세지</span></td>
                            <td><input type="text" readonly></td>
                        </tr>
                    </table>
                </div>
            </article>
        </section>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>