<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/camping/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
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
	<div id="root">
		<section id="container">
			<form name="updateForm" role="form" method="post" action="update">
				<input type="hidden" name="bno" value="${update.bno}" readonly="readonly" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<table>
					<tbody>
						<tr>
							<td>
							<div class="mb-3">
							<label for="title">제목</label><input type="text"
								id="title" name="title" value="${update.title}" class="form-control"
								title="제목을 입력하세요." />
							</div>	
								</td>
						</tr>
						<tr>
							<td>
							<div class="mb-3">
							<label for="content">내용</label> <textarea id="content"
									name="content" class="form-control" title="내용을 입력하세요."><c:out
										value="${update.content}" /></textarea>
										</div>
										</td>
						</tr>
						<tr>
							<td>
							<div class="mb-3">
							<label for="writer">작성자</label><input type="text"
								id="writer" name="writer" class="form-control" value="${update.writer}"
								readonly="readonly" />
								</div>
								</td>
						</tr>
						<tr>
							<td><label for="regdate">작성날짜</label> <fmt:formatDate
									value="${update.regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					<tr>
					<td>
					<button type="button" class="btn btn-primary update_btn">저장</button>
					<button type="button" class="btn btn-primary cancel_btn">취소</button>
					<button type="button" class="btn btn-primary fileAdd_btn">파일추가</button>
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