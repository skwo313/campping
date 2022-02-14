<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">

		<a class="navbar-brand" href="#" onclick="location.href='/camping'"><img
			alt="" width="" height="50px"
			src="${pageContext.request.contextPath}/img/logo.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">

		<a class="navbar-brand" href="testPage.do"><img alt="" width="" height="50px" class="logo" src="${pageContext.request.contextPath}/img/logo.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<%
				if (session.getAttribute("member") != null) {
				%>
				<li class="nav-item"><a class="nav-link display4"
					aria-current="page" href="#">${member.userId}님</a></li>
				<%
				} else {
				%>
				<%
				}
				%>
				<li class="nav-item"><a class="nav-link display4"
					aria-current="page" href="#">캠핑용품</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="#">커뮤니티</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">계정</a>
					<%
					if (session.getAttribute("member") != null) {
					%>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#" id="logout">로그아웃</a></li>
						<%
						} else {
						%>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#"
								onclick="location.href='/camping/member/login'">로그인</a></li>
							<li><a class="dropdown-item" href="#"
								onclick="location.href='/camping/member/register'">회원가입</a></li>
							<%
							}
							%>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logout").on("click", function() {
			location.href = "member/logout";
		});
	});
	var result = '${result}';

	if (result == 'Y') {
		alert("회원가입에 성공하셨습니다");
		if (confirm('로그인 화면으로 이동하시겠습니까?')) {
			location.href = "member/login";
		}
	}
</script>
