<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>無以林 Store</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
	<link href="${path}/resources/css/header.css" rel="stylesheet" />
	<link href="${path}/resources/css/footer.css" rel="stylesheet" />
	<link href="${path}/resources/css/Product/ProductViewStyle.css" rel="stylesheet" />
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style>
		#stockV{
			font-weight: bold;
		}
		
		#proDel{
			 background-color: #625b54;
			 color: white;
			 font-weight: bold;
		}
		
		/* ====== 신고하기 모달창 ====== */
		.modal{ 
		    padding-top: 30px;
		    display: none;
		    margin: auto;
		    width: 400px;
		    height:200px;
		    text-align:center;
		    background-color: white;
		    border: solid 1px #CCCCCC;
		    border-radius: 10px;
		    z-index: 8;
		    box-shadow: 0px 0px 5px #ccc;
		     position: relative;
		    top: -800px;
		    left:0px;
		}
		
		.report{
		    width: 80%;
		    margin: auto;
		    margin-bottom: 50px;
		    text-align: center;
		}
		
		.report h3{
		    text-align: left;
		    text-align: center;
		}
		
		.report .rBtn{
		    margin-top: 30px;
		    width: 30%;
		    height: 50px;
		    background-color: white;
		    
		    border: none;
		    border-radius: 10px;
		    font-size: 20px;
		    cursor: pointer;
		}
		
		#cancel{
		    margin-right: 30px;
		    background-color: #ccc;
		}
		
		#cancel:hover{
		    background-color: #D5D9BA;
		}
		
		#subDel{
		    border: solid 1px #D5D9BA;
		}
		
		#subDel:hover{
		    background-color: #D5D9BA;
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
				<h1 class="title">상품 수정 및 삭제</h1>
			</div>

			<article class="main_article">
				<div class="detail">
					<input type="hidden" id="pro_no" name="pro_no" value="${product.pro_no}">
					
					<table>
						<tr>
							<td id="proImg" rowspan="6"><img src="${product.pro_image}" />
							</td>
							<td id="space" rowspan="6"></td>
							<td id="proName" colspan="4"><p>${product.pro_name}</p>
							<hr class="hrs"></td>
						</tr>
						
						<tr>
							<td class="guide">판매가</td>
							<td id="proPri"><span id="priceV">${product.pro_price}</span></td>
						</tr>
						<tr>
							<td class="guide">재고수량</td>
							<td><span id="stockV">${product.pro_stock}개</span></td>
						</tr>
						
						<tr>
							<td colspan="4" class="buyGuide">
								<button type="button" onClick="location.href='${path}/proWrite?proNo=${product.pro_no}'" id="proMod" class="bBtn">수정하기</button>
								<button type="button" id="proDel" class="bBtn">삭제하기</button>
							</td>
						</tr>
					</table>
			</article>
		</section>
	</div>
	<div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	
	<div class="modal">
        <div class="modal_content">
            <form class="report">
                <input type="hidden" name="pro_no" value="${product.pro_no}">
                
                <h3 class="subTitle">정말로 삭제하시겠습니까?</h3>
               
                <button type="button" class="rBtn" id="cancel">취소하기</button>
                <button type="button" class="rBtn" id="subDel">삭제하기</button>
            </form>
        </div>
    </div>
</body>

<script>
	$(function() {
		//삭제하기 모달창
		//신고하기 모달창
        $('#proDel').click(function(){
	    	$(".modal").fadeIn(); 
	    });
		
		$('#cancel').click(function(){
			$(".modal").fadeOut(); 
		});
		
		$('#subDel').click(function(){
			var form = $('.report');
			form.attr("method","get");
			form.attr("action","proDel");
			form.submit();
		});
	});
</script>
</html>