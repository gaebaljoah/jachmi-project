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
	
	/* 버튼값 */
	.buttonList{
		text-align: center;
	}
	/* 등록버튼 */
	.regi{
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
	/*수정 버튼*/
	#boardModBtn{
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
	/*취소 버튼*/
	#ListMoveBtn{
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
	
	/* 입력값 */
	input[type=text]{
		padding: 10px;
		width: 80%;
		border: none;
	}
	textarea{
		width: 80%;
		resize: none;
		border: none;
		padding: 10px;
		
	}
	.radio2 {
		margin: 10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// 버튼
	$(function() {
		var formObj = $("form");
		var amount = '${cri.amount}';
		var pageNum = '${cri.pageNum}';
		
		// 게시글 등록버튼
		$("button").click(function(e) {
			e.preventDefault();
			var oper = $(this).data("oper");
			if (oper == 'list') {
				location.href = '/board/board_list';
			} else if (oper == 'reset') {
				formObj[0].reset();
			} else {
				// 게시글 삽입시 빈칸 방지
				var title = $("#title").val();
				var content = $("#content").val();
				if (title == "") {
					alert("제목을 입력해주세요.");
					return false;
				}
				if (content == "") {
					alert("내용을 입력해주세요");
					return false;
				}
				console.log("submit clicked");
				// 첨부파일관련
				var str='';
				$(".uploadResult ul li").each(function(i,obj){
					var jobj = $(obj);
					str += '<input type="hidden" name="attachList['+i+'].b_fileName" value="'+jobj.data("filename")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].b_uuid" value="'+jobj.data("uuid")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].b_uploadPath" value="'+jobj.data("path")+'" >';
				});
				console.log(str);
				formObj.append(str);
				formObj.submit();
			}
		});
		// 게시글 카테고리
		$('.b_category').on('click', function() {
			var category_ck = $('.b_category:checked').val();
			alert("category_ck");
		});
		
		// 파일 업로드
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
		// 파일 업로드 후 화면 출력
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
		uploadResult.on("click", "span", function() {
			var targetFile = $(this).data("file");
			var targetLi = $(this).closest("li");
			$.ajax({
				url : "/p_deleteFile",
				data : {fileName : targetFile},
				type : "post",
				dataType : "text",
				success : function(result) {
					targetLi.remove();
				}
			});
		});	
	});
</script>
</head>
<body>
<div id="body-wrapper">
	<div id="body-content">
	<h1 style="text-align: center; margin-bottom: 10px;" >게시판등록</h1>
	<hr class="my-hr3">
		<div>
			<form action="/board/board_insert" method="post" role="form">
			<div class="box2">
				<table>
					<tr>
						<th colspan=3 class="radio" style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<div class="radio2">
								<input class="category" type="radio" name="b_category" value="자유게시판" checked="checked">자유게시판
					      		<input class="category" type="radio" name="b_category" value="모임">모임
						      	<input class="category" type="radio" name="b_category" value="QnA">QnA
							</div>
						</th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" id="writer" name="b_writer" value="${signIn.id }" ></th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" id="title" name="b_title" placeholder="제목을 입력해주세요."></th>
					</tr>
					<tr>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><textarea rows="10" id="content" name="b_content" placeholder="내용을 입력해주세요."></textarea></th>
					</tr>
					<tr>
						<th style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;\">
						<input type="file" name="uploadFile" multiple="multiple">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</th>
					</tr>
				</table>
			</div>
			<div class="buttonList">
				<button type="button" class="regi" data-oper="register">등록</button>
				<button class="btn btn-danger" data-oper="reset" id="boardModBtn">취소</button>
				<button class="btn btn-info" data-oper="list" id="ListMoveBtn">목록</button>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</div>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>