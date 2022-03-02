<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<title>CampPing</title>
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
	$(document).ready(function() {
		var loginMsg = "${loginMsg}";
		if (loginMsg != "") {
			alert(loginMsg);
		};
		
		var hasSession = "${member.userId}";
		if (hasSession == "") {
			alert("로그인이 필요합니다.");
			location.href= "${path}/member/login";
		};
		
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
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="reservations"> <span data-feather="file"></span> 캠핑장 에약 조회
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
					<li class="nav-item"><a class="nav-link active"
						href="userConfirm"> <span data-feather="users"></span>
							개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="padding: 50px;">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h4">회원정보확인</h1>
			</div>
			<form>
				<div class="mb-3">
					<div id="emailHelp" class="form-text" style="padding-bottom: 10px;">${member.userId}님의
						정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다</div>
					<label for="exampleInputEmail1" class="form-label">아이디</label> <span
						class="h6" style="padding-left: 26px">${member.userId}</span>
				</div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">비밀번호</label>
					</div>
					<div class="col-auto">
						<input type="password" name="pass" id="inputPassword6"
							class="form-control" aria-describedby="passwordHelpInline">
					</div>
					<div class="col-auto">
						<span id="passwordHelpInline" class="form-text"> Must be
							8-20 characters long. </span>
					</div>
				</div>
				<div class="d-grid gap-2 d-md-block" style="margin-top: 22px;">
					<button type="submit" class="btn btn-primary btn-sm">확인</button>
					<button type="button" class="btn btn-secondary btn-sm">취소</button>
				</div>
			</form>

		</main>
	</div>
</div>



<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="${path}/js/dashboard.js"></script>