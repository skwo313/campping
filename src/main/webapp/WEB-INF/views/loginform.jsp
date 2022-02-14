
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
.main {
	height: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
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
	<form class="form-signin" name="form1" method="post">
		<table width="400px">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId"
					class="form-control"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPw" name="userPw"
					class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" id="btnLogin"
						class="btn btn-lg btn-primary btn-block">로그인</button>
					<button type="button"
						onclick="location.href='/camping/member/register'"
						class="btn btn-lg btn-primary btn-block">회원가입</button>
				</td>
			</tr>
		</table>
	</form>

</div>
