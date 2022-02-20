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
<link rel="stylesheet" href="css/main.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">

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


<!-- Custom styles for this template -->
<link href="css/mypage.css?after" rel="stylesheet">

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
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file"></span> 주문목록/배송 조회
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
					<li class="nav-item"><a class="nav-link active" href="#">
							<span data-feather="users"></span> 개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h4">회원정보수정</h1>
			</div>

			<form>
				<table class="table table-responsive table-light align-middle">
					<tbody>
						<tr>
							<th class="table-primary">아이디</th>
							<td><strong>${member.userId}</strong>
								<button type="button"
									class="btn btn-light btn-outline-secondary btn-sm">아이디
									변경</button></td>
						<tr>
							<th class="table-primary">이름</th>
							<td><strong>홍길동</strong></td>
						</tr>
						<tr>
							<th class="table-primary">휴대폰 번호</th>
							<td><strong>010-1234-5678</strong>
								<button type="button"
									class="btn btn-light btn-outline-secondary btn-sm">휴대폰
									번호 변경</button></td>
						</tr>
						<tr>
							<th class="table-primary">비밀번호변경</th>
							<td>
								<div class="form-group form-group-sm">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputCurrentPw">현재
											비밀번호</label>
										<div class="col-sm-6">
											<input class="form-control" type="password"
												id="inputCurrentPw">
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputNewPw">새
											비밀번호</label>
										<div class="col-sm-6">
											<input class="form-control" type="password" id="inputPw">
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputNewPw">비밀번호
											다시 입력</label>
										<div class="col-sm-6">
											<input class="form-control" type="password"
												id="inputPwConfirm">
										</div>
									</div>
									<button type="button" id="pwChBtn"
										class="btn btn-light btn-outline-secondary btn-sm">비밀번호
										변경</button>
								</div>
							</td>
						</tr>
						<tr>
							<th class="table-primary">배송지</th>
							<td>배송지 주소 관리는 <a href="#" id="deliveryAddressPopUp"><strong>[배송지
										관리]</strong></a>에서 수정, 등록 합니다.
							</td>
						</tr>
					</tbody>
				</table>
				<div class="usermodify-foot">
					<button type="button" class="btn btn-primary btn-sm">나가기</button>
				</div>
			</form>

		</main>
	</div>
</div>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script src="js/dashboard.js"></script>