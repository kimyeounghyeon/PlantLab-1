<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/font.css">
<head>

   <style>
   
   *{ font-family: 'Jeju Myeongjo'; }
 #topMenu {    
       
width: 1280px;
	margin: auto;
	padding: 0;
 height: 100px; 
	padding-top:200px;
	position:relative;

	
 }
                #topMenu ul li {     
                	border:1px solid #BEBEBE;     
                        list-style: none;          
                                 
                        background-color:#d3d3d3;  
                        float: left;              
                        line-height: 30px;          
                        vertical-align: middle;     
                        text-align: center;         
                }
                #topMenu .menuLink {                              
                        text-decoration:none;                      
                        color: #808080;                            
                        display: block;                           
                        width: 400px;                             
                        font-size: 20px;                          
                        font-weight: bold;                        
                        font-family: 
                }
                #topMenu .menuLink:hover {            
                        color: white;                 
                        background-color: #707070;    
                }
        </style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/rainyday.js"></script>
</head>
<body>

<div><nav id="topMenu" >
                <ul>
                        <li><a class="menuLink" href="#">주문 내역</a></li>
                        <li><a class="menuLink" href="#">내가 쓴 게시글</a></li>
                        <li><a class="menuLink" href="#">문의하기</a></li>
                        <li><a class="menuLink" href="#">구매후기</a></li>
                        <li><a class="menuLink" href="#">개인 정보 수정</a></li>
                         <li><a class="menuLink" href="#">회원탈퇴</a></li>
                </ul>
        </nav></div>
         
</body>
</html>