<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		fn_addFile();
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
</script>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

table {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<div id="root">
		<header>
			<table>
				<tbody>
					<tr>
						<td>
							<h1>board Form</h1>
						</td>
					</tr>
				</tbody>
			</table>
		</header>
		<section id="container">
			<form name="form" id="form" method="post" action="/board/write"
				enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td>
								<div class="mb-3">

									<label for="title">제목</label> <input type="text"
										class="form-control" name="title" id="title"
										placeholder="제목을 입력해 주세요">
								</div>
							</td>
						</tr>

						<tr>
							<td>

								<div class="mb-3">

									<label for="content">내용</label>

									<textarea class="form-control" rows="10" name="content"
										id="content" placeholder="내용을 입력해 주세요"></textarea>

								</div>
							</td>
						</tr>


						<tr>
							<td>

								<div class="mb-3">

									<label for="reg_id">작성자</label> <input type="text"
										class="form-control" name="writer" id="writer"
										placeholder="이름을 입력해 주세요">

								</div>

							</td>
						</tr>

						<tr>
							<td id="fileIndex"></td>
						</tr>
						<tr>
							<td>
								<button class="btn btn-primary write_btn" type="submit">작성</button>
								<button class="btn btn-primary fileAdd_btn" type="button">파일추가</button>
							</td>
						</tr>

					</tbody>
				</table>
			</form>

		</section>
	</div>
</body>
</html>