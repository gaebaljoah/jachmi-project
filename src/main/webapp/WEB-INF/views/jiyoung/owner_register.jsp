<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
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
	.div1-2{
		margin-bottom:10px; 
		font-weight: bold;
	}
	.div1-3{
	 	margin-bottom:10px; 
	 	margin-top: 20px; 
	 	font-weight: bold;
	}
	input{
		height:25px;
	}
	#btn1{
/* 		padding: 10px 100px; 
		font-size:small;  */
		margin-right: 10px;
		
      	background-color: rgb(94, 94, 94);
      	border: none;
      	height: 40px;
      	width: 75px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
	}
	#btn2{
/* 		padding: 10px 100px; 
		font-size:small; */
		
		background-color: rgb(52, 152, 219);
      	border: none;
      	height: 40px;
      	width: 75px;
      	font-size: 15px;
      	border-radius: 5px;
      	color: white;
      	margin-top: 15px;
	}
	button{
		background-color:transparent;
		border: none;
		cursor:pointer
	}
</style>
  <!-- 본문시작 -->
<div id="body-wrapper">
	<div id="body-content">
		<div class="div1">
			<div>
				<h2>물건 정보를 입력하세요.</h2>
			</div>
			<div class="div1-1">
				<hr size=8px>
			</div>
			<form action="/jiyoung/owner_register" method="post" role="form" id="form">
				<div class="div1-2">모델명</div>
				<div><input type="text" id="p_model" name="p_model" size=80px></div>
				<div class="div1-3">카테고리</div>
				<select name="p_category" id="p_category"> 
					<option value=1>전자기기</option>
					<option value=2>주방용품</option>
					<option value=3>기타</option>
				</select>
				<div class="div1-3">지역선택</div>
				<select name="region" id="region"> 
					<option value="서울특별시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
					<option value="강원도">강원도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="제주특별자치도">제주특별자치도</option>
				</select>
				<div class="div1-3">물건 한 줄 소개</div>
				<div><input type="text" id="p_title" name="p_title" size=80px ></div>
				<div class="div1-3">물건 소개</div>
				<div><textarea rows="5" id="p_content" name="p_content" maxlength="250" style="width:540px; height:112px" ></textarea></div>
				<div class="div1-3">가격</div>
				<div><input type="number" id="p_price" name="p_price" size=80px> 원</div>
				<div class="div1-3">시작 대여기간</div>
				<div><input type="date" id="p_start" name="p_start"></div>
				<div class="div1-3">종료 대여기간</div>
				<div><input type="date" id="p_end" name="p_end"></div>
			</form>
			<div class="div1-3">이미지 등록</div>
				<div><input type="file" name="uploadFile" multiple="multiple" id="gdsImg"></div>
				<div class="select_img" style="margin-top:20px"><img src="" /></div>
			<div style="text-align:center">
				<button id="btn1" type="button" data-oper="back">이전</button>
				<button id="btn2" type="button" data-oper="register">저장</button>
			</div>
		</div>
		<!-- 첨부파일 -->
		<div class="uploadResult">
			<ul></ul>
		</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function check(){
    var f = document.getElementById("form");
    
    if(f.p_end.value == '' || f.p_start.value == ''){
        return;
     } 
    
    var ci = new Date(f.p_start.value);
    var co = new Date(f.p_end.value);
    
    var date = co-ci;
    
    if(date < 0){
       f.p_end.value == '';
       f.p_start.value == '';
       alert("날짜 선택을 다시 해주세요.");
       return;
    }

} 
			
 			$("#gdsImg").change(function(){
			     if(this.files && this.files[0]) {
				      var reader = new FileReader;
				      reader.onload = function(data) {
				       $(".select_img img").attr("src", data.target.result).width(500);          
				      }
				      reader.readAsDataURL(this.files[0]);
			     }
			 });

			 	
		$(function(){
			var form = $("form");
			$("#btn2").on("click",function(e){
				e.preventDefault();
				
			 	var operation = $(this).data("oper");
				
    			console.log("submit clicked");
    			
    			var str = '';
    			
    			$(".uploadResult ul li").each(function(i,obj){
    				var jobj = $(obj);
    				console.log(jobj);
    				console.log(obj);
    				str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'">';
    				str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'">';
    				str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'">';
    			});
    			

	   			var f = document.getElementById("form");
	   			var f2 = document.getElementById("#gsdImg");
    		    if(f.p_model.value == '' || f.p_category.value == '' || f.p_category.value == ''|| 
    		    		f.p_title.value == '' || f.p_content.value == '' || f.p_price.value == '' ||
    		    		f.p_start.value == '' || f.p_end.value == ''){
    		    	alert("내용을 모두 입력해주세요");
    		       return;
    		    }/* else if(f2.uploadFile.value == ''){
    		    	alert("내용을 모두 입력해주세요");
    		    	return;
    		    }  */

     			form.append(str);
 				form.submit();
			});
			
			
			 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	         var maxSize = 5242880;      // 5MB
	         
	         function checkExtension(fileName, fileSize) {
	            if (fileSize >= maxSize) {
	               alert("파일 사이즈 초과");
	               return false;
	            }
	            if (regex.test(fileName)) {
	               alert("해당 종류의 파일은 업로드 할 수 없습니다");
	               return false;
	            }
	            return true;
	         }   // end CheckExtension();
	         
	         $("input[type='file']").change(function() {
	            var formData = new FormData();         // 스크립트에서 Form 태그 생성
	            var inputFile = $("input[name='uploadFile']");
	            var files = inputFile[0].files;
	   
	            for(var i=0; i<files.length; i++){
	               
	               if (!checkExtension(files[i].name, files[i].size)) {
	                  return false;
	               }
	               formData.append("uploadFile", files[i]);
	            }
	            $.ajax({
	               url : '/uploadAjaxAction',
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
	         function showUploadFile(uploadResultArr){
	        	 var str='';
	        	 
	        	 for(var i=0; i<uploadResultArr.length; i++){
	        		 var obj = uploadResultArr[i];
	        		 
	        		 var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +
	        				 								obj.uuid + "_" +
	        				 								obj.fileName);
	        		 str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';
	        		 str += '<a href="/download?fileName=' +fileCallPath+'">';
	        		 str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
	        		 str += '</a>';
	        		 str += '<span data-file="'+fileCallPath+'"> X </span>';
	        		 str += '</li>';
	        	 }
	        	 uploadResult.html(str);
	         }
	         
	         /*
	         uploadResult.on("click","span",function(){
	        	 var targetFile = $(this).data("file");
	        	 
	        	 $.ajax({
	        		 url : "/deleteFile",
	        		 data : {fileName : targetFile},
	        		 type : "post",
	        		 dataType : "text",
	        		 success : function(result){
	        			 alert(result);
	        		 }
	        	 });
	         });  
	         */
			
		});
		
			var form = $("form");
			$("#btn1").on("click",function(e){
				e.preventDefault();
				
			 	var operation = $(this).data("oper");
				
    			if(operation == 'back'){
    				form.attr("action","/jiyoung/rent_main");
    				form.attr("method","get"); 
    			}
 				form.submit();
			});

</script>
<%@ include file="../include/footer2.jsp"%>
</div>
