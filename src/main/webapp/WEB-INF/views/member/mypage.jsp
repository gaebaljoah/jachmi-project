<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %> 
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
 font-family: 'NanumSquareNeo-Variable';
}
h2{
	margin: 10px;
}
img{
	margin-top: 15px;
}
/*주문내역*/
	#orderhistory{
		margin: auto;
		text-align: center;
		margin-left: 550px;
		float: left;
		box-shadow: 5px 5px;
		border: 1px solid black;
		margin-top: 40px;
		width: 400px;
		height: 200px;
	}
	#orderhistory:hover{
		cursor: pointer;
	}
	/*공동구매*/
	#Groupbuying{
		display : inline-block;
		margin: auto;
		text-align: center;
		margin-left: 10px;
		border: 1px solid black;
		box-shadow: 5px 5px;
		margin-top: 40px;
		width: 400px;
		height: 200px;
	}
	#Groupbuying:hover{
		cursor: pointer;
	}
	/*물품대여*/
	#Itemrental{
		margin: auto;
		text-align: center;
		margin-left: 350px;
		float: left;
		box-shadow: 5px 5px;
		border: 1px solid black;
		margin-top: 15px;
		margin-top: 40px;
		width: 400px;
		height: 200px;
	}
	#Itemrental:hover{
		cursor: pointer;
	}
	/*게시판*/
	#noticeboard{
		display : inline-block;
		margin: auto;
		text-align: center;
		box-shadow: 5px 5px;
		border: 1px solid black;
		margin-left: 10px;
		margin-top: 15px;
		margin-top: 40px;
		width: 400px;
		height: 200px;
	}
	#noticeboard:hover{
		cursor: pointer;
	}
	/*회원정보수정*/
	#Editmemberinformation{
		display : inline-block;
		margin: auto;
		text-align: center;
		box-shadow: 5px 5px;
		border: 1px solid black;
		margin-left: 10px;
		margin-top: 15px;
		width: 400px;
		height: 200px;
		margin-top: 40px;
	}
	#Editmemberinformation:hover{
		cursor: pointer;
	}

/*  #btn{
	background-color: white;
	box-shadow: 5px 5px;
	text-align: center;
	margin: auto;
}*/


</style>
<div id="body-wrapper">
	<div id="body-content">
		<h1 style="text-align: center; margin-bottom: 10px;" >마이페이지</h1>
		<hr class="my-hr3">
		<div id="orderhistory">
			<form action="/order/getOrderList" method="get" id ="orderList">
			<input type="hidden" class="form-control" name="order_m_id" value="${signIn.id}"/>
			</form>	
			<h2>주문내역</h2><br>클릭시 주문상세내역으로 이동합니다.<br><img alt="" src="<spring:url value='/resources/image/orderhistory.png'/>" style="width: 80px">
		</div>
		<div id="Groupbuying">
			<h2>공동구매</h2><br>클릭시 모집,참가글로 이동합니다.<br><img alt="" src="<spring:url value='/resources/image/Groupbuying.png'/>" style="width: 80px">
		</div>
		<br>
		<div id="Itemrental">
			<h2>물품대여</h2><br>클릭시 물품대여 상세페이지로 이동합니다.<br><img alt="" src="<spring:url value='/resources/image/Itemrental.png'/>" style="width: 80px">
		</div>
	<div id="noticeboard">
		<form id="boardForm" action="/board/board_list_getOne" method="post">
			<h2>게시판</h2><br>클릭시 내게시글로 이동합니다.<br><img alt="" src="<spring:url value='/resources/image/noticeboard.png'/>" style="width: 80px">
			<input type="hidden" name="id" value="${signIn.id }">
		</form>
	</div>
		<div id="Editmemberinformation">
			<h2>회원정보수정</h2><br>클릭시 회원정보수정창으로 이동합니다.<br><img alt="" src="<spring:url value='/resources/image/Editmemberinformation.png'/>" style="width: 80px">
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>    
</div>
<form action="/seller/myinsert" method="post" id="idForm">
      <input type="hidden" name="pageNum" value="1">
      <input type="hidden" name="amount" value="10">
      <input type="hidden" name="id" value="${id }">
</form>
<script>
	var idForm = $("#idForm"); 

	$("#orderhistory").click(function(){
		$("#orderList").submit();
	})
	
	$("#Editmemberinformation").click(function(){
		location.href = "myinfo";
	});
	
	$("#Groupbuying").click(function(e){
	      e.preventDefault();
	      idForm.attr("action","/seller/myattend")
	      idForm.submit();
	   });
	$("#Itemrental").click(function(){
		location.href = "/jiyoung/myPage";
	});
	$("#noticeboard").on("click", function(e) {
 		location.href = "/board/getOne";
	})	
</script>