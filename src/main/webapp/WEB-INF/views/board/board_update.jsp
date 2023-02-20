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

	/* 게시판 table */
	.box {
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
	
	/* 첨부파일 */
	.uploadlist, #uploadF {
		list-style: none;
	}
	
	/* 버튼값 */
	.buttonList{
		text-align: center;
		padding: 10px;
	}
	/* 목록 */
	#listBoard{
		background-color: rgb(224, 224, 224);
		border: none;
		height: 40px;
		width: 75px;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		margin-top: 15px;
		cursor: pointer;
	}
	/* 삭제 */
	#deleteBoard{
		background-color: rgb(94, 94, 94);
		border: none;
		height: 40px;
		width: 75px;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		margin-top: 15px;
		cursor: pointer;
	}
	/* 수정 */
	#updateBoard{
		background-color: rgb(52, 152, 219);
		border: none;
		height: 40px;
		width: 75px;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		margin-top: 15px;
		cursor: pointer;
	}
	
	/* 입력값 */
	input[type=text]{
		padding: 10px;
		width: 80%;
		border: none;
	}
	textarea {
		padding: 10px;
		width: 80%;
		resize: none;
		border: none;
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var operForm = $("#operForm");
		var bnoValue = '${bvo.b_idx}';
		var uploadResult = $(".uploadResult ul");
		
		// 게시글
		$("button").on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			
			if (operation == 'delete') {
				confirm("삭제하시겠습니까?");
				operForm.attr("action", "/board/board_delete");
			} else if (operation == 'list') {
				operForm.attr("action", "/board/board_list");
				operForm.attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
 				operForm.empty();	
				operForm.append(pageNumTag);
				operForm.append(amountTag);
			// 수정버튼
			} else if (operation == 'modify'){
				console.log("submit clicked modify!!!!!!!!!!1");
				var str='';
				$(".uploadResult ul li").each(function(i,obj){
					var jobj = $(obj);
					str += '<input type="hidden" name="attachList['+i+'].b_fileName" value="'+jobj.data("filename")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].b_uuid" value="'+jobj.data("uuid")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].b_uploadPath" value="'+jobj.data("path")+'" >';
				});
				operForm.append(str);
				console.log(operForm.serialize());
			}
			operForm.submit();
		});
		
		// 첨부파일
		
		// 기존 첨부파일 삭제
		$.ajax({
			url : '/board/getAttachList',
			type : 'get',
			data : {b_idx:bnoValue},
			contentType : 'application/json; charset = utf-8',
			success : function(arr) {
				console.log(arr);
				
				var str = '';
				for(var i=0; i<arr.length; i++){
					var obj = arr[i];
					var fileCallPath = encodeURIComponent(obj.b_uploadPath + "/" + obj.b_uuid + "_" + obj.b_fileName);
					str += '<li class="uploadlist" data-path="'+obj.b_uploadPath+'" data-uuid="'+obj.b_uuid+'" data-filename="'+obj.b_fileName+'">';
					str += '<a href = "/p_download?b_fileName='+fileCallPath+'">';
					str += '<img src = "/resources/image/attach.png" style="width:15px">' + obj.b_fileName;
					str += '</a>';
					str += '<span data-file="'+fileCallPath+'"> 삭제 </span>';		// X표시를 만들어 파일 삭제 할 수 있게 하는 것
					str += '</li>';
				}
				$(".uploadResult ul").html(str);
			}	
		});
		uploadResult.on("click", "span", function() {
			var targetFile = $(this).data("file");
			var targetLi = $(this).closest("li");
			$.ajax({
				url : "/p_deleteFile",
				data : {fileName : targetFile},
				type : "post",
				dataType : "text",
				success : function(result) {
					if (confirm("파일을 삭제하시겠습니까?")) {
						console.log(targetFile);
						targetLi.remove();
					}
				}
			});
		});
		
		// 새로운 첨부파일 등록
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(b_fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("해당 파일의 사이즈는 업로드 할 수 없습니다.");
				return false;
			}
			if (regex.test(b_fileName)) {
				alert("해당 종류의 파일은 없로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
		$("input[type='file']").change(function() {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i=0; i<files.length; i++){
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url : '/p_uploadAjaxAction',
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
		var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			var str = '';
			for(var i=0; i<uploadResultArr.length; i++){
				var obj = uploadResultArr[i];
				var fileCallPath = encodeURIComponent(obj.b_uploadPath + "/" + obj.b_uuid + "_" + obj.b_fileName);
				str += '<li data-path="'+obj.b_uploadPath+'" data-uuid="'+obj.b_uuid+'" data-filename="'+obj.b_fileName+'">';
				str += '<img src = "/resources/image/attach.png" style="width:15px">' + obj.b_fileName;
				str += '<span data-file="'+fileCallPath+'"> 삭제 </span>';
				str += '</li>';
			}
			uploadResult.html(str);
		}
	});
</script>
</head>
<body>
	<div id="body-wrapper">
		<div id="body-content">
		<h1 style="text-align: center; margin-bottom: 10px;" >게시판 수정-삭제</h1>
		<hr class="my-hr3">
		<form action="/board/board_update" method="post" id="operForm">
			<div class="box2">
				<table>
					<tr>
						<th class="box">카테고리</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" name="b_category" value="${bvo.b_category }" readonly="readonly"></th>
						<th><input class="form-control" type="hidden" name="b_idx" value="${bvo.b_idx }" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">제목</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" class="form-control" name="b_title" value="${bvo.b_title }"></th>
					</tr>
					<tr>
						<th class="box">작성자</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" class="form-control" name="b_writer" value="${bvo.b_writer }" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">내용</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><textarea class="form-control" rows="8" name="b_content">${bvo.b_content }</textarea></th>
					</tr>
					<tr>
						<th class="box">작성날짜</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" class="form-control" name="b_date" value="${bvo.b_date }" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">첨부파일</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<input type="file" name="uploadFile" multiple="multiple">
							<div class="uploadResult" >
								<ul id="uploadF"></ul>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<div class = "buttonList">
				<button id="updateBoard" class="btn btn-warning" data-oper="modify">수정</button>
				<button id="deleteBoard" class="btn btn-danger" data-oper="delete">삭제</button>
				<button id="listBoard" class="btn btn-primary" data-oper="list">목록</button>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</div>
		</form>
		</div>
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>