
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.main {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	flex-direction: column;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if (userId == "") {
				alert("아이디를 입력하세요");
				$("#userId").focus();

				return false;
			}
			if (userPw == "") {
				alert("비밀번호를 입력하세요");
				$("#userPw").focus();
				return false;
			}
			$(".form1")("action", "/login");
			$(".form1").submit();

		});
		
		var result="${result}"; 
		if(result=="fail"){
			alert("로그인에 실패하였습니다");
		}
	});
	

</script>



<div class="main">
	<div class="row">
		<div class="col-lg-4" style="text-align: center; margin-top: 10px;">
			<img class="img"
				src="${pageContext.request.contextPath}/img/logo2.png" alt=""
				width="90px" height="95px" style="margin-bottom: 10px;">
		</div>
		
		<form class="form-signin" name="form1" method="post">
			<div class="input-group my-2 mb-1">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><i
						class="fa fa-user" style="font-size: 36px"></i></span>
				</div>
				<input type="text" id="userId" name="userId"
					placeholder="ID" class="form-control">
			</div>
			<div class="input-group my-2 mb-1">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><i
						class="fa fa-lock" style="font-size: 40px"></i></span>
				</div>
				<input type="password" id="userPw" name="userPw"
					placeholder="PASSWORD" class="form-control">
			</div>
			<div class="form-group">
				<button type="submit" id="btnLogin" style="margin-bottom: 10px;"
					class="w-100 btn btn-lg btn-primary">로그인</button>
			</div>
			<button type="button"
				onclick="location.href='/camping/member/register'"
				class="w-100 btn btn-lg btn-primary">회원가입</button>
			<span class='text-center'><a href="/camping/member/passFind" class="text-sm">비밀번호 찾기</a></span>
			<hr />
		</form>
	</div>

</div>