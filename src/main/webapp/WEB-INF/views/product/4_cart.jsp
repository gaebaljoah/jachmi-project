<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
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
.flexDiv{
	display: inline-flex;
}

.pay_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	line-height: 2.1em;
	font-size: 17px;
	width: 200px;
	border: none;
}

#go_List {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	font-size: 17px;
	width: 90px;
	border: none;
	font-size: 17px;
}

.go_list_div {
	float: right;
	text-align: right;
}

#remove_cart {
	cursor: pointer;
}

#list_table{
	width:1000px;
}

#pay_table{
	text-align: right;
	width: 270px;
	position: sticky;
	top:50px;
}
#pay_table td{
	padding-bottom: 10px;
	padding-top: 10px;
}

.cart_table_td {
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div style="text-align: center;">
			<h1>장바구니</h1>
		</div>
		<hr />
		<div>
			<b><input type="checkbox" id="check_all" onclick="allCheck(this)" />&nbsp;전체선택</b>&nbsp;&nbsp;
			<b><a id="remove_cart" onclick="remove_cart()">삭제</a></b>
			<div class="go_list_div">
				<form action="/product/allList">
					<input type="submit" value="상품목록" id="go_List" />
				</form>
			</div>
		</div>
		<hr />
		<div class ="flexDiv">
		<div>
			<table id="list_table">
				<c:forEach var="cart" items="${cartList}" varStatus="status">
					<tr>
						<td class="cart_table_td" style="width: 3%;"><input
							class="chk" type="checkbox" name="check_product"
							value="${cart.cart_idx}" />&nbsp;&nbsp;&nbsp;</td>
						<td class="cart_table_td" style="width: 15%;"><img
							class="p_img" src="/uploadImages/${cart.cart_img}"
							style="width: 100px;" style=height:100px;></td>
						<td class="cart_table_td" style="width: 30%;"><b><c:out
									value="${cart.cart_product_name}"></c:out></b>&nbsp;&nbsp;&nbsp;</td>
						<td class="cart_table_td" style="width: 10%;"><fmt:formatNumber
								var="cartPrice" value="${cart.cart_price}" type="number" /> <b>
								<c:out value="${cartPrice}원"></c:out>
						</b>&nbsp;&nbsp;&nbsp; <input type="hidden" value="${cart.cart_price}"
							name="order_price" id='order_price' /></td>
						<td class="cart_table_td" style="width: 20%;"><b><c:out
									value="${cart.cart_product_option}"></c:out></b>&nbsp;&nbsp;&nbsp;</td>
						<td class="cart_table_td" style="width: 10%;">
							<form>
								<input type="number" name="order_count" min="1"
									id="${cart.cart_idx}"
									onchange="changeStock(${cart.cart_idx},this.form)"
									value="${cart.cart_count}" style="width: 50px;" />
								&nbsp;&nbsp;&nbsp;
							</form>
						</td>
						<td><input type="hidden" name="id" value="${id}"></td>
						<td class="cart_table_td" style="width: 10%;"><fmt:formatNumber
								var="totalCartPrice"
								value="${cart.cart_price * cart.cart_count}" type="number" /> <input
							type="hidden" class="total-price"
							value="${cart.cart_price * cart.cart_count}"> <b
							id="totalPrice">${totalCartPrice}원</b> <c:set var="p_total"
								value="${p_total + (cart.cart_price * cart.cart_count) }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<hr>
		<div id="pay_wrap">
			<table id="pay_table">
				<tr>
					<td><h5>상품금액</h5></td>
					<td><h5 id="price">0원</h5></td>
				</tr>
				<tr>
					<td><h5>배송비</h5></td>
					<td><h5 id="delivery">3,000원</h5></td>
				</tr>
				<tr>
					<td colspan="2"><h6 style="color: gray;">50,000원 이상 결제시 배송비 무료</h6></td>
				</tr>
				<tr><td></td>
					<td><h5>결제예상금액</h5></td>
				</tr>
				<tr>
					<td colspan="2"><h4 style="color: rgb(57, 186, 228);" id="allPrice">3,000원</h4></td>
				</tr>
				<tr>
					<td colspan="2">
						<form action="/order/getcartList" method="get" id="move_order"></form>
						<input type="button" class="pay_btn" value="주문하기"
						onclick="go_cart()" />
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.mi	n.js"></script>
	<script type="text/javascript">

		$("input[name=check_product]").click(function(e){
			
			var PriceArr = [];
			var AllPrice = 0;
			
			
			$("input[name=check_product]:checked").each(function() {
				PriceArr.push($(this).closest('tr').find('.total-price').val());		
			});
			for (var i = 0; i < PriceArr.length; i++) {
				AllPrice += parseInt(PriceArr[i]);
			}
			
			var priceAll = AllPrice.toLocaleString('ko-KR');

			$("#price").html(priceAll+"원");

			if (AllPrice <= 50000) {
				$("#delivery").html("3,000원");
			}
			if (AllPrice > 50000) {
				$("#delivery").html("0원");
			}
			
			var AllPricePlusDilv = (AllPrice+3000);
			var AllPricePlusDilvFmt = AllPricePlusDilv.toLocaleString('ko-KR');
			//최종결제금액
			if (AllPrice <= 50000) {
				$("#allPrice").html(AllPricePlusDilvFmt+"원");
			}
			if (AllPrice > 50000) {
				$("#allPrice").html(priceAll+"원");
			}
			
		});
		//전체 선택 전체 해제
		function allCheck(box) {
			if (box.checked == true) {
				$("input:checkbox[name='check_product']").prop("checked", true);
				var PriceArr = [];
				var AllPrice = 0;
				
				
				$("input[name=check_product]:checked").each(function() {
					PriceArr.push($(this).closest('tr').find('.total-price').val());		
				});
				for (var i = 0; i < PriceArr.length; i++) {
					AllPrice += parseInt(PriceArr[i]);
				}
				
				var priceAll = AllPrice.toLocaleString('ko-KR');

				$("#price").html(priceAll+"원");

				if (AllPrice <= 50000) {
					$("#delivery").html("3,000원");
				}
				if (AllPrice > 50000) {
					$("#delivery").html("0원");
				}
				
				var AllPricePlusDilv = (AllPrice+3000);
				var AllPricePlusDilvFmt = AllPricePlusDilv.toLocaleString('ko-KR');
				//최종결제금액
				if (AllPrice <= 50000) {
					$("#allPrice").html(AllPricePlusDilvFmt+"원");
				}
				if (AllPrice > 50000) {
					$("#allPrice").html(priceAll+"원");
				}
			}
			if (box.checked == false) {
				$("input:checkbox[name='check_product']").prop("checked", false);
				$("#price").html("0원");
				$("#delivery").html("3,000원");
				$("#allPrice").html("3,000원");
			}
		}//전체 선택 전체 해제-------

		//장바구니 수량과 상품 금액 변동
		//c_idx 동적으로 가져오기 		
		function changeStock(cart_idx,f){
			var c_idx = cart_idx;
			var c_count = f.order_count.value; //이거 가져고 오는데 개고생함

 			var cart = {
					cart_idx : c_idx,
					cart_count : c_count
				};
			
			$.ajax({
				type : 'post',
				url : '/cart/update',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(cart),
				success : function(result) {
					location.reload();
				},
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			}); 
		}
		//체크된 상품의 idx 여러개 가지고 와서 삭제하기
		//컨트롤러에서 for문 돌리기 ajax 에서 for문 태우기 
		function remove_cart() {
			var remove_chk_c_idx = [];

			
			
			$("input[name=check_product]:checked").each(function() {
				remove_chk_c_idx.push($(this).val());
			});

			if (remove_chk_c_idx === 0) {
				
				alert("품목을 한 개 이상 선택해주시기 바랍니다.");
				return;
				
			}else{
				$.ajax({
					url : "/cart/delete",
					type : "post",
					data : {removeArr : remove_chk_c_idx},
					success : function() {
						location.reload();
						alert("품목이 삭제되었습니다");
					},
					error : function(xhr, status, er) {
						if (error) {
							error(er);
						}
					}
				});	
			}	
		}

		//체크된 상품 주문하기
		function go_cart(){
			
			var show_chk_c_idx = [];
			var move_order = $("#move_order");
			var str = '';
			$("input[name=check_product]:checked").each(function() {
				show_chk_c_idx.push($(this).val());
			});
		
			for (var i = 0; i < show_chk_c_idx.length; i++) {
				str += ('<input type="hidden" name="cart_idx" value="'+show_chk_c_idx[i]+'"/>');
			}
			
			
			if (show_chk_c_idx.length === 0) {//배열이 빈값일때 라는 조건 주는 법
				alert("상품을 한 개 이상 선택하여주세요")
				return;

			}else {
				move_order.html(str);
				move_order.submit(); 
			}
			
		};
		$("#go_List").click(
				function(e) {
					e.preventDefault(); // 기본 href 경로 이동 방지
					$("#pageParam").attr("action", "/product/allList");
					var str = '';
					str += '<input type="hidden" name="pageNum" value="1"/>';
					str += '<input type="hidden" name="amount" value="12"/>';
					//this 없이 그냥 했을때는 고정값만 들어갔었는데 this 를 넣으니 해결
					$("#pageParam").html(str);
					$("#pageParam").submit();
				});
		</script>
	<%@ include file="../include/footer2.jsp"%>
</body>
</html>