<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
	.gg{
		width: 400px;
		height: 300px;
	}
	.div1{
		margin: auto; 
		margin-top:40px;
		width:800px;
	}
	.div2{
		float:right; 
		margin-top:30px; 
		width:350px; 
		height:510px; 
		border:1px solid silver;
	}
	.div3{
		text-align:center; 
		margin-top: 20px;
	}
	.div3-1{
		margin-left:10px;  
		margin-top: 20px; 
		font-size: medium;
	}
	.div3-2{
		width:280px; 
		height:60px; 
		margin-left:10px; 
		border: 1px solid silver; 
		margin-top:20px; 
		text-align:center;
	}
	.input1{
		font-size: small; 
		border: none;
	}
	.div3-3{
		margin-left:10px;
		margin-top:20px
	}
	.div3-4{
		font-size: small;
		margin-left:10px;
	}
	.info{
		margin-left:10px;
		margin-top:20px;
		margin-right:10px; 
		width: 320px; 
		height: 120px; 
		border: 1px solid silver;
	}
	.input2{
	 	margin-left:10px; 
	 	margin-top:15px;
	}
	#button{
		padding: 5px 115px; 
		font-size:small; 
		margin-left: 10px; 
		margin-top:20px
	}
	.div4{
		margin-left: 10px; 
		margin-top:20px
	}
	.div5{
		margin-left: 10px; 
		margin-top:20px; 
		float: left;
	}
	.div6{
		margin-left: 10px; 
		margin-right: 10px; 
		margin-top:20px; 
		text-align:right;
	}
	.div7{
		margin-bottom:10px; 
		margin-top: 20px; 
		font-weight: bold; 
		font-size: large;
	}
	#modify{
/*  		padding: 5px 30px; 
		font-size:small;  */
		margin-right: 10px; 
		
		background-color: rgb(94, 94, 94);
      	border: none;
      	height: 40px;
      	width: 175px;
      	font-size: 15px;
        border-radius: 5px;
        color: white;
        margin-top: 15px;
	}
	#remove{
/* 	 	padding: 5px 30px; 
	 	font-size:small; */
		
		background-color: rgb(52, 152, 219);
      	border: none;
      	height: 40px;
      	width: 175px;
      	font-size: 15px;
      	border-radius: 5px;
      	color: white;
      	margin-top: 15px;
	}
	.div8{
	 	margin: auto; 
	 	margin-top:50px;
	 	text-align:center; 
	 	width:800px;
	}
	.button_div{
		margin: auto; 
		margin-top:20px;
		width:800px;
	}
	button{
		background-color:transparent;
		border: none;
		cursor:pointer
	}
 	input[type="date"]::-webkit-calendar-picker-indicator,
 	input[type="date"]::-webkit-inner-spin-button {
    	 display: none;
     	 appearance: none;
 	}
 	#button{
 		background-color: rgb(52, 152, 219);
      	border: none;
      	height: 30px;
      	width: 300px;
      	/* font-size: ; */
      	border-radius: 5px;
      	color: white;
      	margin-top: 15px;
 	}
</style>
<div id="body-wrapper">
	<div id="body-content">

		<div class ="button_div"><button id="before">이전</button></div>
		<div class="div1">
			<div style="width:400px">
				<c:if test="${vo.payment == 'Y' }"><h1 style="float:right; margin-left: 10px;">[대여완료]</h1></c:if>
				<h1>${vo.p_title}</h1>
			</div>
			<c:if test="${vo.payment != 'Y' }">
			<!-- 예약하기 폼 -->
			<form action="/jiyoung/rent_info" method="post" id="myForm">
			<div class="div2">
			
			<div class="div3"><h4>대여하기</h4></div>
			
				<div class="div3-1"><input id="choice" type="radio" name="register" value="1"> 날짜 선택</div>
				
				<div class="table">
				<table class="div3-2">
				<tr style="font-size: small">
					<td>대여일</td>
					<td>반납일</td>
				</tr>
				<tr style="font-size: small">
					<td><input class="datepicker1" type="date" name="r_start" id="r_start" value="${vo.p_start }"></td>
					<td><input class="datepicker2" type="date" name="r_end" id="r_end" value="${vo.p_end }"></td>
				</tr>
				</table>
				</div>
				
				<div class="div3-3"><input id="choice2" type="radio" name="register" value="1"> 대여자 정보</div>
				<div class="info">
				<div class="div3-4">대여자<input class="input2" type="text" name="r_name" id="r_name" size=30px></div>
				<div class="div3-4">연락처<input class="input2" type="text" name="r_phone" id="r_phone" size=30px></div>
				<div class="div3-4">이메일<input class="input2" type="text" name="r_email" id="r_email" size=30px></div>
				</div>
				
				<button type="button" id="button" data-oper="register">대여하기</button>
				
				<div class="div4">₩ ${vo.p_price }<span id="total_date" style="font-size:small"></span></div>
				
				<hr style="margin-left: 10px; margin-right: 10px">
				
				<div class="div5">총 합계</div>
				<div class="div6">₩
					<span id="total_price" style="text-align:right;"> ${vo.p_price }</span>
				 </div>
				<input type="hidden" name="total_price" id="price" value="${vo.p_price }">
				<input type="hidden" name="p_num" value="${vo.p_num }">
			</div>
			</form>
			</c:if>
			<div class="uploadResult" style="margin-top: 30px">
				<div class="img">
				</div>	
			</div>
			<div class="div7">물건 소개</div>
			<div>${vo.p_content }</div>
		</div>
		<c:if test="${vo.payment != 'Y' }">
		<div class="div8">
			<button type="button" id="modify">수정하기</button>
			<button type="button" id="remove">삭제하기</button>
		</div>
		</c:if>
		
		<form action="/jiyoung/Electronic_info_update" method="get" id="actionForm">
			<input type="hidden" name="p_num" value="${vo.p_num }">
		</form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
	
		$('.datepicker1').datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : new Date('${vo.p_start }'),
			maxDate : new Date('${vo.p_end }'),
			onClose : function() {
				var start_date = $(this).val();
				$('.datepicker2').datepicker({
					dateFormat : 'yy-mm-dd',
					minDate : new Date(start_date),
					maxDate : new Date('${vo.p_end }')
				});
			}
		});
		


</script>
<script src="https://js.tosspayments.com/v1/payment"></script>  	
<script type="text/javascript">


function totalPrice(selVal){
    
    var f = document.getElementById("myForm");
    
    
    if(f.r_end.value == '' || f.r_start.value == ''){
       return;
    } 

    var ci = new Date(f.r_start.value);
    var co = new Date(f.r_end.value);
    
    var rentProduct = co-ci;
    
    if(rentProduct < 0){
       f.r_end.value == '';
       f.r_start.value == '';
       alert("대여 날짜가 반납 날짜보다 빠릅니다.");
       return;
    }
    
    rentProduct = rentProduct / 1000 / 60 / 60 / 24;  
        
    var price = ${vo.p_price};
   
    var total_price = price * rentProduct;
    
    var total_date = ' x '+ rentProduct +'일';
    
    $("#total_date").html(total_date);
    $("#total_price").html(total_price);   
    $("#price").val(total_price);   
 }
 
 $(function(){
    $("input[type=date]").change(function() {
       totalPrice();
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
	        		 str += "<img src='/display?fileName="+fileCallPath+"' class='gg' ></div></div>"
    				
    			});
    			$(".uploadResult div").html(str);
			});
		})();
	});

		
		$(function(){
			var form = $("#actionForm");
			
			$("#remove").on("click",function(e){
				e.preventDefault();
				
				form.append('<input type="hidden" name="p_num" value="'+${vo.p_num }+'">');
				form.attr("action","/jiyoung/remove"); 
				form.attr("method","post");

				alert("삭제 하시겠습니까?");
				form.submit();
			});
			
			$("#modify").on("click",function(){
				form.submit();
			});
			
	});
		
		$(".table").hide();
		$("#choice").on("click",function(){
			
			var f = document.getElementById("myForm");
			
			if(f.register.value=='1'){
				$(".table").show();
			}
		});
	
		$(".info").hide();
		$("#choice2").on("click",function(){
			
			var f = document.getElementById("myForm");
			
			if(f.register.value=='1'){
				
				$(".info").show();
			}
		});		
 		
		var form = $("#myForm");
		$("#button").on("click", function(e){
			e.preventDefault();	
			
		    var f = document.getElementById("myForm");
		    
		    if(f.r_end.value == '' || f.r_start.value == '' || f.r_name.value == ''
		    		|| f.r_phone.value == '' || f.r_email.value == '' ){
		    	alert("대여자 정보를 모두 입력하세요!!");
		       return;
		    } 
		    
			var operation = $(this).data("oper");
			
			if(operation == 'register'){
				form.attr("action","/jiyoung/rent_info");
				form.attr("method","post"); 
		
			}
				form.submit();	
		}); 

		
		$("#before").on("click",function(e){
			e.preventDefault();
			history.go(-1);
		});
		
</script>
<%@ include file="../include/footer3.jsp"%>
</div>