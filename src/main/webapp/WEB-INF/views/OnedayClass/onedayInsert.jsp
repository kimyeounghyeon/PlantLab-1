<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css"/>
<link href="${path}/resources/css/header.css" rel="stylesheet" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/Oneday/OnedayInsert.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<meta charset="UTF-8">
<title>class insert</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>




<div id="fullmainI">
<div id="mainI">
<div id="insertDiv"> 
<h5 class="subtitle">class 등록</h5>


<form action="${path}/onedayInsertResult"  enctype="multipart/form-data" method="post">
<br/>
<span class="inserttag">클래스명</span>
<br/> 

<input type="text" id="oneName"  name="oneinsertN"  class="oneinsert"/>

<br/>
<span class="inserttag">클래스 썸네일</span>
<br/>
<input type="file" accept="image/jpeg, image/jpg, image/png"  id="updateInput"  name="oneinsertS" />


</div>


<br/>


<span class="inserttag" style="margin-top: 20px;">클래스 가격 </span>
<br/>


<input type="text" class="oneinsert" id="onePrice"   name="oneinsertPR" />
<br/>


<span class="inserttag" >클래스 재고수량</span>
<br/>


<input type="number" class="oneinsert"  id="oneStock"   name="oneinsertM" />
<br/>

<button id="adrBtn" type="button" onclick="execDaumPostcode();">주소검색</button>
<br>
<span class="inserttag" >클래스 주소</span>
<br/>

<input type="text" class="oneinsert" id="addr1"   name="oneinsertP" />   <!-- 주소 -->
<br/>
<span class="inserttag" >클래스 상세주소</span>
<input type="text" class="oneinsert" id="addr2"    name="oneinsertPD" />	<!-- 상세주소-->
<br/>


<span class="inserttag" >클래스  시작일</span>
<br/>


<input type="date" class="oneinsert"   id="start"  name="oneinsertDS" />

<span class="inserttag" >클래스  마감일</span>
<br/>
<input type="date" class="oneinsert"  id="end"   name="oneinsertDE" />
<br/>


<span class="inserttag" >클래스  수업시간</span>
<br>
<input type="time"   id="timeS"   name="oneinsertST" />
<span  id="insertspan">~</span>
<input type="time" class="oneinsertTime"  id="timeE"   name="oneinsertET" />
<br/>


<span class="inserttag" >클래스 설명</span>
<br/>


<textarea type="text" id="oneinsertT"   style="resize:none;"  name="oneinsertC"   ></textarea>
<br/>


<button id="oneIbtn" type="submit">등록</button>
</form>

</div>

</div>
</div>

	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script>
	
	$(function(){								//공백체크
		$("#oneIbtn").click(function(){
		  if($("#oneName").val().length ==0 ) {alert("클래스 명을 입력해주세요"); $("#oneName").focus();	return false;}
		  else if($("#updateInput").val().length ==0 )  {alert("사진을 넣어주세요"); $("#updateInput").focus();	return false;}
		  else if($("#onePrice").val().length ==0 )  {alert("예약 금액을 입력해주세요"); $("#onePrice").focus();	return false;}
		  else if($("#oneStock").val().length ==0 )  {alert("재고 좌석을 입력해주세요"); $("#oneStock").focus();	return false;}
		  else if($("#addr1").val().length ==0 )  {alert("주소를 입력해주세요"); $("#addr1").focus();	return false;}
		  else if($("#addr2").val().length ==0 )  {alert("상세 주소를 입력해주세요"); $("#addr2").focus();	return false;}
		  else if($("#start").val().length ==0 )  {alert("클래스 시작일을 입력해주세요"); $("#start").focus();	return false;}
		  else if($("#end").val().length ==0 )  {alert("클래스 마감일 입력해주세요"); $("#end").focus();	return false;}
		  else if($("#oneinsertT").val().length ==0 )  {alert("클래스에 대한 설명을 입력해주세요"); $("#oneinsertT").focus();	return false;}

		});
		})
	
	
	
	
	
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
  //              document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr;
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>

</body>
</html>