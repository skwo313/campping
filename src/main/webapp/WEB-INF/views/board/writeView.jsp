<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {

			if (fn_valiChk()) {
				return false;
			}		
			formObj.attr("action", "write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$(".list_btn")
		.on(
				"click",
				function() {

					location.href = "list?page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
				})

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
	}
</script>
<style>
table {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<br><br>
	<section id="container">
			<form name="writeForm" id="form" method="post" action="write">
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
						<td>
							<div class="mb-3">
								<label for="reg_id">비밀번호</label> <input type="text"
									class="form-control" name="password" id="password"
									placeholder="비밀번호를 입력해주세요.">
							</div>
						</td>
					</tr>
					<tr>
							<td>
								<button class="write_btn btn btn-success" type="submit">작성</button>
								<button type="button" class="btn btn-primary" onclick="location.href='list'">목록</button><br>
								<br><br>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</section>
	</div>
</body>
</html>