<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="../include/header.jsp"%>

<style>
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

.main-div {
	text-align: center;
	padding: auto;
}

.main-title-div {
	display: block;
	width: 65%;
	margin: auto;
	text-align: left;
	font-size: 30;
	height: 90px;
}

.chat-tbl {
	margin: auto;
	width: 65%;
	text-align: center;
	border-collapse: collapse;
}

.chat-tblhd {
	border-top: 1px solid;
	border-bottom: 1px solid;
	background-color: #D4F4FA;
}

.chat-tblhd tr, td {
	padding: 10px;
}

.chat-tblbd {
	border-bottom: 1px solid #d7d7d7;
}

.chat-tblhd tr {
	border-top: 1px solid;
	border-bottom: 1px solid;
}

.tbl-chatList {
	margin: auto;
	width: 65%;
	text-align: center;
	border-collapse: collapse;
}


.tbl-div {
	height: 40px;
	width: 65%;
	margin: auto;
	text-align: left;
}

a {
	text-decoration-line: none;
}
a:visited {
	color:blue;
}
</style>
<div id="body-wrapper">
	<h1 style="text-align: center; margin-bottom: 10px;">상담관리</h1>
	<hr class="my-hr3">
		<form action="/chat/chat_admin" method="post" class="chatForm">
			<table class="chat-tbl">
				<thead class="chat-tblhd">
					<tr class="tbl-chatList">
						<td>유저 아이디</td>
						<td>내용</td>
						<td>시간</td>
					</tr>
				</thead>
				<tbody class="chat-tblbd">
					<c:forEach var="chat" items="${list }">
						<tr>
							<td>
								<a class="move_chat" href="${chat.username }" > 
									<c:out value="${chat.username}"></c:out>
								</a>
							</td>
							<td><c:out value="${chat.message }"></c:out></td>
							<td><fmt:formatDate value="${chat.regdate }" type="time" pattern="yyyy/MM/dd hh:mm:ss"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	<script type="text/javascript">
		$(function() {
			var chatForm = $(".chatForm");

			$(".move_chat").click(
					function(e) {
						e.preventDefault();
						var str = '';
						str += '<input type="hidden" name="sender" value="'
								+ $(this).attr("href") + '">';
						chatForm.html(str);
						chatForm.submit();
					});

		})
	</script>

	<%@ include file="../include/footer.jsp"%>
</div>