<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<style>
	/*게시판등록*/
	h2 {
		text-align: center;
		padding: 10px;
		
	}
	
	.box2 {
		margin: auto;
		text-align: center;
		width: 80%;
	
	}
	table{
		font-size: .9em;
		margin: auto;
		width: 60%;
		overflow: hidden;
		background-color:  white;
		border-collapse: separate;
 		 border-spacing: 0 20px;
 		 table-layout:fixed
	}
	
	.choice{
		width: 20%;
		border-radius: 10px red;
		opacity: 0.7;
		font-size: 20px;
		
	}
	input[type=button]{
		width: 10%;
		margin: 10px;
		padding: 8px;
	}
	textarea{
		width: 80%;
		resize: none;
		border: none;
		padding: 10px;
		
	}
	.btn{
		text-align: center;
	}
	input[type=text]{
		padding: 10px;
		width: 80%;
		border: none;
	}
	/* 등록버튼 */
	#faq_modify{
	    background-color: rgb(52, 152, 219);
	    border: none;
	    height: 40px;
	    width: 75px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    margin-top: 15px;
	}
   /*취소 버튼*/
   #faq_list{
      	background-color: rgb(94, 94, 94);
      	border: none;
      	height: 40px;
      	width: 75px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
   }

</style>
<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading">공지사항</div> -->
<!-- 			<!-- /.panel-heading -->
<!-- 			<form action="/faq/faq_modify" method="post" id="operForm"> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label>글 제목</label> -->
<%-- 					<input class="form-control" name="faq_title" value="${faq.faq_title }"> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label>글 내용</label> -->
<%-- 					<textarea rows="3" class="form-control" name="faq_content">${faq.faq_content }</textarea> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label>카테고리</label> -->
<!-- 					<select name="faq_category"> -->
<!-- 						<option value="회원관리">회원관리</option> -->
<!-- 						<option value="주문/결제">주문/결제</option> -->
<!-- 						<option value="상품">상품</option> -->
<!-- 						<option value="배송">배송</option> -->
<!-- 						<option value="서비스이용">서비스이용</option> -->
<!-- 						<option value="시스템 오류">시스템 오류</option> -->
<!-- 					</select> -->
<!-- 				</div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<label>작성자</label> -->
<!-- 					<input class="form-control" name="id" value="관리자" readonly="readonly"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 				<button class="btn btn-warning" type="submit" data-oper="faq_modify">글 수정</button> -->
<%-- 				<input type="hidden" name="faq_idx" value="${faq.faq_idx }"> --%>
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<div id="body-wrapper">
	<div id="body-content">
	<h1 style="text-align: center; margin-bottom: 10px;" >FAQ 수정</h1>
	<hr class="my-hr3">
		<div>
			<form action="/faq/faq_modify" method="post" id="operForm">
			<div class="box2">
				<table>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<select name="faq_category">
								<option value="회원관리">회원관리</option>
								<option value="주문/결제">주문/결제</option>
								<option value="상품">상품</option>
								<option value="배송">배송</option>
								<option value="서비스이용">서비스이용</option>
								<option value="시스템 오류">시스템 오류</option>
							</select>
						</th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<input type="text" name="faq_title" value="${faq.faq_title }">
						</th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<textarea rows="10" id="faq_content" name="faq_content">${faq.faq_content }</textarea>
						</th>
					</tr>
				</table>
			</div>
			<div class="btn">
				<button class="btn btn-primary" type="submit" id="faq_modify" data-oper="faq_modify">전송</button>
				<button class="btn btn-success" id="faq_list" data-oper="faq_list">목록</button>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">  				
				<input type="hidden" name="amount" value="${cri.amount }">
				<input type="hidden" name="faq_idx" value="${faq.faq_idx }">  	
			</div>
			</form>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</div>

<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	var operForm = $("#operForm");
	var text = $('textarea').val();
	text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
	
	$("button").on("click", function(e) {
		e.preventDefault();
		
		var operation = $(this).data("oper");
		operForm.append('<input type="hidden" name="pageNum" value="'+${cri.pageNum } + '">');
		operForm.append('<input type="hidden" name="amount" value="'+${cri.amount } + '">');
		
		if(operation == 'faq_list'){
			operForm.attr("method", "get");
			operForm.attr("action", "/faq/faq_list");
			
			var pageNumTag = $("input[name=pageNum]").clone();
			var amountTag = $("input[name=amount]").clone();
			
			operForm.empty(); // 내부 비워주기 
			
			operForm.append(amountTag);
			operForm.append(pageNumTag);
		}
		operForm.submit();
	});
	

});
</script>			