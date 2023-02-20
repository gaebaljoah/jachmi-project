<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
	#goMain{
		margin-top: 100px;
		background-color: rgb(94, 94, 94);
      	border: none;
      	height: 40px;
      	width: 175px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
	   /*  text-align: center; */
	   	margin-left: 350px;
	}
	#goMypage{
		margin-top: 100px;
		background-color: rgb(52, 152, 219);
	    border: none;
	    height: 40px;
	    width: 180px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	   /*  text-align: center; */
	 	margin-right: 350px;
	   	float: right;
	}
	.div1{
		width: 50%;
		height: 50%;
		margin: auto;
	}
	.h1{
		text-align: center;
		margin-top: 20%;
	}
</style>
  <!-- 본문시작 -->
<div id="body-wrapper">
	<div id="body-content">

	<h1 style="text-align: center; margin-bottom: 10px;" >어떤 물건을 찾고 있나요?</h1>
	<hr class="my-hr3">

		<div class="div1">
			<h1 class="h1">결제가 완료되었습니다.</h1>
	<form action="/jiyoung/payUpdate" method="post" id="form">
	 	<input type="hidden" name="p_num" value="${vo.p_num }"> 
		<button id="goMain" >메인페이지로 이동</button>
	</form>
		<button id="goMypage" >대여내역 확인하기</button>
		</div>
</div>	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
 	
		$("#goMypage").on("click",function(e){
			e.preventDefault();
			location.href='/jiyoung/myPage';
		}); 


</script>
	<%@ include file="../include/footer3.jsp"%>	
</div>