<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
	.img{
		width: 400px;
		height: 300px;
	}
	.div1{
		margin:auto; 
		margin-top: 60px; 
		width: 800px;
	}
	.div1-1{
		margin-top: 20px; 
		margin-bottom: 20px;
	}
	hr{
		border:0; 
		background-color:silver;
	}
	.div2{
		margin-bottom:10px; 
		font-weight: bold;
	}
	.div3{
		margin-bottom:10px; 
		margin-top: 20px; 
		font-weight: bold;
	}
	.uploadResult{
		 margin-top: 20px; 
		 margin-bottom: 10px; 
		 font-weight: bold;
	}
	#btn1{
		padding: 10px 100px; 
		font-size:medium; 
		margin-right: 10px;
	}
	#btn2{
		padding: 10px 100px; 
		font-size:medium;
	}
</style>
  <!-- 본문시작 -->
<div id="body-wrapper">
	<div id="body-content">
		<div class="div1">
			<div>
				<h2>물건 정보 수정하기.</h2>
			</div>
			<div class="div1-1">
				<hr size=8px>
			</div>
			<form action="/jiyoung/Etc_info_update" method="post" role="form">
				<div class="div2">모델명</div>
				<div><input type="text" name="p_model" value="${vo.p_model }"size=80px style="height:25px"></div>
				<div class="div3">카테고리</div>
				<select name="p_category"> 
					<option value=1>전자기기</option>
					<option value=2>주방용품</option>
					<option value=3>옷/신발</option>
					<option value=4>기타</option>
				</select>
				<div class="div3">물건 한 줄 소개</div>
				<div><input type="text" name="p_title" value="${vo.p_title }" size=80px style="height:25px"></div>
				<div class="div3">물건 소개</div>
				<div>
				<textarea rows="5" name="p_content" maxlength="250" style="width:540px; height:112px" >${vo.p_content }" </textarea></div>
				<div class="div3">가격</div>
				<div><input type="number" name="p_price" value="${vo.p_price }" size=80px style="height:25px"></div>
				<div class="div3">시작 대여기간</div>
				<div><input type="date" name="p_start" value="${vo.p_start }"></div>
				<div class="div3">종료 대여기간</div>
				<div><input type="date" name="p_end" value="${vo.p_end }" ></div>
				<input type="hidden" name="p_num" value="${vo.p_num }">
			</form>
			<div class="uploadResult">이미지
				<div>
				</div>
				<span>X</span>	
			</div>
			<div style="text-align:center">
				<button id="btn1" type="button" data-oper="back">이전</button>
				<button id="btn2" type="button" data-oper="modify">저장</button>
			</div>
		</div>
</div>	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
 $(function(){
    
    $("#btn2").click(function() {
       alert("수정 하시겠습니까?");
    });
    
 });
	$(document).ready(function(){
			(function() {
				var p_num = '${vo.p_num}';
				console.log(1);

				$.getJSON("/jiyoung/getAttachList", {p_num : p_num}, function(arr){
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i,attach){
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" +
								 attach.uuid + "_" +
								 attach.fileName);
						
		        		 str += "<div data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'";
		        		 str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
		        		 str += "<img src='/display?fileName="+fileCallPath+"' class='img'></div></div>"
						
					});
					$(".uploadResult div").html(str);
				});
				
				// var uploadResult = $(".uploadResult div");	

					$(".uploadResult").on("click","span",function(){
			       	 var targetFile = $(this).data("file");
			       	 var targetDi = $(this).closest("div");
			       	 
			       	 $.ajax({
			       		 url : "/deleteFile",
			       		 data : {fileName : targetFile},
			       		 type : "post",
			       		 dataType : "text",
			       		 success : function(result){
			       			 alert(result);
			       			 targetDi.remove();
			       		 }
			       	  });
			        }); 

			})();
		});
		
		
		$(function(){
			var form = $("form");
			var p_num = '${vo.p_num}';
			
			$("button").on("click",function(e){
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				if(operation == 'back'){
					form.attr("action","/jiyoung/Etc_info");
					form.attr("method","get");
				}
				
				form.submit();
			});
			
		});
		
	</script>
<%@ include file="../include/footer2.jsp"%>
</div>