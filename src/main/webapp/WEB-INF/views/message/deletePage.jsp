<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
		text-align: center;
	}
	.exitM{
		text-align: center;
	}
	.exit{
		background-color: rgb(52, 152, 219);
		border: none;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		cursor: pointer;
		padding: 10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".exit").on("click", function() {
			alert("창을 나가시겠습니까?");
			window.close();
			window.opener.document.location.reload();
		});
	});
</script>
</head>
<body>
	<h1>삭제완료</h1>
	<div class="exitM">
		<button class="exit">닫기</button>
	</div>
</body>
</html>