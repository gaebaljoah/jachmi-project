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
	
	/* 게시판 관련 */
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
	
	/* 첨부파일 */
	.uploadlist{
		list-style: none;
		padding: 10px;
	}
	
	/* 내용입력 */
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
	
	/* 버튼 */
	.boardButton{
		text-align: center;
		padding: 10px;
	}
	/* 수정버튼 */
	#boardModBtn {
		background-color: rgb(52, 152, 219);
		text-align: center;
		border: none;
		width: 6%;
		height: 40px;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		margin-top: 15px;
		cursor: pointer;
	}
	/* 목록 */
	#listMoveBtn {
		background-color: rgb(94, 94, 94);
		text-align: center;
		border: none;
		width: 6%;
		height: 40px;
		font-size: 15px;
		border-radius: 5px;
		color: white;
		margin-top: 15px;
		cursor: pointer;
	}
	/* 본인 글 목록 */
	#myListMoveBtn {
		background-color: rgb(224, 224, 224);
		text-align: center;
		border: none;
		width: 6%;
		height: 40px;
		font-size: 15px;
		border-radius: 5px;
		color: black;
		margin-top: 15px;
		cursor: pointer;
	}
	
	/* 댓글 모달 관련 */
	/* 댓글, 쪽지모달배경 */
	.modal, .m_modal {
		display: none;
		position: fixed; 
		z-index: 1; 
		left: 0;
		top: 0;
		width: 100%; 
		height: 100%; 
		overflow: auto; 
		background: rgba(0, 0, 0, 0.8);
		border-radius: 25px;
	}
	/* 댓글 모달 내용 */
	.modal-content, .m_modal-content {
		position: absolute;
		top: 200px; 
		left: 730px;
		background-color: white;
		border-radius: 10px;
		width: 400px;
		height: 160px;
		font-size: 20px;
		padding: 50px 0;
		text-align: center;
	}
	/* 댓글 모달입력내용 */
	#commentContent, #messageContent{
		padding: 10px;
		width: 250px;
	}
	/* 댓글 모달버튼 */
	.modal-footer, .message-footer{
		text-align: center;
		padding: 20px;
	}
	/* 댓글모달 안에 버튼 */
	#modalRegisterBtn, #close, #modalModBtn, #modalRemoveBtn, #sendToMessage, #closeToMessage{
		padding: 10px;
		background-color: rgb(52, 152, 219);
	    text-align: center;
	    border: none;
	    height: 40px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    margin-top: 15px;
	    cursor: pointer;
	}
	/* 댓글버튼 */
	.insertComment{
		text-align: center;
	}
	
	.c_writer{
		width: 10%;
	}
	
	/* 댓글등록, 쪽지보내기 버튼 */
	#btnRegister, #sendMessage{
		background-color: rgb(52, 152, 219);
	    text-align: center;
	    border: none;
	    width: 6%;
	    height: 40px;
	    font-size: 15px;
	    border-radius: 5px;
	    color: white;
	    margin-top: 15px;
	    cursor: pointer;
	}
	.insertView{
		text-align: center;
	}
	#commentL{
		display: flex;
		list-style-type: none;
		margin-left: 40%;
	}
	#commentL li{
		padding: 30px;
	}
	.ctList{
		margin-left: 40%;
	}
	.ctList p{
		float: left;
		padding: 5px;
	}
	
	.ctList{
		list-style: none;
		margin-left: 0;
		padding-left: 80px;
		
	}
	.ctList li{
		padding: 0 2%;
		display: inline-block;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">
	$(function() {
		var operForm = $("#operForm");
		var bnoValue = '${bvo.b_idx}';
		var c_writer = $("input[name='c_writer']");
		var c_content = $("input[name='c_content']");
		var replyUL = $(".chat");
		var m_idx = $("input[name='m_id']");
		
		function showList() {
			getList({b_idx:bnoValue, page:1},
			function(result) {
				var str = '';
				if (result == null || result.length == 0) {
					// 댓글이 없으면
					replyUL.html("");
					return;
				} else{
				// 댓글이 있으면
					for(var i=0; i<result.length; i++){
					console.log(result[i].c_writer);
					str += '<ul id="commentList" data-rno = "' + result[i].c_idx + '">';
					str += '<div class="ctList">';
					str += '<li>' + result[i].c_idx + '</li>';
					str += '<li>' + result[i].c_writer + '</li>';
					str += '<li>' + result[i].c_content + '</li>';
					str += '<li>' + displayTime(result[i].c_date) + '</li>';
					str += '</div>';
					str += '</ul>';
				}
				replyUL.html(str);
					}
				}
			);
		}
		
		showList();
		
		// 게시글 수정
		$("#boardModBtn").click(function() {
			operForm.empty();
			operForm.append('<input type="hidden" name="b_idx" value="'+${bvo.b_idx}+'">');
			operForm.append('<input type="hidden" name="pageNum" value="'+${cri.pageNum}+'">');
			operForm.append('<input type="hidden" name="amount" value="'+${cri.amount}+'">');
			operForm.submit();
		});
		// 게시글 목록으로 이동
		$("#listMoveBtn").click(function(e) {
			e.preventDefault();
			location.href = "/board/board_list";
		});
		
		// 내 게시글 목록으로 이동
		$("#myListMoveBtn").click(function(e) {
			e.preventDefault();
			location.href = "/board/getOne";
		});
		// 댓글등록
		function add(cvo, callback){
			console.log("cvo......"); 
     		$.ajax({
       			type:'post',
				url : '/replies/new',
				data : JSON.stringify(cvo),
				contentType : "application/json; charset=utf-8",
				success:function(result, status, xhr){
					alert("댓글이 등록되었습니다.");
					showList();
					console.log(result);  
					$("#modal").hide();
				},
          		error : function(xhr, status, er){
             		console.log("error");
          		}
       		});
   		}
		// 댓글목록
		function getList(param, callback, error) {
			var bno = param.b_idx;
			$.ajax({
				type:'get',
				url : '/replies/pages/' + bno + '/1.json',
				success:function(result, status, xhr){
					if (callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if (error) {
						error;
					}
				}
			});
		}
		
		// 댓글상세
		function get(c_idx, callback, error){
		console.log("get reply!!!!!!!!!!!!!!" + c_idx);
			$.ajax({
				type : 'get',           
				url : '/replies/' + c_idx + '.json',  
				success : function(result, status, xhr){ 
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		// 댓글수정
		function update(reply, callback, error){
			console.log("update reply!!!!!!!!!!!" + reply.c_idx);
			$.ajax({
				type : 'put',           
				url : '/replies/' + reply.c_idx,    
				data : JSON.stringify(reply), 
				contentType : "application/json; charset=utf-8",     
				success : function(result, status, xhr){ 
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		// 댓글삭제
		function remove(rno, callback, error){
			$.ajax({
				type : 'delete',           
				url : '/replies/' + rno,    
				success : function(result, status, xhr){ 
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		// 댓글취소
		$("#close").on("click", function() {
			$("#modal").hide();
		});
		// 댓글수정
		$("#modalModBtn").on("click", function(e) {
			var result = {c_idx:rno, c_content:$("#modal").find("input[name='c_content']").val()};
			update(result, function(check) {
				if (check === 'success') {
					alert("댓글이 수정되었습니다.");
				}
			$("#modal").hide();	//모달 창 숨기기
			showList();
			});
		});
		// 댓글삭제
		$("#modalRemoveBtn").on("click", function() {
			remove(rno, function(result) {
				if (result === 'success') {
					alert("댓글이 삭제되었습니다.");
				}
			$("#modal").hide();	// 모달 창 숨기기
			showList();				// 목록창으로 보여지는 함수
			});
		});
		// 댓글달기버튼
		$("#btnRegister").on("click", function() {
			$("#modal").find("input").val();
			$("#modal").find("input[name='c_date']").closest("div").hide();
			$("#modalRegisterBtn").show();
			$("#modalModBtn").hide();
			$("#modalRemoveBtn").hide();
			$("#modal").show();
		});
		
		// 댓글등록버튼
		$("#modalRegisterBtn").on("click", function() {
			add(
					
				{c_content:$("#modal").find("input[name='c_content']").val(), c_writer:$("#modal").find("input[name='c_writer']").val(), b_idx:bnoValue},
				function(result) {
					if (result === 'success') {
						alert("댓글이 등록되었습니다.");
					}
				showList();	// 댓글 목록 뿌려주는 함수
				$("#modal").hide();
				}
			)
		});
		
		// 댓글목록
		$(".chat").on("click", "ul", function() {
			rno = $(this).attr('data-rno');
			var id = "${signIn.id}";
			get(rno, function(result) {
				console.log(result);
				$("#modal").find("input[name='c_writer']").val(result.c_writer);
				$("#modal").find("input[name='c_content']").val(result.c_content);
				
				if (result.c_writer == id) {
					console.log(result.c_writer);
					$("#modalModBtn").show();
					$("#modalRemoveBtn").show();
					$("#modalRegisterBtn").hide();
					$("#modal").show();
				}
			});
		});
		
			
		// 첨부파일 관련
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
					str += '</li>';
				}
				$(".uploadResult ul").html(str);
			}
			});
		
		// 쪽지 관련
		
		// 쪽지보내기 버튼
		$("#sendMessage").on("click", function() {
			$("#m_modal").show();
		});
		
		// 쪽지 취소버튼
		$("#closeToMessage").on("click", function() {
			$("#m_modal").hide();
		});
		
		// 쪽지 보내기버튼(submit)
		$("#sendToMessage").on("click", function() {
			var m_content = $("#m_content").val();
			var m_receiver = $("input[value='${bvo.b_writer }']").val();
			var m_id = $("input[value='${signIn.id}']").val();
			var formObj = $("form");
			var str = "";
			if (m_content == "") {
				alert("내용을 입력해주세요");
				return;
			}
			
			alert("쪽지가 전송되었습니다.");
			$("#m_modal").hide();
			formObj.submit();
		});
	});
</script>
</head>
<body>
	<div id="body-wrapper">
		<!-- 게시판 -->
		<div id="body-content">
			<h1 style="text-align: center; margin-bottom: 10px;" >게시판상세</h1>
			<hr class="my-hr3">
			<div class="box2">
				<table>
					<tr>
						<th class="box">카테고리</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" name="b_category" value="${bvo.b_category }" readonly="readonly"></th>
						<th><input id="boxing1" type="hidden" name="b_idx" value="${bvo.b_idx }" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">제목</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" name="b_title" value="${bvo.b_title }" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">작성자</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text"name="b_writer" value="${bvo.b_writer }" readonly="readonly"></th>
						<th><input type="hidden" name="m_idx" value="${mvo.m_idx }"></th>
					</tr>
					<tr>
						<th class="box">내용</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><textarea rows="8" name="content" readonly="readonly">${bvo.b_content }</textarea></th>
					</tr>
					<tr>
						<th class="box">작성날짜</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;"><input type="text" name="b_date" value="<fmt:formatDate value="${bvo.b_date }" pattern="yyyy-MM-dd"/>" readonly="readonly"></th>
					</tr>
					<tr>
						<th class="box">첨부파일</th>
						<th colspan=3 style="border: solid 2px gray; opacity: 0.5; border-radius: 5px;">
							<div class="uploadResult" >
								<ul id="uploadF"></ul>
							</div>
						</th>
					</tr>
				</table>
			</div>
		</div>
		
		<form action="/board/board_update" method="get" id="operForm">
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="keyword" value="${cri.keyword }">
			<input type="hidden" name="type" value="${cri.type }">
		</form>
		<div class="boardButton">
			<c:if test="${signIn.id eq bvo.b_writer }">
				<button id="boardModBtn" type="button" class="btn-warning">수정</button>
				<button id="myListMoveBtn" type="button">본인글 목록</button>
			</c:if>
			<button id="listMoveBtn" type="button" class="btn-primary">목록</button>
		</div>
		
		<!-- 댓글 -->
		<div class="insertComment">
		<form>
			<p>
				<c:if test="${signIn.id != null }">
					<input type="button" id="btnRegister" value="댓글등록">
					<c:if test="${bvo.b_category.equals('모임')}">
						<input type="button" value="쪽지보내기" id="sendMessage">
					</c:if>
				</c:if>
				<input type="hidden" name="b_idx" value="${bvo.b_idx }">
			</p>
			<div class="insertView">
				<ul id="commentL">
					<li>번호</li>
					<li>작성자</li>
					<li>댓글내용</li>
					<li>날짜</li>
				</ul>
				<div>
					<ul class ="chat" id="commentL2">
					</ul>
				</div>
			</div>
		</form>
		<div id="modal" class="modal">
			<div class="modal-content">
				<input type="hidden" name="c_writer" value="${signIn.id}" >
				<p>댓글내용</p>
				<input id='commentContent' name='c_content'>
				<div class = "modal-footer">
					<button id = 'modalModBtn' type = "button" class = "btn btn-warning">수정</button>
					<button id = 'modalRemoveBtn' type = "button" class = "btn btn-danger">삭제</button>
					<button id = 'modalRegisterBtn' type = "button" class = "btn btn-primary">등록</button>
					<button id = "close" class = "btn btn-default">취소</button>
				</div>
			</div>
		</div> 
		</div>
		
		<!-- 쪽지 -->
		<div id="m_modal" class="m_modal">
			<div class="m_modal-content">
				<form action="/messsage/newMessage" method="get" role="form">
					<input type="hidden" name="m_id" value="${signIn.id }">
					<input type="hidden" name="m_receiver" value="${bvo.b_writer }" readonly="readonly">
					<p>쪽지내용<p>
					<input id="messageContent" name="m_content">
					<div class="message-footer">
						<button id="sendToMessage" type="button">보내기</button>
						<button id="closeToMessage" type="button">취소</button>
					</div>			
				</form>	
			</div>
		</div>
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>