<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %> 
<style>
	/* 게시물리스트 중앙정렬*/
	#list{
		text-align: center;
		margin: auto;
	}
	/*게시글 테이블 디자인*/
	#getlist{
		margin : auto;
		border-collapse: collapse;
		
	}
	#title{
		width : 100px;
		text-align: center;
		border-right: 1px solid black;
	}
	#contenct{
		text-align: left;
		padding: 20px;
	}
	
	/*참여자 테이블 디자인*/
	/*게시물신고*/
	#declaration{
		background-color: white;
		color: gray;
		text-align: center;
		margin: auto;
		display:block;
		margin-left: 1500px;
		border: none;
	}
	
	/*제목*/
	h2{
		text-align: center;
	}
	#getbtn{
		text-align: center;
	
	}

	/*참가하기 버튼*/
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
</style>

	<h2 style="text-align: center; margin-bottom: 10px;">같이사요</h2>
<hr class="my-hr3">

<div id="body-wrapper">
	<div id="body-content">
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
	<h2>${vo.s_title }</h2>
	<c:set var="today" value="<%=new Date(new Date().getTime() - 60*60*24*1000*1)%>"/>
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
	<button id="declaration">게시물신고<img alt="" src="<spring:url value='/resources/image/Declaration.png'/>" style="width: 20px; height: 20px;"></button>
	<table id="getlist">
		<tr>
			<td id="title">글번호</td>
			<td id="contenct">${vo.s_num }</td>
		</tr>
		<tr>
			<td id="title">아이디</td>
			<td id="contenct">${vo.id }</td>
		</tr>
		<tr>
			<td id="title">작성일</td>
			<td id="contenct">${vo.s_day }</td>
		</tr>
		<tr>
			<td id="title">총인원수</td>
			<td id="contenct">${vo.s_person }</td>
		</tr>
		<tr>
			<td id="title">카테고리</td>
			<td id="contenct">${vo.s_category }</td>
		</tr>
		<tr>
			<td id="title">1인당금액</td>
			<td id="contenct"><fmt:formatNumber value="${Math.round(vo.s_price/vo.s_person)}" pattern="#,###,###"/></td>
		</tr>
		<tr>
			<td id="title">링크URL</td>
			<td id="contenct"><a href=${vo.s_link }>${vo.s_link }</a></td>
		</tr>
		<tr>
			<td id="title">공구기한</td>
			<td id="contenct">${vo.s_startday } ~${vo.s_endday }</td>
		</tr>
		<tr>
			<td id="title">거래장소</td>
			<td id="contenct">${vo.s_location }</td>
		</tr>
		<tr>
			<td id="title">내용</td>
			<td id="contenct">${vo.s_contents }</td>
		</tr>
		
		<tr>
		<td colspan="2" id="getbtn">
			<c:if test="${today < vo.s_endday&&vo.replyCnt ne vo.s_person&&vo.id ne id}">
			<button id="buyer">참가하기</button>
			</c:if>
			
			<c:if test="${vo.id eq id}">
			<button id="boardModBtn" class="btn">수정</button>
			</c:if>
			
			<button id="ListMoveBtn" class="btn">목록</button>

		</td>
		</tr>
	</table>
	<!-- 참가자목록 -->
	<c:if test="${vo.id eq id}">
	 <table id="list">
      <thead>
        <tr>
          <th>NO.</th>
          <th>아이디</th>
          <th>입금형식</th>
          <th>휴대폰번호</th>
          <th>희망장소</th>
          <th>요청사항</th>
        </tr>
      </thead>
      <tbody>
    	
    		<c:forEach var="guest" items="${guest }">
			<tr>
			<td><c:out value="${guest.b_num}"/></td>
			<td><c:out value="${guest.id}"/></td>
			<td><c:out value="${guest.b_money}"/></td>
			<td><c:out value="${guest.phone}"/></td>
			<td><c:out value="${guest.b_location}"/></td>
			<td><c:out value="${guest.b_equests}"/></td>
			</tr>
			</c:forEach>
		

      </tbody>
    </table>
          </c:if>
	<form action="/seller/modify" method="get" id="operForm">
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="amount" value="${cri.amount }">
	</form>
	
	<form action="/seller/attend" method="post" id="idForm">
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="amount" value="${cri.amount }">
		<input type="hidden" name="id" value="${id }">
		<input type="hidden" name="s_num" value="${vo.s_num}">
		<input type="hidden" name="s_title" value="${vo.s_title}">
	</form>
	
	<form action="/seller/myinsert" method="post" id="sactionForm">
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="id" value="${id }">
	</form>
	
	</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	
$(function(){
	//화면이동 스크립트 ---------------------- START
	var operForm = $("#operForm");
	var bnoValue = '${vo.s_num}';
	var idForm = $("#idForm");
	var sactionForm = $("#sactionForm");
	
	/*내위치*/
	var centerAddr = '${centerAddr}';
	/*거래장소*/
	var s_location = '${vo.s_location}';
	
	
	$("#boardModBtn").click(function(){
		operForm.append('<input type="hidden" name="s_num" value="'+${vo.s_num }+'">');
		operForm.submit();
	});
	
	$("#ListMoveBtn").click(function(){
		operForm.attr("action","/seller/list");
		operForm.submit();
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
	
	/*  참가하기  */
	$("#buyer").click(function(){
		
		if(confirm("동네인증이 필요합니다.")==true){
			if(centerAddr==s_location){
				alert("현재위치와 거래장소가 일치합니다.")
				$.ajax({
					url:"",
					method:"get",
					data:idForm,
					dataType:"html",
					success: eventSuccess,
					error: function(xhr, status, error) {alert(error);}
				});

				function eventSuccess(data)
				{
					window.open("/seller/attend?pageNum=${cri.pageNum }&amount=${cri.amount }&s_num=${vo.s_num}&s_title=${vo.s_title}","_blank","width=500,height=550");
				}
				
			}else{
				alert("현재위치와 거래장소가 일치하지않아 참가하실 수 없습니다.")		
				/*url = "/member/mylocation";
				specs = "width=500,height=400,top=150,left=680,toolbar=no,menubar=no,reizable=yes";
				window.open(url,'windown',specs);*/
			}
			
		}else{
			return;	
		}
		
		
		
		
		
		
		
		
		
	/*	if(confirm("동네인증이 필요합니다.")==true){
			url = "/member/mylocation";
			specs = "width=500,height=400,top=150,left=680,toolbar=no,menubar=no,reizable=yes";
			window.open(url,'windown',specs);
		}else{
			return;			
		}
		
		if(centerAddr==s_location){
			alert("현재위치와 거래장소가 일치합니다.")
			$.ajax({
				url:"",
				method:"get",
				data:idForm,
				dataType:"html",
				success: eventSuccess,
				error: function(xhr, status, error) {alert(error);}
			});

			function eventSuccess(data)
			{
				window.open("/seller/attend?pageNum=${cri.pageNum }&amount=${cri.amount }&s_num=${vo.s_num}&s_title=${vo.s_title}","_blank","width=500,height=550");
			}
			
	
			
		}else{
			alert("현재위치와 거래장소가 일치하지않습니다.")			
		}	*/
			
		/* url = "/seller/attend?pageNum=${cri.pageNum }&amount=${cri.amount }&s_num=${vo.s_num}";
		specs = "width=500,height=550,top=150,left=680,toolbar=no,menubar=no,reizable=yes";
		window.open(url,'windown',specs); */		
				
	});
		
		
		

	
	
	
	
	
	/* 신고하기 */
	$("#declaration").click(function(){
		url = "/seller/declaration?pageNum=${cri.pageNum }&amount=${cri.amount }&s_num=${vo.s_num}";
		specs = "width=500,height=550,top=150,left=680,toolbar=no,menubar=no,reizable=yes";
		window.open(url,'windown',specs);
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