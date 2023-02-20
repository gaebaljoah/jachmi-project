<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소</title>
    
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    /*지도위치 전송버튼  */
    #submit{
      background-color: rgb(52, 152, 219);
      border: none;
      border-radius: 5px;
      color: white;
   }
    
</style>
</head>
<body>

<form action="/seller/insert" method="get" id="testForm">
<div id="map" style="width:100%;height:350px;"></div>
  <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
    </div>
    
    <div style="display: inline-block; margin-top: 10px;"> 
  <input type="text" id="centerAddr" name="inputNm" value="" readonly="readonly">
    </div>
    <div style="display: inline-block;">
  <button data-oper="list" onclick="setParentText()" id="submit">전송</button>
   </div>
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64a79125676645e957f07235be411705&libraries=services"></script>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript">

/*자식창 부모창 넘겨주기*/
  function setParentText(){
        	opener.document.getElementById("s_location").value = document.getElementById("centerAddr").value
        }

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
    level: 3, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
};


//지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);

//지도 크기 변경
mapContainer.style.width = '485px';
mapContainer.style.height = '350px'; 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

function locationLoadSuccess(pos){
// 현재 위치 받아오기
var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);




// 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
map.panTo(currentPos);

// 마커 생성
var marker = new kakao.maps.Marker({
    position: currentPos
});

// 인포윈도우로 장소에 대한 설명을 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    content: '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
      
});
 // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
infowindow.open(map, marker);


// 기존에 마커가 있다면 제거
marker.setMap(null);
marker.setMap(map);
};

function locationLoadError(pos){
alert('위치 정보를 가져오는데 실패했습니다.');
};

//위치 가져오기 버튼 클릭시
$("#getMyPositionBtn").click(function(){
	navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
	console.log(locationLoadSuccess);
	
});

//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
		var test = '1234';
        
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                $('input[name=inputNm]').attr('value',result[i].address_name);
                break;
            }
        }
    }    
}




$("button").click(function(e){
	e.preventDefault(); //기본 이벤트 삭제
	var queryString = $("form[id=testForm]").serialize();
	var oper = $(this).data("oper");
	var getMyPositionBtn = $("#getMyPositionBtn");
	
	if(oper=="list"){
		$.ajax({
			type : 'get',
			url : '/seller/insert',
			data : queryString,
			success: function(data){
				alert("위치가설정되었습니다.")
				self.close();
			},
			error: function(data){
				alert("위치가설정되지않았습니다. 다시 시도해주세요.")
			}
		});
		
	}
	
});
	
	

</script>




</body>
</html>