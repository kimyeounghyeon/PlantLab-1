<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>無以林 주문 내역</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${path}/resources/css/OrderListStyle.css"/>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    	.regis_page{
    		margin: auto;
    		text-align: center;
    	}
    </style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../mypagemenu.jsp"></jsp:include>
    <div id="content" class="contents">
        <section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">주문 내역</h1>
            </div>

            <article class="main_article">
                <div>
                	<c:if test="${empty orderList}">
                		<table class="orderList">
                			<tr>
                				<td>
                					<h3>주문하신 상품이 없습니다.</h3>
                				</td>
                			</tr>	
                		</table>
                	</c:if>
                	
                	<c:if test="${not empty orderList}">
                		<c:forEach  var="vo" items="${orderList}" varStatus="status">
		                    <form>
		                    <input type="hidden" name="new" value="new">
		                    <input type="hidden" name="buy_no" value="${vo.buy_no}">
		                    <input type="hidden" name="reserv_no" value="${vo.reserv_no}"  id="reserv_no">  <!-- 추가======-->
		                    <table class="orderList">
		                        <tr>
		                            <td class="proImg" rowspan="2">
                                <div class="reviewImg" style="max-width:800px;position:relative;">
		                                
		                                </div>
		                                
		                            </td>
		                            <td rowspan="2" class="space"></td>
		                            <td class="proNames" colspan="2">
		                            	<input type="hidden" name="buy_no" value="${vo.buy_no}">
		                                <p><a href="<%=request.getContextPath()%>/OrderView?buy_no=${vo.buy_no}"> </a></p>
		                            </td>
		                           
		                            <td class="btn"> 
		                                <button type="button" class="proBtn" id="qnaB">문의하기</button>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="proAllP proGuid">
		                                <span>총 구매가</span><span>${vo.buy_totalprice}</span>
		                            </td>
		                            <td class="proDate proGuid">
		                                <span>구매 날짜</span><span>${vo.buy_date}</span>
		                            </td>
		                            <td class="btn addB">
		                            
		                            <c:choose>
		                            <c:when  test="${vo.reserv_no ==0 }">
		                             <button type="button" class="proBtn" id="reivewB">리뷰작성</button>
		                            
		                            </c:when>
		                            <c:when test="${vo.reserv_no !=0 }">
		                             <button type="button" class="proBtn" id="oneCancel">예약 취소</button>
		                            </c:when>
		                            </c:choose>
		                            
		                            
		       
		                            </td>
		                        </tr>
		                    </table>
		                    </form>
	                    </c:forEach>
                    </c:if>
                    <br>
                    
                    <br>
                    <div class="proFoot">
                        <p>이용해주셔서 감사합니다.<br>상품의 이용방법, 주문취소 등에 대한 문의는 고객센터를 이용해 주세요.</p>
                    </div>
                </div>
                <br>
                
                <div class="regis_page">
					<c:if test="${startPage != 1 }">
						<a href="${path}/orderList?page=${startPage-1}"> ◀ </a>
					</c:if>
					<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${p eq currentPage}">
							<font color="#6A60A9" size="4"><b> ${p} </b></font>
						</c:if>
						<c:if test="${p ne currentPage}">
							<c:url var="adminDiaryChk" value="orderList">
								<c:param name="page" value="${p}" />
								<c:param name="keyword" value="${keyword}" />
							</c:url>
							<a href="${adminDiaryChk}" class="aLink"><b>[${p}]</b></a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="<%=request.getContextPath() %>/orderList?page=${endPage+1}"> ▶ </a>
					</c:if>
				</div>
            </article>
        </section>
    </div>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	$(function(){
		//class 예약 취소 
		var reserv_no= $("#reserv_no");
		
			$("#oneCancel").click(function() {
				var allData = {
					'reserv_no' : reserv_no
				};
				$.ajax({
					url : "${path}/onedayCancle",
					type : "GET",
					data : allData,
					async:false,
					success : function(data) {
						console.log('return reserv_no value는  : ' + data);
						alert("취소 하시겠습니까?");
					var can=	$("#oneCancel").text("취소 요청중");
					var day =10;
					function setCookie(cookiee , can , day)
					{
					   var exdate=new Date();
					   exdate.setDate(exdate.getDate() + day);
					   var can=escape(can) + ((day==null) ? "" : "; expires="+exdate.toUTCString());
					   document.cookiee=cookiee + "=" + can;
					}
					setCookie('cookiee','can',day); 
					
					
					function getCookie(cookiee)
					{
					   var i,x,y,ARRcookies=document.cookie.split(";");
					   for (i=0;i<ARRcookies.length;i++)
					   {
					     x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					     y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					     x=x.replace(/^\s+|\s+$/g,"");
					     if (x==cookiee)
					     {
					       return unescape(y);
					     }
					   }
					}
					
					
					
					
					
					
					
					
					
					
					},
					error : function(request){
						
						alert("유효 하지 않는 클래스 입니다.");
						}
					});
				
				})
		
		
		//리뷰체크
		var rvMsg = "<c:out value="${rvMsg}" />";
		
		if(rvMsg != ""){
			 swal("이미 리뷰를 작성하셨습니다.");
		}
		
		
		//전송
		var proBtn = $('#reivewB');
		
		proBtn.click(function(){
			var form = $('form');
			form.attr("method","get");
        	form.attr("action","revieWrite");
        	form.submit();
		
		});
		
		
		var qnaB = $('#qnaB');
		
		qnaB.click(function(){
			var form = $('form');
			form.attr("method","get");
        	form.attr("action","inquery");
        	form.submit();
		
		});
		
		//상품 이미지 가져오기
		var buy_no = ($('input[name=buy_no]').val())*1;
		var reserv_no = ($('input[name=reserv_no]').val())*1;
		var reviewImg = $('.reviewImg');
		var proNames = $('.proNames a');
		
		console.log("reserv_no:::"+reserv_no);
		
		//상품 구매시 ajax
		if (reserv_no == 0) {
		
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
			            	   proNames.append(details[0].pro_name + " 외 " + (details.length-1) +"개");
			            	  
			               }else{
			            	   $.each(details, function(i, item){
			            		   proNames.append(item.pro_name);
			            		   
			                   });
			               }
			               
			               reviewImg.append(html);
			               showDivs(slideIndex);
					}
	               
				},
				error : function(request, status, errorData){ 
					
				}
			});
		}else{
			
			
			//클래스  구매시 ajax
			
			
			$.ajax({
				url:"orderClass1",
				data : {reserv_no : reserv_no},
				type:"get",
				dataType : "json",
				success:function(data){
					var html ="";
					html += "<img src='"+data.oneday_img+"'/>";
					 proNames.append(data.oneday_title);
		            
		            
		            reviewImg.append(html);
				}
			});
			
			
		}
		
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