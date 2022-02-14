<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/main.css">

<header class="bg-dark py-5">
	<div class="container px-4">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-6">
				<div class="text-center my-4">
					<h2 class="display-5 fw-bolder text-white mb-2">어느 캠핑장을 찾으시나요?</h2>
					<form method="post">
						<label id="search-tab"> <input id="search-text" name="search" class="form-control" placeholder="지역 또는 이름을 입력하세요." />
						</label>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="main">
	<div id="map"></div>
	<div class="list">
		<div class="form-box">
			<select class="form-select">
				<option>전체</option>
				<option>경기도</option>
				<option>충청남도</option>
				<option>충청북도</option>
				<option>강원도</option>
				<option>전라남도</option>
				<option>전라북도</option>
				<option>경상남도</option>
				<option>경상북도</option>
			</select>
		</div>
		<c:forEach items="${list}" var = "list">
		<div class="camping-place" id="detail">
			
			<div style="display: flex;">
				<img class="campingImg" alt="" src="${list.camping_image }">
			</div>
			<div class="descriptions">
				<div class="description1">${list.camping_name}</div>
				<div class="description2">${list.camping_loc}</div>
				<div class="description3"><fmt:formatNumber value="${list.camping_price}"/>원</div>
				<div class="description4">${list.camping_des}</div>
			</div>
		</div>
		</c:forEach>
	</div>

	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">산청 지리산 자양보 오토캠핑장</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<img class="modalImg" alt="" src="img/camping-test.jpg">
					<hr>
					<p class="detailDescription">위치</p>
					<p>경상남도 산청군 시천면 남명로 392-23</p>
					<hr>
					<p class="detailDescription">상세 설명</p>
					<p>자양보 유원지 바로 옆! 천왕봉을 바라보는 산청 타프캠핑장 (글램핑타프+데크)</p>
					<p>캠핑톡 고객센터 : 070-4336-1824 (예약관련문의)</p>
					<p>산청 지리산 자양보 오토캠핑장 : 010-4143-3005 (현장문의)</p>
					<p>사이트 주소: http://jyb-camp.com/default/</p>
					<hr>
					<p class="detailDescription">예약 정보</p>
					<form>

						<div style="display: flex;">
							<input type="text" id="datepicker_start" class="form-control" value="" placeholder="체크인" />
							<span style="font-size: x-large;">~</span>
							<input type="text" id="datepicker_end" class="form-control" value="" placeholder="체크아웃" />
						</div>
						<br>
						<input type="number" id="person" class="form-control" value="" placeholder="인원수" />
						<p class="detailDescription" style="padding-top: 7px; text-align: -webkit-right; font-weight: normal;">90000원 / 1박</p>
						<hr>
						<p class="detailDescription">결제 금액</p>
						<div style="display: flex; justify-content: flex-end;">
							<input type="text" readonly class="form-control-plaintext" value="" id="price" style="width: 15%; font-size: 19px; text-align: -webkit-right;" />
							<span style="padding-top: 3px; padding-left: 3px; font-size: x-large;">원</span>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예약하기</a>
					<!-- <button class="btn" type="button" data-dismiss="modal">아니오</button> -->
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#detail').click(function(e) {
		e.preventDefault();
		$('#detailModal').modal("show");
	});
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bd11d6b565f348aeb6f7ee8032c658"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 12
	//지도의 레벨(확대, 축소 정도)
	};
	var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbqMXOH%2FbtrsSki0YsO%2FuVMoCkyqdKBh0k69CjnIl1%2Fimg.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(35, 48), // 마커이미지의 크기입니다
	imageOption = {
		offset : new kakao.maps.Point(17.5, 100)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption)
	// 마커를 생성합니다

	/* 사용자 위치에 따른 지도 중심 변경*/
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			message = '<div style="padding:5px;">사용자의 위치</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : locPosition,
			image : markerImage
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
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
		position : markerPosition,
		image : markerImage
	});
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	marker.setMap(map);
</script>
<script type="text/javascript">
	$(function() {
		fn_default_datepicker();
	});

	function fn_default_datepicker() {
		var start = $("#datepicker_start").datepicker(
				{
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : false //콤보박스에서 년 선택 가능
					,
					changeMonth : false //콤보박스에서 월 선택 가능                
					//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
					//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
				});

		var end = $("#datepicker_end").datepicker(
				{
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : false //콤보박스에서 년 선택 가능
					,
					changeMonth : false //콤보박스에서 월 선택 가능                
					//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
					,
					defaultDate : "+1w"
				});

		//초기값을 오늘 날짜로 설정
		/* $('#datepicker_start').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		$('#datepicker_end').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) */
	}

	function getDate(element) {
		var date;
		var dateFormat = "yy-mm-dd";
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
	$(document).ready(
			function() {

				$("#datepicker_start").on("click", function() {

				});

				$("#datepicker_start").on(
						"change",
						function(e) {
							var end = $("#datepicker_end").datepicker("option",
									"minDate", getDate(e.target));
						});
				

				$("#datepicker_end").on("change", function(e) {

				});

				$("#datepicker_start,#datepicker_end").on("change", function() {
					var start = $("#datepicker_start").datepicker('getDate');
					var end = $("#datepicker_end").datepicker('getDate');
					if(start!=0&&start!=null&&end!=0&&end!=null){
						var days = (end - start)/1000/60/60/24;
						$("#price").val(days*90000);
						
					}
				});
			});
</script>