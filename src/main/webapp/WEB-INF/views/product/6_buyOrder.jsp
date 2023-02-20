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
		<form action="/order/register" method="post">
			<div style="text-align: center;">
				<h1>주문서</h1>
			</div>
			<br /> <b class="subTitle">주문상품</b>
			<hr />
			<table>
				<tr>
					<td><input type="hidden" name="order_p_id"
						value="${buyList.cart_idx}" /></td>
					<td><img src="/uploadImages/${buyList.cart_img}"
						style="width: 100px;" style=height:100px;>&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="order_img" value="${buyList.cart_img}" />
					</td>

					<td><b><c:out value="${buyList.cart_product_name}"></c:out></b>&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="order_p_name"
						value="${buyList.cart_product_name}" /></td>

					<td><b><c:out value="${buyList.cart_product_option}"></c:out></b>
						<input type="hidden" name="order_option"
						value="${buyList.cart_product_option}" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

					<td><b><c:out value="${buyList.cart_count}"></c:out></b>&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="order_count"
						value="${buyList.cart_count}" /></td>
					<fmt:formatNumber var="comPrice"
						value="${buyList.cart_count * buyList.cart_price}" type="number" />
					<td><b><c:out value="${comPrice}원"></c:out></b>&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
			<br /> <br /> <b class="subTitle">주문자 정보</b>
			<hr />

			<table>
				<tr>
					<td><b>받으시는 분</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="hidden" name="order_recv" value="${signIn.name}" />${signIn.name}</td>
				</tr>
				<tr>
					<td><b>이메일 주소</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="hidden" name="order_email"
						value="${signIn.email}" />${signIn.email}</td>
				</tr>
				<tr>
					<td><b>연락처</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="hidden" name="order_tel"
						value="${signIn.phone}" />${signIn.phone}</td>
				</tr>
			</table>
			<br /> <br /> <b class="subTitle">배송 정보</b>
			<hr />
			<table>
				<tr>
					<td><b>주소</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" id="address_kakao" name="order_addr"
						value="${signIn.addr}" readonly="readonly"
						class="form-control" style="width: 350px;" /></td>
					<td><input type="button" id="addressChange-btn"
						class="addr_change_btn" value="변경" /></td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" class="form-control"
						value= "${signIn.addr_ck}"name="order_addr_detail" /></td>
				</tr>
			</table>
			<br /> <br /> <b class="subTitle">결제 정보</b>
			<hr />
			<div class="totaPrice로 처리">
				<table>
					<tr>
						<td><b>주문금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>${comPrice}원</td>
					</tr>
					<tr>
						<td><b>배송비</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><c:if
								test="${buyList.cart_count * buyList.cart_price ge 50000}">
					0원
					</c:if> <c:if test="${buyList.cart_count * buyList.cart_price lt 50000}">
					3,000원
					</c:if></td>
					</tr>
					<tr>
						<td><b class="subTitle">최종결제금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><c:if
								test="${buyList.cart_count * buyList.cart_price ge 50000}">
								<b>${comPrice}원</b>
								<input type="hidden" class="form-control" name="order_price"
									value="${buyList.cart_count * buyList.cart_price}" />
							</c:if> <c:if test="${buyList.cart_count * buyList.cart_price lt 50000}">
								<fmt:formatNumber var="comPricePlus"
									value="${(buyList.cart_count * buyList.cart_price) + 3000}"
									type="number" />
								<b>${comPricePlus}원</b>
								<input type="hidden" class="form-control" name="order_price"
									value="${(buyList.cart_count * buyList.cart_price) +3000}" />
							</c:if></td>
					</tr>
				</table>

			</div>
			<hr />
			<div id="pay_btn_wrap">
				<input type="hidden" class="form-control" name="order_m_id"
					value="${signIn.id}" /> <input type="button" value="결제하기" id="pay_btn"
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

		var order_count = f.order_count.value;
		var order_price = f.order_price.value;
		var order_recv = f.order_recv.value;
		var order_addr = f.order_addr.value;
		var order_addr_detail = f.order_addr_detail.value;
		var order_tel = f.order_tel.value;
		var order_email = f.order_email.value;
		var order_p_id = f.order_p_id.value;
		var order_p_name = f.order_p_name.value;

		if (!order_addr_detail) {
			alert("상세주소를 입력해주세요.");
			return;
		} else {

			var IMP = window.IMP; // 생략가능
			IMP.init('imp23484225');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				/* 'kakao':카카오페이, 
				    html5_inicis':이니시스(웹표준결제)
				    'nice':나이스페이
				    'jtnet':제이티넷
				    'uplus':LG유플러스
				    'danal':다날
				    'payco':페이코   
				    'syrup':시럽페이
				    'paypal':페이팔 */
				pay_method : 'card',
				/* 
				    'samsung':삼성페이, 
				    'card':신용카드, 
				    'trans':실시간계좌이체,
				    'vbank':가상계좌,
				    'phone':휴대폰소액결제 
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/* 
				    merchant_uid에 경우 
				    https://docs.iamport.kr/implementation/payment
				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				    참고하세요. 
				    나중에 포스팅 해볼게요.
				 */
				name : '상품명:' + order_p_name,
				//결제창에서 보여질 이름
				amount : 100,
				//가격 
				buyer_email : order_email,
				buyer_name : order_recv,
				buyer_tel : order_tel,
				buyer_addr : order_addr + order_addr_detail,
				buyer_postcode : '123-456',
			/* m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			
			   모바일 결제시,
			   결제가 끝나고 랜딩되는 URL을 지정 
			   (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {

					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
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
	};
</script>
<%@ include file="../include/footer2.jsp"%>
</body>
</html>