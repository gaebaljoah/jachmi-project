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
#askTable {
	width: 1000px;
}

#askTable th {
	text-align: center;
}

#askTable td {
	text-align: center;
	width: 20%;
}
/*페이징  */
.page_wrap {
	text-align: center;
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

.container {
	width: 1000px;
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

.modify_btn {
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
	<div class="container">
		<table id="ask_table">
			<thead id="ask_table_head">
				<tr>
					<th>상품번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody id="ask_table_body">
				<c:forEach var="askList" items="${list}">
					<tr>
						<td>${askList.ask_product_idx }</td>
						<td>${askList.ask_title }</td>
						<td>${askList.ask_id }</td>
						<td>${askList.ask_regdate }</td>
						<td>
							<form action="/ask/ask_detail_view">
								<input type="hidden" name="ask_idx" value="${askList.ask_idx}" />
								<input type="submit" value="답변등록 및 수정" class="modify_btn" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
	</div>
	<form action="/ask/getAskListAdmin" method="get" id="paginate">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
	</form>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(".paginate_button")
				.click(
						function(e) {

							var pageNum = $(this).attr('href')

							var str = '';
							str += '<input type="hidden" name="pageNum" value="'+pageNum+'"/>';
							str += '<input type="hidden"name="amount" value="'+${pageMaker.cri.amount }+'"/>';

							e.preventDefault();
							$("#paginate").attr('action',
									'/ask/getAskListAdmin');
							$("#paginate").html(str);
							$("#paginate").submit();
						});
	</script>
	<%@ include file="../include/footer2.jsp"%>
</body>
</html>