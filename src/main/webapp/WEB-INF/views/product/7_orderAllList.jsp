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

#statusDiv {
	margin: auto;
}

#statusTable {
	border-spacing: 30px;
	border-collapse: separate;
	width: 1000px;
}

#allListTable {
	width: 1000px;
}

.staus {
	width: 25%;
}

#allstaus {
	color: blue;
}

.goOrderOneList {
	width: 25%;
}

#oneList_btn {
	cursor: pointer;
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 13px;
	width: 80px;
	border: none;
}
#order_btn_td{
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<div style="text-align: center;">
			<h1>주문내역</h1>
			<br>
			<hr />
			<div id="statusDiv">
				<table id="statusTable">
					<tr>
						<td class="staus" id="staus1"><h3>전체</h3></td>
						<td class="staus" id="staus2"><h3>입금확인중</h3></td>
						<td class="staus" id="staus3"><h3>배송중</h3></td>
						<td class="staus" id="staus4"><h3>배송완료</h3></td>
					</tr>
					<tr>
						<td class="staus" id="allstaus"><b>${allStatus}</b></td>
						<td class="staus"><b>${status1}</b></td>
						<td class="staus"><b>${status2}</b></td>
						<td class="staus"><b>${status3}</b></td>
					</tr>
				</table>
			</div>
			<div>
				<table id="allListTable">

					
					<c:forEach var="order" items="${orderAllList}" varStatus="status">
						<tr>
							<td><img src="/uploadImages/${order.order_img}" style="width: 100px;" style=height:100px;></td>
							<td class="goOrderOneList"><c:out value="${order.order_p_name}"></c:out></td>
							<td class="goOrderOneList"><c:out value="${order.order_date}"></c:out></td>
							<td class="goOrderOneList"><c:out value="${order.order_status}"></c:out></td>
	<%-- 						<td class="goOrderOneList"><c:out value="${status.current.order_date}"></c:out></td>
							<td class="goOrderOneList"><c:out value="${orderAllList[status.index+1].order_date}"></c:out></td> --%>
						<%-- 	<td class="goOrderOneList">
							<form action="/order/getOrderOneList" method="get">
							<input type="hidden" name="order_idx" value="${order.order_idx}" /> 
							<input type="submit" value="주문상세" id="oneList_btn" />
							</form>
							</td> --%>
						</tr>
						<c:if
							test="${orderAllList[status.index].order_date!=orderAllList[status.index+1].order_date}">
							<tr>
								<td id="order_btn_td"colspan="5">
									<form action="/order/getOrderOneList" method="get">
										<input type="hidden" name="order_date"value="${order.order_date}" /> 
										<input type="submit"value="주문상세" id="oneList_btn" />
									</form>
									<br>
								</td>
							</tr>
							<tr>
								<td colspan="5"><hr><br></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		<div>
			<form action="/order/getOrderOneList" method="get" id="go_order">
			</form>
		</div>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	/* 	$(".goOrderOneList")
	 .click(
	 function(e) {
	 e.preventDefault();
	 var order_idx = $(this).attr("href");
	 var str = '<input type="hidden" name="order_idx" value="'+order_idx+'"/>'
	 $("#go_order").html(str);
	 $("#go_order").submit();

	 }); */
	function move_oneList(f) {
		f.submit();

	}
</script>
</html>