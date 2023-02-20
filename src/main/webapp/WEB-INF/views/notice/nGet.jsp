<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.board-group{
	    display: block;
	    width: 1050px;
	    margin: auto;
	    text-align: left;
        font-size: 30;
    	height: 60px;
	}
	#title-div{
	    display: block;
	    width: 1050px;
	    margin: auto;
	    text-align: left;
        font-size: 30;
    	height: 60px;
	}
	.form-group{
		border-top: 1px solid #d7d7d7;
		border-bottom: 1px solid #d7d7d7;
		height: 650px;
	    padding: 15px;
	}
	
	#board-table{
		margin: auto;
		width: 1050px;
		text-align: center;
		border-collapse: collapse;
	}
	
	#board-table tr{
		border-top: 1px solid #d7d7d7; 
		border-bottom: 1px solid #d7d7d7; 
	}	
	
	#board-title{
		border-right: 1px solid #d7d7d7; 
		width: 250px;
		height: 45px;
	}
	.content-file{
		list-style:none;
	}
	
	.content-file li a{
		color: black;
		text-decoration-line : none;
	}

	#nModify{
		background-color: rgb(52, 152, 219);
      	border: none;
      	height: 30px;
      	width: 45px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
	}
	
	/* 삭제버튼 */
	#nRemove{
      	background-color: rgb(94, 94, 94);
      	border: none;
      	height: 30px;
      	width: 45px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
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


</style>
<!-- <body> -->
<div id="body-wrapper">
	<div id="body-content">
		<div id="title-div"></div>
		<div class="board-group">
			<div>
				<table id="board-table">
					<tr>
						<td id="board-title">제목</td>
						<td>${vo.n_title }</td>
					</tr>
					<tr>
						<td id="board-title">작성자</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td id="board-title">첨부파일</td>
						<td>
							<div class="uploadResult">
								<ul class="content-file"></ul>
							</div>
						</td>
					</tr>
				</table>
				<div class="form-group">
				<div>${vo.n_content }</div>
				</div>
			</div>
			<div class="modal-footer">
				 <c:choose>
					<c:when test="${signIn.auth eq 'admin'}">				
						<button id="nModify" class="btn btn-default">수정</button>
						<button id="nRemove" class="btn btn-default">삭제</button>
						<button id="listMoveBtn" class="btn btn-default">목록</button>
					</c:when>
					<c:otherwise>
						<button id="listMoveBtn" class="btn btn-default">목록</button>
					</c:otherwise>
				</c:choose>
			</div>
			<form method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">			
			</form>
		</div>
	</div>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

	$(function () {
		var n_idxValue = '${vo.n_idx }';
		var operForm = $("#operForm");
		
		$("#nModify").click(function() {
			operForm.attr("action", "/notice/nModify");
			operForm.append('<input type="hidden" name="n_idx" value="'+${vo.n_idx }+'">');
			operForm.submit();			
		});
		
		$("#nRemove").click(function() {
			operForm.attr("action", "/notice/nRemove");
			operForm.append('<input type="hidden" name="n_idx" value="'+${vo.n_idx }+'">');
			operForm.submit();			
		});		
		
		$("#listMoveBtn").click(function() {
			operForm.attr("action", "/notice/nList");
			operForm.submit();			
		});		
		

		
		$.ajax({
			url:'/notice/n_getAttachList',
			type: 'get',
			data: {n_idx:n_idxValue},
			contentType: 'application/json; charset=utf-8',
			success : function(arr){
				console.log(arr);
				var str = '';
				
				for(var i=0; i<arr.length; i++){
					var obj = arr[i];
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +
															obj.uuid + "_" +
															obj.fileName);
					
					str += '<li data-path="'+obj.uploadPath+ '" data-uuid="'+obj.uuid+ '" data-filename="'+obj.fileName+'">';		
					str += '<a href="/download?fileName='+fileCallPath+'">';		
					str += '<img src="/resources/image/attach.png" style="width:15px">' + obj.fileName;		
					str += '</a>';		
					str += '</li>';		
				}			
				$(".uploadResult ul").html(str);
			}
		});		
	});
</script>
<%@ include file="../include/footer3.jsp" %>		
</div>