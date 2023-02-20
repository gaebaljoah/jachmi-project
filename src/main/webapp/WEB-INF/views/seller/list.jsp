<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %> 
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Chosunilbo_myungjo';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	a {
  		text-decoration: none;
 		color: black;
	}
	#number:visited{
		color:	aqua;
	}
/*  본문 */
	/* 카테고리디자인  */
   #category{
   	list-style:none;
   	margin: auto;
   	text-align: center;
   	margin-top: 10px;
   }
   #cate{
   display : inline-block;
   	width: 100px;
   	padding-left: 15px;
   }
   #test12{
   	float: left;
   	width: 100px;
   }
 	/* 테이블디자인 */
	  table {
	    width: 65%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
	    text-align: center;
	    margin: auto; 
	    margin-top: 15px;
	    table-layout: fixed;
	  }
	  th, td {
	    border-bottom: 1px solid #444444;
	    padding-bottom: 10px;
	    padding-top: 10px;
	  }
	
	/* 게시물작성 */
	#writer{
		list-style:none;
   		text-align: center;
   		margin-top: 30px;
   		margin-right: 1200px;
	}
	
	/* 게시물작성버튼 */
	#regBtn{
		margin-left: 350px;
		background-color: transparent;
		border:none;
	}
	/* 게시물작성버튼 효과*/
	#regBtn:hover{
		cursor: pointer;
	}
	/*카테고리 버튼*/
	.category{
		border:none;
		background-color: white;
	}
	/*카테고리버튼 효과*/
	.category:hover {
		cursor: pointer;
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
	/*같이사요제목 */
	h1,.categroy{
	  font-family: 'NanumSquareNeo-Variable';
	}
	
 	/* 검색창 위치 */
    .search_wrap {
        margin-left: 68%;
   }
   /*검색창 div  */
   .search_area{
   height: 30px;
   width: 250px;
   border: 4px solid black;
   background: white;
   border-radius:10px;
   
   }
   /*검색창 input*/
   #name_input{
      font-size: 16px;
      width: 200px;
      border: 0px;
      border-radius:10px;
      outline: none;
      float: left;      
      padding: 5px;
      padding-bottom: 0;
   }
   
   #search_button{
      width: 30px;
      height: 100%;
      border: 0px;
      outline: none;
      float: right;
      background-color: white;
      color: black;
   }
   *{
   font-family: 'NanumSquareNeo-Variable';
   }
  thead{
   	background-color: #D4F4FA;
   	}
	/*카테고리 클릭했을경우 색깔변경*/
	#click{
	color: #00a8f3;
	text-decoration: underline;
	font-weight: bold;
	}
	
	/*페이징  */
.page_wrap {
   text-align: center;
   font-size: 0;
}

.page_nation {
   display: inline-block;
   margin-top: 15px;
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

   <!-- 본문시작 -->
	<div id="body-wrapper">
	<div id="body-content">
	
<h1 style="text-align: center; margin-bottom: 10px;" >같이사요</h1>
<hr class="my-hr3">
	
	
	 <c:choose>
	<c:when test="${empty signIn }">
	 <h1 style="text-align: center; margin: auto; font-family: 'Chosunilbo_myungjo';">게시글 조회권한이없습니다. <br>(로그인을 해주시길 바랍니다.)</h1>
	
	</c:when>
	<c:when test="${!empty signIn }">
	<!--검색창  -->
    <div class="search_wrap">
        <div class="search_area">
            <input id="name_input" type="text" name="keyword" placeholder="검색어를입력해주세요." value="${pageMaker.cri.keyword }">
            <button id="search_button"><img alt="" src="<spring:url value='/resources/image/search2.png'/>" width="30px;"></button>
        </div>
    </div> 

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
	  
	<ul id="category">
		<li id="cate"><button class="category" name="category" value="전자제품" id="${pageMaker.cri.category eq '전자제품'?'click':''}"><div id="test12"><img alt="" src="<spring:url value='/resources/image/Electronic products.png'/>" style="width: 90px"></div>전자제품</button></li>
		<li id="cate"><button class="category"  name="category" value="식품" id="${pageMaker.cri.category eq '식품'?'click':''}"><div  id="test12" ><img alt="" src="<spring:url value='/resources/image/food.png'/>" style="width: 90px"></div>식품</button></li>
		<li id="cate"><button class="category"  name="category" value="생활용품" id="${pageMaker.cri.category eq '생활용품'?'click':''}"><div id="test12"><img alt="" src="<spring:url value='/resources/image/Household goods.png'/>" style="width: 90px"></div>생활용품</button></li>
		<li id="cate"><button class="category"  name="category" value="뷰티/미용" id="${pageMaker.cri.category eq '뷰티/미용'?'click':''}"><div id="test12"><img alt="" src="<spring:url value='/resources/image/beauty.png'/>" style="width: 90px"></div>뷰티/미용</button></li>
		<li id="cate"><button class="category"  name="category" value="건강/운동"id="${pageMaker.cri.category eq '건강/운동'?'click':''}"><div id="test12"><img alt="" src="<spring:url value='/resources/image/health.png'/>" style="width: 90px"></div>건강/운동</button></li>
		<li id="cate"><button class="category"  name="category" value="기타" id="${pageMaker.cri.category eq '기타'?'click':''}"><div id="test12"><img alt="" src="<spring:url value='/resources/image/etc.png'/>" style="width: 90px"></div>기타</button></li>
	</ul>
	
	<div id="table">
	  <table>
      <thead>
        <tr>
          <th style="width: 30px;">NO.</th>
          <th style="width: 300px;">제목</th>
          <th style="width: 150px;">지역</th>
          <th style="width: 50px;">모집현황</th>
          <th style="width: 100px;">금액(인당)</th>
          <th style="width: 80px;">참여자/모집인원</th>
          <th style="width: 150px;">공구기한</th>
        </tr>
      </thead>
      <tbody>
    		<c:set var="today" value="<%=new Date(new Date().getTime() - 60*60*24*1000*1)%>" />
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
    		<c:forEach var="board" items="${list }" >
    		<fmt:formatNumber value="${Math.round(board.s_price/board.s_person)}" pattern="#,###,###" var="s_price"/>
			<tr>
			<td><c:out value="${board.s_num}"/></td>
			<td>
			<a class="move" href="${board.s_num}">
			<c:out value="${board.s_title}"/></a>
			</td>
			<td><c:out value="${board.s_location}"/></td>
			<td>
			<c:choose>
			<c:when test="${today > board.s_endday}">
				날짜마감
			</c:when>
			<c:when test="${board.replyCnt < board.s_person}">
				모집중
			</c:when>
			<c:when test="${board.s_person == board.replyCnt}">
				모집완료
			</c:when>
			</c:choose>
			<td>${s_price}</td>
			<td><c:out value="${board.replyCnt}"/>/<c:out value="${board.s_person}"/></td>
			<c:choose>
			<c:when test="${today > board.s_endday}">
				<td style="text-decoration: line-through"><c:out value="${board.s_startday}"/>~<c:out value="${board.s_endday}"/></td>
			</c:when>
			<c:when test="${today <  board.s_endday}">
				<td><c:out value="${board.s_startday}"/>~<c:out value="${board.s_endday}"/></td>
			</c:when>
			</c:choose>
			
			</tr>
			</c:forEach>
		
      </tbody>
      </table>
	</div>
	
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
				
						
						
				<form action="/seller/list" method="get" id="sactionForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
						
				<form action="/seller/list" method="get" id="keywordForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				</form>
				
				<form action="/seller/list" method="post" id="idForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="id" value="${id }">
				</form>
				
				
				<form action="/seller/list" method="get" id="cateForm">
					  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
					  <input type="hidden" name="category" value="${pageMaker.cri.category }">
				</form>
				
				
	
	<!--왼쪽 목록부분  -->			
	
	<button id="regBtn">	
	<ul>
	<li id="cate"><img  class="writerimg" src="<spring:url value='/resources/image/chat.png'/>" style="width: 90px">게시물작성</li>
	</ul>
	</button>
	
	
	</c:when>
	</c:choose>
	</div>
	   
	 <!-- 본문끝 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// ---- 새 게시글 등록 버튼----
			$("#regBtn").click(function(){
				
				
				location.href='/seller/insert?pageNum='+${pageMaker.cri.pageNum }+'&amount='+${pageMaker.cri.amount };
			});
			
			var sactionForm = $("#sactionForm");	// 데이터 전송을 위한 form 태그
			var category = $(this).val;
			var cateForm = $("#cateForm");	//카테고리검색을위한폼
			var idForm = $("#idForm"); // id 를 던져주기위한폼
			var keywordForm = $("#keywordForm");	// 데이터 전송을 위한 form 태그
			
			
			// ----상세 보기 페이지 이동 클릭 이벤트 ----
			$(".move").click(function(e){ 	//매개변수 이벤트 e 
				//<a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
				e.preventDefault();	// 기본 href 경로 이동 방지
				sactionForm.attr("action","/seller/get"); 	//attr 속성 (action="/board/list"의미)
				
				 var str = '';
				str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">';
				str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">';
				str += '<input type="hidden" name="s_num" value="'+$(this).attr("href")+'">';
				sactionForm.html(str); 	//attr의 href의 속성을가져옴
				//.append 덮어쓰기라서 ex)bno=3&bno=9... 늘어남  
				sactionForm.submit();
			
			});
			
			/*내목록이동*/
			$("#myinsert").click(function(e){
				e.preventDefault();	
				idForm.attr("action","/seller/myinsert")
				idForm.submit();
			});
			
			/*내참가서이동*/
			$("#myattend").click(function(e){
				e.preventDefault();
				idForm.attr("action","/seller/myattend")
				idForm.submit();
			});
			
			//---------------페이징------------------------------
			$(".paginate_button").click(function(e){
				e.preventDefault();
				sactionForm.attr("action","/seller/list"); 
				sactionForm.find("input[name='pageNum']").val($(this).attr('href'));
				sactionForm.submit();
			});

			//------------------검색버튼눌렀을경우 ------------------------------
			 $(".search_area button").on("click", function(e){
			        e.preventDefault();
			        let val = $("input[name='keyword']").val();
			        keywordForm.find("input[name='keyword']").val(val);
			        keywordForm.find("input[name='pageNum']").val(1);
			        keywordForm.submit();
			 });
			//----------------검색페이징---------------------------------------------
			$(".paginate_button").click(function(e){
				e.preventDefault();
				keywordForm.attr("action","/seller/list"); 
				keywordForm.find("input[name='pageNum']").val($(this).attr('href'));
				keywordForm.submit();
			});
			
			//----------------카테고리페이징---------------------------------------------
			$(".paginate_button").click(function(e){
				e.preventDefault();
				cateForm.attr("action","/seller/list"); 
				cateForm.find("input[name='pageNum']").val($(this).attr('href'));
				cateForm.submit();
			});
			
			
			  //----------------카테고리별 버튼-------------------------------------------
	  	  	  $(".category").click(function(e){
			        e.preventDefault();
			        var val = $(this).val();
			        cateForm.find("input[name='category']").val(val);
			        cateForm.find("input[name='pageNum']").val(1);
			        console.log(val);
			        cateForm.submit();
			    });
	  	  	
			 
			
		});
		
		
		// 결과창 출력을 위한 코드
		var result= '<c:out value="${result}"/>';
		// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터 변경) 알림 메소드 실행
		if(result != ''){
			checkResult(result);
		}
		// 뒤로 가기 할 때 문제가 될 수 있으므로,
		// history 객체를 조작({정보를 담은 객체}, 뒤로 가기 버튼 문자열 형태의 제목, 바꿀 url)
		history.replaceState({}, null, null);
		function checkResult(result){
			if(result===''|| history.state){	//뒤로가기 방지
				return;
			}
			if(result === 'sucess'){	// 수정 및 삭제
				alert("수정되었습니다.");
			}
			if(result === 'delete'){	// 수정 및 삭제
				alert("삭제되었습니다.");
			}
			
			if(result==='ok'){	// 삽입 
				alert("게시글이 등록되었습니다.");
			}
		}
		/*왼쪽 내목록 슬라이스css*/
		 $(".main").click(function(){
               if($(".sub").is(":visible")){
                   $(".sub").slideUp();
               }
               else{
                   $(".sub").slideDown();
               }
           })
		
</script>
	
	

   <!-- 본문끝 -->

<%@ include file="../include/footer2.jsp" %>    
</div>