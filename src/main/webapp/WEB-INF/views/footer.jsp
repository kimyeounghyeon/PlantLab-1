<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>



<footer>
<hr>
<br>
<br>
<br>
		<table class="tablet" border="0">
			<tr>
				<td class="subname"><img id="chi"src="${path}/resources/img/muirim.png">[무이림]<br><br></td>
			
				<td class="end" rowspan="3">
				<a href="http://pf.kakao.com/_XJWxns" onclick="void chatChannel();" target='_blank'> 1:1 상담 신청&nbsp;&nbsp;</a>/<a href="${path}/mypage">고객센터</a>
				<br>문의는1:1상담을 이용해주세요.
				</td>
			
			<tr>
				<td>대표: 플랜트랩&nbsp;&nbsp;고객센터(평일 09:00 ~ 18:00)
				<br>서울특별시 강남구 테헤란로14길 6
				<br><br>
				</td>
			<tr>
				<td>COPYRIGHT &copy; PLANTLAP ALL RIGHTS RESERVED</td>
			</tr>
		</table>
<br>
<br>
<br>
</footer>
	<script type="text/javascript">
		function chatChannel() {
			Kakao.Channel.chat({
				channelPublicId : '_XJWxns',
			})
		}
	</script>
