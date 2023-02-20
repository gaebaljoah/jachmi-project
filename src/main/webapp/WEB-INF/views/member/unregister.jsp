<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
 font-family: 'NanumSquareNeo-Variable';
}			
	.unregister{
		margin-top: 7%;
		text-align: center;
	}
	.button{
		margin-top: 3%;
		text-align: center;
	}
	.button1{
		margin-right:2%;
		border:none;
		background-color: white;
		font-size: medium;
		cursor: pointer;
		text-decoration: none;
    	  border: none;
      	height: 60px;
      	width: 100px;
      font-size: 15px;
      border-radius: 5px;
      color: white;
      margin-top: 15px;
      padding: 10px;
       background-color: rgb(94, 94, 94);
      
	}
	.button2{
		border:none;
		background-color: white;
		font-size: medium;
		cursor: pointer;
		text-decoration: none;
    	color: black;
    	margin-right:2%;
		border:none;
		background-color: white;
		font-size: medium;
		cursor: pointer;
		text-decoration: none;
    	background-color: rgb(52, 152, 219);
    	  border: none;
      	height: 60px;
      	width: 100px;
      font-size: 15px;
      border-radius: 5px;
      color: white;
      margin-top: 15px;
      padding: 10px;
	}

</style>
</head>
<body>
	
		<div class="unregister">
			<h2>
			<strong style="font-weight: bolder;">${signIn.name }</strong> 
			회원님,
			</h2>
			<br>
			<h3>정말 혜택을 포기하실 건가요?</h3>
			
		</div>
		
		<div class="button">
			<a class="button1" href="unregister2">혜택 포기하고 탈퇴하기</a>
			<a class="button2" href="/">혜택 계속 사용하기</a>
		</div>
	
	
	
</body>
</html>
<%@ include file="../include/footer.jsp" %>