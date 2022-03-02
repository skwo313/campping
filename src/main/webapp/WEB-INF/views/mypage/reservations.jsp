<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<title>CampPing</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
<link href="${path}/css/mypage.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var cancelMsg = "${cancelMsg}";
		if( cancelMsg != ""){
			alert(cancelMsg);
		}
		
	});
	
</script>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 캠핑장 예약</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="reservations"> <span data-feather="file"></span>
							캠핑장 에약 조회
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 쇼핑</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file"></span> 주문목록/배송 조회
					</a></li>
					<li class="nav-item"><a class="nav-link" href="cart"> <span
							data-feather="shopping-cart"></span> 장바구니
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 정보</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="userConfirm"> <span
							data-feather="users"></span> 개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h4">캠핑장 예약 조회</h1>
			</div>
			<div class="input-group mb-3">
				<div class="col-sm-6">
					<input type="text" class="form-control"
						placeholder="예약한 캠핑장을 검색할 수 있어요!" aria-label="예약한 캠핑장을 검색할 수 있어요!"
						aria-describedby="button-addon2">
				</div>
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2">
					<span data-feather="search"></span>
				</button>
			</div>

			<h2 id="reserveList" class="h5">예약 내역</h2>
			<div id="rlist" class="row">
				<c:forEach var="reserve" items="${reservations }">
				<div class="card col-md-4" id="reservation-detail">
					<img
						src="${reserve.camping_order_image}"
						class="card-img-top" alt="...">
					<div class="card-body">
						<span id="reservationStat" class="card-text">예약완료</span>
						<h5 id="campsiteName" class="card-title">${reserve.camping_order_name}</h5>
						<h5 id="reservationDate" class="card-text">${reserve.camping_order_startdate } - ${reserve.camping_order_enddate}</h5>
						<a href="reserveDetail?orderno=${reserve.order_no}" class="btn btn-primary btn-sm">예약 정보</a>
					</div>
				</div>
				</c:forEach>
			</div>

			<h2 id="useageList" class="h5">이용 내역</h2>
			<div id="ulist" class="row">
				<div class="card col-md-4" id="reservation-detail">
					<img
						src="https://img.campingtalk.me/camp/3512/16230543118372822_M.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<span id="reservationStat" class="card-text">이용 완료</span>
						<h5 id="campsiteName" class="card-title">산청 지리산 자양보 오토캠핑장</h5>
						<h5 id="reservationDate" class="card-text">02.24 - 02.25일</h5>
						<a href="#" class="btn btn-primary btn-sm">다시 예약</a>
					</div>
				</div>
			</div>

		</main>
	</div>
</div>



<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="${path}/js/dashboard.js"></script>