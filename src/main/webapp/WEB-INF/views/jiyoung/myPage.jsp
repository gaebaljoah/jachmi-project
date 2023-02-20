<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
.div1{
		width: 50%;
		height: 50%;
		margin: auto;
	}
	.h1{
		margin-top: 5%;
	}
	.h3{
		margin-top: 5%;
		margin-bottom: 2%;
	}
	.date{
		margin-bottom:20px;
	}
	.name{
		margin-top: 20px;
		margin-bottom:20px;
	}
	.phone{
		margin-top: 20px;
		margin-bottom:20px;
	}
	#goPay{
		margin-top: 20px;
		background-color: rgb(52, 152, 219);
	    border: none;
	    height: 40px;
	    width: 200px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    float:right;
	}
	.price{
		float: right;
	}
</style>
  <!-- 본문시작 -->
<div id="body-wrapper">
	<div id="body-content">
	<div class="div1">
		<div><h1 class="h1">${signIn.name }님의 대여내역</h1></div>
		
		<h3 class="h3">대여 정보</h3>	
		
		<div class="date"> 날짜 </div>
		<div>${vo.r_start } - ${vo.r_end }</div>
		
		<div class="name"> 이름 </div>
		<div>${vo.r_name } </div>
		
		<div class="phone">연락처</div>
		<div>${vo.r_phone } </div>	
		
		<div class="price">총 합계(KRW)&nbsp;&nbsp;&nbsp;₩${vo.total_price } </div>
		
		<hr style="margin-top:40px;">
		</div>
</div>
<%@ include file="../include/footer3.jsp"%>
</div>