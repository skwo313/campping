
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
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
	$(function() {
		$('#btnJoin').click(function() {
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var getName = RegExp(/^[가-힣]{2,4}$/);
			var chName = $('#checkbtn').attr('name');
			if ($("#userId").val() == "") {
				alert("아이디 입력해주세요");
				$("#userId").focus();
				return false;
			}
			if (chName == "" || chName == "N") {
				alert('아이디 중복확인을 해주세요');
				$('#userId').focus();
				return false;
			}
			if ($("#userPw2").val() == "") {
				alert("패스워드확인을 입력해주세요");
				$("#userPw2").focus();
				return false;
			}
			if ($("#userPw").val() != $("#userPw2").val()) {
				alert("패스워드가 서로 다릅니다");
				$("#userPw").val("");
				$("#userPw2").val("")
				$("#userPw").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("이름을 입력해주세요");
				$("#userName").focus();
				return false;
			}
			if (!getName.test($("#userName").val())) {
				alert("이름 2~4자를 입력해주세요");
				$("#userName").val("");
				$("#userName").focus();
				return false;
			}
			console.log(chName);
			if(confirm("회원가입 하시겠습니까?")){
				console.log(chName);
				$(".form1").attr("action", "/register");
				$(".form1").submit();
			}else{
				return false
			}
		});

		$('#checkbtn').click(function() {
			var getID = RegExp(/^[a-zA-Z0-9]{4,12}$/);
			var chName = $('#checkbtn').attr('name');

			if (!getID.test($("#userId").val())) {
				alert("영어+숫자로 아이디 4~12자 입력해주세요");
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
			$.ajax({
				type : "POST",
				url : "idChk",
				data : {
					"userId" : $('#userId').val()
				},
				success : function(data) {
					if (data == 0) {
						alert("사용 가능한 아이디입니다.")
						$('#checkbtn').attr('name', 'Y');
						$(".resultCK").html('사용 가능한 아이디입니다.').css("font-size", "10px");
						$(".resultCK").css('color', 'green');
					} else {
						alert("이미 사용중인 아이디입니다.")
						$('#checkbtn').attr('name', 'N');
						$(".resultCK").html('이미 사용중인 아이디 입니다');
						$(".resultCK").css('color', 'red');
					}
				}
			});
		});
	});
</script>

<div class="main">
	<form class="form-signin" name="form1" method="post">
		<table width="500px">
			<tr>
				<td>*아이디</td>
				<td><input type="text" id="userId" name="userId"
					placeholder="ID" class="form-control"></td>
				<td>
					<button type="button" id="checkbtn" name="N"
						class="btn btn-primary btn-xs">중복확인</button>
			</tr>
			<tr>
				<td><p style="font-size: 10px;">(영어+숫자 4~12자 아이디 입력)</p></td>
				<td><div class="resultCK"></div></td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td><input type="password" id="userPw" name="userPw"
					placeholder="PASSWORD" class="form-control"></td>
			</tr>

			<tr>
				<td>*비밀번호 확인</td>
				<td><input type="password" id="userPw2"
					placeholder="Confirm password" class="form-control"></td>
			</tr>

			<tr>
				<td>*이름</td>
				<td><input type="text" id="userName" name="userName"
					placeholder="이름" class="form-control"></td>
			</tr>

			<tr>
				<td>휴대폰</td>
				<td><input type="text" id="userPhone" name="userPhone"
					placeholder="ex)-없이 입력해주세요" class="form-control"></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="email" id="userEmail" name="userEmail"
					placeholder="ex)example@naver.com" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					id="btnJoin" value="회원 가입"
					class="btn btn-success btn-primary btn-block" /></td>
			</tr>
		</table>
	</form>

</div>