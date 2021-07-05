<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>리뷰 작성</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
     <link rel="stylesheet" href="${path}/resources/css/ReviewWriteStyle.css"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">리뷰 작성</h1>
            </div>

            <article class="main_article">
                <form>
                    <h3>상품 내역</h3>
                    <table class="proGuide">
                        <tr>
                            <td class="proImg">
                                <div class="reviewImg" style="max-width:800px;position:relative">
		                                
		                        </div>
                                <input type="hidden" name="buy_no" value="${buy_no}">
                            </td>
                            <td class="proName">
                                <p> </p>
                            </td>
                        </tr>
                    </table>
                    <br><br><br>
                    <h3>상품 별점</h3>
                    <div class="star">
                        <h3 class="starH">별점 0/0</h3>

                        <input type="hidden" name="rv_star">
                        <input type="checkbox" id="star1" value="1" class="star_radio" title="1점">
                        <label for="star1"><i class="fas fa-star"></i></label>
                        <input type="checkbox" id="star2" value="2" class="star_radio" title="2점">
                        <label for="star2"><i class="fas fa-star"></i></label>
                        <input type="checkbox" id="star3" value="3" class="star_radio" title="3점">
                        <label for="star3"><i class="fas fa-star"></i></label>
                        <input type="checkbox" id="star4" value="4" class="star_radio" title="4점">
                        <label for="star4"><i class="fas fa-star"></i></label>
                        <input type="checkbox" name="rv_star" id="star5" value="5" class="star_radio" title="5점">
                        <label for="star5"><i class="fas fa-star"></i></label>
                    </div>

                    <br><br><br>

                    <h3>리뷰 작성</h3>
                    <div>
                        <input type="text" name="rv_title" placeholder="리뷰 제목">
                    </div>

                    <div>
                        <textarea style="resize: none;" name="rv_content"></textarea>
                    </div>
                    
                    <div>
                        <button type="button" id="reBtn">등록하기</button>
                    </div>
                </form>
            </article>
        </section>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	//이미지	
	var buy_no = $('input[name=buy_no]').val();
	var proName = $('.proName p');
	var reviewImg = $('.reviewImg');
	$.ajax({
		url:"orderPro.do",
		data : {buy_no : buy_no},
		type:"get",
		dataType : "json",
		success:function(data){
			if(data.imgList != null){
				var imgList = data.imgList;
				var details = data.details;
				
              	var html = "";
                $.each(imgList, function(i, item){
            	    html += "<img src='"+item+"' class=\"mySlides\"/>";
                });
               
                if(imgList.length > 1){
            	    html += "<a class='w3-btn-floating' style='position:absolute; top:45%; left:0;' onclick='plusDivs(-1)'>❮ </a>";
                    html += "<a class='w3-btn-floating' style='position:absolute;top:45%;right:0;' onclick='plusDivs(1)'>❯ </a>";
                }
               
                if(details.length > 1){
                	$.each(details, function(i, item){
                		proName.append(item.pro_name+"<br>");
	                 });
            	   
                }else{
            	    $.each(details, function(i, item){
            	 	   proName.append(item.pro_name);
                    });
                }
               
                reviewImg.append(html);
                showDivs(slideIndex);
			}
           
		},
		error : function(request, status, errorData){ 
			
		}
	});
	
	//별점계산
    var star = $("input[type=checkbox]");
    var rv_star =$("");
    var i = 0;

    star.click(function(){
        var starH = $('.starH');
        starH.empty();

        i = $("input[type=checkbox]").index(this);
        console.log("인덱스 : " + i);

        for(var j=1 ; j<=i ; j++){
            $("#star"+j).prop('checked',true);
        }
        
        for(var j=5 ; j>i+1 ; j--){
            $("#star"+j).prop('checked',false);
        }

        if($(this).is(":checked") != true){
            $("#star"+j).prop('checked',true);
        }

        starH.append("별점 "+(i+1)+"/5");
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