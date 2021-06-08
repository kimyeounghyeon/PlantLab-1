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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
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
                            <table class="prolist">
                                <tr>
                                    <td class="proCheck" rowspan="3">
                                        <label class="checkContain">
                                            <input type="checkbox" name="prock">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td class="proImg" rowspan="3">
                                        이미지
                                    </td>
                                    <td class="space" rowspan="3"></td>
                                    <td class="proName" colspan="3">
                                        <p>키우기쉬운 나무</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="proGuide" colspan="2">
                                        <p>수량</p>
                                    </td>
                                    <td class="proCnt pro" colspan="2">
                                        <span>1개</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="proGuide" colspan="2">
                                        <p>가격</p>
                                    </td>
                                    <td class="proPri pro" colspan="2">
                                        <p><span>15000</span>원</p>
                                    </td>

                                    
                                </tr>
                            </table>
                            <table class="prolist">
                                <tr>
                                    <td class="proCheck" rowspan="3">
                                        <label class="checkContain">
                                            <input type="checkbox" name="prock">
                                            <span class="checkmark"></span>
                                        </label>
                                    </td>
                                    <td class="proImg" rowspan="3">
                                        이미지
                                    </td>
                                    <td class="space" rowspan="3"></td>
                                    <td class="proName" colspan="3">
                                        <p>키우기쉬운 나무</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="proGuide" colspan="2">
                                        <p>수량</p>
                                    </td>
                                    <td class="proCnt pro" colspan="2">
                                        <span>1개</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="proGuide" colspan="2">
                                        <p>가격</p>
                                    </td>
                                    <td class="proPri pro" colspan="2">
                                        <p><span>15000</span>원</p>
                                    </td>
                                </tr>
                            </table>

                            <hr>

                            <table class="infoT">
                                <tr>
                                    <td colspan="2">
                                        <p class="info">총 상품 가격</p>
                                        <p id="proAllP" class="price">30000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                       <p id="plus">+</p>
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
                                       <p id="plus">=</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p class="info">최종 결제 금액</p>
                                        <p id="allPrice" class="price">5000원</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="buyBG">
                                        <button class="infoBtn" id="choseDel">선택상품 삭제</button>
                                    </td>
                                    <td>
                                        <button class="infoBtn" id="choseBuy">선택상품 구매</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="buyBG"> 
                                        <button class="infoBtn" id="allBuy">전체상품구매</button>
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
    })
</script>
</html>