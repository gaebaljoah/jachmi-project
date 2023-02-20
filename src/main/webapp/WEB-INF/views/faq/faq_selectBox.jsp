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
    	height: 90px;
	}
	
	#faq-table{
		margin: auto;
	    width: 65%;
		text-align: center;
		border-collapse: collapse;
	}
	
	#faq-table-hd {
		background-color: #D4F4FA;
	}
	#faq-table-hd tr, td{
		padding : 10px;
	}
	
	#faq-table-hd tr{
		border-top: 1px solid; 
		border-bottom: 1px solid;  
	}
	#faq-table-bd tr{
		border-bottom: 1px solid #d7d7d7; 
	}
	
	#button-div{
	    display: block;
	    width: 65%;
	    margin: auto;
	    text-align: left;	
	}
	#faq_regBtn{
		background-color: rgb(52, 152, 219);
		color: #fff;
	  	border: solid 2px #fff;
  		border-radius: 12px;
 		height: 30px;
    	width: 130px;
	}
	
	/* 수정버튼 */
	.faqModify{
      	background-color: rgb(224, 224, 224);
      	border: none;
      	height: 30px;
      	width: 45px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
	}
	
	/* 삭제버튼 */
	.faqRemove{
      	background-color: rgb(94, 94, 94);
      	border: none;
      	height: 30px;
      	width: 45px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
	}
	
 	.hidden_content{ 
 		display: none; 
 	} 
 	#category-div{
 		height: 40px;
	    width: 65%;
	    margin: auto;
	    text-align: left;		
 	}
 	#button-div{
	    display: block;
	    width: 65%;
	    margin: auto;
	    text-align: left;	
	}
	/*페이징  */
	.page_wrap {
	   text-align: center;
	   font-size: 0;
	}
	
	.faq-pagination {
	   display: inline-block;
	   margin: 15px 0 15px 0;
	}
	
	.faq-pagination .none {
	   display: none;
	}
	
	.faq-pagination a {
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
	
	.faq-pagination .arrow {
	   border: 1px solid #ccc;
	}
	
	.faq-pagination a.active {
	   background-color: rgb(57, 186, 228);
	   color: #fff;
	   border: rgb(255, 255, 255);
	}	
	
	#category-div{
		text-align: center;
	}
	select {
		border-radius:0; /* 아이폰 사파리 보더 없애기 */
		-webkit-appearance:none; /* 화살표 없애기 for chrome*/
		-moz-appearance:none; /* 화살표 없애기 for firefox*/
		appearance:none; /* 화살표 없애기 공통*/
	    text-align: center;
	    height: 27px;
		width: 20%;
}
	
</style>
 <!-- 본문시작 -->
	<div id="body-wrapper">
	<div id="body-content">
<h1 style="text-align: center; margin-bottom: 10px;" >FAQ</h1>
<hr class="my-hr3">
<div id="main-div">
	<!--  <div id="title-div">
		<h1>FAQ</h1>
	</div>-->
	<div id="category-div">
		<form method="get" id="faq_selForm">
			<select id="faq_selbox" name="faq_category">
				<option value="">${category }</option>
				<option value="회원관리">회원관리</option>
				<option value="주문/결제">주문/결제</option>
				<option value="상품">상품</option>
				<option value="배송">배송</option>
				<option value="서비스이용">서비스이용</option>
				<option value="시스템 오류">시스템 오류</option>
				<option value="전체">전체</option>
			</select>
		</form>
	</div>
	<div>
		<form method="get" id="faq_openForm">
			<table id="faq-table">
				<thead id="faq-table-hd">
					<tr>
						<td>NO</td>
						<td>분류</td>
						<td>제목</td>
						<td>작성날짜</td>
					</tr>
				</thead>
				<tbody id="faq-table-bd">
					<c:forEach var="faq" items="${faq_list }">
						<tr class="faqTrClickEv">
							<td class="idx_val"><c:out value="${faq.faq_idx }"></c:out></td>
							<td><c:out value="${faq.faq_category }"></c:out></td>
							<td>
								<c:out value="${faq.faq_title }"></c:out> 
							</td>
							<td><c:out value="${faq.faq_date }"></c:out> </td>
						</tr>
						<tr class="hidden_content">
							<td></td>
							<td colspan="2" >
								<c:out value="${faq.faq_content }"></c:out>
							</td>
							<td>
								<c:choose>
									<c:when test="${signIn.auth eq 'admin'}">								
										<button class="faqModify">수정</button>
										<button class="faqRemove">삭제</button>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>			
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
   <!-- page -->
      <div class="page_wrap">
         <div class="faq-pagination">
            <c:if test="${pageMaker.prev }">
               <a class="faq-paginate_button previous" href="${pageMaker.startPage-1 }">&lt;</a>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }" step="1">
               <a class="faq-paginate_button ${pageMaker.cri.pageNum==num ? 'active' : '' }"
                  href="${num}">${num }</a>
            </c:forEach>
            <c:if test="${pageMaker.next }">
               <a class="faq-paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
            </c:if>
         </div>
      </div>		
		<form method="get" id="faq-actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>			
		<div id="button-div">
			<c:choose>
				<c:when test="${signIn.auth eq 'admin'}">						
					<button id="faq_regBtn">새 게시글 등록</button>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>			
		</div>
	</div>
</div>
<script type="text/javascript">
	var faq_actionForm = $("#faq-actionForm");	// 데이터 전송을 위한 form 태그
	var faq_openForm = $("#faq_openForm");
	var faq_selForm = $("#faq_selForm");
	var category = "${category }";
	
	$(function(){
		$(".faqTrClickEv").click(function(e) {
			e.preventDefault();
			var hidden_content = $(e.target).closest("tr").next();
			hidden_content.toggle();
		});
		
		$(".faqModify").click(function(e) {
			var faq_idx = ($(e.target).closest('tr').prev().find('.idx_val').text());
			faq_openForm.attr("action", "/faq/faq_modify");
			faq_openForm.append('<input type="hidden" name="faq_idx" value="'+faq_idx+'">');
			faq_openForm.append('<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">');
			faq_openForm.append('<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">');
// 			faq_openForm.submit();
		});
		
		$(".faq-paginate_button").click(function(e) {
			e.preventDefault();
			faq_actionForm.attr("action", "/faq/faq_selectBox");
			faq_actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			faq_actionForm.append('<input type="hidden" name="faq_category" value="'+category+'">');
			faq_actionForm.submit();
		});				

		$("#faq_regBtn").click(function() {
			faq_actionForm.attr("action", "/faq/faq_register");
			faq_actionForm.submit();
		});		
		
		$(".faqRemove").click(function (e) {
			var faq_idx = ($(e.target).closest('tr').prev().find('.idx_val').text());
			faq_openForm.attr("action", "/faq/faq_remove");
			faq_openForm.append('<input type="hidden" name="faq_idx" value="'+faq_idx+'">');
			faq_openForm.append('<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">');
			faq_openForm.append('<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">');
			faq_openForm.submit();
		});
		
		$('#faq_selbox').change(function () {
			faq_selForm.attr("action", "/faq/faq_selectBox");
			faq_selForm.append('<input type="hidden" name="pageNum" value="1">');
			faq_selForm.append('<input type="hidden" name="amount" value="10">');
			faq_selForm.submit();			
		});
	});		
</script>
<%@ include file="../include/footer.jsp" %>
</div>