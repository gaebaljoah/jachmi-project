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
		<h1 class="h1">대여 요청</h1>
		
		<h3 class="h3">대여 정보</h3>	
		
		<div class="date"> 날짜 </div>
		<div>${vo.r_start } - ${vo.r_end }</div>
		
		<div class="name"> 이름 </div>
		<div>${vo.r_name } </div>
		
		<div class="phone">연락처</div>
		<div>${vo.r_phone } </div>	
		
		<div class="price">총 합계(KRW)&nbsp;&nbsp;&nbsp;₩${vo.total_price } </div>
		
		<hr style="margin-top:40px;">
		
	<button id="goPay">결제하기</button>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script type="text/javascript">

		
		$("#goPay").on("click", function(e) {
			e.preventDefault();

		  	var clientKey = "test_ck_Z0RnYX2w532Lj9aJwXgrNeyqApQE";
	    	var tossPayments = TossPayments(clientKey);
	    	var ordername = '${vo.p_num}';
	    	var amount = '${vo.total_price}';
	    	var r_name = '${vo.r_name}';
	    
	    	tossPayments.requestPayment('카드', { 
			  	  // 결제 정보
			  	  amount: amount, //총가격									
			  	  orderId: 'aaaaaabbbb95',					//중복X
			  	  orderName: '토스 smile paws 결제 건',	//주문명	
			  	  customerName: r_name,
			  	  successUrl: 'http://localhost:8092/pay/success',
			  	  failUrl: 'http://localhost:8092/pay/fail',
			  	  flowMode: 'DIRECT',
			  	  easyPay: 'TOSSPAY'
			  	})
			  	.catch(function (error) {
			  	  if (error.code === 'USER_CANCEL') {
			  	    // 결제 고객이 결제창을 닫았을 때 에러 처리
			  	  } else if (error.code === 'INVALID_CARD_COMPANY') {
			  	    // 유효하지 않은 카드 코드에 대한 에러 처리
			  	  }
			  	}); 
		});  
		
</script>
<%@ include file="../include/footer3.jsp"%>
</div>