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
}
th{
	width : 100px;
	text-align: center;
	border-right: 1px solid black;
}
td{
	text-align: left;
	padding: 15px;
	
}
/*1인당금액  거래장소 링크url 크기*/
input[type="text"]{
	height: 25px;
	width: 300px;
}
input[type="date"]{
	height: 25px;
}
#s_link{
	width: 550px;

}


/*수정 버튼*/
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
/*삭제 버튼*/
.boardModBtn{
	background-color: rgb(224, 224, 224);
	border: none;
	height: 40px;
	width: 75px;
	font-size: 15px;
	border-radius: 5px;
	color: white;
	margin-top: 15px;
}
/*목록 버튼*/
.ListMoveBtn{
	background-color: rgb(94, 94, 94);
	border: none;
	height: 40px;
	width: 75px;
	font-size: 15px;
	border-radius: 5px;
	color: white;
	margin-top: 15px;
}
/*버튼중앙정렬*/
#joinback{
	text-align: center;
	margin-top: 0;
}

</style>
<div id="body-wrapper">
<h1 style="text-align: center; margin-bottom: 10px;" >신청서수정</h1>
<hr class="my-hr3">
	<form action="/seller/modify" method="post" id="operForm">
	<div id="body-content">
	<table id="getlist">
		<tr>
			<th>글제목</th>
			<td><input type="hidden" name="s_title" value="${vo.s_title }">${vo.s_title }</td>
		</tr>
		<tr>
			<th>글번호</th>
			<td><input type="hidden" name="s_num" value="${vo.s_num }">${vo.s_num }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="hidden" name="id" value="${vo.id}">${vo.id }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="hidden" name="s_day" value="${vo.s_day}">${vo.s_day }</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td><input type="hidden" name="s_category" value="${vo.s_category}">${vo.s_category }</td>
		</tr>
		<tr>
			<th>총인원수</th>
			<td><input type="hidden" name="s_person" value="${vo.s_person}">${vo.s_person }</td>
		</tr>
		<tr>
			<th>총금액</th>
			<td><input type="text" name="s_price" value="${vo.s_price }" id="s_price"></td>
		</tr>
		<tr>
			<th>거래장소</th>
			<td><input type="text" name="s_location" value="${vo.s_location }" id="s_location"></td>
		</tr>
		<tr>
			<th>링크URL</th>
			<td><input type="text" name="s_link" value="${vo.s_link }" id="s_link"></td>
		</tr>
		<tr>
			<th>공구기한</th>
			<td>
				<input type="date" name="s_startday" value="${vo.s_startday }" id="s_startday"> ~
				<input type="date" name="s_endday" value="${vo.s_endday }" id="s_endday">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="80" rows="10" name="s_contents" id="s_contents">${vo.s_contents }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" id="joinback">
					<button id="buyer" class="boardModBtn" type="submit" data-oper="modify">글 수정</button> <!--submit 데이터를 해당 경로로 보내라.  -->
					<button class="boardModBtn" type="submit" data-oper="remove">글 삭제</button>
					<button class="ListMoveBtn" type="submit" data-oper="list">목록</button>
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="keyword" value="${cri.keyword }">   .
					<input type="hidden" name="category" value="${cri.category }">
			</td>
		</tr>
	</table>		
	</div>
		</form>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	
$(function(){
	var operForm = $("#operForm");
	var bnoValue = '${vo.s_num}';
	
	$("button").on("click", function(e){	//onclick, click 같다
		e.preventDefault();
		
		var operation =$(this).data("oper"); 	// data-oper
		
		if(operation == 'remove'){
			operForm.attr("action","/seller/remove");
		}else if(operation =='list'){
			operForm.attr("action","/seller/list");
			operForm.attr("method","get");
			var pageNumTag =$("input[name='pageNum']").clone();	//clone 필요한 부분만 잠시복사해서 보관함.
			var amountTag = $("input[name='amount']").clone();
			operForm.empty(); // 내부비워주기
			
			operForm.append(pageNumTag);	//append 더해줌.
			operForm.append(amountTag);
			
			
		}else{
			var s_price = document.getElementById("s_price");
			var s_startday = $("#s_startday").val();
			var s_endday = $("#s_endday").val();
			var s_contents = document.getElementById("s_contents");
			var s_category = $('input[name=s_category]').is(":checked");
			
			if(s_price.value==''){
				alert("가격을 입력해주세요.")
				return;
			}
			if(s_location.value==''){
				alert("거래장소를 선택해주세요")
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
		}
		operForm.submit();
		
	});
	
	
	
});
</script>	
<%@ include file="../include/footer.jsp" %>    
</div>