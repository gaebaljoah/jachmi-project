<% response.setStatus(200); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>400error</title>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
			/* 로그인,로고이미지 묶음 */
            #top{
	            margin-top : 200px;
	            text-align: center;
	            margin: auto;
	            margin-top : 200px;
            }
            /* 로고이미지 */
            #logoimg{
            	margin-top : 200px;
            	width: 400px;
            }	
            /* 로그인버튼 */
            #historyback{
                background-color: #00a8f3;
                border:none;
                color:white;
                border-radius: 5px;
                width:50%;
                height:35px;
                font-size: 14pt;
                margin-top:100px;
            }
            #historyback:hover{
            		cursor: pointer;
            }
            /* ! 경고이미지*/
            #warning{
            	width: 80px;
            	height: 80px;
            	margin: auto;
    			display: block;
            }
            
            #homepage{
            	width: 150px;
            	height: 30px;
            	background-color: #00a8f3;
            	border-radius: 10px;
            	margin-top: 10px;
            	border:none;
            	color:white;
            }
           
            
</style>
</head>
<body>
<div id="top">

<!--  <a href="/"><img alt="" src="<spring:url value='/resources/image/logo.png'/>" id="logoimg" title="홈으로 돌아갑니다."></a>-->
<img alt="" src="<spring:url value='/resources/image/9042020_warning_circle_icon.png'/>" id="warning"> 
<h3 style="text-align: center; margin-bottom: 10px;" >페이지를 찾을 수 없습니다.</h3>
입력한 주소가 잘못되었거나, 사용이 일시 중단되어 <br>
요청한 페이지를 찾을 수 없습니다.<br>
서비스 이용에 불편을 드려 죄송합니다.<br>
<a href="javascript:history.back();"><button id="homepage" title="이전페이지로 이동합니다.">이전페이지로이동하기</button></a>
<a href="/"><button id="homepage" title="홈으로이동합니다..">홈으로이동하기</button></a>
</div>




</body>


</html>