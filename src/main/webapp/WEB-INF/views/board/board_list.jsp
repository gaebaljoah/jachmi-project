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
	#keywordType, #keyword, #listBack {
		padding: 10px;
	}
	.pagination a {
/* 		display:block; */
/* 		margin:0 3px; */
/* 		float:left; */
/* 		border:1px solid #e6e6e6; */
/* 		width:28px; */
/* 		height:30px; */
/* 		line-height:28px; */
/* 		text-align:center; */
/* 		background-color:#fff; */
/* 		font-size:13px; */
/* 		color:#999999; */
/* 		text-decoration:none; */
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
	.pagination .arrow{
		 border: 1px solid #ccc;
	}
	.pagination a.active{
		background-color: rgb(57, 186, 228);
		color: #fff;
		border: rgb(255, 255, 255);
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
	.cate_list{
		background-color: rgb(52, 152, 219);
		border : none;
		border-radius: 8px;
		cursor: pointer;
		color: white;
	   	height: 35px;
  	 	width: 80px;
  	 	font-size: 13px;
	}
	.cate_list:focus{
		background: #D4F4FA;
		color: black;
	}
	#regBtn{
		background-color: rgb(52, 152, 219);
	    border: none;
	    width : 120px;
	    height: 40px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    margin-top: 15px;
	    cursor: pointer;
	}
	#searchBtn{
		background-color: rgb(52, 152, 219);
		padding: 10px;
		border: none;
		color: white;
		cursor: pointer;
	}
	#boardBtn{
		margin-left : 17%;
	}
 	.page-link:link{ 
 	background-color: skyblue; 
 	} 
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">

	// 비동기 도전
	var amount = 0;
	var result_pageNum = 0;
	
	$(document).ready(function() {
		
// 		if(amount == null && result_pageNum == null){
			amount = 10;
			result_pageNum = 1;
// 		}
		
		getPage(result_pageNum);
		
		// 검색버튼
		$("#searchBtn").click(function(e) {
			e.preventDefault();
			
			var keyword = $("#keyword").val();
			var searchType  = $("#keywordType").val();
			
			if (!keyword) {
				alert("내용을 입력해주세요");
				return;
			}
			getPage(result_pageNum);
		}); // 검색버튼 END
		
		
		// 게시물 등록
		$("#regBtn").click(function() {
			
			var id = "${signIn.id}"
			if (id == '') {
				if(logchk == true){
					// 로그인 화면 이동
					location.href = "/member/login";
				} else{
					return;
				}
			} else{
	 			$(location).attr('href', '/board/board_insert');
			}
		});
		
		// 카테고리관련
		$(".cate_list").on("click", function() {
			
			b_cate = $(this).val();
			
			getPage(result_pageNum);
			
			/* var actionForm = $("#actionForm");
			var cate_list = $(this).attr("value");
			//alert(cate_list);
			
			var str='';
			str += '<input type="hidden" name="b_category" value="'+cate_list+'">';
			actionForm.append(str);
			actionForm.submit(); */
		
		});
		
		// 게시글 수 변경 이벤트
		$("#listSize").on('change',function(){
			var thisVal = $(this).val();
			amount = thisVal;
			getPage(result_pageNum);
		});
			
		
	});
	var b_cate = '';	// 전역 변수
	function getPage(pageNum) {
		result_pageNum = pageNum;
		var listSize = $("#listSize").val();
		
		var key = $("#searchForm").find("input[type=text]").val();
		var searchType  = $("#keywordType").val();
		
		console.log(key);
		console.log(searchType);
		$.ajax({
			url : "/board/board_list",
			type : "POST",
			contentType: "application/json; charset=utf-8",
			dataType: "JSON",
			data : JSON.stringify({
				pageNum : pageNum,
				amount: amount,
				listSize : listSize,
				b_category : b_cate,
				type : searchType,
				keyword : key
			}),
			success : function(res){
				
				console.log(res);
				var str = "";
				var block = "";
					for(var i=0; i<res.length; i++){
						str += "<tr>";
						str += "<td>" + res[i].b_idx + "</td>";
						//str += "<td>" + res[i]['b_idx'] + "</td>";
						str += "<td>" + res[i]['b_category'] + "</td>";
// 						str += "<td><a href='/board/board_get?b_idx="+res[i]['b_idx']+"&'>"+res[i]['b_title']+'&nbsp;'+'['+res[i]['b_replycnt']+']'+"</a></td>";
						str += "<td><a class='test_page' href='"+res[i].b_idx+"'>"+res[i]['b_title']+'&nbsp;'+'['+res[i]['b_replycnt']+']'+"</a></td>";
						str += "<td>" + res[i]['b_writer'] + "</td>";
						str += "<td>" + displayTime(res[i]['b_date']) + "</td>";
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
					
					str+='<input type ="hidden" name="pageNum" value="'+result_pageNum+'"/>';
					str+='<input type ="hidden" name="amount" value="'+amount+'"/>';
					str+='<input type ="hidden" name="b_idx" value="'+b_idx+'"/>';
					//alert(str);
					$("#testForm").html(str);
					$("#testForm").submit();
					
				});
				//------정민
				
				
				
				//---------------------페이징
				$.ajax({
					url : "/board/board_list_page",
					type : "POST",
					contentType: "application/json; charset=utf-8",
					dataType: "JSON",
					data : JSON.stringify({
						pageNum : pageNum,
						amount: amount,
						b_category : b_cate,
						type : searchType,
						keyword : key
					}),
					success : function(pdto){
						
						// 이전 버튼
						if (pdto.prev) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
									+ (pdto.startPage - 1)
									+ ")'> < </a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
						}
						//번호를 표시하는 부분
						for (var i=pdto.startPage; i<=pdto.endPage; i++) {
							if (pageNum !== i) {
								block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
										+ i + ")'>" + i + "</a></li>";
							} else {
								block += "<li class='page-item disabled'><a class='page-link'>"
										+ i + "</a></li>";
							}
						}
						if (pdto.next) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getPage("
									+ (pdto.endPage +1)
									+ ")'>  > </a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
						}
						
						//
						$("#paginationBox").html(block);
					}
				});
			}
		});
		
	} // end getPage
	
	
	
	// 결과창 출력
	var result = '<c:out value="${result}"/>';
	if (result != '') {
		checkResult(result);
	}
	// 뒤로가기 관련
	history.replaceState({}, null, null);
	function checkResult(result) {
		if (result === '' || history.state) {	// 뒤로가기 방지
			return;
		}
		if (result === 'success') {		// 수정 및 삭제
			alert("처리가 완료되었습니다.");
			return;
		}
		if (result === 'ok') {		// 삽입
			alert("게시글이 등록되었습니다.");
		}
	} 
	
</script>
</head>
<body>
	<div id="body-wrapper">
		<div id="body-content">
		<h1 style="text-align: center; margin-bottom: 10px;" >게시판</h1>
		<hr class="my-hr3">
			<div class="box1">
				<div class="category">
					<h4>
						<button class="cate_list" value="자유게시판">자유게시판</button> |
						<button class="cate_list" value="모임">모임</button> |
						<button class="cate_list" value="QnA">QnA</button>
					</h4> 
				</div>
				
				<div class="boardListCount">
					<!-- 검색 -->
					<form id="searchForm" name="search-form" autocomplete="off">
						<select name="type" id="keywordType">
							<option value="title" class="search">제목</option>
							<option value="writer" class="search">작성자</option>
						</select>
						<input type="text" id="keyword" value="" name="keyword" placeholder="검색어를 입력하세요.">
						<button id="searchBtn">검색</button>
						
						<select class="form-control" id="listSize">
					  		<option value="10">10개</option>
					  		<option value="15">15개</option>
					  		<option value="20">20개</option>
						</select>
					</form>
				</div>
				
				<!-- 게시판 목록 -->
				<div class="box2">
					<form role="form" action="/board/board_insert" method="get" id="boardForm">
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
					</form>
				</div>
            
				<!-- 페이징 -->
				<div class="pagination1">
					<ul id="paginationBox" class="pagination">
		
					</ul>
				</div>
				
				<div id="boardBtn">
					<c:if test="${signIn.id != null}">
						<button id="regBtn">새 게시글 등록</button>
					</c:if>
				</div>
				
				<form action="/board/board_get" method="get" id="testForm">
				
				</form>
				
				<form action="/board/board_list" method="get" id="actionForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
					<input type="hidden" name="b_category" value="${pageMaker.cri.b_category }">
				</form>
			</div>
		</div>
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>