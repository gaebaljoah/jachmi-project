<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->
<title>상품페이지</title>
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
	width: 980px;
	margin: auto;
}

table {
	margin-top: 10px;
	/* 	border-spacing: 50px;
	border-collapse: separate; */
}

table td {
	padding-right: 50px;
	padding-bottom: 50px;
	vertical-align: text-top;
}

.p_img {
	
}

.p_reg_btn, .cart_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 150px;
	border: none;
}

/*페이징  */
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

#categoryDiv {
	text-align: center;
}

#categoryDiv li {
	display: inline-block;
	width: 100px;
}
</style>
</head>
<body>
	<!-- 본문시작 -->
	<div id="body-wrapper">
	
	<div id="body-content">
	<c:if test="${category_name.product_category_idx == 101}">
	<h1 style="text-align: center; margin-bottom: 10px;" >음식</h1>
	</c:if>
	<c:if test="${category_name.product_category_idx == 102}">
	<h1 style="text-align: center; margin-bottom: 10px;" >생필품</h1>
	</c:if>
	<c:if test="${category_name.product_category_idx == 103}">
	<h1 style="text-align: center; margin-bottom: 10px;" >주방</h1>
	</c:if>
	<c:if test="${category_name.product_category_idx == 104}">
	<h1 style="text-align: center; margin-bottom: 10px;" >욕실</h1>
	</c:if>
	<c:if test="${category_name.product_category_idx == 105}">
	<h1 style="text-align: center; margin-bottom: 10px;" >가전</h1>
	</c:if>
	<c:if test="${category_name.product_category_idx == 106}">
	<h1 style="text-align: center; margin-bottom: 10px;" >전자</h1>
	</c:if>
	<c:if test="${empty category_name.product_category_idx}">
		<h1 style="text-align: center; margin-bottom: 10px;" >전체상품</h1>
	</c:if>
	<div id="categoryDiv">
				<ul>
				<li><a href ="/product/list_by_category" id="go_101List"><img src="/uploadImages/음식.png" style="width:50px;"></a><br><b>음식</b></li>
				<li><a href ="/product/list_by_category" id="go_102List"><img src="/uploadImages/생필품.png" style="width:50px;"></a><br><b>생필품</b></li>
				<li><a href ="/product/list_by_category" id="go_103List"><img src="/uploadImages/주방.png" style="width:50px;"></a><br><b>주방</b></li>
				<li><a href ="/product/list_by_category" id="go_104List"><img src="/uploadImages/욕실.png" style="width:50px;"></a><br><b>욕실</b></li>
				<li><a href ="/product/list_by_category" id="go_105List"><img src="/uploadImages/가전.png" style="width:50px;"></a><br><b>가전</b></li>
				<li><a href ="/product/list_by_category" id="go_106List"><img src="/uploadImages/전자.png" style="width:50px;"></a><br><b>전자</b></li>
				</ul>
			</div>
			<br>
	<hr class="my-hr3">
	<div class="container">
<!-- 
		<form action="/product/register" method="get">
			<input type="button" class="p_reg_btn" value="상품등록"
				onclick="send(this.form)">
		</form> -->
		<%-- <form action="/cart/getCartList" method="get" id="move_cart_form">
         <input type="hidden" name="cart_m_id" value="${id}"> 
         <a onclick="cart()" id="cart_img"><img src="/uploadImages/장바구니사진.png" style="width:50px;"></a>            
      </form> --%>
		<div>
			<table>
				<tr>
					<c:forEach var="product" items="${list}" varStatus="status">
						<c:if test="${status.index%4==0}">
							<tr></tr>
						</c:if>
						<td><a class="move" href="${product.product_idx}"> <img
								class="p_img" src="/uploadImages/${product.product_img}"
								style="width: 200px;" style=height:200px;>
						</a> <br /> <br /> <b><c:out value="${product.product_name}"></c:out></b><br />
							<b><c:out value="${product.product_price}"></c:out></b>원<br /> <c:out
								value="${product.product_desc}"></c:out><br />
							<form action="/product/detail_view" method="get" class="move_detail">
								<input type="hidden" name="product_idx" value="${product.product_idx}" /> 
								<input type="hidden" name="id" value="${id}">
							</form></td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<!-- page -->
		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${pageMaker.prev }">
					<a class="paginate_button previous" href="${pageMaker.startPage-1 }">&lt;</a>
				</c:if>
				<c:forEach var="page" begin="${pageMaker.startPage}" end="${pageMaker.endPage }" step="1">
					<a class="paginate_button ${pageMaker.cri.pageNum==page ? 'active' : '' }"
						href="${page}">${page }</a>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<a class="paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
				</c:if>
			</div>
		</div>
			<form action="/product/allList" method="get" id="paginate">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" /> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
			</form>
	</div>
	</div> <!-- body-content 끝나는곳 -->
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		//상품등록 페이지 이동
	/* 	function send(f) {
			f.submit();
		} */
	/* 	//상품등록 페이지 이동
		function cart() {
			$("#move_cart_form").submit();
		} */

		//----------- 상세 보기 페이지 이동 버튼 클릭 이벤트 -----
		$(".move").click(
				function(e) {
					e.preventDefault(); // 기본 href 경로 이동 방지
					$("#move_detail").attr("action", "/product/detail_view");
					var str = '';
					var id = "${signIn.id}";
					str += '<input type="hidden" name="product_idx" value="'+ $(this).attr("href") + '">';
					str += '<input type="hidden" name="id" value="'+id+'">';
					str += '<input type="hidden" name="pageNum" value="1"/>';
					str += '<input type="hidden" name="amount" value="10"/>';
					//this 없이 그냥 했을때는 고정값만 들어갔었는데 this 를 넣으니 해결
					$(".move_detail").html(str);
					$(".move_detail").submit();
				});
		//-----------페이징---------------

		$(".paginate_button")
				.click(
						function(e) {
							var category_idx = ${pageMaker.cri.category_idx};
							var str = '';
							str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum}+'"/>';
							str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount}+'"/>';

							if (category_idx == 101) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action','/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']").val($(this).attr('href'));
								$("#paginate").submit();
							} else if (category_idx == 102) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action',
										'/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							} else if (category_idx == 103) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action',
										'/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							} else if (category_idx == 104) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action',
										'/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							} else if (category_idx == 105) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action',
										'/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							} else if (category_idx == 106) {
								e.preventDefault();
								str += '<input type="hidden" name="category_idx" value="'+${pageMaker.cri.category_idx }+'"/>';
								$("#paginate").attr('action',
										'/product/list_by_category');
								$("#paginate").html(str);
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							} else {
								e.preventDefault();
								$("#paginate").attr('action',
										'/product/allList');
								$("#paginate").find("input[name='pageNum']")
										.val($(this).attr('href'));
								$("#paginate").submit();
							}

						});
	</script>
	</div> <!-- body-wrapper끝나는곳 -->
	<%@ include file="../include/footer2.jsp"%>
</body>
</html>