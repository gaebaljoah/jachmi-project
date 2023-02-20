<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face {
	    font-family: 'NanumSquareRound';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	body{
		 font-family: 'NanumSquareRound';
	}
	h2, .cmd{
		text-align: center;
	}
	table{
		margin: auto;
	}
	#messageExit{
		border: none;
		background-color: rgb(52, 152, 219);
		padding: 10px;
		border-radius: 5px;
		font-size: 15px;
	}
	#messageDelete{
		border: none;
		padding: 10px;
		border-radius: 5px;
		font-size: 15px;
	}
	.cmd{
		padding: 10px;
	}
	.messageGet, input{
		font-size: 20px;
	}
	#content{
		resize: none;
		font-size: 20px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".button").on("click", function() {
			window.close();
		});
		$(".deleteButton").on("click", function() {
			
			confirm("삭제하시겠습니까?");

			$("#messageDelete").submit();
			alert("삭제되었습니다.");
		});
		
	});
</script>
</head>
<body>
	<div class="tot">
		<h2>쪽지내용</h2>
		<form id="messageDelete" method="post" action="/message/messageDelete">
			<table class="messageGet">
				<tr>
					<th class="sen">번호</th>
					<td><input name="m_idx" value="${mvo.m_idx }" readonly="readonly"></td>
				</tr>
				<tr>
					<th class="sen">보낸사람</th>
					<td><input name="m_id" value="${mvo.m_id }" readonly="readonly"></td>
				</tr>
				<tr>
					<th class="sen">쪽지내용</th>
					<td>
					<textarea id="content" rows="3" cols="25" name="m_content" readonly="readonly">${mvo.m_content }</textarea>
				</tr>
			</table>
			<div class="cmd">
				<input type="button" id="messageExit" value="창닫기" class="button">
				<input type="button" id="messageDelete" value="삭제" class="deleteButton"> 
				<input type="hidden" name="m_idx" value="${mvo.m_idx }">
				<input type="hidden" name="m_date" value="${mvo.m_date }">
				<input type="hidden" name="gubun" value="${mvo.gubun }">
				<input type="hidden" name="m_receiver" value="${mvo.m_receiver }">
			</div>
		</form>
	</div>
</body>
</html>

