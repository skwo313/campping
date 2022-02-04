<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page session="false"%>
<!-- <html>
 
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>캠핑에 미치다</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
         

		
</head>
    <body>
        Page content
            

</body>
</html> -->
<title>CampPing</title>
<style>
html, body {
	width: 100%;
	height: 100%;
}

.main {
	display: flex;
}

#map {
	display: flex;
	width: 100%;
	height: 80vh;
}

#search-tab {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	width: 100%;
	height: 72px;
	padding: 0px 40px;
	border-radius: 2px;
	box-shadow: rgb(0 0 0/ 10%) 0px 7px 15px -2px;
	background-color: rgb(255, 255, 255);
}

#search-text {
	flex: 1 1 0%;
	height: 27px;
	margin-left: 20px;
	font-size: 18px;
	border: 0px;
	background-color: transparent;
}

.list {
	display: flex;
	flex-direction: column;
	width: 500px;
	height: 80vh;
}

.camping-place {
	display: flex;
	padding : 10px 15px
}
</style>
<form>
	<label id="search-tab"> <input id="search-text" class="form-control" placeholder="지역 또는 이름을 입력하세요." />
	</label>
</form>
<div class="main">
	<div id="map"></div>
	<div class="list">
		<div>
			<select class="form-select">
				<option>서울/경기</option>
				<option>충청남도</option>
				<option>충청북도</option>
				<option>강원도</option>
				<option>전라남도</option>
				<option>전라북도</option>
				<option>경상남도</option>
				<option>경상북도</option>
			</select>
		</div>
		<div class="camping-place">
			<div style="display: flex;">
				<img alt="" src="img/camping-test.jpg" width="150" height="150">
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
			</div>
		</div>
		<div class="camping-place">
			<div style="display: flex;">
				<img alt="" src="img/camping-test.jpg" width="150" height="150">
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
			</div>
		</div>
		<div class="camping-place">
			<div style="display: flex;">
				<img alt="" src="img/camping-test.jpg" width="150" height="150">
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
			</div>
		</div>
		<div class="camping-place">
			<div style="display: flex;">
				<img alt="" src="img/camping-test.jpg" width="150" height="150">
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
			</div>
		</div>
		<div class="camping-place">
			<div style="display: flex;">
				<img alt="" src="img/camping-test.jpg" width="150" height="150">
			</div>
			<div style="display: flex; flex-direction: column;">
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
				<div>산청 지리산 자양보 오토캠핑장</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bd11d6b565f348aeb6f7ee8032c658"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
