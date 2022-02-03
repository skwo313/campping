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

#main {
	display: flex;
}

#map {
	display: flex;
	width: 80%;
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

#list {
	display: flex;
	width: 20%;
	height: 80vh;
}
</style>
<form>
	<label id="search-tab"> <input id="search-text" placeholder="지역 또는 이름을 입력하세요." />
	</label>
</form>
<div id="main">
	<div id="map"></div>
	<div id="list">리스트가 출력될 장소 입니다.</div>
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
