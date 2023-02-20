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
	@font-face {
		font-family: 'NanumSquareRound';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body {
		font-family: 'NanumSquareRound';
	}
	h2 {
		text-align: center;
		padding: 10px;
	}
	h4 {
		text-align: center;
		padding: 10px;
	}
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
	
	.pull-right {
		text-align: center;
	}
	
	.search_area {
		margin: 10px;
		border: none;
	}
	.boardListCount, .form-control {
		padding: 10px;
		text-align: right;
		margin-right: 17%;
	}
	#keywordType, #keyword, #searchBtn, #listBack {
		padding: 10px;
	}
	.pagination a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:30px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	#paginationBox {
		list-style-type: none;
		padding: 30px;
		text-align: center;	
		margin-left: 37%;
	}
	
	.pagination li a:hover {
		color:#fff;
		border:1px solid #3498db;
		background-color:#3498db;
	}
	#listSize {
		padding: 10px 0;
		margin: 10px;
	}
	.test_page {
		text-decoration: none;
	}
	.category button.active{
		background-color: red;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">
//비동기 도전
var amount = 0;
var result_pageNum = 0;

$(document).ready(function() {
	
	amount = 10;
	result_pageNum = 1;
	
	console.log(amount);
	
	getPageOne(result_pageNum);
	
	
	
});


function getPageOne(pageNum) {
	result_pageNum = pageNum;
	var id = '${signIn.id}';
	
	console.log(id + "!!!!!!!!!!!!!!!!!!!!!!!!!");
	
	$.ajax({
		url : "/board/board_list_getOne",
		type : "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "JSON",
		data : JSON.stringify({
			b_writer : id
		}),
		success : function(res){
			
			console.log(res);
			var str = "";
			var block = "";
				for(var i=0; i<res.length; i++){
					str += "<tr>";
					str += "<td>" + res[i].b_idx + "</td>";
					str += "<td>" + res[i]['b_category'] + "</td>";
					str += "<td><a href='/board/board_get?b_idx="+res[i]['b_idx']+"&'>"+res[i]['b_title']+'&nbsp;'+'['+res[i]['b_replycnt']+']'+"</a></td>";
					str += "<td>" + res[i]['b_writer'] + "</td>";
					str += "<td>" + res[i]['b_date'] + "</td>";
					str += "<td>" + res[i]['b_cnt'] + "</td>";
					str += "</tr>";			
				}
				
			console.log(res.length + "!!!!!!!!!!!!!!!!!");
			
			$("#dataSection").html(str);
			
			
			//------정민
			$(".test_page").click(function(e){
				var str='';
				e.preventDefault();
				var b_idx = $(this).attr('href');
				
				str+='<input type ="hidden" name="b_idx" value="'+b_idx+'"/>';
				//alert(str);
				$("#testForm").html(str);
				$("#testForm").submit();
				
			});
			//------정민
			
			
			
			//---------------------페이징
// 			$.ajax({
// 				url : "/board/board_list_page",
// 				type : "POST",
// 				contentType: "application/json; charset=utf-8",
// 				dataType: "JSON",
// 				data : JSON.stringify({
// 					pageNum : pageNum,
// 					amount: amount,
// 					b_category : b_cate,
// 					type : searchType,
// 					keyword : key
// 				}),
// 				success : function(pdto){
					
// 					// 이전 버튼
// 					if (pdto.prev) {
// 						block += "<li class='page-item'><a class='page-link' href='javascript:getPageOne("
// 								+ (pdto.startPage - 1)
// 								+ ")'> < </a></li>";
// 					} else {
// 						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
// 					}
// 					//번호를 표시하는 부분
// 					for (var i=pdto.startPage; i<=pdto.endPage; i++) {
// 						if (pageNum !== i) {
// 							block += "<li class='page-item'><a class='page-link' href='javascript:getPageOne("
// 									+ i + ")'>" + i + "</a></li>";
// 						} else {
// 							block += "<li class='page-item disabled'><a class='page-link'>"
// 									+ i + "</a></li>";
// 						}
// 					}
// 					if (pdto.next) {
// 						block += "<li class='page-item'><a class='page-link' href='javascript:getPageOne("
// 								+ (pdto.endPage +1)
// 								+ ")'>  > </a></li>";
// 					} else {
// 						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
// 					}
					
// 					//
// 					$("#paginationBox").html(block);
// 				}
// 			});
		}
	});
	
}





</script>
</head>
<body>
	<h1 style="text-align: center; margin-bottom: 10px;" >내가 작성한 글</h1>
			<hr class="my-hr3">
	<div class="box2">
		<table>
			<thead>
				<tr>
					<th id="no" style="width: 10%">No</th>
					<th id="category" style="width: 15%">게시판카테고리</th>
					<th id="title" style="width: 40%">제목</th>
					<th id="writer" style="width: 15%">작성자</th>
					<th id="date" style="width: 10%">작성날짜</th>
					<th id="cnt" style="width: 10%">조회수</th>
				</tr>
			</thead>
			<tbody id="dataSection">
			</tbody>
		</table>
	</div>

</body>
<%@ include file="../include/footer.jsp" %>
</html>