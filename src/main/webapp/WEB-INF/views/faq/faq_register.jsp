<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	#faq_register{
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
<div id="body-wrapper">
	<div id="body-content">
	<h1 style="text-align: center; margin-bottom: 10px;" >FAQ 작성</h1>
	<hr class="my-hr3">
		<div>
			<form role="form">
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
						<input type="text" id="faq_title" name="faq_title" placeholder="제목을 입력해주세요.">
						</th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
						<textarea rows="10" id="faq_content" name="faq_content" placeholder="내용을 입력해주세요."></textarea>
						</th>
					</tr>
<!-- 					<tr> -->
<!-- 						<th style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;\"> -->
<!-- 							<input type="file" name="uploadFile" multiple="multiple"> -->
<!-- 							<div class="uploadResult"> -->
<!-- 								<ul></ul> -->
<!-- 							</div> -->
<!-- 						</th> -->
<!-- 					</tr> -->
				</table>
			</div>
			<div class="btn">
				<button class="btn btn-primary" id="faq_register">전송</button>
				<button class="btn btn-success" id="faq_list" data-oper="faq_list">목록</button>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">  				
				<input type="hidden" name="amount" value="${cri.amount }">  	
			</div>
			</form>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</div>


<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading">공지글 작성</div> -->
<!-- 			<!-- /.panel-heading --> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<form role="form"> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>제목</label> -->
<!-- 						<input class="form-control" name="faq_title"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>내용</label> -->
<!-- 						<textarea rows="3" class="form-control" name="faq_content"></textarea> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label>카테고리</label> -->
<!-- 						<select name="faq_category"> -->
<!-- 							<option value="회원관리">회원관리</option> -->
<!-- 							<option value="주문/결제">주문/결제</option> -->
<!-- 							<option value="상품">상품</option> -->
<!-- 							<option value="배송">배송</option> -->
<!-- 							<option value="서비스이용">서비스이용</option> -->
<!-- 							<option value="시스템 오류">시스템 오류</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 						첨부파일 -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-12"> -->
<!-- 							<div class="panel panel-default"> -->
<!-- 								<div class="panel-heading">파일 첨부</div> -->
<!-- 								/.panel-heading -->
<!-- 								<div class="panel-body"> -->
<!-- 									<div class="form-group uploadDiv"> -->
<!-- 										<input type="file" name="uploadFile" multiple="multiple"> -->
<!-- 									</div> -->
<!-- 									<div class="uploadResult"> -->
<!-- 										<ul></ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								/.panel-body -->
<!-- 							</div> -->
<!-- 							/.panel -->
<!-- 						</div> -->
<!-- 						/.col-lg-12	 -->
<!-- 					</div> -->
<!-- 					/.row -->
<!-- 					<button class="btn btn-primary" data-oper="faq_register">전송</button> -->
<!-- 					<button class="btn btn-success" data-oper="faq_list">목록</button> -->
<%-- 					<input type="hidden" name="pageNum" value="${cri.pageNum }">  				 --%>
<%-- 					<input type="hidden" name="amount" value="${cri.amount }">  			 --%>
<%-- <%-- 					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	 --%> --%>
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 			<!-- /.panel-body --> -->
<!-- 		</div> -->
<!-- 		<!-- /.panel --> -->
<!-- 	</div> -->
<!-- 	<!-- /.col-lg-12 -->	 -->
<!-- </div> -->

<script type="text/javascript">
$(function(){
	var formObj = $("form");
	
	var amount = '${cri.amount}'
	var pageNum = '${cri.pageNum}';
	
	var text = $('textarea').val();
	text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
	
	// ----------------------버튼 클릭 스크립트----------------------
	$("button").click(function(e) {
		e.preventDefault();	// 기본 이벤트 삭제
		
		var oper = $(this).data("oper");
		
		if(oper == 'faq_list'){
			location.href='/faq/faq_list?pageNum='+ pageNum + '&amount=' + amount;				
		}else{
			// 게시글 등록
			console.log("submit clicked");
			
			formObj.attr("action", "/faq/faq_register");
			formObj.attr("method", "post");				
			
			var faq_title = $("input[name=faq_title]").val();
			var faq_content = $("input[name=faq_content]").val();

			if(faq_content == '' || faq_title == ''){
				alert("제목과 내용을 입력해주세요");
				return;
			}			
			var str = '';
			
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				str += '<input type="hidden" name="faqAttachList['+i+'].fileName" value="'+jobj.data("filename")+'">';
	            str += '<input type="hidden" name="faqAttachList['+i+'].uuid" value="'+jobj.data("uuid")+'">';
	            str += '<input type="hidden" name="faqAttachList['+i+'].uploadPath" value="'+jobj.data("path")+'">';
			});
			formObj.append(str);
			formObj.submit();
		}
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
		url : '/faq_uploadAjaxAction',
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
var uploadResult = $(".uploadResult ul");
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
		url: "/faq_deleteFile",
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