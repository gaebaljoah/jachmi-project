<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">

* {
	font-family: 'NanumSquareNeo-Variable';
}

@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Chosunilbo_myungjo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.container {
	width: 1000px;
	margin: auto;
}

table td {
	padding-bottom: 10px;
	padding-top: 10px;
	padding-right: 10px;
}

#pay_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.5em;
	font-size: 17px;
	width: 160px;
	border: none;
}

#pay_btn_wrap {
	text-align: center;
}

.addr_change_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 70px;
	border: none;
}

.subTitle {
	color: rgb(57, 186, 228);
	font-size: 17px;
	font-family: bold;
}
</style>

</head>
<body>

	<div class="container">
		<div style="text-align: center;">
			<h1>주문서</h1>
		</div>

		<br /> <b class="subTitle">주문상품</b>
		<hr />
		<table>
			<c:forEach var="order" items="${list}">
				<tr>
					<%-- <td><b>${order.cart_idx}</b>&nbsp;&nbsp;&nbsp; 
					<c:set var="allIdx" value="${order.cart_idx}" /></td> --%>
					<c:set var="allIdx" value="${order.cart_idx}" />
					<td ><img src="/uploadImages/${order.cart_img}"
						style="width: 100px;" style=height:100px;>&nbsp;&nbsp;&nbsp;</td>
					<td ><b>${order.cart_product_name}</b>&nbsp;&nbsp;&nbsp;</td>
					<td ><b>${order.cart_product_option}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td ><b>${order.cart_count}</b>&nbsp;&nbsp;&nbsp;</td>
					<fmt:formatNumber var="comPrice"
						value="${order.cart_count * order.cart_price}" type="number" />
					<td ><b>${comPrice}원</b>&nbsp;&nbsp;&nbsp; <c:set var="total"
							value="${total + (order.cart_count * order.cart_price) }" /></td>
				</tr>
			</c:forEach>
		</table>
		<br /> <br /> <b class="subTitle">주문자 정보</b>
		<hr />

		<table>
			<tr>
				<td><b>받으시는 분</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>${signIn.name}</td>
			</tr>
			<tr>
				<td><b>이메일 주소</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>${signIn.email}</td>
			</tr>
			<tr>
				<td><b>연락처</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>${signIn.phone}</td>
			</tr>
		</table>
		<br /> <br /> <b class="subTitle">배송 정보</b>
		<hr />
		<table>
			<tr>
				<td><b>주소 변경</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input type="text" id="address_kakao" name="order_addr"
					readonly="readonly" class="form-control"
					value="${signIn.addr}" style="width: 350px;" /></td>
				<td><input type="button" id="addressChange-btn"
					class="addr_change_btn" value="변경" /></td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td><input type="text" class="form-control"
					name="order_addr_detail"value="${signIn.addr_ck}" /></td>
			</tr>
		</table>
		<br /> <br /> <b class="subTitle">결제 정보</b>
		<hr />
		<div class="totaPrice로 처리">
			<table>
				<fmt:formatNumber var="comTotal" value="${total}" type="number" />
				<fmt:formatNumber var="comTotalPlus" value="${total+3000}"
					type="number" />
				<tr>
					<td><b>주문금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><c:out value="${comTotal}원"></c:out></td>
				</tr>
				<tr>
					<td><b>배송비</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><c:if test="${total ge 50000}">
					0원
					</c:if> <c:if test="${total lt 50000}">
					3,000원
					</c:if></td>
				</tr>
				<tr>
					<td><b class="subTitle">최종결제금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><c:if test="${total ge 50000}">

							<b>${comTotal}원</b>

						</c:if> <c:if test="${total lt 50000}">
							<b>${comTotalPlus}원</b>

						</c:if></td>
				</tr>
			</table>

		</div>
		<hr />
		<form action="/order/registerFromCart" method="post" id="go_order">
			<div id="pay_btn_wrap">
				<input type="hidden" name="order_recv" value="${signIn.name}" /> <input
					type="hidden" name="order_m_id" value="${signIn.id}" /> <input
					type="hidden" name="order_email" value="${signIn.email}" /> <input
					type="hidden" name="order_tel" value="${signIn.phone}" /> <input
					type="hidden" name="order_addr" value="${signIn.addr}" /> <input
					type="button" value="결제하기" id="pay_btn"
					onclick="reg_order_btn(this.form)">
			</div>
		</form>
	</div>

</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	//주소 api
	window.onload = function() {
		document
				.getElementById("addressChange-btn")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
											document
													.querySelector(
															"input[name=order_addr_detail]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}

	//결제 api

	function reg_order_btn(f) {

		//var order_price = f.totalPrice.value;
		var order_recv = f.order_recv.value;
		var order_addr = f.order_addr.value;
		var order_addr_detail = $('input[name=order_addr_detail]').val();
		var order_tel = f.order_tel.value;
		var order_email = f.order_email.value;
		var order_m_id = f.order_m_id.value;

		if (!order_addr_detail) {
			alert("상세주소를 입력해주세요.");
			return;
		} else {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp23484225');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP
					.request_pay(
							{
								pg : 'html5_inicis',
								pay_method : 'card',
								merchant_uid : 'merchant_'
										+ new Date().getTime(),
								name : '상품명:'+,
								amount : 100,
								//상품금액
								buyer_email : order_email,
								//이메일
								buyer_name : order_recv,
								//주문자명
								buyer_tel : '010-6286-7692',
								//전화번호
								buyer_addr : order_addr + order_addr_detail,
								//주소
								buyer_postcode : '123-456',
							//우편번호
							},
							function(rsp) {
								console.log(rsp);
								if (rsp.success) {

									var msg = '결제가 완료되었습니다.';
									msg += '고유ID : ' + rsp.imp_uid;
									msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '결제 금액 : ' + rsp.paid_amount;
									msg += '카드 승인번호 : ' + rsp.apply_num;
									alert(msg);

									var str = '';
									<c:forEach var="order" items="${list}">
									str += '<input type="hidden" name="all_cart_idx" value="${order.cart_idx}"/>';
									str += '<input type="hidden" name="all_order_count" value="${order.cart_count}"/>';
									str += '<input type="hidden" name="all_order_price" value="${order.cart_price*order.cart_count}"/>';
									str += '<input type="hidden" name="all_order_option" value="${order.cart_product_option}"/>';
									str += '<input type="hidden" name="all_order_p_name" value="${order.cart_product_name}"/>';
									str += '<input type="hidden" name="all_order_p_id" value="${order.cart_product_idx}"/>';
									str += '<input type="hidden" name="all_order_img" value="${order.cart_img}"/>';
									</c:forEach>
									str += '<input type="hidden" name="order_addr_detail" value="'+ order_addr_detail+'"/>';
									$("#go_order").append(str);
									//f.append(str); 왜안되죠 ?
									f.submit();
									//결제 정보 db에 저장

								} else {
									var msg = '결제에 실패하였습니다.';
									msg += '에러내용 : ' + rsp.error_msg;
									alert(msg);
									return;

								}
							});
		}
	};//------결제 end

	//test
	/* function test(){
		var allIdx = [];
		var str ='';

		var order_recv1 = $('input[name=order_recv]').val();
		var order_addr1 = $('input[name=order_addr]').val();
		var order_addr1_detail = $('input[name=order_addr_detail]').val();
		var order_tel1 = $('input[name=order_tel]').val();
		var order_email1 = $('input[name=order_email]').val();
		var order_m_id1 = $('input[name=order_m_id]').val();
		
		for (var i = 0; i < ${list.size()-1}; i++) {
			allIdx.push(${list[i].cart_idx});
		} 
		왜 안되는지 이유 찾기
		

		<c:forEach var="order" items="${list}">
		str +='<input type="hidden" name="all_order_count" value="${order.cart_count}"/>';
		str +='<input type="hidden" name="all_order_price" value="${order.cart_price}"/>';
		str +='<input type="hidden" name="all_order_option" value="${order.cart_product_option}"/>';
		str +='<input type="hidden" name="all_order_p_name" value="${order.cart_product_name}"/>';
		str +='<input type="hidden" name="all_order_p_id" value="${order.cart_product_idx}"/>';
		str +='<input type="hidden" name="all_order_img" value="${order.cart_img}"/>';
		</c:forEach> 
		str +='<input type="hidden" name="order_recv" value="' + order_recv1 + '"/>';
		str +='<input type="hidden" name="order_addr" value="'+order_addr1+'"/>';
		str +='<input type="hidden" name="order_addr_detail" value="'+ order_addr_detail1+'"/>';
		str +='<input type="hidden" name="order_tel" value="'+order_tel1+'"/>';
		str +='<input type="hidden" name="order_email" value="'+order_email1+'"/>';
		str +='<input type="hidden" name="order_m_id" value="'+order_m_id1 +'"/>';	
	} */
</script>
<%@ include file="../include/footer2.jsp"%>
</body>
</html>