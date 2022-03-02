<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<title>CampPing</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
<link href="${path}/css/mypage.css?after" rel="stylesheet">

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
		
		$("#cancelBtn").click(function(){
			
			if(confirm("예약을 취소 하시겠습니까?")){
				location.href = "${path}/mypage/reserveCancel?orderno=${orderno}";
			};
			
		});
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
						aria-current="page" href="reservations"> <span
							data-feather="file"></span> 캠핑장 에약 조회
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
					<li class="nav-item"><a class="nav-link" href="userConfirm">
							<span data-feather="users"></span> 개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="padding: 50px;">
			<div class="border-bottom">
				<span id="reservationStat">예약완료</span>
				<h1 class="h4">${detail.camping_order_name}</h1>
				<h3 class="h6">A동</h3>
			</div>
			<div class="border-bottom">
				<div id="reserveDte">
					<div class="row">
						<div class="col-sm-2 h5">체크인</div>
						<div class="col-sm-4 h5">${detail.camping_order_startdate }
							금 15:00</div>
					</div>
					<div class="row">
						<div class="col-sm-2 h5">체크아웃</div>
						<div class="col-sm-4 h5">${detail.camping_order_enddate } 일
							11:00</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2 h5">예약자 이름</div>
					<div class="col-sm-4 h5">${detail.userName }</div>
				</div>
				<div class="row">
					<div class="col-sm-2 h5">휴대폰 번호</div>
					<div class="col-sm-4 h5">${detail.userPhone }</div>
				</div>
			</div>
			<div id="pay">
				<div class="row">
					<div class="h5">결제정보</div>
				</div>
				<div class="row">
					<div class="col-sm-2 h5">총 결제금액</div>
					<div id="price" class="col-sm-4 h5">
						<fmt:formatNumber value="${detail.camping_order_resultprice}" />원
					</div>
				</div>
			</div>
			<button id="cancelBtn" type="button"
				class="btn btn-light btn-outline-secondary">예약취소</button>
		</main>
	</div>
</div>



<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="${path}/js/dashboard.js"></script>