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
}

#askTable {
	width: 1000px;
}

textarea {
	width: 1000px;
	height: 300px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
}

.container {
	width: 1000px;
}

#btnDiv {
	margin-left: 290px;;
	
}

#btn_table {
	text-align: center;
}
#btn_table td{
	padding :10px;
}
.btn{
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
		<br>
		<div>
			<h3>문의번호 ${oneList.ask_idx}</h3>
		</div>
		<hr>
		<table id="askTable">
			<tr>
				<td><h5>제목</h5> <input type="text" class="form-control"
					value="${oneList.ask_title}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td><h5>내용</h5> <textarea style="resize: none;"
						readonly="readonly">${oneList.ask_title}</textarea></td>
			</tr>
		</table>
		<hr>
		<table id="askTable">
			<tr>
				<td><h5>답변</h5> <textarea cols="120" rows="100"
						id="answer_content" style="resize: none;">${oneList.answer_content}</textarea></td>
			</tr>
		</table>
		<br> <br> <br>
		<div id="btnDiv">
			<table id="btn_table">
				<tr>
					<td>
						<form action="/ask/update" method="post">
							<input type="hidden" name="pageNum" value="1" /> <input
								type="hidden" name="amount" value="10" /> <input type="hidden"
								name="ask_idx" value="${oneList.ask_idx}" /> <input
								type="hidden" name="answer_content" value="0" /> <input
								type="button" class="btn" value="등록 및 수정"
								onclick="update(this.form)">
						</form>
					</td>
					<td>
						<form action="/ask/getAskListAdmin" method="get" id="paginate">
							<input type="hidden" name="pageNum" value="1" /> <input
								type="hidden" name="amount" value="10" /> <input type="submit"
								class="btn" value="전체문의내역">
						</form>
					</td>
				</tr>

			</table>
		</div>
	</div>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function update(f) {
			var answer_content = $("#answer_content").val()	
			f.answer_content.value = answer_content;
			f.submit();
		}
	</script>
	<%@ include file="../include/footer2.jsp"%>
</body>
</html>