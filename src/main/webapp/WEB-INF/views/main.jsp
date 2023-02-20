<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ include file="include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정중메인</title>
<style type="text/css">
 #img{
	width: 100%;
	text-align: center;
 }
 
 /*이미지슬라이드*/
 .Slidesbackground {
    margin: 0;
    padding: 0;
    width: 90%;
    height: 600px;
}
.slideshow-image{
    width: 90%;
    overflow: hidden;
    height: 600px;
    margin-left: 100px;
}
.mySlides {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.slideshow-container {
    display: flex;
    justify-content: center;
    position: relative;
    margin: auto;
}

.fade {
    animation-name: fade;
    animation-duration: 1.5s;
}

@keyframes fade {
    from {
        opacity: .4
    }
    to {
        opacity: 1
    }
}
	#img1{
		width: 200px;
		height: 200px;
		text-align: center;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	/*이동하는 작은것들 div*/
	#imgs{
		text-align: center;
	
	}
	/*지도*/
	#map{
		width: 600px;
		height: 500px;
		margin: auto;
		margin-left: 20%;
		margin-bottom: 200px;
	}
	#table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: separate;
      border-spacing: 0 50px;
  }
  	/* footer 하단 고정 [S] */
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    padding-bottom: 1320px; /* footer의 높이 */
}

footer {
    width: 100%;
    height: 99999px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
}
/* footer 하단 고정 [E] */
/* 	아이프레임 추가 */
	.chat-ifr{
		visibility: hidden;
	}  


</style>
<body>
	<!-- 본문시작 -->
	<div id="body-wrapper">
	<div id="body-content">
				<%-- <span class="slideshow-container">
                 <div class="Slidesbackground">
                    <div class="mySlides fade">
                    <img src="<spring:url value='/resources/image/springdayevent.png'/>" class="slideshow-image">
                    </div>
                    <div class="mySlides fade">
                     <img src="<spring:url value='/resources/image/joingift.png'/>" class="slideshow-image">
                    </div>
                    <div class="mySlides fade">
                     <img src="<spring:url value='/resources/image/valentineday.png'/>" class="slideshow-image">
                    </div>
                </div>
                </span> --%>
		
		<!-- <div style="margin-left: 200px;">
			<div style="width:90%; height:400px; background-color:#f4ebde">
			<h1 style="text-align: center; padding-top: 15px;">-PRODUCTS-</h1>
			<p  style="text-align: center;">JACHMI 생활 의 다양한 제품을 소개합니다.</p>
			<br>
			<table>
			<tr>
			<td>
			<img class='png24' border='0' src='/resources/dailyNecessityImages/1.데일리 물티슈(100매x 10팩).png' style="border-radius: 800px; width: 250px; height: 250px; margin-left: 100px;">
			</td>
			<td><img class='png24' border='0' src='/resources/dailyNecessityImages/11.히노키 리프 디퓨저.png' style="border-radius: 800px; width: 250px; height: 250px; margin-left: 25px;"></td>
			<td><img class='png24' border='0' src='/resources/dailyNecessityImages/3.포밍 핸드워시.png' style="border-radius: 800px; width: 250px; height: 250px; margin-left: 25px;"></td>
			<td><img class='png24' border='0' src='/resources/foodImges/11.소불고기 두부샐러드.png' style="border-radius: 800px; width: 250px; height: 250px; margin-left: 25px;"></td>
			<td><img class='png24' border='0' src='/resources/foodImges/23.동인도식 매운 찜갈비.png' style="border-radius: 800px; width: 250px; height: 250px; margin-left: 25px;"></td>
			</tr>
			</table>
			</div>
		</div> -->		
	<span> hello world</span>
		
		<div id="imgs" style="margin-left: 20%; margin-bottom: 100px; margin-top: 30px;" >.
		<!-- 1번 -->
		<div style="float: left; width: 25%; height: 400px; background-color: #d791c7; border: 1px solid #d791c7; ">
		<h1 style="margin-top: 25%; color: white;">공지사항</h1>
		<p style="color : white;">NOTICES</p>
		<div style="color:white;">l</div>
		<div style="color :#ffd4f5">(주)자취미생활의<br>
		주요소식을 알려드립니다.<br></div>
		<a id="moveNotice" href="/notice/nList?pageNum=1&amount=15"><img src="<spring:url value='/resources/image/9041830_home_door_icon.png'/>"style="width:50px; height:50px; margin-top: 10px;"></a>
		</div>
		<!-- 2번 -->
		<div style="float: left; width: 25%; height: 400px; border-bottom: 2px solid #85a7ff;">
			<img src="<spring:url value='/resources/image/archive-1850170_640.jpg'/>"style="width:100%; height:100%;">
		</div>
		<!-- 3번 -->
		<div style="float: left; width: 25%; height: 400px; background-color: #acb991; border: 1px solid #acb991; ">
			<h1 style="margin-top: 25%; color: white;">자주묻는질문</h1>
			<p style="color : white;">FAQ</p>
			<div style="color:white;">l</div>
			<div style="color :#d2e4ad">궁금하신 사항들을 <br>
			알려드립니다<br></div>
			<a id="moveFAQ" href="/faq/faq_list?pageNum=1&amount=10"><img src="<spring:url value='/resources/image/9041829_home_door_icon.png'/>"style="width:50px; height:50px; margin-top: 10px;"></a>
		</div>
		<!-- 4번 -->
		<div style="float: left; width: 25%; height: 400px; margin-bottom: 50px;">
			<img src="<spring:url value='/resources/image/diary-3300606_640.jpg'/>"style="width:100%; height:100%;">
		</div>
		<!-- 5번 -->
<!-- 5번 -->
      <div style="float: left; width: 25%; height: 400px; background-color: #85a7ff; border: 1px solid #85a7ff; ">
         <h1 style="margin-top: 25%; color: white;">동네모임</h1>
         <p style="color : white;">Neighborhood meeting</p>
         <div style="color:white;">l</div>
         <div style="color :#bfd0fc;">지역 모임,스터디 그룹, 정보 공유를 할 수 있는 <br>
         자취미생활 게시판<br></div>
         <a href="/board/board_list"><img src="<spring:url value='/resources/image/9041831_home_door_icon.png'/>"style="width:50px; height:50px; margin-top: 10px;"></a>
      </div>
		<!-- 6번 -->
		<div style="float: left; width: 25%; height: 400px; margin-bottom: 50px;">
			<img src="<spring:url value='/resources/image/telephone-1223310_640.jpg'/>"style="width:100%; height:100%;">
		</div>
		
		
		
	  	<!--  	<img id="img1" src="<spring:url value='/resources/image/event3.jpg'/>"/>
	  		<img id="img1" src="<spring:url value='/resources/image/event4.jpg'/>"/>
	  		<img id="img1" src="<spring:url value='/resources/image/event5.jpg'/>"/>-->
	  	</div>
	  	
	  	
	  	<!-- <div class="info">
		  	<div id="map" style="float:left;"></div>
		  	
			<div style="width:540px; height:500px; border:10px solid #3498db; float:left;">
			
			<h1 style="
    margin-top: 50px;
    margin-bottom: 25px;
    margin-left: 30px;">CONTACT US</h1>
			<table id="table">
			<tbody>
			<tr>
			<td class="tit01" style="
    padding-left: 80px;"
			>Address</td>
			<td>서울특별시 금천구 디지털로9길 56</td>
			</tr>
			
			<tr>
			<td class="tit02"style="
    padding-left: 80px;">Tel</td>
			<td class="tel">02-123-4561~8</td>
			</tr>
			
			<tr>
			<td class="tit02" style="
    padding-left: 80px;">Fax</td>
			<td>02-123-4567</td>
			</tr>
			
			<tr>
			<td class="tit04"style="
    padding-left: 80px;">E-mail</td>
			<td><a>admin@jachmi.com</a></td>
			</tr>
			
			</tbody>
			</table>
			</div> -->
	  	</div>
	  	
	  </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64a79125676645e957f07235be411705&libraries=services"></script>	  
<script type="text/javascript">

/* 이미지슬라이드부분--------------------------------------------- */
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
   
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";

    setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
}

/*지도부분-------------------------------------------------------------------*/
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
     level: 3 // 지도의 확대 레벨
 };  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 금천구 디지털로9길 56', function(result, status) {

 // 정상적으로 검색이 완료됐으면 
  if (status === kakao.maps.services.Status.OK) {

     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

     // 결과값으로 받은 위치를 마커로 표시합니다
     var marker = new kakao.maps.Marker({
         map: map,
         position: coords
     });

     // 인포윈도우로 장소에 대한 설명을 표시합니다
     var infowindow = new kakao.maps.InfoWindow({
         content: '<div style="width:150px;text-align:center;padding:6px 0;">(주)자취미생활</div>'
     });
     infowindow.open(map, marker);

     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
     map.setCenter(coords);
 } 
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
//					history.back();
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
</script>
	</div> <!-- body-wrapper끝나는곳 -->
	<%@ include file="include/footer2.jsp" %>    
