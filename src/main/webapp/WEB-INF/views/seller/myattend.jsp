<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/*게시글 테이블 디자인*/
table{
	margin : auto;
	border-collapse: collapse;
	border-top: 1px solid black;
	width: 66%;
}
th{
	width : 100px;
	text-align: center;
	border-bottom: 1px solid black;
	padding: 15px;
}
td{
	text-align: center;
	padding: 25px;
	border-bottom: 1px solid black;
}
/*a태그*/
a {
  		text-decoration: none;
 		color: black;
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
	
	#name_input{
		border-radius: 15px;
	}
	
	button{
		background: white;
		border : none;
	}
	.category{
	  font-family: 'NanumSquareNeo-Variable';
	}
	/*페이징 -------------------------------------------- */
	.page_wrap {
	   text-align: center;
	   font-size: 0;
	   margin: 15px;
	}
	
	.page_nation {
	   display: inline-block;
	}
	
	.page_nation .none {
	   display: none;
	}
	
	.page_nation a {
	   display: block;
	   margin: 0 3px;
	   float: left;
	   border: 1px solid #e6e6e6;
	   width: 28px;
	   height: 28px;
	   line-height: 28px;
	   text-align: center;
	   background-color: #fff;
	   font-size: 13px;
	   text-decoration: none;
	}
	
	.page_nation .arrow {
	   border: 1px solid #ccc;
	}
	
	.page_nation a.active {
	   background-color: rgb(57, 186, 228);
	   color: #fff;
	   border: rgb(255, 255, 255);
	}
	
</style>
<div id="body-wrapper">
	<div id="body-content">
	<h2 style="text-align: center; margin-bottom: 10px;">내참가서확인</h2>
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
	  <table>
      <thead>
        <tr>
          <th>공구제목</th>
          <th>NO.</th>
          <th>참가날짜</th>
          <th>입금방법</th>
          <th>전화번호</th>
          <th>희망지역</th>
          <th>내용</th>
        </tr>
      </thead>
      <tbody>
   		<c:forEach var="board" items="${list }">
		<tr>
		<td><c:out value="${board.s_title}"/></td>
		<td>
		<a class="move" href="/seller/attendmodify?b_num=${board.b_num }" onclick="window.open(this.href, '_blank', 'width=500, height=550'); return false;" title="수정,삭제가 가능한상세페이지로 이동합니다.">
		<c:out value="${board.b_num}"/></a>
		</td>
		<td><c:out value="${board.b_day}"/></td>
		<td><c:out value="${board.b_money}"/></td>
		<td><c:out value="${board.phone}"/></td>
		<td><c:out value="${board.b_location}"/></td>
		<td><c:out value="${board.b_equests}"/></td>
		</tr>
		</c:forEach>
      </tbody>
    </table>
    
   <!-- page -->
      <div class="page_wrap">
         <div class="page_nation">
            <c:if test="${pageMaker.prev }">
               <a class="paginate_button previous" href="${pageMaker.startPage-1 }">&lt;</a>
            </c:if>
            <c:forEach var="page" begin="${pageMaker.startPage}" end="${pageMaker.endPage }" step="1">
               <a class="paginate_button ${pageMaker.cri.pageNum==page ? 'active' : '' }"
                  href="${page}">${page }</a>
            </c:forEach>
            <c:if test="${pageMaker.next }">
               <a class="paginate_button" href="${pageMaker.endPage+1 }">&gt;</a>
            </c:if>
         </div>
      </div>
				
		<form action="/seller/myinsert" method="post" id="sactionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="id" value="${id }">
		</form>
		
</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	
$(function(){
	
	var sactionForm = $("#sactionForm");	// 데이터 전송을 위한 form 태그
	//----------------검색페이징---------------
	$(".paginate_button").click(function(e){
		e.preventDefault();
		sactionForm.attr("action","/seller/myattend"); 
		sactionForm.find("input[name='pageNum']").val($(this).attr('href'));
		sactionForm.submit();
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
	})
	
	
	

/*왼쪽 목록 내림올림*/
$(".main").click(function(){
    if($(".sub").is(":visible")){
        $(".sub").slideUp();
    }
    else{
        $(".sub").slideDown();
    }
});
	
});	
	
	
	
</script>
<%@ include file="../include/footer2.jsp" %>    
</div>