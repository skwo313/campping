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
<div id="map" style="width: 500px; height: 400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bd11d6b565f348aeb6f7ee8032c658"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	function resizeMap() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.width = '650px';
	    mapContainer.style.height = '650px'; 
	}
</script>
