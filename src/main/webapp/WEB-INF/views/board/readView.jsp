<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");
						
						// 수정 
						$("#update_btn").click(function(){
							
							var password = $("#password").val();
							
							if(password == ""){
								alert("비밀번호를 입력하세요");
								$("#password").focus();
								
								return false;
							}			
											
							formObj.attr("action", "updateView");
							formObj.attr("method", "get");
							formObj.submit();

						})

						// 삭제
						$(".delete_btn").on("click", function() {
							var deleteYN = confirm("삭제하시겠습니까?");
							var password = $("#password").val();
										
							if (deleteYN == true) {						
								if (password == ""){
									alert("비밀번호를 입력하세요");
									$("#password").focus();
									
									return false;
								}				
								
								formObj.attr("action", "delete");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {
											location.href = "list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

                        // 댓글 작성										
						$(".replyWriteBtn").on("click", function() {
							
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "replyWrite");
							formObj.submit();
						});

						// 댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "replyUpdateView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});

						// 댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "replyDeleteView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
						// 첨부파일 다운
						function fn_fileDown(fileNo){
							var formObj = $("form[name='readForm']");
							$("#FILE_NO").attr("value", fileNo);
							formObj.attr("action", "/board/fileDown");
							formObj.submit();
						}

						function fn_valiChk() {
							var regForm = $("form[name='readForm'] .chk").length;
							for (var i = 0; i < regForm; i++) {
								if ($(".chk").eq(i).val() == ""
										|| $(".chk").eq(i).val() == null) {
									alert($(".chk").eq(i).attr("title"));
									return true;
								}
							}
						}									
					})
</script>
<style>
table {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
}
</style>

<body>
	<div class="container">
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""><br>

				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label> <input
						type="text" id="title" name="title" class="form-control"
						value="${read.title}" readonly="readonly" /><br>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control"
						rows="10" readonly="readonly"><c:out
							value="${read.content}" /></textarea>
					<br>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label> <input
						type="text" id="writer" name="writer" class="form-control"
						value="${read.writer}" readonly="readonly" /><br>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />
					<br><br>
				</div>
				
				<div class="form-group">
					<div class="col-sm-10">
					<span>파일 목록</span>
						<div class="form-group" style="border: 1px solid #dbdbdb;" class="col-sm-2 control-label">
						<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach><br>
					</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-10">
						<label for="password" class="col-sm-2 control-label">비밀번호</label>
						<input type="password" id="password" name="password" class="form-control" placeholder="수정 또는 삭제시 비밀번호를 입력해주세요" /><br>
					</div>
				</div>
			</form>
			<div>
				<button type="button" class="update_btn btn btn-warning" id="update_btn">수정</button>
				<button type="submit" class="delete_btn btn btn-danger" id="delete_btn">삭제</button>
				<button type="button" class="list_btn btn btn-primary">목록</button>
				<br>
			</div>

			<!-- 댓글 -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p>
								작성자 : ${replyList.writer}<br /> 작성 날짜 :
								<fmt:formatDate value="${replyList.regdate}"
									pattern="yyyy-MM-dd" />
							</p>

							<p>${replyList.content}</p>
							<div>
								<button type="button" class="replyUpdateBtn btn btn-warning"
									data-rno="${replyList.rno}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger"
									data-rno="${replyList.rno}">삭제</button>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>

			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label" id="writer">댓글 작성자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2 control-label" id="content">댓글 내용</label>
					<div class="col-sm-10">
						<input type="text" id="content" name="content"
							class="form-control" />
					</div>
				</div>
				
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" id="write_btn" class="replyWriteBtn btn btn-success">작성</button>
					</div>
				</div>
				<br>
			</form>
		</section>

	</div>
</body>
</html>