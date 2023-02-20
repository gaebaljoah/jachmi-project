<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<style type="text/css">
	.img{
 		width: 300px;
 		height: 200px; 
	}
	ul li{
		list-style-type : none;
	}
	.div{
		width: 60%;
/*  		height: 60%;  */
		margin: auto;
	}
	.div1{
		width:1600px; 
		margin-top:50px; 
	}
	.div2{
		margin:auto; 
		width: 300px; 
		border:1px solid gray; 
		float:left;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-left: 20px;
		margin-bottom: 20px;
	}
	a{
		text-decoration: none; 
		color: black;
	}
	.divv{
		width: 60%;
/* 		height: 60%; */
		margin: auto;
	}
	button{
		background-color:transparent;
		border: none;
		cursor:pointer
	}
	.button_div{
		margin: auto;
		margin-bottom: 10px;
	}

</style>

  <!-- 본문시작 -->
<div id="body-wrapper">
	<div id="body-content">

	<h1 style="text-align: center; margin-bottom: 10px;" >어떤 물건을 찾고 있나요?</h1>
	<hr class="my-hr3">

	<div class ="divv">
	<div class ="button_div"><button id="before">이전</button></div>
<!-- 	<div class ="radio_div"><input type="radio" name="rentvalue" id="rentvalue" value=""> 대여가능만 보기</div> -->
	</div>
	<div class="div">
		<div class="div1">
			<c:forEach var="pr" items="${list }">
				<div class="div2">				
						<a class="move" href="${pr.p_num }" style="text-decoration: none; color: black">
					<c:url value="/display" var="imgSrc"> <!— c:url 자동 인코딩  —>
                        <c:param name="fileName" value="${pr.attachList[0].uploadPath }/${pr.attachList[0].uuid }_${pr.attachList[0].fileName }"></c:param>
                     </c:url>
						<img src="${imgSrc }" class="img"><br>												
						<c:out value="${pr.p_title}"/>
						<c:out value="${pr.region}"/><br><br>
						<c:out value="${pr.p_start}"/>~<c:out value="${pr.p_end}"/><br>
						₩<c:url value="${pr.p_price}"/>/일<br>
						<c:if test="${pr.payment == 'Y' }"><div style="float: right; margin-right: 5px; font-weight:bold;">대여완료</div></c:if><br>
						<input type="hidden" name="p_category" value="${pr.p_category}">
						<input type="hidden" name="p_num" value="${pr.p_num}">
						</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
				<form action="/jiyoung/Living_info" method="get" id="actionForm">

					
				</form>
	
	<div class="uploadResult">
		<ul>
		</ul>
	</div>
</div> <!-- body-content 끝나는곳 -->

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

			$(function(){
				var actionForm = $("#actionForm");
				
				$(".move").click(function(e){
					//<a>클릭시 페이지 이동이 이루어지지 않게 하기 위해
					e.preventDefault();	
					actionForm.attr("action","/jiyoung/Living_info");
					
					var str = '';
					str += '<input type="hidden" name="p_num" value="'+$(this).attr("href")+'">';
					
					actionForm.html(str); 
					actionForm.submit();
				});
				

			}); 
			
			$("#before").on("click",function(e){
				e.preventDefault();
				history.go(-1);
			});
			
 	 	 	$("#rentvalue").on("click",function(e){
				e.preventDefault();
			      var valueCheck = $('#rentvalue:checked').val();
	                if ( valueCheck == '') {
	                    $("#rentvalue").val(1);
	                }
				
			});  
	 	 	


</script>
<%@ include file="../include/footer3.jsp"%>
</div>
