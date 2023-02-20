<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>


<style type="text/css">
	@font-face {
	    font-family: 'Happiness-Sans-Title';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
   *{
      margin: 0;
      padding: 0;
      z-index: 0;
   }
/* 	아이프레임 추가 */
	.chat-ifr{
		visibility: hidden;
		position: relative;
		z-index: 10;
	}
  /*로그인,회원가입,로그아웃디자인 */
   .log{
       border : 1px solid skyblue;
       color: black;
       padding: 5px;
       padding-right : 15px;
       background-color: white;
       font-family: 'Happiness-Sans-Title';
       border-top: none;
       border-left: none;
       border-bottom: none;
       text-align: center;
       margin-right: 3px;
       font-size: 15px;
    }
   .log:hover {
       color: skyblue;
        transform: translateY(+4px);
   }
   /*로그인,로그아웃,메뉴 위치*/
   .header-menu{
      text-align: right;
      padding: 30px;
   }
   
   /*상단바메뉴*/
   .menu{
      overflow: hidden;
      text-align: center;
   }
    .menu li{
      margin-top: 0;
      display: inline-block;
      margin: 20px 70px 10px;
   }
    .menu li a{
      display: block;
      margin: auto;
	  padding: 20px;
      font-family: 'Happiness-Sans-Title';
      font-size: 20px;
      background-color: #ffffff;
      background-color: rgba( 255, 255, 255, 0.5 );
      text-decoration: none;
   }
   .menu li a:hover{
 	color : skyblue;
   
   }
   
/*    .droptn:hover { */
/* 	color : skyblue; */
/*    } */
   .drop-btn-content{
   	display : none;
      position: fixed;
      z-index: 1;
   }
   .drop-down:hover .drop-btn-content{
      display: block;
      position: absolute;
   }
   
   /*로고*/
   #logo{
        text-align: center;
        top: 0;
   }
   #logoimg{
      width: 400px;
   }
   .line{
      margin: auto;
      width: 84%;
      padding-bottom: 10px;
   }
   
   /*하단테스트*/
   #footer {
	position:absolute;
	bottom:0;
	width:100%;
	height:70px;   
	background:#ccc;
	text-align: center;
	background-color: #3498db;
	color: white;
   }
   /*하단*/
  	#down{
      color: white;
      text-align: center;
      font-size: 9px;
      background: #3498db;
      height: 100px;
   }
	.my-hr3 {
	  border: 0;
	  height: 3px;
	  width:67%;
	  margin : auto;
	  background: #ccc;
	  margin-bottom: 10px;
	  }
 	 .floating {
      position: fixed; 
      right: 80px; 
      top: 300px; 
      margin-right: 0px;
      text-align:center;
      z-index: 100;
   }
   .floating img{
   	width: 150px;
   }

   .menu li a:link {
   color: black;
   text-decoration: none;
	}
	
 	.menu li a:visited { 
 	   color: black; 
 	   text-decoration: none; 
 	} 
	
	.menu li a:hover {
	   color: skyblue;
	   text-decoration: underline;
	   transform: translateY(+4px);
	}
   #location{
      text-align: left;
      width: 20px;
      height: 20px;
      float: left;      
   }
   #location-box{
      float: left;
   }	
	#recMs{
		background-image: url("../resources/image/message.png");
		float:right;
		cursor:pointer;
		margin-right:10px;
		color:pink;
		padding:0 10px;
		width:30px;
		height: 30px;
		background-repeat: no-repeat;
		background-size : cover;
		border: none;
	}
	#cart_img{
		margin: 0 1% 0 1%;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#recMs").on("click", function() {
		
		var id = $("input[name='m_receiver']").val();
		var messageForm = $("#messageForm");
 		//$(location).attr('href', '/message/sml');
		
		messageForm.submit();
		});
});

var id = "${id}";
$(function(){
	
	$("#login").click(function(e){
		location.href = "/member/login"
	});
	$("#logout").click(function(e){
		location.href = "/member/logout"
	});
	$("#join").click(function(e){
		location.href = "/member/join"
	});
	$("#mypage").click(function(e){
		location.href = "/member/mypage"
	});
	$("#adminPage").click(function(e){
		location.href = "/member/adminPage"
	});
	
	
	$("#mylocation").click(function(e){
		url = "/member/mylocation";
		specs = "width=500,height=400,top=150,left=680,scrollbars=no, resizable=no, toolbars=no, menubar=no";
		window.open(url,'windown',specs);
	})		
});

	/* 채팅버튼 클릭 이벤트 */
	$(function() {
		
		$(".openChat").click(function() {
			// 로그인 하지 않았을 떄
			if(id == ""){
				var logchk = confirm("로그인이 필요한 서비스 입니다. 로그인 화면으로 이동하시겠습니까?")
				if(logchk == true){
					// 로그인 화면 이동
					location.href = "/member/login";
				}else{
					// 뒤로가기
// 					history.back();
					return;
				}
			}else{
				// 채팅 버튼 숨기기
				$(".openChat").hide();
				// 아이프레임 열기
				$(".chat-ifr").css('visibility', 'visible');
			}
		});
	});
	
	//장바구니 페이지 이동
	 function cart() {
		$("#move_cart_form").submit();
	} 
</script>
</head>
<body>
	<!-- 로그인 -->
	<div class="header-menu">
		<c:if test="${not empty signIn }">
			<button id="logout" style="text-align: center;" class="log">로그아웃</button>
			<c:if test="${signIn.auth eq 'admin' }">
				<button id="adminPage" style="text-align: center;" class="log">관리자
					페이지</button>
			</c:if>
			<c:if test="${signIn.auth ne 'admin' }">
				<button id="mypage" style="text-align: center;" class="log">마이페이지</button>
			</c:if>
			<button id="mylocation" class="log">내위치설정</button>
			<button id="recMs" name="recMs"></button>
			<a onclick="cart()" id="cart_img"><img
				src="/uploadImages/장바구니사진.png" style="width: 30px;"></a>
			<form id="messageForm" action="/message/sml">
				<input type="hidden" name="m_receiver" value="${signIn.id}">
			</form>
			<form action="/cart/getCartList" method="get" id="move_cart_form">
				<input type="hidden" name="cart_m_id" value="${id}">
			</form>
			<div id="location-box">
				<img alt="location"
					src="<spring:url value='/resources/image/location_icon.png'/>"
					id="location">${centerAddr }</div>
		</c:if>
		<c:if test="${empty signIn }">
			<button id="login" class="log">로그인</button>
			<button id="join" class="log">회원가입</button>
		</c:if>
		<div id="logo">
			<a href="/"><img alt="logo"
				src="<spring:url value='/resources/image/mylogo.png'/>" id="logoimg"></a>
		</div>
	</div>
	<!-- 메뉴바 -->
   <ul class="menu">
      	<li class="drop-down" id="shop">
			<!-- 정민수정 -->
			<form action="/product/allList" method="get" id="pageParam">
			</form> 
			<a href ="/product/allList" id="go_allList" class="drop-tn">자취샵</a> <!-- 정민수정 -->
		</li>
      <li><a class="droptn" href="/seller/list?pageNum=1&amount=10">공동구매</a></li>
      <li><a href="/jiyoung/rent_main">물품대여</a></li>
      <li><a href="/board/board_list">게시판</a></li>
<!--       <li class="drop-down"> -->
<!--          <a class="droptn">고객센터</a> -->
<!--          <div class="drop-btn-content"> -->
<!-- <!--             <a id="moveNotice" href="/notice/nList?pageNum=1&amount=10">공지사항</a> --> 
<!-- <!--             <a id="moveFAQ" href="/faq/faq_list?pageNum=1&amount=10">FAQ</a> --> 
<!-- <!--             	<a id="moveChat" href="/chat/chatting">채팅뷰</a> -->
<!--             	<a id="moveChat" href="/chat/chat_list">채팅관리</a> -->
<!--          </div> -->
<!--       </li>    -->
   </ul>
   
<!--    <form action="/board/board_list" method="post"> -->
<%-- 	   	<input type="hidden" name="pageNum" value="${cri.pageNum }"> --%>
<%-- 		<input type="hidden" name="amount" value="${cri.amount }"> --%>
<!--    </form>    -->
   
   
   <hr class="my-hr3">
    <div class="floating">
    	<div class="chat-div">
       			<img class="openChat" src="<spring:url value='/resources/image/chat.jpg'/>">
       		<div class="chat-icon-div">
				<iframe src="/chat/chatting" class = "chat-ifr" style="height:440px; width:250; border:solid 1px;"></iframe>       		
       		</div>
    	</div>
   </div>
</body>
</html>