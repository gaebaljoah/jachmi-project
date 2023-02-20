<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.box2 {
		margin: auto;
		text-align: center;
		width: 65%;
	}
	table {
		border: 1px #a39485 solid;
		font-size: .9em;
		box-shadow: 0 2px 5px rgba(0,0,0,.25);
		width: 100%;
		border-collapse: collapse;
		border-radius: 10px;
		overflow: hidden;
	}
	th, td {
		border: 1px solid #000;
		padding: 1em .5em;
		vertical-align: middle;
		font-size: 15px;
	}
	thead {
		background-color: #D4F4FA;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".mContent").on("click", function(e) {
			e.preventDefault();
			var feature = "width=500, height=300, top=300, left=500";
// 			var openUrl = "/message/getMessage?m_idx='+'";
			var m_idx = $(e.target).closest('td').find('input[name="m_idx"]').val();
// 			console.log($(e.target).closest('td').find('input[name="m_idx"]').val());
			
			window.open("/message/getMessage?m_idx="+m_idx, "", feature);
		});
	});
</script>
</head>
<body>
	<div id="body-wrapper">
		<div id="body-content">
			<h1 style="text-align: center; margin-bottom: 10px;" >받은쪽지함</h1>
			<hr class="my-hr3">
			<div class="box2">
				<form role="form" action="/message/sml" method="get" id="messageForm">
					 <table>
						<thead>
							<tr>
								<th id="category" style="width: 20%">보낸사람</th>
								<th id="title" style="width: 60%">내용</th>
								<th id="writer" style="width: 10%">받는사람</th>
								<th id="date" style="width: 10%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mvo" items="${mvo }">
								<tr>
									<td>${mvo.m_id }</td>
									<td>
										<a class="mContent">${mvo.m_content }</a>
										<input type="hidden" name="m_idx" value="${mvo.m_idx }">
									</td>
									<td>${mvo.m_receiver }</td>
									<td><fmt:formatDate value="${mvo.m_date}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>