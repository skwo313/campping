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
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="#"> <span data-feather="file"></span> 캠핑장 에약 조회
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 쇼핑</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link  active" href="#">
							<span data-feather="file"></span> 주문목록/배송 조회
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="shopping-cart"></span> 장바구니
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 정보</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="users"></span> 개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h4" style="padding-top: 30px;">주문 목록</h1>
			</div>
			<div class="input-group mb-3">
				<div class="col-sm-6">
					<input type="text" class="form-control"
						placeholder="주문한 상품을 검색할 수 있어요!" aria-label="주문한 상품을 검색할 수 있어요!"
						aria-describedby="button-addon2">
				</div>
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2">
					<span data-feather="search"></span>
				</button>
			</div>

			<div class="orderContainer">
				<div class="orderdate">2022.2.19 주문</div>

				<div class="card mb-6">
					<div class="row g-0">
						<div class="col-md-9">
							<div class="deliveryStat">
								<span>배송 중 •</span><span class="text-success"> 2/20(일) 도착</span>
							</div>
							<div class="row">
								<img
									src="http://img.autocamping.co.kr/produck/wildland/sum_wildcruiser_002.jpg"
									class="col-md-4 img-thumbnail rounded-start" alt="...">
								<div class="col-md-8">
									<div class="orderName">[와일드랜드]어드벤처 크루저 루프탑 텐트 1400</div>
									<div class="orderInfo">
										<span>3,250,000 원</span><span>• 1개</span>
									</div>
									<button id="addCart"
										class="btn btn-light btn-outline-secondary">장바구니 담기</button>
								</div>
							</div>
						</div>
						<div class="col-md-3 buttons">
							<button class="btn btn-outline-primary bsize">배송조회</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">교환,반품
								신청</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">리뷰
								작성하기</button>
						</div>
					</div>
				</div>

				<div class="card mb-6">
					<div class="row g-0">
						<div class="col-md-9">
							<div class="deliveryStat">
								<span>배송 중 •</span><span class="text-success"> 2/20(일) 도착</span>
							</div>
							<div class="row">
								<img
									src="http://img.autocamping.co.kr/produck/wildland/sum_wildcruiser_002.jpg"
									class="col-md-4 img-thumbnail rounded-start" alt="...">
								<div class="col-md-8">
									<div class="orderName">[와일드랜드]어드벤처 크루저 루프탑 텐트 1400</div>
									<div class="orderInfo">
										<span>3,250,000 원</span><span>• 1개</span>
									</div>
									<button id="addCart"
										class="btn btn-light btn-outline-secondary">장바구니 담기</button>
								</div>
							</div>
						</div>
						<div class="col-md-3 buttons">
							<button class="btn btn-outline-primary bsize">배송조회</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">교환,반품
								신청</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">리뷰
								작성하기</button>
						</div>
					</div>
				</div>


			</div>

			<div class="orderContainer">
				<div class="orderdate">2022.2.19 주문</div>

				<div class="card mb-6">
					<div class="row g-0">
						<div class="col-md-9">
							<div class="deliveryStat">
								<span>배송 중 •</span><span class="text-success"> 2/20(일) 도착</span>
							</div>
							<div class="row">
								<img
									src="http://img.autocamping.co.kr/produck/wildland/sum_wildcruiser_002.jpg"
									class="col-md-4 img-thumbnail rounded-start" alt="...">
								<div class="col-md-8">
									<div class="orderName">[와일드랜드]어드벤처 크루저 루프탑 텐트 1400</div>
									<div class="orderInfo">
										<span>3,250,000 원</span><span>• 1개</span>
									</div>
									<button id="addCart"
										class="btn btn-light btn-outline-secondary">장바구니 담기</button>
								</div>
							</div>
						</div>
						<div class="col-md-3 buttons">
							<button class="btn btn-outline-primary bsize">배송조회</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">교환,반품
								신청</button>
							<br>
							<button class="btn btn-light btn-outline-secondary bsize">리뷰
								작성하기</button>
						</div>
					</div>
				</div>
			</div>

		</main>
	</div>
</div>



<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="${path}/js/dashboard.js"></script>