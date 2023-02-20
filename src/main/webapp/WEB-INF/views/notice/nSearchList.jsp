<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="../include/header.jsp" %>

<style>
	*{
   		font-family: 'NanumSquareNeo-Variable';
   	}
	@font-face {
    	font-family: 'NanumSquareNeo-Variable';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
	}
	@font-face {
    	font-family: 'Chosunilbo_myungjo';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
	#main-div{
		text-align: center;
		padding: auto;
	}
	
	#title-div{
	    display: block;
	    width: 65%;
	    margin: auto;
	    text-align: left;
        font-size: 30;
    	height: 60px;
	}
	
	#board-table{
		margin: auto;
	    width: 65%;
		text-align: center;
		border-collapse: collapse;
	}
	
	#board-table-hd{
		background-color: #D4F4FA;
	}
	
	#board-table-hd tr, td{
		padding : 10px;
	}
	
	#board-table-hd tr{
		border-top: 1px solid; 
		border-bottom: 1px solid;  
	}
	
	#board-table-bd tr{
		border-bottom: 1px solid #d7d7d7; 
	}
	
	.notice-pagination li{
		display: inline-block;
		margin: auto;
	}
	
	.pull-right{
		text-align: center;
	    width: 65%;
	    margin: auto;
	}
	
	#button-div{
	    display: block;
	    width: 65%;
	    margin: auto;
	    text-align: left;	
	}
	#nRegBtn{
		background-color: rgb(52, 152, 219);
		color: #fff;
	  	border: solid 2px #fff;
  		border-radius: 12px;
 		height: 30px;
    	width: 130px;
	}
	
	/*페이징  */
	.page_wrap {
	   text-align: center;
	   font-size: 0;
	}
	
	.notice-pagination {
	   display: inline-block;
	   margin: 15px 0 15px 0;
	}
	
	.notice-pagination .none {
	   display: none;
	}
	
	.notice-pagination a {
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
	
	.notice-pagination .arrow {
	   border: 1px solid #ccc;
	}
	
	.notice-pagination a.active {
	   background-color: rgb(57, 186, 228);
	   color: #fff;
	   border: rgb(255, 255, 255);
	}	
	
	a{
		text-decoration-line : none;
		color: black;
	}
	
	/* 검색 버튼 디자인 */
	#nSearchBtn{
		background-color: white;
		border: none;
		height: 22px;
	}
	/* 검색폼 중앙정렬 */
	#searchForm{
		margin-left: 500px;
	}		
	.search_wrap{
	    width: 67%;
	    text-align: right;
	    height: 35px;
	    margin: auto;	
	}
	.search_area{
		margin-left: 40%;
	}
	#listMoveBtn{
      	background-color: rgb(224, 224, 224);
      	border: none;
      	height: 30px;
      	width: 45px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;	
	}
	#button-div{
		text-align: center;
	}
	.nSearch-result{
		margin: auto;
		text-align: center;
	}
</style>

<div id="body-wrapper">
	<div id="body-content">
		<h1 style="text-align: center; margin-bottom: 10px;" >공지사항</h1>
		<hr class="my-hr3">
	
		<div class="search_wrap">
			<div class="search_area">
				<form id="searchForm" method="get">
					<div style="float: left;  box-shadow: 3px 3px 3px 3px #EBEBEB;">
						<select id="nColumn" name="nColumn" style="border: none; border-right: none; height: 22px;">
							<option value="n_title">제목</option>
							<option value="n_content">내용</option>
						</select>
					</div>
					<div style="float: left; box-shadow: 3px 3px 3px 3px #EBEBEB">
						<input type="text" name="nSearch" style="border: none; height: 22px; border-left: none;">
					</div>
					<div style="float: left; box-shadow: 3px 3px 3px 3px #EBEBEB">
						<button id="nSearchBtn"><!-- 검색 --> <img alt="" src="<spring:url value='/resources/image/9041903_search_icon (1).png'/>" width="20px;"></button>
						<input type="hidden" name="pageNum" value="1">
						<input type="hidden" name="amount" value="10">
					</div>
				</form>		
			</div>	
		</div>
	<div id="main-div">
		<table id="board-table">
			<thead id="board-table-hd">
				<tr>
					<td>NO</td>
					<td>제목</td>
					<td>작성날짜</td>
				</tr>
			</thead>
			<tbody id="board-table-bd">
				<c:forEach var="notice" items="${nList }">
					<tr>
						<td><c:out value="${notice.n_idx }"></c:out></td>
						<td>
							<a class="move" href="${notice.n_idx }">
								<c:out value="${notice.n_title }"></c:out> 
							</a>
						</td>
						<td><c:out value="${notice.n_regdate }"></c:out> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <div class="page_wrap">
        <div class="notice-pagination">
        	<c:if test="${pageMaker.prev }">
               <a class="notice-paginate_button previous" href="${pageMaker.startPage-1 }">&lt;</a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }" step="1">
               <a class="notice-paginate_button ${pageMaker.cri.pageNum==num ? 'active' : '' }"
	                  href="${num}">${num }</a>
            </c:forEach>
            <c:if test="${pageMaker.next }">
               <a class="notice-paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
            </c:if>
        </div>
       </div>
       <div class="nSearch-result">
       		검색하신 <span style="color:blue;">${nSearch}</span>에 대한 결과입니다.
       </div>
       
		<div id="button-div">
			<form method="get" id="noticeForm">
				<button id="listMoveBtn" class="btn btn-default">목록</button>
				<input type="hidden" name="pageNum" value="1">
				<input type="hidden" name="amount" value="15">
			</form>
		</div>
	</div>

<script type="text/javascript">

	$(function(){
		var noticeForm = $("#noticeForm");	// 데이터 전송을 위한 form 태그
		
		$(".move").click(function(e) {
			// <a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
			e.preventDefault(); // 기본 href 경로 이동 방지
			noticeForm.attr("action", "/notice/nGet");
			
			var str = '';
			str += 	'<input type="hidden" name="n_idx" value="' + $(this).attr("href")+ '">';
			
			noticeForm.html(str);
			noticeForm.submit();
		});
		
		$("#listMoveBtn").click(function() {
			noticeForm.attr("action", "/notice/nList");
			noticeForm.submit();			
		});				
		
		$(".notice-pagination a").click(function(e) {
			e.preventDefault();
			noticeForm.attr("action", "/notice/nSearchList");
			noticeForm.find("input[name='pageNum']").val($(this).attr('href'));
			noticeForm.submit();
		});		
	});
	history.replaceState({}, null, null);
</script>

<%@ include file="../include/footer.jsp" %>
</div>