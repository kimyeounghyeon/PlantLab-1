<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 : 키우기쉬운 나무</title>
    <link href="${path}/resources/css/ProductViewStyle.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林 식물</h1>
            </div>

            <!-- Store 최근본 상품(오른쪽바) -->
            <article class="aside2">
                <h3>최근 본 상품</h3>
                <h4 class="recentCnt">5</h4>
                <ul class="recentList">
                    <li class="recentImg">
                        이미지
                    </li>
                    <li class="recentImg">
                        이미지
                    </li>
                    <li class="recentImg">
                        이미지
                    </li>
                    <li class="recentImg">
                        이미지
                    </li>
                </ul>
                <p class="next">▼</p>
            </article>

            <!-- 메인 -->
            <article class="main_article">
                <!-- 상품상세 -->
                <div class="detail">
                    <table>  
                        <tr>
                            <td id="proImg" rowspan="6"><img src="http://leafy.kr/data/goods/20/05/22/1000000040/1000000040_main_065.jpg"/></td>
                            <td id="space" rowspan="6"> </td>
                            <td id="proName" colspan="4"><p>키우기쉬운 나무</p><hr class="hrs"></td>
                        </tr>
                        <tr>
                            <td class="guide">배송비</td>
                            <td id="deliv">5000원</td>
                        </tr>
                        <tr>
                            <td class="guide">판매가</td>
                            <td id="proPri"><span id="priceV">15000</span>원</td>
                        </tr>
                        <tr>
                            <td class="space2" colspan="4"><hr class="hrs hr2"></td>
                        </tr>
                        <tr>
                            <td class="numGuide" colspan="2">
                                <p id="min" class="numB">-</p>
                                <p id="num">1</p>
                                <p id="add" class="numB">+</p>
                            </td>
                            <td class="resultPG" colspan="2">
                                총합금액 <p><span>15000</span>원</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="buyGuide">
                                <button id="buyB" class="bBtn">구매하기</button>
                                <button id="basketB" class="bBtn"><a href="43_finalCart.html">장바구니</a></button>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- 상품설명 -->
                <div class="pro_content">
                    <!-- 이동바 -->
                    <div class="contentList" id="listFirst">
                        <ul>
                            <li><a href="#listFirst">상품상세정보</a></li>
                            <li><a href="#listSecond">상품리뷰</a></li>
                            <li>&nbsp;</li>
                        </ul>
                    </div>

                    <!-- 상품설명 -->
                    <div class="content" id="proContent">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                        <br><br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                        <br><br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                        <br><br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                        <br><br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                        <br><br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                        when an unknown printer took a galley of type and scrambled it to make a type 
                        specimen book. It has survived not only five centuries, but also the leap into 
                        electronic typesetting, remaining essentially unchanged. It was popularised 
                        in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
                        and more recently with desktop publishing software like Aldus PageMaker including 
                        versions of Lorem Ipsum.
                    </div>

                    <!-- 상품리뷰 -->
                    <div class="review" id="proReview">
                        <!-- 이동바 -->
                        <div class="contentList"  id="listSecond">
                            <ul>
                                <li><a href="#listFirst">상품상세정보</a></li>
                                <li><a href="#listSecond">상품리뷰</a></li>
                                <li>&nbsp;</li>
                            </ul>
                        </div>

                        <div class="content" id="proReview">
                            <!-- 별점표시 -->
                            <div class="starGuide">
                                <div class='RatingStar'>
                                    <h3>사용자 총 별점</h3>
                                    <div class='RatingScore'>
                                        <div class='outer-star'>
                                          <div class='inner-star'></div>
                                        </div>
                                    </div>
                                    <p class="starNum">4.5<span> / 5</spna></p>
                                </div>
    
                                <div class="starDetail">
                                    <h4>리뷰 총 점수</h4>
                                    <div class="starContent">
                                        <span class="outBar">
                                            <span class="bar" id="star5" style="height:60%"></span>
                                        </span>
                                        
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 리뷰표시 -->
                            <div class="reviewContent">
                                <h2>리뷰 2개</h2>
                                <div class="review">
                                    <table>
                                        <!-- 한개의 리뷰 시작 -->
                                        <tr class="accordian">
                                            <td class="reviewTitle">
                                                <div class="title">리뷰 제목2222222</div>
                                                <div class="writer">작성자</div>
                                                <div class="star userStar">★★★★★</div>
                                                <div class="star date">2021-01-01</div>
                                            </td>
                                        </tr>
                                        <tr class="panel">
                                            <td>
                                                <div class="reviewImg">
                                                    이미지
                                                </div>
                                                <div class="reviewCon">
                                                    <p>
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="space2"><td></td></tr>
                                        <!-- 한개의 리뷰 끝 -->

                                         <!-- 한개의 리뷰 시작 -->
                                         <tr class="accordian">
                                            <td class="reviewTitle">
                                                <div class="title">리뷰 제목2222222</div>
                                                <div class="writer">작성자</div>
                                                <div class="star userStar">★★★★★</div>
                                                <div class="star date">2021-01-01</div>
                                            </td>
                                        </tr>
                                        <tr class="panel">
                                            <td>
                                                <div class="reviewImg">
                                                    이미지
                                                </div>
                                                <div class="reviewCon">
                                                    <p>
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="space2"><td></td></tr>
                                        <!-- 한개의 리뷰 끝 -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>

<script>
    ratings = {RatingScore: 4.5} 
    totalRating = 5;

    table = document.querySelector('.RatingStar');

    function rateIt() {
        for (rating in ratings) {
            ratingPercentage = ratings[rating] / totalRating * 100;
            ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
            star = table.querySelector('<c:out value="${rating}"/> .inner-star');
            numberRating = table.querySelector('<c:out value="${rating}"/> .numberRating');
            star.style.width = ratingRounded;
            numberRating.innerText = ratings[rating];
        }
    }
    
    rateIt();
</script>
<script>
    $(function(){
        //수량
        var num = $('.numGuide #num');
        var allPrice = $('.resultPG span');
        var price = $('#priceV').text();
        console.log(price);
        var addB = $('#add');
        var minB = $('#min');

        addB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();
            
            numVal = (numVal*1)+1;
            numPri = (numPri*1)+(price*1);

            num.text(numVal);
            allPrice.text(numPri);
        });

        minB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();
            if(numVal == 1){
                numVal == 1;
                allPrice.text(price);
            }else{
                numVal = (numVal*1)-1;
                numPri = (numPri*1)-(price*1);

                num.text(numVal);
                allPrice.text(numPri);
            }

        
        });

        //총가격

        //리뷰
        $('.panel').hide();

        $('.accordian').on('click',function(e){
            e.preventDefault();
            $(this).next().fadeToggle(500);
        });
    });
</script>
</html>