<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
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
					<form method="post" action="/camping/search">
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
					<option value="">도 선택</option>
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
		</c:forEach>
	</div>
	<c:forEach items="${list}" var="list" varStatus="vs">
		<div class="modal fade" id="detailModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">${list.camping_name}</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<form method="post" action="/camping/order" id="campingOrder" onsubmit="return checkForm();">
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
								<input type="text" id="datepicker_start" class="form-control" value="" placeholder="체크인" />
								<span style="font-size: x-large;">~</span>
								<input type="text" id="datepicker_end" class="form-control" value="" placeholder="체크아웃" />
							</div>
							<br>
							<input type="number" id="person" class="form-control" value="" placeholder="인원수" />
							<div style="display: flex; justify-content: end;">
								<p class="detailDescription" style="padding-top: 7px; text-align: -webkit-right; font-weight: normal;">
									<fmt:formatNumber value="${list.camping_price}" />
								</p>
								<p class="detailDescription" style="padding-top: 7px; text-align: -webkit-right; font-weight: normal;">
									/ 1박
								</p>
							</div>
							<hr>
							<p class="detailDescription">결제 금액</p>
							<div style="display: flex; justify-content: flex-end;">
								<input type="text" readonly class="form-control-plaintext" value="" id="price" style="width: 15%; font-size: 19px; text-align: -webkit-right;" />
								<span style="padding-top: 3px; padding-left: 3px; font-size: x-large;">원</span>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn" type="submit" data-dismiss="modal">예약하기</button>
						</div>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				$("#detail${vs.index}").click(function(e) {
					e.preventDefault();
					$('#detailModal${vs.index}').modal("show");
				});
			</script>
		</div>
	</c:forEach>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bd11d6b565f348aeb6f7ee8032c658"></script>
<script type="text/javascript" src="js/kakaoMap.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>