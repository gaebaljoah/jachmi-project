<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
	/*내물건 등록하기*/
	#mystuff{
		float: left;
		margin-right: 15%;
		margin-top: 50px;
	}
	.div2{
		float: left;
		width: 200px;
		margin-top: 100px;
	}
	
	.register{
		text-decoration: none; 
		color: black;
	}
	.div2-1{
		width: 120px; 
		height: 18px; 
		margin-top: 5px; 
		font-size: 18px; 
		text-align: center; 
		font-weight: bold;
	}
/* 	.alldiv{
		height: 80%;
	} */
</style>
  <!-- 본문시작 -->
	<div id="body-wrapper">
	<div id="body-content">
	
	<c:choose>
	<c:when test="${empty signIn }">
	 <h1 style="text-align: center; margin: auto; font-family: 'Chosunilbo_myungjo';">게시글 조회권한이없습니다. <br>(로그인을 해주시길 바랍니다.)</h1>
	
	</c:when>
	<c:when test="${!empty signIn }">
	<h1 style="text-align: center; margin-bottom: 10px;" >어떤 물건을 찾고 있나요?</h1>
	<hr class="my-hr3">

	
				<div id="mystuff" style="float: right">
				<a class="register" href="owner_register">내 물건 등록하기</a>
				</div>
<!-- 	<div class="alldiv"> -->
				
				<div class="div2" style="margin-left: 35%;">
					<a href="Electronic?p_category=1"><img class="icons" src="/resources/icon/5047530.png" style="width: 120px"></a>
					<div class="div2-1">전자기기</div>
				</div>
				
				<div class="div2">
					<a href="Living?p_category=2"><img class="icons" src="/resources/icon/4600595.png" style="width: 120px"></a>
					<div class="div2-1">주방용품</div>
				</div>
				
				<div class="div2">
					<a href="Etc?p_category=3"><img class="icons" src="/resources/icon/7371484.png" style="width: 120px"></a>
					<div class="div2-1">기타</div>
				</div>
		
<!-- 		</div> -->
				
	</c:when>
	</c:choose>
	</div> <!-- body-content 끝나는곳 -->
	

	<%@ include file="../include/footer3.jsp"%>
	</div> <!-- body-wrapper끝나는곳 -->
