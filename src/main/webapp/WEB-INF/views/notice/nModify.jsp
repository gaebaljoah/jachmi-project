<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
/* 	.col-lg-12{ */
/* 	    display: block; */
/* 	    width: 65%; */
/* 	    margin: auto; */
/* 	    text-align: left; */
/*         font-size: 30; */
/*     	height: 60px; */
/* 	} */
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
	#title-div{
	    display: block;
	    width: 65%;
	    margin: auto;
	    text-align: left;
        font-size: 30;
    	height: 60px;
	}
	.form-group{
		border-top: 1px solid #d7d7d7;
		border-bottom: 1px solid #d7d7d7;
	}
	textarea{
		width: 80%;
		resize: none;
		border: none;
		padding: 10px;
	}	
	#board-table{
		margin: auto;
	    width: 65%;
		text-align: center;
		border-collapse: collapse;
	}
	.btn{
		text-align: center;
	}	
	input[type=text]{
		padding: 10px;
		width: 80%;
		border: none;
	}	
	#board-table tr{
		border-top: 1px solid #d7d7d7; 
		border-bottom: 1px solid #d7d7d7; 
	}	
	
	#board-title{
		border-right: 1px solid #d7d7d7; 
		width: 250px;
	}

	#nModify{
	    background-color: rgb(52, 152, 219);
	    border: none;
	    height: 40px;
	    width: 75px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    margin-top: 15px;
	}
   #nList{
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

<div id="body-wrapper">
	<div id="body-content">
	<h1 style="text-align: center; margin-bottom: 10px;" >공지사항 수정</h1>
	<hr class="my-hr3">
		<div>
			<form action="/notice/nModify" method="post" id="operForm">
			<div class="box2">
				<table>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
						<input type="text" class="form-control" id="n_title" name="n_title" value="${vo.n_title }">
						</th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
						<textarea rows="10" id="n_content" name="n_content">${vo.n_content }</textarea>
						</th>
					</tr>
					<tr>
						<th style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;\">
							<input type="file" name="uploadFile" multiple="multiple">
							<div class="uploadResult">
								<ul class="content-file"></ul>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<div class="btn">
				<button class="btn btn-primary" id="nModify">수정</button>
				<button class="btn btn-success" id="nList" data-oper="nList">목록</button>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">  				
				<input type="hidden" name="amount" value="${cri.amount }">  	
				<input type="hidden" name="n_idx" value="${vo.n_idx }">
			</div>
			</form>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</div>	
	
	
	
	
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(function () {
	var operForm = $("#operForm");
	var nidxValue = ${vo.n_idx };
	var text = $('textarea').val();
	text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
	
	
	$("button").on("click", function(e) {
		e.preventDefault();
		
		var operation = $(this).data("oper");
		operForm.append('<input type="hidden" name="pageNum" value="'+${cri.pageNum } + '">');
		operForm.append('<input type="hidden" name="amount" value="'+${cri.amount } + '">');
		
		if(operation == 'nRemove'){
			operForm.attr("action", "/notice/nRemove");		
		}else if(operation == 'nList'){
			operForm.attr("method", "get");
			operForm.attr("action", "/notice/nList");
			
			var pageNumTag = $("input[name=pageNum]").clone();
			var amountTag = $("input[name=amount]").clone();
			
			operForm.empty(); // 내부 비워주기 
			
			operForm.append(amountTag);
			operForm.append(pageNumTag);
		}
		operForm.submit();
	});

	// ----------------------파일 업로드 스크립트----------------------
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 특정 확장자 거르기
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){	// 파일 사이즈, 종류 체크하는 함수
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}		

	
	$("input[type='file']").change(function(){	// 업로드 버튼 클릭 이벤트
		var formData = new FormData();	// 스크립트에서 Form 태그 생성
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files; 
		
		for(var i=0; i<files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){	// 파일 사이즈 초과, 종류가 regex면 false를 리턴
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/notice_uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				showUploadFile(result);
			}
		});
	});	
	
	// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
	var uploadResult = $(".content-file");
	function showUploadFile(uploadResultArr) {
		var str = '';
		
		for(var i=0; i<uploadResultArr.length; i++){
			var obj = uploadResultArr[i];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +
													obj.uuid + "_" +
													obj.fileName);
			
			str += '<li data-path="'+obj.uploadPath+ '" data-uuid="'+obj.uuid+ '" data-filename="'+obj.fileName+'">';		
			str += '<img src="/resources/image/attach.png" style="width:15px">' + obj.fileName;		
			str += '<span data-file="'+ fileCallPath+'"> X </span>';
			str += '</li>';		
		}
		uploadResult.html(str);			
	}
	
	uploadResult.on("click", "span", function() {
		var targetFile = $(this).data("file");
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: "/notice_deleteFile",
			data : {fileName: targetFile},
			type : "post",
			dataType : "text",
			success : function(result) {
				targetLi.remove();
				}	
			});
		});
});
</script>			