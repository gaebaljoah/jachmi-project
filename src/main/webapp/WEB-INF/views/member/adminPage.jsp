<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'NanumSquareNeo-Variable';
}

h2 {
	margin: 10px;
}

img {
	margin-top: 15px;
}
/*주문내역*/
#reg_btn {
	margin: auto;
	text-align: center;
	margin-left: 15%;
	float: left;
	box-shadow: 5px 5px;
	border: 1px solid black;
	margin-top: 40px;
	width: 400px;
	height: 200px;
	display: inline-block;
}

#reg_btn:hover {
	cursor: pointer;
}

#answer_btn {
    margin: 40px 3% 0 3%;
	text-align: center;
	float: left;
	box-shadow: 5px 5px;
	border: 1px solid black;
	width: 400px;
	height: 200px;
	display: inline-block;
	cursor: pointer;
}

#chatList_btn {
	margin: auto;
	text-align: center;
	margin-right: 15%;
	float: left;
	box-shadow: 5px 5px;
	border: 1px solid black;
	margin-top: 40px;
	width: 400px;
	height: 200px;
	display: inline-block;
	
}

#chatList_btn {
	cursor: pointer;
}

#body-content {
	text-align: center;
}
</style>
<div id="body-wrapper">
	<div id="body-content">
		<h1 style="text-align: center; margin-bottom: 10px;">관리자 페이지</h1>
		<hr class="my-hr3">

		<div class="btn" id="reg_btn">
			<form action="/product/register" method="get" id="reg_controller"></form>
			<h2>상품등록</h2>
			<br>클릭시 상품등록페이지로 이동합니다.<br>
			<img alt=""
				src="<spring:url value='/resources/image/orderhistory.png'/>"
				style="width: 80px">
		</div>

		<div class="btn" id="answer_btn">
			<form action="/ask/getAskListAdmin" id="answer_controller">
				<input type="hidden" name="amount" value="10"> <input
					type="hidden" name="pageNum" value="1">
			</form>
			<h2>문의내역</h2>
			<br>클릭시 문의내역 페이지 이동합니다.<br>
			<img alt=""
				src="<spring:url value='/resources/image/Groupbuying.png'/>"
				style="width: 80px">
		</div>

		<div class="btn" id="chatList_btn">
			<form action="/chat/chat_list" id="chat_controller">
				<h2>채팅관리</h2>
				<br>클릭시 채팅관리 페이지로 이동합니다.<br>
				<img alt=""
					src="<spring:url value='/resources/image/9055231_bxs_chat_icon.png'/>"
					style="width: 80px">
			</form>
		</div>


	</div>
	<%@ include file="../include/footer3.jsp"%>
</div>
<script>
	//상품등록 페이지 이동
	$("#reg_btn").click(function() {
		$("#reg_controller").submit();
	});

	$("#answer_btn").click(function() {
		$("#answer_controller").submit();
	});

	$("#chatList_btn").click(function() {
		$("#chat_controller").submit();
	});
</script>