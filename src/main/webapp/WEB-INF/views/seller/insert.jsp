<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/*게시글 테이블 디자인*/
#getlist{
	margin : auto;
	border-collapse: collapse;
	margin-left: 700px;
}
th{
	text-align: center;
}
td{
	text-align: left;
	padding: 17px;
	width: 100px;
}

/*전송 버튼*/
#buyer{
	background-color: rgb(52, 152, 219);
	border: none;
	height: 40px;
	width: 75px;
	font-size: 15px;
	border-radius: 5px;
	color: white;
	margin-top: 15px;
}
/*목록 버튼*/
#list{
	background-color: rgb(224, 224, 224);
	border: none;
	height: 40px;
	width: 75px;
	font-size: 15px;
	border-radius: 5px;
	color: white;
	margin-top: 15px;
}
#joinback{
	text-align: center;
}
/* 왼쪽 내 목록 카테고리 */
	#box{
 	 position : fixed;
 	 display : inline-block;
	width: 150px;  /*가로길이*/
	left: 50px;      /*위치 지정 : 오른쪽에서 몇 px에 위치, 왼쪽 배너이면 left : 2px; */
	top : 60%;     /* 위치 지정 : 상단에서 몇 px에 위치, 하단부터라면 bottom:48px; */
	text-align:center;  /*중앙정렬*/
	 text-decoration: none;
	 list-style:none;
	}
	#box:hover{
		cursor: pointer;
	}
	.main{
		list-style:none;	
	}
	.sub{
		list-style:none;	
	}
	/* 제목,사람수,카테고리,가격,위치,링크 박스부분 */
	#s_title,#s_person,#s_category,#s_price,#s_location,#s_link{
		width: 250px;
		height: 30px;
		border : 1px solid #ccc;
		border-radius: 5px;
	}
	/*내용 부분  */	
	textarea{
		border : 1px solid #ccc;
		border-radius: 5px;
	}
	/* 시작일,종료일 */
	#s_startday,#s_endday{
		border : 1px solid #ccc;
		border-radius: 5px;
		height: 30px;
	}
	/* 지도 위치 선택 버튼  */
	#locationbtn{
		border : 1px solid #ccc;
		border-radius: 5px;
		height: 30px;
		width: 40px;
	}

</style>

	<div id="body-wrapper">
	<div id="body-content">
	<h2 style="text-align: center; margin-bottom: 10px;">공동구매신청서</h2>
	<hr class="my-hr3">

	<!-- 왼쪽 내목록 카테고리 -->
	  <div id="box"> 
	      <ul>
	         <li class="main"><img alt="" src="<spring:url value='/resources/image/slist.png'/>" style="width: 20px;">내목록
	            <ul class="sub" style="display:none">
	               <li><a id="myinsert">내신청서목록</a></li>
	               <li><a id="myattend">내참가서확인</a></li>
	         	</ul>
	       </li>
	     </ul>
	  </div>
	  
	<form action="/seller/insert" method="post" role="form">
			<table id="getlist">
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
						<select name="s_category" id="s_category">
						<option  value="전자제품" id="s_category">전자제품</option>
						<option  value="식품" id="s_category">식품</option>
						<option value="생활용품" id="s_category">생활용품</option>
						<option  value="뷰티/미용" id="s_category">뷰티/미용</option>
						<option  value="운동/건강" id="s_category">운동/건강</option>
						<option  value="기타" id="s_category">기타</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>글제목</th>
						<td><input type="text" name="s_title" size="80" id="s_title" placeholder="제목을입력하세요" ></td>
					</tr>
					<tr>
						<th>총인원수</th>
						<td><input type="number" name="s_person" id="s_person"></td>
					</tr>
					<tr>
						<th>총금액</th>
						<td><input type="text" name="s_price" maxlength="10" size="80"  id="s_price" onkeyup="inputNumberFormat(this);" placeholder="100원~500,000원 사이만 입력가능합니다." /></td>
					</tr>
					<tr>
						<th>거래장소</th>
						<td>
						 <input type="text" name="s_location" size="80" id="s_location" readonly="readonly" value="${location }">
						 <input type="button" value="선택" onclick="openChild()" id="locationbtn">
						</td>
					</tr>
					<tr>
						<th>링크URL(선택)</th>
						<td><input type="text" name="s_link" size="80" id="s_link"></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="date" name="s_startday" id="s_startday"></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td><input type="date" name="s_endday" id="s_endday"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="50" name="s_contents" placeholder="내용을 입력하세요" id="s_contents"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="joinback">
							<button id="buyer" data-oper="insert">전송</button> 
							<button id="list" data-oper="list">취소</button>
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="id" value="${id }">
						</td>
					</tr>
				</tbody>			
			</table>
		</form>
		
		<form action="/seller/myinsert" method="post" id="sactionForm">
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="id" value="${id }">
		</form>
	
	</div>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var openWin;

	 function openChild() {
         // window.name = "부모창 이름"; 
         window.name = "parentForm";
         
         // window.open("open할 window", "자식창 이름", "팝업창 옵션");
         openWin = window.open("location", "childForm", "width=505, height=400, resizable = no, scrollbars = no");    
     }

     function setChildText(){
         openWin.document.getElementById("s_location").value = document.getElementById("centerAddr").value;
     }



	$(function(){
			var formObj = $("form[role=form]");
			var amount = "${cri.amount}";
			var pageNum = "${cri.pageNum}";
			var sactionForm = $("#sactionForm");
			var now_utc = Date.now()
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("s_startday").setAttribute("min", today);
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("s_endday").setAttribute("min", today);
			
			
			
			
			//***버튼 클릭 스크립트***
			$("button").click(function(e){
				e.preventDefault(); //기본 이벤트 삭제
				
				var oper = $(this).data("oper");
				var str = '';
				var s_title = document.getElementById("s_title");
		        var s_person = document.getElementById("s_person");
		        var s_price = document.getElementById("s_price");
		        var s_location = document.getElementById("s_location");
		        var s_startday = $("#s_startday").val();
		        var s_endday = $("#s_endday").val();
		        var s_contents = document.getElementById("s_contents");
		        

				
				if(oper=="list"){
					location.href = '/seller/list?pageNum='+pageNum+'&amount='+amount;
				}else{
		               if(s_title.value==''){
		                  alert("제목을 입력해주세요.")
		                  return;
		               }
		               if(s_person.value==''){
		                  alert("인원수를 숫자로 입력해주세요")
		                  return;
		               }
		               if(s_person.value<=1 || s_person.value>4){
			                  alert("인원수를 2명이상 4명 이하로 입력해주세요")
			                  return;
			           }
		               if(s_price.value==''){
			                  alert("금액을 입력해주세요.")
			                  return;
			           }
		               if(s_price.value<=100||s_price.value>500000){
			                alert("금액을 100원~500,000원 이내로 입력해주세요.")
			                return;
			           }
		               if(s_location.value==''){
		                  alert("거래지역을 선택해주세요")
		                  return;
		               }
		               if(s_startday==''){
		                  alert("시작일을 선택해주세요")
		                  return;
		               }
		               if(s_endday==''){
		                  alert("종료일을 선택해주세요")
		                  return;
		               }
		               if(s_startday>s_endday){
		                     alert("종료일이 시작일보다 빠를수없습니다.")
		                     return;
		               }
		               if(s_contents.value==''){
		                  alert("내용을 입력해주세요.")
		                  return;
		               }
		               
					
					//게시글 등록
					console.log("submit clicked");	
					formObj.append(str);
					formObj.submit();
				}
			});
			
			/*내목록이동*/
			$("#myinsert").click(function(e){
				e.preventDefault();	
				sactionForm.attr("action","/seller/myinsert")
				sactionForm.submit();
			});
			
			/*내참가서이동*/
			$("#myattend").click(function(e){
				e.preventDefault();
				sactionForm.attr("action","/seller/myattend")
				sactionForm.submit();
			});
			
			/*카테고리 버튼 효과*/
			 $(".main").click(function(){
		               if($(".sub").is(":visible")){
		                   $(".sub").slideUp();
		               }
		               else{
		                   $(".sub").slideDown();
		               }
		           }) 
		           
		           
});		
</script>	

<%@ include file="../include/footer.jsp" %>    
</div>