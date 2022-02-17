var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 12
	//지도의 레벨(확대, 축소 정도)
};
var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbqMXOH%2FbtrsSki0YsO%2FuVMoCkyqdKBh0k69CjnIl1%2Fimg.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(35, 48), // 마커이미지의 크기
	imageOption = {
		offset: new kakao.maps.Point(17.5, 100)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
	imageOption)
// 마커를 생성합니다

/* 사용자 위치에 따른 지도 중심 변경*/
if (navigator.geolocation) {

	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

		var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
			message = '<div style="padding:5px;">사용자의 위치</div>'; // 인포윈도우에 표시될 내용

		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);

	});

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

	displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수
function displayMarker(locPosition, message) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: locPosition,
		image: markerImage
	});

	var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content: iwContent,
		removable: iwRemoveable
	});

	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);

	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);
}
/*-----------------------------------------------------------*/
/* 	var markers = [];
<c:forEach items="${list}" var="list">
addMarker(new kakao.maps.LatLng(${list.camping_locationx},${list.camping_locationy}));
</c:forEach> */
var markerPosition = new kakao.maps.LatLng(35.267374619147226,
	127.85531231177431);

var marker = new kakao.maps.Marker({
	position: markerPosition,
	image: markerImage
});
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
marker.setMap(map);