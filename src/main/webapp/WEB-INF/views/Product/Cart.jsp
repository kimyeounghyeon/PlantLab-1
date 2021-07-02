<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 cart</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
    <link href="${path}/resources/css/header.css" rel="stylesheet"/>
    <link href="${path}/resources/css/footer.css" rel="stylesheet"/>
    <link href="${path}/resources/css/Product/CartStyle.css" rel="stylesheet"/>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                    <div class="cartList">  
                       	<c:if test="${empty cartList}">
                       		<h3>상품이 존재하지 않습니다.</h3>
                       	</c:if>
                       	<c:if test="${not empty cartList}">
                       	<label class="checkContain">
	                        <input type="checkbox" id="allcheck">
	                        <span class="checkmark"></span>
	                    </label>
                       		<c:forEach  var="vo" items="${cartList}" varStatus="status">
                       			<input type="hidden" class="pro_no" name="pro_no" value="${vo.pro_no}">
                       			<table class="prolist" id="${status.index}">
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
	                                        <span class="cntValue">${vo.pro_cnt}</span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="proGuide" colspan="2">
	                                        <p>가격</p>
	                                    </td>
	                                    <td class="proPri pro" colspan="2">
	                                        <p><span class="priceValue"></span></p>
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
                                   	   <form id="orderF">
                                   	   		<input type="hidden" name="buy_totalprice"  value="">
                                   	   		<input type="hidden" name="deliv"    		value="5000">
	                                        <button type="button" class="infoBtn infoB" id="choseBuy">선택상품 구매</button>
                                   	   </form>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2" class="buyBG"> 
                                       <button type="button" class="infoBtn" id="allBuy">전체상품구매</button>
                                   </td>
                               </tr>
                           </table>
                    </div>
                </div>
            </article>
        </section>
    </div>
</body>
<script>
    $(function(){
    	//금액 전달용
    	var form = $('#orderF');
    	
    	//pro_no 보관용
    	var pro_no = $('.pro_no');
        var proNo = [];
    	
    	//금액표시
        var proAllP = $('#proAllP');
        var allPrice = $('#allPrice');
        var valSave = 0; //개별체크 금액 세이브용
        var allSave = 0; //전체체크 금액 세이브용
        var valAllSave = []; //모든 금액 세이브용
        
        //금액계산
        var voPrice = $('.voPrice');
		var proPri  = $('.priceValue');
        var cntValue = $('.cntValue');
        var all = 0; 

        for(var i = 0; i < voPrice.length; i++){
            var val = voPrice[i].value;
            val = val.substring(0,val.indexOf('원'));
	    	val = val.replace(',','');
          
            var num = cntValue[i].textContent;

            val = val*num;
            valAllSave[i] = val;
            allSave += val;
            
            val =  val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
             
            proPri[i].append(val+"원");
        }//금액계산

        // 체크박스
        var allcheck = $('#allcheck');
        var prock = $('input[name=prock]');

        //전체체크 선택시 ==========================================================
        allcheck.click(function(){
            if($(this).prop('checked')){
                prock.prop('checked',true);

                all = allSave;
                var total = all + 5000;
               
                form.children("input[name=buy_totalprice]").val(allSave);
                var allSaveT =  allSave.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                form.children("input[name=proAllP]").val(total);
                total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                allPrice.text(total+"원");
                proAllP.text(allSaveT+"원");
                
                pro_no.length = 0;
                
                for(var a=0; a<prock.length;a++){
                    proNo[a] = pro_no[a].value;
                }
            }else{
                prock.prop('checked',false);
                all = 0;
                proAllP.text(0+"원");
                allPrice.text(0+"원");
                
                form.children("input[name=buy_totalprice]").val(0);
                form.children("input[name=proAllP]").val(0);
                
                for(var a=0; a<pro_no.length;a++){
                	proNo[a] = pro_no[table].value;
                }
            }
        }); //전체체크 이벤트

        //개별체크시 ==========================================================
        prock.click(function(){
            //체크개수
            var cnt = $("input[name=prock]:checked").length;
            
            //전체체크유무
            if(prock.length == cnt){
                allcheck.prop('checked',true);
            }else{
                allcheck.prop('checked',false);
            }

            //총금액 계산
            
            if($(this).is(":checked") == true){
                var table = $(this).parents('table').attr('id');
                
                all += (valAllSave[table]);
                valSave = all;
                var total = all + 5000;                
                
                form.children("input[name=buy_totalprice]").val(valSave);
                valSave =  valSave.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                form.children("input[name=proAllP]").val(total);
                total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                allPrice.text(total+"원");
                proAllP.text(valSave+"원");
                
                proNo[proNo.length] = pro_no[table].value;
            }else{
                var table = $(this).parents('table').attr('id');
                var proTV = $(this).parents('table').children('input[name=pro_no]');

                var allValue = proAllP.text();
                allValue = allValue.substring(0,allValue.indexOf('원'));
	    	    allValue = allValue.replace(',','');

                all -= (valAllSave[table]);
                var total = all + 5000;          

                allValue -= (valAllSave[table]);
                valSave = allValue;
                
                form.children("input[name=buy_totalprice]").val(valSave);
                valSave =  valSave.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                form.children("input[name=proAllP]").val(total);
                total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                allPrice.text(total+"원");
                proAllP.text(valSave+"원");
                
                
                proNo.splice(proNo.indexOf("proTV.val()"),1);
                
                for(var a=0; a<proNo.length;a++){
                    console.log("삭제확인"+proNo[a]);
                }
            }
        });//체크 이벤트
        
       //삭제B ==========================================================
       var choseDel = $('#choseDel');

        choseDel.click(function(){
            for(var a=0; a<proNo.length; a++){
            	console.log(proNo[a]);
            	$.ajax({
					url:"cartDel.do",
					data : {pro_no:proNo[a]},
    				type:"post",
    				success:function(result){
    					if(result == "del"){ //삭제 성공시
    						setTimeout(function(){
    							location.reload();
    						},1000); // 3000밀리초 = 3초
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
        });//삭제 이벤트
        
        //선택구매B ==========================================================
        var choseBuy = $('#choseBuy');

        choseBuy.click(function(){
        	if(proNo.length == 0){
        		swal("상품을 선택해주세요","", "info");
        	}else{
        		for(var a=0; a<proNo.length; a++){
	        		form.prepend("<input type='hidden' name='pro_no' value='"+proNo[a]+"'>");
	        	}
	        	form.attr("method","post");
	        	form.attr("action","orders");
	        	form.submit();
           	}
    	});//구매 이벤트
    	
    	//전체구매B ==========================================================
        var allBuy = $('#allBuy');	
    	
        allBuy.click(function(){
        	
        	allcheck.click();
        	
        	for(var a=0; a<prock.length;a++){
                proNo[a] = pro_no[a].value;
            }
        	
        	for(var a=0; a<proNo.length; a++){
        		form.prepend("<input type='hidden' name='pro_no' value='"+proNo[a]+"'>");
        	}
        	form.attr("method","post");
        	form.attr("action","orders");
        	form.submit();
        });//전체 구매
    });
</script>
</html>