<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <style>
 #mypagemenu{    
       
width: 1280px;
	margin: auto;
	padding: auto;
 height: 100px; 
 padding-top:210px;
	position:static;
	
 }
                #mypagemenu ul li {     
                font-family: 'Jeju Myeongjo';
                	border:1px solid #BEBEBE;     
                        list-style: none;          
                                 
                        background-color:#d3d3d3;  
                        float: left;              
                        line-height: 30px;          
                        vertical-align: middle;     
                        text-align: center;         
                }
                #mypagemenu .linkmenu {                              
                        text-decoration:none;                      
                        color: #808080;                            
                        display: block;                           
                        width: 400px;                             
                        font-size: 20px;                          
                        font-weight: bold;                        
                        
                }
                #mypagemenu .linkmenu:hover {            
                        color: white;                 
                        background-color: #707070;    
                }
        </style>
<title>mypage</title>
</head>
<body>

<nav id="mypagemenu" >
                <ul>
                        <li><a class="linkmenu" href="<%=request.getContextPath()%>/orderList">주문 내역</a></li>
                        <li><a class="linkmenu" href="<%=request.getContextPath()%>/mydiary">내가 쓴 게시글</a></li>
                        <li><a class="linkmenu" href="${path}/nlist.do">문의하기</a></li>
                        <li><a class="linkmenu" href="#">구매후기</a></li>
                        <li><a class="linkmenu" href="<%=request.getContextPath()%>/update">개인 정보 수정</a></li>
                         <li><a class="linkmenu" href="<%=request.getContextPath()%>/delete">회원탈퇴</a></li>
                </ul>
        </nav>
        
   
         
         

</body>
</html>