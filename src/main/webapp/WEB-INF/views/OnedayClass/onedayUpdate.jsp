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
<title>관리자 class 등록</title>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>




<div id="fullmainI">
<div id="mainI">

<h5 class="subtitle">class update</h5>
<form action="${path}/onedayUpdateRs"  enctype="multipart/form-data" method="post"> 
<br/>
<input type="hidden"  name="oneno"  class="oneinsert"  value="${one.oneday_no}"/>
<span class="inserttag">클래스명</span>
<br/> 

<input type="text"  name="oneinsertN"  class="oneinsert"  value="${one.oneday_title}"/>

<br/>
<span class="inserttag">클래스 썸네일</span>
<br/>
<input type="file"  id="updateInput"  name="oneinsertS"  />

<div id="some" style="border:none; display: inline-block; display:none;"   >   <!-- hidden으로 해놓고 change이벤트 걸어서 미리보기 하기 -->
<img src="${one.oneday_img }"  alt="img" id="some_IMG" style="display: none;">
</div>

<br/>


<span class="inserttag" style="margin-top: 20px;">클래스 가격 </span>
<br/>


<input type="text" class="oneinsert"   name="oneinsertPR" value="${one.oneday_price}" />
<br/>


<span class="inserttag" >클래스 재고수량</span>
<br/>


<input type="number" class="oneinsert"    name="oneinsertM"  value=  "${one.oneday_maxPerson}"/>
<br/>

<button id="adrBtn" type="button" onclick="execDaumPostcode();">주소검색</button>
<br>
<span class="inserttag" >클래스 주소</span>
<br/>

<input type="text" class="oneinsert" id="addr1"   name="oneinsertP" value="${one.oneday_place}" />   <!-- 주소 -->
<br/>
<span class="inserttag" >클래스 상세주소</span>
<input type="text" class="oneinsert" id="addr2"    name="oneinsertPD"  value="${one.oneday_dtailPlace}"/>	<!-- 상세주소-->
<br/>

<span class="inserttag" >클래스  시작일</span>
<br/>


<input type="date" class="oneinsert"    name="oneinsertDS"  value="${one.oneday_start}"/>

<span class="inserttag" >클래스  마감일</span>
<br/>
<input type="date" class="oneinsert"    name="oneinsertDE" value="${one.oneday_end}" />
<br/>

<span class="inserttag" >클래스  수업시간</span>
<br>
<input type="time"   id="timeS"   name="oneinsertST" value="${one.oneday_Stime}" />
<span  id="insertspan">~</span>
<input type="time" class="oneinsertTime"  id="timeE"   name="oneinsertET"  value="${one.oneday_Etime}"/>
<br/>


<span class="inserttag" >클래스 설명</span>
<br/>


<textarea type="text" id="oneinsertT"   style="resize:none;"  name="oneinsertC"   >${one.oneday_content}</textarea>
<br/>


<button id="oneIbtn" type="submit">수정</button>
</form> 



</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

<script type="text/javascript">
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