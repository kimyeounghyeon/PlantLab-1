<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>無以林 Store</title>
    <link href="${path}/resources/css/ProductListStyle.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<%-- 	<jsp:include page="header.jsp"></jsp:include> --%>
    <div id="content" class="contents">
		<section id="main_section">
            <!-- Store 제목 -->
            <div class="main_header">
                <h1 class="title">無以林 식물</h1>
                <!-- <h4 class="subTitle">식 물</h4> -->
            </div>

            <!-- Stroe 카테고리(왼쪽바) -->
            <article class="aside1">
                <h3>카테고리</h3>
                <hr>
                <ul class="cateList">
                    <li><a href="">식물</a></li>
                    <li><a href="">관리제품</a></li>
                    <li><a href="">원예용품</a></li>
                </ul>
            </article>

            <!-- Store 최근본 상품(오른쪽바) -->
            <article class="aside2">
                <h3>최근 본 상품</h3>
                <h4 class="recentCnt">5</h4>
                <ul class="recentList">
                    <li class="recentImg">
                        <a href="42_finalProView.html">
                            <img src="test.jpg"/>
                        </a>
                    </li>
                    <li class="recentImg">
                        <a href="42_finalProView.html">
                            <img src="test.jpg"/>
                        </a>
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

			<article class="main_article">
                <div class="orderby">
                    <ul class="orderList">
                        <li><a href="" class="nowOrder">최신순</a></li>
                        <li><a href="">판매량순</a></li>
                        <li><a href="">낮은 가격순</a></li>
                        <li><a href="">높은 가격순</a></li>
                    </ul>
                </div>
                
                <div class="search">
                    <input type="text" id="searchInput" placeholder=" 검색어">
                    <input type="button" value="검색" id="serachBtn">
                </div>

                <div class="pro">
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">큼직하고 시원스러운 진녹빛 잎!<br>떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                    <div class="proList">
                        <ul class="list">
                            <li class="proImg">
                                <a href="42_finalProView.html">
                                    <img src="test.jpg"/>
                                </a>
                            </li>
                            <li class="proName"><a href="42_finalProView.html">떡갈고무나무(중대형)</a></li>
                            <li class="proPri">112000원</li>
                        </ul>
                    </div>
                </div>
                
                <div class="page">
                    <ul>
                        <li class="now"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
                </div>
			</article>
		</section>
	</div>
</body>

<script>
    $(function(){
        var search = $('#searchInput');
        var serachBtn = $('#serachBtn');

        serachBtn.click(function(){
            console.log(search.val());

            if(search.val() == ""){
                swal("검색어를 입력해주세요!", "", "info");
            }
        });
    });
</script>
</html>