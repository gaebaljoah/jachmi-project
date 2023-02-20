<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
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
.reg_container {
	width: 620px;
	margin: auto;

}
table td{
padding-bottom:10px;
padding-top: 10px;
padding-right: 10px;
}
#reg_btn_td {
	text-align: center;
}

#p_desc {
	resize: none;
}

td {
	margin: 14px;
	padding: 10px;
}

.sub_title {
	width: 150px;
}

.reg_product_btn {
	border-radius: 5px;
	background-color: rgb(57, 186, 228);
	color: rgb(255, 255, 255);
	text-align: center;
	line-height: 2.1em;
	font-size: 17px;
	width: 209px;
	border: none;
}
</style>
</head>
<body>
	<div class="mb-3 row">
		<div class="reg_container">
			<form action="/product/register" method="post"
				enctype="multipart/form-data">
				<table>
					<tr id="reg_t_tr">
						<td class="sub_title"><b>상품카테고리명</b></td>
						<td><select class="form-select form-select-sm"
							aria-label=".form-select-sm example" name="product_category_idx"
							id="select_category_idx">
								<option value="">::카테고리명::</option>
								<option value="101">음식</option>
								<option value="102">생필품</option>
								<option value="103">주방</option>
								<option value="104">욕실</option>
								<option value="105">가전</option>
								<option value="106">전자</option>
						</select></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품명</b></td>
						<td><input type="text" name="product_name"
							class="form-control" placeholder="상품명을 입력해주세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품 가격</b></td>
						<td><input type="text" name="product_price" id="price"
							class="form-control" onkeyup="inputNumberFormat(this)"
							placeholder="상품금액을 입력하세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품이미지첨부</b></td>
						<td><input type="file" name="product_p_img"
							class="form-control" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품설명사진</b></td>
						<td><input type="file" name="product_p_img_desc1"
							class="form-control" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품설명</b></td>
						<td><input type="file" name="product_p_img_desc2"
							class="form-control" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품정보</b></td>
						<td><input type="file" name="product_p_img_desc3"
							class="form-control" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품옵션1</b></td>
						<td><input type="text" name="product_option1"
							class="form-control" placeholder="상품옵션명을 입력해주세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품옵션값</b></td>
						<td><input type="text" name="product_option_price1"
							class="form-control" id="price" onkeyup="inputNumberFormat(this)"
							placeholder="상품옵션금액을 입력하세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품옵션2</b></td>
						<td><input type="text" name="product_option2"
							class="form-control" placeholder="상품옵션명을 입력해주세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품옵션값2</b></td>
						<td><input type="text" name="product_option_price2"
							class="form-control" id="price" onkeyup="inputNumberFormat(this)"
							placeholder="상품옵션금액을 입력하세요" /></td>
					</tr>
					<tr id="reg_t_tr">
						<td><b>상품설명</b></td>
						<td><textarea rows="10" cols="50" name="product_desc"
								class="form-control" id="p_desc"></textarea></td>
					</tr>
					<tr id="reg_t_tr">

						<td id="reg_btn_td" colspan="2"><input type="hidden"
							name="pageNum" value="1" /> <input type="hidden" name="amount"
							value="8" /> <input class="reg_product_btn" type="button"
							value="상품등록" onclick="reg_btn(this.form)" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 스크립트 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		//상품금액 콤마넣기
		function inputNumberFormat(obj) {
			obj.value = comma(uncomma(obj.value));
		}

		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}//상품금액 콤마넣기------end

		//상품등록 버튼
		function reg_btn(f) {
			var product_category = $('select[name=product_category_idx]').val();
			var product_name = $('input[name=product_name]').val();
			var product_price = $('input[name=product_price]').val();
			var product_p_img = $('input[name=product_p_img]').val();
			var product_option1 = $('input[name=product_option1]').val();
			var product_option_price1 = $('input[name=product_option_price1]')
					.val();
			var product_option2 = $('input[name=product_option2]').val();
			var product_option_price2 = $('input[name=product_option_price2]')
					.val();
			var product_desc = $('textarea[name=product_desc]').val();

			product_option1
			if (product_category == '') {
				alert("카테고리를 선택하여주세요.");
				return;
			} else if (!product_name) {
				alert("상품명을 입력해주시기바랍니다.");
				return;
			} else if (!product_price) {
				alert("상품금액을 입력해주시기바랍니다.");
				return;
			} else if (!product_p_img) {
				alert("상품이미지를 첨부해주시기바랍니다.");
				return;
			} else if (!product_option1) {
				alert("상품옵션1을 입력해주시기바랍니다.");
				return;
			} else if (!product_option2) {
				alert("상품옵션2를 입력해주시기바랍니다..");
				return;
			} else if (!product_option_price1) {
				alert("상품옵션값1을 입력해주시기바랍니다.");
				return;
			} else if (!product_option_price2) {
				alert("상품옵션값2을 입력해주시기바랍니다.");
				return;
			} else if (!product_desc) {
				alert("상품설명을 입력해주시기바랍니다.");
				return;
			} else {
				f.submit();
			}//상품등록 버튼----end
		}
	</script>
	<%@ include file="../include/footer4.jsp"%>
</body>
</html>