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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
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

.view_container {
	width: 1000px;
	margin: auto;
}

#reviewORaskContainer {
	width: 1000px;
	text-align: center;
	top: 0px;
	position: sticky;
	font-weight: normal;
	text-align: center;
	
}
#reviewORaskContainer th {
	background-color: rgb(57, 186, 228);
	color : white;
}

#reviewORaskContainer th:hover {
	background-color: rgb(57, 186, 228);
}

.aTagCategory {
   padding-top: 15px;
   padding-bottom: 15px;
   font-size: 20px;
}

.aTagCategory:hover {
   color: white;
}
.info_a:visited{
   color: white;
   text-decoration: none;
}
.info_a:link{
   color: white;
   text-decoration: none;
}
#ask_table {
	margin: auto;
	width: 1000px;
	text-align: center;
	border-collapse: collapse;
}

#ask_table_head {
	background-color: #D4F4FA;
}

#ask_table_head tr, td {
	padding: 10px;
}

#ask_table_head tr {
	border-top: 1px solid;
	border-bottom: 1px solid;
}

#ask_table_body tr {
	border-bottom: 1px solid #d7d7d7;
}

.reg_cart_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 150px;
	border: none;
}

.buy_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 209px;
	border: none;
}

.view_tr {
	margin: 50px;
	padding-right: 70px;
}

.reg_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 100px;
	border: none;
}

#askDiv {
	text-align: right;
}

#reviewDiv {
	text-align: right;
}

.ask_title {
	cursor: pointer;
}

.view_td {
	width: 500px;
}

#infoDiv {
	text-align: center;
}

#descDiv {
	text-align: center;
}

#view_table {
	margin-left: 150px;
}

#reg_answer {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 100px;
	border: none;
}


.review_td {
	vertical-align: top;
	text-align: left;
	padding-right: 10px;
	padding-top: 5px;
	padding-bottom: 10px;
}

#review_td_id {
	padding-right: 60px;
}

.review_hr {
	border: 0;
	height: 1px;
	background: #ccc;
}

/*?????????  */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}
.page_nation a.active {
	background-color: rgb(57, 186, 228);
	color: #fff;
	border: rgb(255, 255, 255);
}
</style>
</head>
<body>

	<!--?????? ????????????-->
	<div class="view_container">
		<table id="view_table">
			<tr>
				<td class="view_tr" rowspan="9"><img id="p_img"
					src="/uploadImages/${pvo.product_img}" style="width: 400px;"
					style=height:600px;></td>
			</tr>
			<tr class="view_tr">
				<td class="view_td">
					<h2>${pvo.product_name}</h2>
				</td>
			</tr>
			<tr class="view_tr">
				<td class="view_td">
					<h6 style="color: gray;">${pvo.product_desc}</h6>
				</td>
			</tr>
			<tr class="view_tr">
				<td class="view_td"><h2 id="changePrice">???${pvo.product_price}???</h2></td>
			</tr>
			<tr class="view_tr" id="option_table">
				<td class="view_td">?????? ?????? <select class="form-control"
					name="p_option">
						<option value="${pvo.product_option1}">::?????? ??????::</option>
						<option id="op1" value="${pvo.product_option1}">${pvo.product_option1}(${pvo.product_option_price1}???)</option>
						<option id="op2" value="${pvo.product_option2}">${pvo.product_option2}(${pvo.product_option_price2}???)</option>
				</select></td>
			</tr>
			<tr class="view_tr">
				<td class="view_td"><b>???????????? <input type="number" min="1"
						class="form-control" value="1" name="p_count"
						style="width: 100px;" /></b></td>
			</tr>
			<tr class="view_tr">
				<td class="view_td"><h2>??? ????????????</h2>
					<h2 id="allPrice"></h2></td>
			</tr>
			<tr class="view_tr">
				<td class="view_td"><img src="/uploadImages/???????????? ??????.PNG"
					style="width: 55px;">
					
					<c:if test="${empty signIn.id}">
					<button type="button" class="reg_cart_btn" onclick="no_id()">???????????? ??????</button>
					</c:if>
					<c:if test="${not empty signIn.id}">
					<button type="button" class="reg_cart_btn" id="go_cart" >???????????? ??????</button>
					</c:if>
					</td>
			</tr>
			<tr class="view_tr">
				<td class="view_td">
					<form action="/order/getBuyList" id="getBuyList">
						<input type="hidden" name="idx" value="${pvo.product_idx}" /> <input
							type="hidden" name="name" value="${pvo.product_name}" /> <input
							type="hidden" name="option" /> <input type="hidden" name="count" />
						<input type="hidden" name="price" value="${pvo.product_price}" />
						<input type="hidden" name="img" value="${pvo.product_img}" /> 
						<c:if test="${empty signIn.id}">
						<input type="button" value="????????????" class="buy_btn" onclick="no_id()">
						</c:if>
						<c:if test="${not empty signIn.id}">
						<input type="button" value="????????????" class="buy_btn" id="go_order"onclick="move_buyOrder(this.form)">
						</c:if>
						
					</form>
				</td>
			</tr>
		</table>
		<form action="/cart/register" method="post" id="move_cart"></form>
		<hr>
		<!-- ?????? ?????? ????????? -->
	<table id="reviewORaskContainer">
			<tr>
		<th class="aTagCategory"><a href="#infoDiv" class="info_a">?????? ??????</a></th>
            <th class="aTagCategory"><a class="info_a" href="#descDiv">?????? ??????</a></th>
            <th class="aTagCategory"><a class="info_a" href="#reviewDiv">?????? ??????</a></th>
            <th class="aTagCategory"><a class="info_a" href="#askDiv">?????? ??????</a></th>
			</tr>
		</table>
		<hr>
		<div id="infoDiv">
			<c:if test="${empty pvo.product_img_desc1}">
			</c:if>
			<c:if test="${not empty pvo.product_img_desc1}">
				<img src="/uploadImages/${pvo.product_img_desc1}">
				<img src="/uploadImages/${pvo.product_img_desc2}">
			</c:if>

		</div>
		<div id="descDiv">

			<c:if test="${empty pvo.product_img_desc3}">
			</c:if>
			<c:if test="${not empty pvo.product_img_desc3}">
				<img src="/uploadImages/${pvo.product_img_desc3}">
			</c:if>

		</div>
		<hr>
		<!-- ?????? ?????? ?????? ???  -->
		<!-- Button trigger modal -->
		<div id="reviewDiv">
			<div style="text-align: left;">
				<h3>????????????</h3>
			</div>
			<div style="text-align: left;">
				<ul>
					<li style="color: gray;">?????? ????????? ???????????????????????? 30??? ????????? ???????????????.</li>
					<li style="color: gray;">????????? ???????????? ????????? ?????? ?????? ????????? ??????????????????.</li>
					<li style="color: gray;">????????? 1?????? ?????? ???????????????.</li>
				</ul>
			</div>
			<hr class="review_hr">
			<c:forEach var="review" items="${rvo}">
				<table>
					<tr>
						<td class="review_td" rowspan="5" id="review_td_id"
							style="color: rgb(57, 186, 228); font-family: bold;">${review.id}</td>
					</tr>
					<tr>
						<td class="review_td" style="color: gray; font-family: bold;">${review.review_title}</td>
					</tr>
					<tr>
						<td class="review_td">${review.review_content}</td>
					</tr>
					<tr>
						<td class="review_td"><c:if test="${empty review.review_img}">
							</c:if> <c:if test="${not empty review.review_img}">
								<a href="/reviewImages/${review.review_img}" data-fancybox ><img src="/reviewImages/${review.review_img}"
									style="width: 100px;" style="height:100px;"></a>
							</c:if></td>
					</tr>
					<tr>
						<td class="review_td" style="color: gray;">${review.review_regdate}</td>
					</tr>
				</table>
				<hr class="review_hr">
			</c:forEach>
			<!-- page -->
			<div class="page_wrap">
				<div class="page_nation">
					<c:if test="${pageMaker.prev }">
						<a class="paginate_button" href="${pageMaker.startPage-1 }">&lt;</a>
					</c:if>
					<c:forEach var="page" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage }" step="1">
						<a
							class="paginate_button ${pageMaker.cri.pageNum==page ? 'active' : '' }"
							href="${page}">${page }</a>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<a class="paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
					</c:if>
				</div>
			</div>
			<form action="/product/detail_view" method="get" id="paginate">

			</form>
			<c:if test="${not empty signIn.id}">
				<button type="button" id="reg_review" class="reg_btn"
					data-bs-toggle="modal" data-bs-target="#review_reg_btn">????????????</button>
			</c:if>
			<c:if test="${empty signIn.id}">
				<button type="button" class="reg_btn" onclick="no_id()">????????????</button>
			</c:if>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="review_reg_btn" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">?????? ??????</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="/review/register" method="post"
							enctype="multipart/form-data" id="move_review">
							?????? <input type="text" class="form-control" name="review_title" /><br />
							????????? <input type="text" value="${mvo.id}" class="form-control"
								readonly="readonly" name="id" /><br /> ??????
							<textarea rows="5" cols="10" style="resize: none;"
								class="form-control" name="review_content"></textarea>
							<br /> ????????? ??????<input type="file" name="review_img_1"
								class="form-control" /> <input type="hidden"
								value="${pvo.product_idx}" name="product_idx" /> <input
								type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
							<input type="hidden" name="amount"
								value="${pageMaker.cri.amount }" />
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">????????????</button>
						<button type="button" class="btn btn-primary" id="move_review_btn">????????????</button>
					</div>
				</div>
			</div>
		</div>

		<!--  ?????? ?????? ?????? ???  ??????-->
		<!-- Button trigger modal -->
		<hr>
		<div id="askDiv">
			<c:if test="${not empty signIn.id}">
				<button type="button" id="reg_ask" class="reg_btn" data-bs-toggle="modal" data-bs-target="#ask_reg_btn">????????????</button>
			</c:if>
			<c:if test="${empty signIn.id}">
				<button type="button" class="reg_btn" onclick="no_id()">????????????</button>
			</c:if>
			<hr>
			<table id="ask_table" >
				<thead id="ask_table_head">
					<tr>
						<th scope="col">??????</th>
						<th scope="col">?????????</th>
						<th scope="col">????????????</th>
						<th scope="col">????????????</th>
					</tr>
				</thead>
				<tbody id="ask_table_body">
					<c:forEach var="ask" items="${avo}">
						<tr>
							<td style="width: 55%;" class="ask_td"><a
								href="${ask.ask_idx}" class="ask_title" id="show_ask"
								data-bs-toggle="modal" data-bs-target="#show_detail_ask">${ask.ask_title}</a></td>
							<td class="ask_td">${ask.ask_id}</td>
							<td class="ask_td">${ask.ask_regdate}</td>
							<td class="ask_td"><c:if test="${ask.answer_chk==0}">
									<h6 style="color: rgb(57, 186, 228);">-</h6>
								</c:if> <c:if test="${ask.answer_chk==1}">
									<h6 style="color: rgb(57, 186, 228);">????????????</h6>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
<%-- 			<!-- page -->
			<div class="page_wrap">
				<div class="page_nation">
					<c:if test="${pageMaker.prev }">
						<a class="paginate_button" href="${pageMaker.startPage-1 }">&lt;</a>
					</c:if>
					<c:forEach var="page" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage }" step="1">
						<a
							class="paginate_button ${pageMaker.cri.pageNum==page ? 'active' : '' }"
							href="${page}">${page }</a>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<a class="paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
					</c:if>
				</div>
			</div> --%>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="ask_reg_btn" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">?????? ??????</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<form action="/ask/register" method="post" id="move_ask">
							<input type="hidden" value="${pvo.product_idx}"
								name="ask_product_idx" /> ?????? <input type="text"
								class="form-control" name="ask_title" /><br /> ????????? <input
								type="text" class="form-control" value="${mvo.id}"
								readonly="readonly" name="ask_id" /><br /> ??????
							<textarea rows="5" cols="10" style="resize: none;"
								name="ask_content" class="form-control"></textarea>
							<input type="hidden" name="pageNum"value="${pageMaker.cri.pageNum }" /> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }" /> <br />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">????????????</button>
							<button type="button" class="btn btn-primary" id="move_ask_btn">????????????</button>
					</div>
					
				</div>
			</div>
		</div>

		<hr />
		<!-- ??????  -->
		<div id="ask"></div>
		<!-- detail ??????  -->
		<!-- Modal -->
		<div class="modal fade" id="show_detail_ask" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 style ="color:rgb(57, 186, 228);" class="modal-title fs-5" id="staticBackdropLabel">?????? ???</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>
					</div>
					<div class="modal-body" id="ask_detail_view"></div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- ??????  -->	
		<div id="review"></div>
	</div>
	<!-- ???????????? confirm -->
	<div>
		<form action="/cart/getCartList" method="get" id="move_cart_page">
			<input type="hidden" name="cart_m_id" value="${signIn.id}">
		</form>
	</div>
	<link rel="stylesheet" href="/styles/vendor/jquery.fancybox.min.css">
<script src="/scripts/vendor/jquery.fancybox.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		//1.?????? ?????? ?????? ?????? ??? ?????? ?????? ??? ????????? ?????? ?????? ??? ???????????????	

		$(".ask_title")
				.click(
						function(e) {
							e.preventDefault(); // ?????? href ?????? ?????? ??????

							var ask_idx1 = $(this).attr("href");
							var ask = {
								ask_idx : ask_idx1
							};

							$
									.ajax({
										type : 'post',
										url : '/ask/read',
										data : JSON.stringify(ask),
										contentType : "application/json; charset=utf-8",
										success : function(result) {
											var str = '';
											str += '?????? <input type="text" class="form-control" value="'+result.ask_title+'"name="ask_title" readonly="readonly"/>';
											str += '?????????<input type="text" class="form-control" value="'+result.ask_id+'" readonly="readonly" name="ask_id" />';
											str += '?????? <textarea rows="5" cols="10" style="resize: none;" name="ask_content" class="form-control"readonly="readonly">'
													+ result.ask_content
													+ '</textarea>';
											str += '?????? <textarea rows="5" cols="10" style="resize: none;" name="answer_content" class="form-control"readonly="readonly">'
												+ result.answer_content
												+ '</textarea>';
											$("#ask_detail_view").html(str);
										},
										error : function(xhr, status, er) {
											console.log(xhr);
											console.log(status);
											console.log(er);
										}
									});

						});

		//-----------?????? ????????????--------------

		//-----------?????? ?????? --------------
		$("#move_ask_btn").click(function(e) {
			$("#move_ask").submit();
		});//-----------?????? ?????? --------------End	

		//----------- ?????? ?????? --------------
		$("#move_review_btn").click(function(e) {
			$("#move_review").submit();
		});//-----------?????? ?????? --------------End
		
		//??????????????? ???????????? insert
		function no_id(){			
			var logchk = confirm("???????????? ????????? ????????? ?????????. ????????? ???????????? ?????????????????????????")
			if(logchk == true){
				location.href = "/member/login";
			}else{
				return;
			}
		}
		//???????????? insert
		$("#go_cart").click(function(e) {

			var p_name = '${pvo.product_name}';
			var p_option = $('select[name=p_option]').val();
			var c_price = $("#changePrice").html();
			var c_price1 = c_price.replace(",", "");
			var c_price2 = c_price1.replace("???", "");
			var c_price3 = parseInt(c_price2.replace("???", ""));
			var c_count = $('input[name=p_count]').val();
			var m_id = '${id}';
			var p_idx = '${pvo.product_idx}';
			var p_img = '${pvo.product_img}';
			if (c_count == 0) {
				alert("????????? 1??? ?????? ??????????????????????????????.")
				return;
			}
			var cart = {
				cart_product_name : p_name,
				cart_count : c_count,
				cart_product_option : p_option,
				cart_price : c_price3,
				cart_img : p_img,
				cart_m_id : m_id,
				cart_product_idx : p_idx
			};
			$.ajax({
				type : 'post',
				url : '/cart/register',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(cart),
				success : function(result) {
					alert("??????????????? ????????? ???????????????");
					if (confirm("??????????????? ?????????????????????????") == true) {
						$("#move_cart_page").submit();
					} else {
						return;
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			});
		}); //--------------------------cartinsert End----------

		//??? ?????? ?????? ????????????---------------------
		function totalPrice() {

			var p_option = $('select[name=p_option]').val();
			var op1 = '${pvo.product_option1}';
			var opp1 = '${pvo.product_option_price1}';
			var op2 = '${pvo.product_option2}';
			var opp2 = '${pvo.product_option_price2}';
			var allPrice = $("#allPrice")
			var p_price1 = parseInt('${pvo.product_price}'.replace(",", ""));
			var p_count = $('input[name=p_count]').val();

			if (p_option == "????????????") {
				var totalPrice = p_count * p_price1;
				var comtotal = totalPrice.toLocaleString();
				allPrice.html("???" + comtotal + "???");
			}

			if (p_option == op1) {
				if (opp1 == 0) {
					var totalPrice = p_count * p_price1;
					parseInt(totalPrice);
					var comtotal = totalPrice.toLocaleString();
					allPrice.html("???" + comtotal + "???");
				} else {
					p_price = parseInt('${pvo.product_option_price1}'.replace(
							",", ""));
					var totalPrice = p_count * p_price;
					var comtotal = totalPrice.toLocaleString();
					allPrice.html("???" + comtotal + "???");
				}
			}
			if (p_option == op2) {

				if (opp2 == 0) {
					var totalPrice = p_count * p_price1;
					var comtotal = totalPrice.toLocaleString();
					allPrice.html("???" + comtotal + "???");
				} else {
					p_price = parseInt('${pvo.product_option_price2}'.replace(
							",", ""));
					var totalPrice = p_count * p_price;
					var comtotal = totalPrice.toLocaleString();
					allPrice.html("???" + comtotal + "???");
				}
			}
		}
		totalPrice();
		$('input[name=p_count]').change(function(e) {
			totalPrice();
		});//??? ?????? ?????? ???????????? end-----------------

		//?????? ?????? ?????? ??? ?????? ??????
		function changePrice() {
			totalPrice();
			var p_option = $('select[name=p_option]').val();
			var changePrice = $("#changePrice");
			var op1 = '${pvo.product_option1}';
			var opp1 = '${pvo.product_option_price1}';
			var op2 = '${pvo.product_option2}';
			var opp2 = '${pvo.product_option_price2}';
			var p_price = '${pvo.product_price}';
			if (p_option == op1) {
				if (opp1 == 0) {
					var comtotal = p_price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					changePrice.html('???' + comtotal + '???');
				} else {
					var comtotal = opp1.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					changePrice.html('???' + comtotal + '???');
				}
			}
			if (p_option == op2) {
				if (opp2 == 0) {
					var comtotal = p_price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					changePrice.html('???' + comtotal + '???');
				} else {
					var comtotal = opp2.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					changePrice.html('???' + comtotal + '???');
				}
			}

		};

		/* 	window.onload = function showTotalPrice() {
				var allPrice = $("#allPrice");
				var p_count = $("#p_count");
				
			} */

		$('select[name=p_option]').change(function(e) {

			var allPrice = $("#allPrice");
			var p_count = $("#p_count");

			allPrice.html("");
			p_count.value = ""; //?????? ????????? ?????? ??? ?????????
			p_count.focus(); //?????? ????????? ?????? ??? ?????????	
			changePrice();

		});

		//???????????? ?????? ??? ?????? ???????????? ????????? 
		window.onload = function hideOption() {

			var optionTable = $("#option_table")
			var op1 = $("#op1");
			var op2 = $("#op2");

			if (op1.html() == "-(0???)") {
				optionTable.hide();
			}
		}
		//???????????? ?????? ?????? ?????????
		function move_buyOrder(f) {

			f.option.value = $('select[name=p_option]').val();
			f.count.value = $('input[name=p_count]').val();
			if (f.count.value == 0) {
				alert("????????? 1??? ?????? ??????????????????????????????.")
				return;
			}
			f.submit();
		}

		// ?????? ????????? ??????
		$(".paginate_button").click(
						function(e) {

							var pageNum = $(this).attr('href')
							var id = '${mvo.id}';
							var str = '';
							str += '<input type="hidden" name="id" value="'+id+'"/>';
							str += '<input type="hidden" value="'+${pvo.product_idx}+'" name="product_idx"/>';
							str += '<input type="hidden" name="pageNum" value="'+pageNum+'"/>';
							str += '<input type="hidden"name="amount" value="'+${pageMaker.cri.amount }+'"/>';

							e.preventDefault();
							$("#paginate").attr('action',
									'/product/detail_view');
							$("#paginate").html(str);
							$("#paginate").submit();
						});
	</script>

	<%@ include file="../include/footer2.jsp"%>
</body>
</html>