<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.orderOne {
	width: 20%;
}

#oneListTable {
	width: 1000px;
	text-align: center;
}

#infoTable {
	text-align: left;
}

#infoTable td {
	padding-top: 10px;
	padding-left: 5px;
	padding-right: 5px;
}

.infoTd {
	width: 30%;
}

#priceTable {
	text-align: left;
}

#priceTable td {
	padding-top: 10px;
	padding-left: 5px;
	padding-right: 5px;
}

#removeTable {
	width: 400px;
	text-align: center;
	margin: auto;
}

#removeTable td {
	padding-right: 10px;
}

#removeDiv {
	margin: auto;
}

.btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 130px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<h1 style="text-align: center;">주문 상세 내역</h1>
		</div>
		<br>
		<h3 style="color: rgb(57, 186, 228);">주문정보</h3>
		<table>
			<tr>
				<%-- 	<td><h3>주문번호&nbsp;&nbsp;&nbsp;${oneList.order_idx}</h3></td> --%>
			</tr>
		</table>
		<hr>
		<br>
		<table id="oneListTable">
			<c:forEach var="orderOne" items="${oneList}">
				<tr>
					<td class="orderOne"><img
						src="/uploadImages/${orderOne.order_img}"
						style="width: 120px; height: 150px;"></td>
					<td class="orderOne"><h4>${orderOne.order_p_name}</h4></td>
					<td class="orderOne"><h4>${orderOne.order_option}</h4></td>
					<td class="orderOne"><h4>${orderOne.order_count}</h4></td>
					<fmt:formatNumber var="order_price" value="${orderOne.order_price}"
						type="number" />
					<td class="orderOne"><h4>${order_price}원</h4></td>
				</tr>
			</c:forEach>
		</table>
		<br> <br>
		<h3 style="color: rgb(57, 186, 228);">배송정보</h3>
		<hr>
		<table id="infoTable">
			<tr>
				<td class="infoTd"><b>배송상태</b></td>
				<td>${oneListInfo.order_status}</td>
			</tr>
			<tr>
				<td class="infoTd"><b>받으시는분</b></td>
				<td>${oneListInfo.order_recv}</td>
			</tr>
			<tr>
				<td class="infoTd"><b>휴대폰</b></td>
				<td>${oneListInfo.order_tel}</td>
			</tr>
			<tr>
				<td class="infoTd"><b>이메일</b></td>
				<td>${oneListInfo.order_email}</td>
			</tr>
			<tr>
				<td class="infoTd"><b>주소</b></td>
				<td>${oneListInfo.order_addr}&nbsp;${oneListInfo.order_addr_detail}</td>
			</tr>
		</table>
		<br> <br>
		<h3 style="color: rgb(57, 186, 228);">결제내역</h3>
		<hr>
		<table id="priceTable">
			<tr>
				<td><h4>총결제금액</h4></td>
			</tr>
			<tr>
				<td><h2 id="total" style="color: rgb(57, 186, 228);"></h2></td>
			</tr>
			<tr>
				<td><b>거래일시</b></td>
				<td>${oneListInfo.order_date}</td>
			</tr>
		</table>
		<br> <br> <br> <br>
		<div id="removeDiv">
			<table id="removeTable">
				<tr>
					<td><c:if test="${oneListInfo.order_status=='입금확인중'}">
							<form action="/order/remove" method="post">
								<input type="hidden" name="order_m_id"
									value="${oneListInfo.order_m_id}" /> <input type="hidden"
									name="order_date" value="${oneListInfo.order_date}" /> <input
									type="submit" class="btn" value="주문취소" />
							</form>
						</c:if> <c:if test="${oneListInfo.order_status=='배송중'}">
							<input type="button" class="btn" value="주문취소" onclick="removeFail(this.form)" />
						</c:if> <c:if test="${oneListInfo.order_status=='배송완료'}">
							<input type="button" class="btn" value="주문취소" onclick="removeFail(this.form)" />
						</c:if></td>
					<td>
						<form action="/order/getOrderList" method="get">
							<input type="hidden" name="order_m_id"
								value="${oneListInfo.order_m_id}" /> <input type="submit" class="btn"
								value="주문내역이동" />
						</form>
					</td>
				</tr>
			</table>
		</div>


	</div>
</body>
<script type="text/javascript">
window.onload=function totalPrice(){
		
		var price = [];
		var totalPrice = 0;
		<c:forEach var="orderOne" items="${oneList}">
		price.push(${orderOne.order_price});
		</c:forEach>	
		
		for (var i = 0; i < price.length; i++) {
			totalPrice += price[i];
		}
		if (totalPrice >= 50000){
			$("#total").html(totalPrice.toLocaleString()+"원");
		}
		if (totalPrice<50000){
			
			$("#total").html((totalPrice+3000).toLocaleString()+"원");
		}
		
	}

function removeFail(){
	alert("배송중 또는 배송완료 상품은 환불신청을 해주시기바랍니다.");
}
</script>
<%@ include file="../include/footer.jsp"%>
</html>