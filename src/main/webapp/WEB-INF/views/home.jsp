<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<title>CampPing</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/kakaoMap.css">
<header class="bg-dark py-5">
	<div class="container px-4">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-6">
				<div class="text-center my-4">
					<h2 class="display-5 fw-bolder text-white mb-2">어느 캠핑장을 찾으시나요?</h2>
					<form method="post" action="/camping/search" autocomplete="off">
						<label id="search-tab"> <input id="search-text" name="keyword" class="form-control" placeholder="지역 또는 이름을 입력하세요." />
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
			<form method="post" action="/camping/search">
				<select class="form-select" name="select" onchange="this.form.submit()">
					<option value="">지역 선택</option>
					<option value="경기도">경기도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
					<option value="강원도">강원도</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
				</select>
			</form>
		</div>
		<c:forEach items="${list}" var="list" varStatus="vs">
			<div class="camping-place" id="detail${vs.index}">
				<div style="display: flex;">
					<img class="campingImg" alt="" src="${list.camping_image }">
				</div>
				<div class="descriptions">
					<div class="description1">${list.camping_name}</div>
					<div class="description2">${list.camping_loc}</div>
					<div class="description3">
						<fmt:formatNumber value="${list.camping_price}" />
						원
					</div>
					<div class="description4">${list.camping_des}</div>
				</div>
			</div>
			<!-- modal 창 -->
			<div class="modal fade" id="detailModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">${list.camping_name}</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">X</span>
							</button>
						</div>
						<form method="post" action="/camping/order" id="campingOrder" name="insert${vs.index}" onsubmit="return checkForm${vs.index}();" autocomplete="off">
							<div class="modal-body">
								<img class="modalImg" alt="" src="${list.camping_image }">
								<hr>
								<p class="detailDescription">위치</p>
								<p>${list.camping_loc}</p>
								<hr>
								<p class="detailDescription">상세 설명</p>
								<p>${list.camping_des}</p>
								<hr>
								<p class="detailDescription">예약 정보</p>
								<div style="display: flex;">
									<input type="text" id="datepicker_start${vs.index}" class="form-control start" value="" placeholder="체크인" name="camping_order_startdate" />
									<span style="font-size: x-large;">~</span>
									<input type="text" id="datepicker_end${vs.index}" class="form-control end" value="" placeholder="체크아웃" name="camping_order_enddate" />
								</div>
								<br>
								<input type="number" id="person" class="form-control" value="" placeholder="인원수" name="cnt" />
								<div style="display: flex; justify-content: end;">
									<p class="detailDescription" id="campingPrice${vs.index}" style="padding-top: 7px; text-align: -webkit-right; font-weight: normal;">
										<fmt:formatNumber value="${list.camping_price}" />
									</p>
									<p class="detailDescription" style="padding-top: 7px; text-align: -webkit-right; font-weight: normal;">/ 1박</p>
								</div>
								<hr>
								<p class="detailDescription">결제 금액</p>
								<div style="display: flex; justify-content: flex-end;">
									<input type="text" readonly class="form-control-plaintext" value="" id="price${vs.index}" style="width: 15%; font-size: 19px; text-align: -webkit-right;" />
									<span style="padding-top: 3px; padding-left: 3px; font-size: x-large;">원</span>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn" type="submit" data-dismiss="modal">예약하기</button>
							</div>
							<!--  데이터 전송용 hidden -->
							<input type="hidden" value="${list.camping_price}" class="inputPrice${vs.index}">
							<input type="hidden" value="${member.userId}" name="user_id">
							<input type="hidden" value="${list.camping_name}" name="camping_order_name">
							<input type="hidden" value="${list.camping_image}" name="camping_order_image">
							<input type="hidden" value="" name="camping_order_resultprice" id="sendPrice${vs.index}">
						</form>
					</div>
				</div>
				<script type="text/javascript">
					$("#detail${vs.index}").click(function(e) {
						e.preventDefault();
						$('#detailModal${vs.index}').modal("show");
					});
					$(".close").click(function(){
						$('#detailModal${vs.index}').modal("hide");
					});
					function checkForm${vs.index}() {
						var ckLogin = '<%=session.getAttribute("member")%>';
						if(ckLogin == "null"){	
							swal ( "Oops" ,  "로그인이 필요합니다" ,  "error" );
							return false;
						}else if(ckLogin != "null"){
							if (document.insert${vs.index}.camping_order_startdate.value == "") {
								swal ( "Oops" ,  "체크인 날짜를 선택해주세요." ,  "error" );
								return false;
							}else if(document.insert${vs.index}.camping_order_enddate.value == "") {
								swal ( "Oops" ,  "체크아웃 날짜를 선택해주세요." ,  "error" );
								return false;
							}else if (document.insert${vs.index}.cnt.value == "") {
								swal ( "Oops" ,  "인원수를 입력해주세요.." ,  "error" );
								return false;
							}
						}
						swal ( "예약" ,  "예약 되었습니다." ,  "success" );
						
					}
					
				</script>
			</div>
			<script type="text/javascript">
			$(function() {
				fn_default_datepicker${vs.index}();
			});

			function fn_default_datepicker${vs.index}() {
				var start = $("#datepicker_start${vs.index}").datepicker(
					{
						dateFormat: 'yy-mm-dd' //Input Display Format 변경
						,
						showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,
						showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
						,
						changeYear: false //콤보박스에서 년 선택 가능
						,
						changeMonth: false //콤보박스에서 월 선택 가능                
						//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
						//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
						,
						buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
						,
						yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
						,
						monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
						,
						monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
						,
						dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
						,
						dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일'] //달력의 요일 부분 Tooltip 텍스트
						,
						minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,
						maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
					});

				var end = $("#datepicker_end${vs.index}").datepicker(
					{
						dateFormat: 'yy-mm-dd' //Input Display Format 변경
						,
						showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,
						showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
						,
						changeYear: false //콤보박스에서 년 선택 가능
						,
						changeMonth: false //콤보박스에서 월 선택 가능                
						//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
						,
						buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
						,
						yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
						,
						monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
						,
						monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
						,
						dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
						,
						dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일'] //달력의 요일 부분 Tooltip 텍스트
						,
						minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,
						maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
						,
						defaultDate: "+1w"
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

					$("#datepicker_start${vs.index}").on("click", function() {

					});

					$("#datepicker_start${vs.index}").on(
						"change",
						function(e) {
							var end = $("#datepicker_end${vs.index}").datepicker("option",
								"minDate", getDate(e.target));
						});


					$("#datepicker_end${vs.index}").on("change", function(e) {

					});
					$("#datepicker_start${vs.index},#datepicker_end${vs.index}").on("change", function() {
						var start = $("#datepicker_start${vs.index}").datepicker('getDate');
						var end = $("#datepicker_end${vs.index}").datepicker('getDate');
						console.log(start);
						if (start != 0 && start != null && end != 0 && end != null) {
							var days = (end - start) / 1000 / 60 / 60 / 24;
							var resultPrice = days * ($(".inputPrice${vs.index}").val());
							var comma = resultPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

							$("#price${vs.index}").val(comma);
							$("#sendPrice${vs.index}").val(resultPrice);
						}
					});
				});
			</script>
			<!--  모달창 종료 -->
		</c:forEach>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bd11d6b565f348aeb6f7ee8032c658"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
    center: new kakao.maps.LatLng(35.67546548019562, 127.77413496897933), // 지도의 중심좌표
    level: 11 // 지도의 확대 레벨
	};
var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbqMXOH%2FbtrsSki0YsO%2FuVMoCkyqdKBh0k69CjnIl1%2Fimg.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(35, 48), // 마커이미지의 크기
imageOption = {
	offset: new kakao.maps.Point(0, 0)
}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정

//마커의 이미지정보를 가지고 있는 마커이미지를 생성
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
imageOption)
//마커를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var positions = [];
<c:forEach items="${list}" var="list" varStatus="vs">
	positions.push({
		content:'<div class="overlaybox">' +
	    '    <div class="boxtitle">상세 정보</div>' +
	    '    <div class="first" style="background-image: url(${list.camping_image })">' +
	    '        <div class="movietitle text">${list.camping_name}</div>' +
	    '    </div>' +
	    '    <ul>' +
	    '        <li class="up">' +
	    '            <span class="title">${list.camping_loc}</span>' +
	    '        </li>' +
	    '        <li>' +
	    '            <span class="title">${list.camping_price}원 / 1박</span>' +
	    '        </li>' +
	    '        <li>' +
	    '            <span class="title">${list.camping_des}</span>' +
	    '        </li>' +
	    '    </ul>' +
	    '</div>',
		lating: new kakao.maps.LatLng(${list.camping_locationx},${list.camping_locationy})
		});
</c:forEach>

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].lating, // 마커의 위치
        image: markerImage
        
    });
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));

    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
        var infoTitle = document.querySelectorAll('.overlaybox');
		console.log(infoTitle);
		infoTitle.forEach(function(e) {
		    e.parentElement.parentElement.style.border = "0px";
		    e.parentElement.parentElement.style.background = "unset";
		});
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
</script>