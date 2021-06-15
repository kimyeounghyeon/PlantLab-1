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
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title"></h1>
            </div>
			
            <!-- 메인 -->
            <article class="main_article">
                <!-- 상품상세 -->
                <div class="detail">
					<input type="hidden" id="pro_totalStar" value="${product.pro_totalStar}">
					<input type="hidden" id="pro_stock" value="${product.pro_stock}">
					
                    <table>  
                        <tr>
                            <td id="proImg" rowspan="6">
                                <img src="${product.pro_image}"/>
                            </td>
                            <td id="space" rowspan="6"> </td>
                            <td id="proName" colspan="4"><p>${product.pro_name}</p><hr class="hrs"></td>
                        </tr>
                        <tr>
                            <td class="guide">배송비</td>
                            <td id="deliv">5000원</td>
                        </tr>
                        <tr>
                            <td class="guide">판매가</td>
                            <td id="proPri"><span id="priceV">${product.pro_price}</span></td>
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
                                	총합금액 <p><span>${product.pro_price}</span></p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="buyGuide">
                                <button id="buyB" class="bBtn">구매하기</button>
                                <button id="basketB" class="bBtn">장바구니</button>
                            </td>
                        </tr>
                    </table>
                    <div class="modal">
                        <div class="modal_content">
                            <p>
                                	장바구니에 상품이 담겼습니다 
                                <span><a href="43_finalCart.html">장바구니로 이동</a></span>
                            </p>
                        </div>
                    </div>
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
                        <c:if test="${not empty productCon}">
                        	<c:forEach var="vo" items="${productCon}" varStatus="status">
                        		<img src="${vo.pro_detail}">
                        	</c:forEach>
                        </c:if>
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
                                    <p class="starNum">${product.pro_totalStar}<span> / 5</spna></p>
                                </div>
    
                                <div class="starDetail">
                                    <h3>리뷰 총 점수</h3>
                                    <div class="starContent">
                                        <div class="graph">
                                            <span class="barNum">5점</span><span class="bar" style="width: 70%;"></span>
                                        </div>
                                        <div class="graph">
                                            <span class="barNum">4점</span><span class="bar" style="width: 30%;"></span>
                                        </div>
                                        <div class="graph">
                                            <span class="barNum">3점</span><span class="bar" style="width: 0%;"></span>
                                        </div>
                                        <div class="graph">
                                            <span class="barNum">2점</span><span class="bar" style="width: 0%;"></span>
                                        </div>
                                        <div class="graph">
                                            <span class="barNum">1점</span><span class="bar" style="width: 0%;"></span>
                                        </div>
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
                                                        국무총리는 대통령을 보좌하며, 행정에 관하여 대통령의 명을 받아 행정각부를 통할한다. 국회의 회의는 공개한다. 다만, 출석의원 과반수의 찬성이 있거나 의장이 국가의 안전보장을 위하여 필요하다고 인정할 때에는 공개하지 아니할 수 있다.

                                                        농업생산성의 제고와 농지의 합리적인 이용을 위하거나 불가피한 사정으로 발생하는 농지의 임대차와 위탁경영은 법률이 정하는 바에 의하여 인정된다.
                                                        
                                                        의원을 제명하려면 국회재적의원 3분의 2 이상의 찬성이 있어야 한다. 대통령의 임기는 5년으로 하며, 중임할 수 없다. 국민의 모든 자유와 권리는 국가안전보장·질서유지 또는 공공복리를 위하여 필요한 경우에 한하여 법률로써 제한할 수 있으며, 제한하는 경우에도 자유와 권리의 본질적인 내용을 침해할 수 없다.
                                                        
                                                        재산권의 행사는 공공복리에 적합하도록 하여야 한다. 위원은 정당에 가입하거나 정치에 관여할 수 없다. 국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다.
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
	var pro_totalStar = $('#pro_totalStar').val();
	
	
	console.log(pro_totalStar);
	
	
	ratings = {RatingScore: pro_totalStar}
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
        var value;
        
        price = numChange(price);

        var addB = $('#add');
        var minB = $('#min');

        addB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();

            numPri = numChange(numPri);
            numPri = numPri.replace(/[^\d]+/g, "");
            
            numVal = (numVal*1)+1;
            numPri = (numPri*1)+(price*1);

            numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
           
            num.text(numVal);
            allPrice.text(numPri+"원");
        });

        minB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();

            numPri = numChange(numPri);
            numPri = numPri.replace(/[^\d]+/g, "");

            if(numVal == 1){
                numVal == 1;
                numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                allPrice.text(price+"원");
            }else{
                numVal = (numVal*1)-1;
                numPri = (numPri*1)-(price*1);

                num.text(numVal);
                numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                allPrice.text(numPri+"원");
            }
        });

        function numChange(value){
            value = value.substring(0,value.indexOf('원'));
            value = value.replace(',','');
            return value;
        };
        
        //리뷰
        $('.panel').hide();

        $('.accordian').on('click',function(e){
            e.preventDefault();
            $(this).next().fadeToggle(500);
        });

        //모달
        var basketB = $('#basketB');

        $("#basketB").click(function(){ 
            $(".modal").fadeIn(); 
            
            setTimeout(function() { 
                $('.modal').fadeOut();
            }, 3000);
        }); 
    });
</script>
</html>