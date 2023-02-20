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
	.read{
		margin-left: 18%;
		margin-top: 3%;
	}
	h3{
		margin-bottom: 2%;
		margin-top: 2%;
	}
	ul li{
		margin-bottom:2%;
		margin-left:2%;
		font-size: small;
	}
	.checkbox{
		margin-left: 18%;
		margin-top: 3%;
		font-size: small;
	}
	h4{
		margin-top: 2%;
	}
	.button{
		margin-top: 3%;
		text-align: right;
		margin-right: 500px;
		padding-bottom: 30px;
	}
	.button1{
		margin-right:2%;
		border:none;
		font-size: medium;
		cursor: pointer;
		text-decoration: none;
    	background-color: rgb(52, 152, 219);
      	font-size: 15px;
      	border-radius: 5px;
      	color: white;
      	margin-top: 15px;
      	padding: 5px 10px 5px 10px;
	}
	.button2{
		border:none;
		background-color: white;
		font-size: medium;
		cursor: pointer;
		 background-color: rgb(94, 94, 94);
      	font-size: 15px;
      	border-radius: 5px;
      	color: white;
      	padding: 5px 10px 5px 10px;
      	margin-top: 15px;
	}
	.remove{
		float:right;
	}


</style>
</head>
<body>
	<div class="read">
		<h3>탈퇴 시 삭제되는 내용</h3>
			<ul>
				<li>탈퇴 시 고객님께서 보유하셨던 쿠폰과 마일리지는 모두 소멸되며 환불할 수 없습니다. 또한 다른 계정으로 양도 또는 이관할 수 없습니다.</li>
				<li>탈퇴한 계정 및 이용 내역은 복구할 수 없으니 탈퇴 시 유의하시기 바랍니다.</li>
			</ul>
		<h3>탈퇴 시 보관 또는 유지되는 항목</h3>
			<ul>
				<li>탈퇴 시 법령에 따라 보관해야 하는 항목은 관련 법령에 따라 일정 기간 보관하며 다른 목적으로 이용하지 않습니다.
				전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 <br><br>대금결제 및 재화 등의 공급에 관한 기록 5년, 계약 또는 청약철회 등에 관한 기록 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년동안 보관됩니다.</li>
				<li>탈퇴 후에도 서비스에 등록한 게시물 및 댓글은 그대로 남아 있습니다. 상품 리뷰, 게시글, 이벤트 댓글 등은 삭제되지 않습니다. 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 <br><br> 확인할 수 없으므로 게시글을 임의로 삭제해드릴 수 없습니다. 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>
			</ul>
		<h3>탈퇴 불가 및 기타 유의사항</h3>
			<ul>
				<li>진행 중인 주문이 있는 경우에는 탈퇴할 수 없습니다. 이미 결제가 완료된 건은 탈퇴로 취소되지 않으므로 주문 취소 후 탈퇴를 시도하시고, 주문 내역을 미리 확인해주세요.</li>
				<li>동일 아이디는 탈퇴 후 재사용할 수 없습니다.</li>
			</ul>
	</div>
	
	<div class="checkbox">
		<input class="check" type="checkbox" name="check" value="1" size="medium">&nbsp;&nbsp;&nbsp;위 내용을 모두 확인했습니다. (필수)
		
		<h4>아이디 : ${signIn.id } ( ${signIn.email } ) </h4>
	</div>
			
		<div class="button">
			<a class="button1" href="myinfo">취소하기</a>
					<input class="button2" type="button" value="탈퇴하기">
			<div class="remove">
				<form action="unregister3" method="post" id="unregister">
					<input type="hidden" name="id" value="${signIn.id }">
					<input type="hidden" name="pw" value="${signIn.pw }">
				</form>
			</div>
		</div>
</body>
<script type="text/javascript">
	check = $(".check");
	
	$(".button2").click(function(e){
		e.preventDefault();
		
		var form = document.getElementById("unregister");
		
		if(check.is(':checked')){
			alert("정말로 탈퇴하시겠습니까?");
			form.submit();
		}else{
			alert("약관 동의에 체크해주세요.");
			return;
		}
	});

</script>
</html>
<%@ include file="../include/footer2.jsp" %>