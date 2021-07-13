<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 : 키우기쉬운 나무</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link href="${path}/resources/css/Product/ProductViewStyle.css" rel="stylesheet"/>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
						<input type="hidden" id="pro_totalStar" name="pro_totalStar" value="${product.pro_totalStar}">
						<input type="hidden" id="pro_stock" name="pro_stock" value="${product.pro_stock}">
					<form id="cartF">
						<input type="hidden" name="user_no" value="${user}">
						<input type="hidden" name="buy_totalprice" value="">
                        <input type="hidden" name="deliv" value="5000">
						<input type="hidden" id="pro_no" name="pro_no" value="${product.pro_no}">
						<input type="hidden" name="pro_cnt" id="pro_cnt" value="1">
						<input type="hidden" id="pro_name" name="pro_name" value="${product.pro_name}">
						<input type="hidden" id="pro_price" name="pro_price" value="${product.pro_price}">
					</form>
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
	                            <td id="deliv">5,000원</td>
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
	                                <p id="num" >1</p>
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
                    <div class="modal" id="cartInsert">
                        <div class="modal_content">
                            <p>
                                장바구니에 상품이 담겼습니다 
                                <span><a href="${path}/cart">장바구니로 이동</a></span>
                            </p>
                        </div>
                    </div>
                    <div class="modal" id="cartNo">
                        <div class="modal_content">
                            <p>
                                장바구니에 이미 상품이 있습니다
                                <span><a href="${path}/cart">장바구니로 이동</a></span>
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
                                    <p class="cntP">(${count}명)</p>
                                </div>
    
                                <div class="starDetail">
                                    <h3>리뷰 총 점수</h3>
                                    <div class="starContent">
                                    	<c:if test="${not empty percent }">
                                    	<c:forEach var="vo" items="${percent}" varStatus="status">
	                                        <div class="graph">
	                                            <span class="barNum">${fn:length(percent)-status.index}점</span><span class="bar" style="width: ${vo}%;">${vo}%</span>
	                                        </div>
                                        </c:forEach>
                                        </c:if>
                                        
                                        <c:if test="${empty percent }">
                                        	<div class="graph">
	                                            <span class="barNum">5점</span><span class="bar" style="width: 0%;"></span>
	                                        </div>
	                                        <div class="graph">
	                                            <span class="barNum">4점</span><span class="bar" style="width: 0%;"></span>
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
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 리뷰표시 -->
                            <div class="reviewContent">
                                <h2>리뷰  ${fn:length(reviewList)}개</h2>
                                <div class="review">
                                    <table>
                                        <!-- 한개의 리뷰 시작 -->
                                        <c:if test="${empty reviewList}">
                                        	<tr class="accordian">
                                            	<td class="reviewTitle">
                                               		<div><h3>아직 작성된 리뷰가 없습니다!</h3></div>
                                           		</td>
                                       		</tr>
                                        </c:if>
                                        <c:if test="${not empty reviewList}">
                                        	<c:forEach var="vo" items="${reviewList}" varStatus="status">
                                        		 <tr class="accordian">
		                                            	<td class="reviewTitle">
		                                                	<div class="title">
		                                                		${vo.rv_title}
		                                                	</div>
		                                                <div class="writer">
		                                                	${vo.user_name}
		                                                	<input type="hidden" name="user_no2" value="${vo.user_no}">
		                                                	<input type="hidden" name="rv_no" value="${vo.rv_no}">
		                                                </div>
		                                                <div class="star userStar">
		                                                	<c:forEach var="i" begin="1" end="${vo.rv_star}">
		                                                	★
		                                                	</c:forEach>
														</div>
		                                                <div class="star date">${vo.rv_date}</div>
	                                            	</td>
                                        		</tr>
		                                        <tr class="panel">
		                                            <td>
		                                                <div class="reviewImg" style="max-width:800px;position:relative">
		                                                </div>
		                                                <div class="reviewCon">
		                                                	<p>${vo.rv_content}</p>
		                                                </div>
		                                            </td>
		                                        </tr>
		                                        <tr class="space2"><td></td></tr>
		                                        <!-- 한개의 리뷰 끝 -->
                                        	</c:forEach>
                                        </c:if>
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
	
</script>

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
            star = table.querySelector('.inner-star');
            numberRating = table.querySelector('.numberRating');
            star.style.width = ratingRounded;
            numberRating.innerText = ratings[rating];
        }
    }
    
    rateIt();
</script>
<script>
    $(function(){
    	//로그인여부
    	var user_no = $('input[name=user_no]').val();
    	
    	//금액
    	var buy_totalprice = $('#cartF input[name=buy_totalprice]');
    	
    	//수량
        var num = $('.numGuide #num');
    	var pro_cnt = $('#pro_cnt');
        var allPrice = $('.resultPG span');
        var price = $('#priceV').text();
        var stock = $('#pro_stock').val();
        var value;
        
        price = numChange(price);
        
        buy_totalprice.val(price);

        var addB = $('#add');
        var minB = $('#min');

        addB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();

            if(stock >= 0){
            	 numPri = numChange(numPri);
                 numPri = numPri.replace(/[^\d]+/g, "");
                 
                 if(numVal == stock){
                 	swal("최대 "+stock+"개 까지만 가능합니다!", "현재 남은수량 : " + stock+"개", "info");
                 }else{
                	 numVal = (numVal*1)+1;
                	 pro_cnt.val(numVal);
                     numPri = (numPri*1)+(price*1);
                     buy_totalprice.val(numPri);
                 }
                 
                 numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
             
                 num.text(numVal);
                 allPrice.text(numPri+"원");
            }
        });

        minB.click(function(){
            var numVal = num.text();
            var numPri = allPrice.text();

            if(stock >= 0){
                numPri = numChange(numPri);
                numPri = numPri.replace(/[^\d]+/g, "");

                if(numVal == 1){
                    numVal == 1;
                    
                    numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    allPrice.text(price+"원");
                }else{
                    numVal = (numVal*1)-1;
                    pro_cnt.val(numVal);
                    numPri = (numPri*1)-(price*1);
                    buy_totalprice.val(numPri);
                    num.text(numVal);
                    numPri =  numPri.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    allPrice.text(numPri+"원");
                }
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
            //e.preventDefault();
            $(this).next().fadeToggle(500);
            
            var pro_no = $('#pro_no').val();
            var user_no = $(this).find('input').val();
            var reviewImg = $(this).next().find('.reviewImg');
            var rv_no = $(this).find('input[name=rv_no]').val();
            $.ajax({
				url:"imgSearch.do",
				data : {pro_no : pro_no,
						rv_no : rv_no,
						user_no : user_no},
				type:"post",
				dataType : "json",
				success:function(data){
					reviewImg.empty("");
					var html=""
					if(data.length==1){
						html += "<img src='"+data+"'/>";
						
					}else if(data.length==0){
						var srcValue = $('#proImg img').prop('src');
						html += "<img src='"+srcValue+"'/>";
					}else{
						$.each(data,function(index,e){
							html += "<img src='"+e+"' class=\"mySlides\"/>";
							
						});
						
						html += "<a class='w3-btn-floating' style='position:absolute; top:45%; left:0;' onclick='plusDivs(-1)'>❮ </a>";
                        html += "<a class='w3-btn-floating' style='position:absolute;top:45%;right:0;' onclick='plusDivs(1)'>❯ </a>";
					}
					
					reviewImg.append(html);
					
					showDivs(slideIndex);
				},
				error : function(request, status, errorData){ 
					alert("error code : " + request.status + "\n"
   						 + "message : " + request.responseText + "\n"
   						 + "error : " + errorData); 
				}
			});
        });
        
        //장바구니
        var re = 0;
        function modal(re) {
        	if(re == 1){ //카트에 상품이 없을 경우
        		$("#cartInsert").fadeIn(); 
                
                setTimeout(function() { 
                    $('#cartInsert').fadeOut();
                }, 3000);
        	}else if(re == 2){ //카트에 상품이 있을 경우
				$("#cartNo").fadeIn(); 
                
                setTimeout(function() { 
                    $('#cartNo').fadeOut();
                }, 3000);
        	}
		}

        //구매
        var buyB = $("#buyB");
        var form = $('#cartF');
        
        buyB.click(function(){
        	var numPri = allPrice.text();
        	
        	if(stock <= 0){
        		swal("상품이 품절되었습니다.","", "info");
        	}else if(user_no == 0){   		
        		swal("로그인 후 이용해 주세요.","", "info");
        	}else{
	        	form.attr("method","post");
	        	form.attr("action","order");
	        	form.submit();     
        	}
        });
        
        //카트 이동 및 모달
        var basketB = $('#basketB');
		var pro_no = $('#pro_no').val();
    	console.log("확인:"+pro_no);
    	
        $("#basketB").click(function(){ 
        	var numPri = allPrice.text();
        	if(stock <= 0){
        		swal("상품이 품절되었습니다.","", "info");
        	}else if(user_no == 0){   		
        		swal("로그인 후 이용해 주세요.","", "info");
        	}else{
        		//카트에 상품이 있는지 조회하는 ajax
            	$.ajax({
    				url:"cartSearch.do",
    				data : {pro_no : pro_no},
    				type:"post",
    				success:function(result){
    					if(result == "ok"){ //상품이 있을 경우
    						modal(2);
    					}else if(result=="no"){ //카트에 상품이 없을 경우
    						//카트등록 ajax
    						var numVal = num.text();
    						
    						$.ajax({
    							url:"cartInsert.do",
    							data : {pro_no : pro_no,
    									pro_cnt : numVal},
    		    				type:"post",
    		    				success:function(result){
    		    					if(result == "insert"){ //등록했을경우
    		    						modal(1);
    		    					}else{
    		    						swal("오류","다시 시도해주세요.", "info");
    		    					}
    		    				},
    		    				error : function(request, status, errorData){ 
    		    					alert("error code : " + request.status + "\n"
    		    						 + "message : " + request.responseText + "\n"
    		    						 + "error : " + errorData); 
    		    				} 
    						});//등록ajax
    					}
    				},
    				error : function(request, status, errorData){ 
    					alert("error code : " + request.status + "\n"
    						 + "message : " + request.responseText + "\n"
    						 + "error : " + errorData); 
    				}
    			});//ajax
        	}
        }); 
    });
</script>
<script>
var slideIndex = 1;


function plusDivs(n) {
    showDivs(slideIndex += n);
};

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
};
</script>
</html>