<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>CampPing</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/objectDetail.css">
<script type="text/javascript">
	var cntCk = function() {
		let cnt = $("[name=cnt]").val();
		if(cnt<1) {
			cnt = 1;
			$("#exampleModalCenter").modal("show");
 			$("#modalText").text("수량은 1개 이상 숫자로 입력해주세요.");
 			$("#cartIns").hide();
 			$("#login").hide();
 			$("#shoping").hide();
			$("#close").text("확인");
 			$("#close").click(function(){
 				$("#exampleModalCenter").modal("hide");
 			});
		}
		$("[name=cnt]").val(cnt);
	}
	
	var tot = function() {
		let cnt = $("[name=cnt]").val();
		let price = "${obj.camping_price}";
		let sum = cnt*price;
		sum = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#tot").text(sum);
	}
	
	function getDetail(name) {
		name = encodeURIComponent(name);
		location.href="/camping/object/detail?name="+name;
	}
	
	$(document).ready(function() {	
		$("#plus").click(function(){
			let cnt = $("[name=cnt]").val();
			cnt++;
			$("[name=cnt]").val(cnt);
			cntCk();
			tot();
		});
		$("#minus").click(function() {
			let cnt = $("[name=cnt]").val();
			if(cnt!=1) cnt--;
			$("[name=cnt]").val(cnt);
			cntCk();
			tot();
		});
		$("[name=cnt]").keyup(function() {
			cntCk();
			tot();
		});
		$("#top").click( function() {
			$("html, body").animate({scrollTop:0}, 100 );
			return false;
		});
		$("#bottom").click(function() {
			$("html, body").animate({scrollTop:($("#footer").offset().top)}, 100 );
			return false;
		});
		$("#cart").click(function() {
			$.ajax({
				url:"/camping/loginCk",
				type:"POST",
				success : function(loginCk) {
					if(loginCk) {
						let camping_object_name = "${obj.camping_name}";
						let camping_object_image = "${obj.camping_image}";
						let camping_object_price = "${obj.camping_price}";
						let cnt = $("[name=cnt]").val();
						let camping_object_tot_price = camping_object_price * cnt;
						$.ajax({
							url:"/camping/object/detail",
							type:"post",
							data:{
								"camping_object_name":camping_object_name,
								"camping_object_image":camping_object_image,
								"camping_object_price":camping_object_price,
								"camping_object_tot_price":camping_object_tot_price
							},
							success : function(cartCk) {
								if(cartCk) {
									$("#exampleModalCenter").modal("show");
									$("#close").text("현재 페이지 유지");
						 			$("#modalText").html("해당 상품이 장바구니에 담겼습니다.<br>장바구니 페이지로 이동하시겠습니까?");
						 			$("#cartIns").show();
						 			$("#login").hide();
						 			$("#shoping").hide();
						 			$("#cartIns").click(function(){
						 				location.href="/camping/mypage/cart";
						 			});
						 			$("#close").click(function(){
						 				$("#exampleModalCenter").modal("hide");
						 			});
								} else {
									$("#exampleModalCenter").modal("show");
									$("#close").text("현재 페이지 유지");
						 			$("#modalText").html("해당 상품이 이미 장바구니에 담겨있습니다.<br>쇼핑을 계속 하시겠습니까?");
						 			$("#cartIns").hide();
						 			$("#login").hide();
						 			$("#shoping").show();
						 			$("#shoping").click(function(){
						 				location.href="/camping/object";
						 			});
						 			$("#close").click(function(){
						 				$("#exampleModalCenter").modal("hide");
						 			});
								}
							}
						});
					} else {
						$("#exampleModalCenter").modal("show");
						$("#close").text("현재 페이지 유지");
			 			$("#modalText").text("로그인 먼저 시도해주세요.");
			 			$("#cartIns").hide();
			 			$("#login").show();
			 			$("#shoping").hide();
			 			$("#login").click(function(){
			 				location.href="/camping/member/login";
			 			});
			 			$("#close").click(function(){
			 				$("#exampleModalCenter").modal("hide");
			 			});
					}
				}
			});
		});
		var objects = "${fn:length(objects)}";
		$(".nofixed").hide();
		if(objects < 1) {
			$(".nofixed").show();
		}
	});
</script>
<div>
	<div class="logoimg">
		<img alt="로고 오류" src="${pageContext.request.contextPath}/img/logo.png">
	</div>
	<div class="categorybox">
		<ul class="category">
			<li>
				<a href="/camping/object">텐트</a>
			</li>           
			<li>
				<a href="#">테이블 / 캠핑의자</a>
			</li>           
			<li>
				<a href="#" >침낭 / 매트</a>
			</li>
			<li>
				<a href="#" >식기 / 조리기구</a>
			</li>
			<li>
				<a href="#" >조명 / 랜턴</a>
			</li>
			<li>
				<a href="#" >바비큐</a>
			</li>
			<li>
				<a href="#" >캠핑용 공구</a>
			</li>
			<li>
				<a href="#" >수납 / 손수레</a>
			</li>
		</ul>
	</div>
	<div class="path">
		<div class="link">
			<i class="bi bi-house-door-fill"></i>
			<span>&nbsp;</span><a href="/camping/">HOME</a><span>&nbsp;</span>
			<i class="fas fa-angle-right"></i>
			<span>&nbsp;</span><a href="/camping/object">캠핑용품</a><span>&nbsp;</span>
			<i class="fas fa-angle-right"></i>
			<span>&nbsp;</span><a href="/camping/object">텐트</a><span>&nbsp;</span>
		</div>
		<div class="objinfo">
			<div>
				<div class="img">
					<img src="${obj.camping_image}" alt="오류"/>
				</div>
				<div class="info">
					<div>
						<table class="infotb">
						<col width="40%">
							<tr><th colspan="2">${obj.camping_name}</th></tr>
							<tr><td>판매가</td><td><fmt:formatNumber value="${obj.camping_price}" pattern="#,###"/>원</td></tr>
							<tr><td>수량</td>
								<td>
									<form id="cntFrm" method="post" onsubmit="return false">
										<div class="input-group count" >
											<i class="fas fa-minus" id="minus"></i>
											<input type="number" name="cnt" min="1" value="1" id="cnt" class="form-control"/>
											<i class="fas fa-plus" id="plus"></i>
										</div>
									</form>
							</td></tr>
							<tr><td>총 상품금액</td><td><span id="tot"><fmt:formatNumber value="${obj.camping_price}" pattern="#,###"/></span>원</td></tr>
						</table>
					</div>
					<table class="infobtn" >
						<tr>
							<td><button type="button" id="cart" class="btn btn-light">장바구니</button></td>
							<td><button type="button" id="pay" class="btn btn-primary">바로구매</button></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="detailimg">
			<img src="${obj.camping_image_detail}" alt="오류"/>
		</div>
	</div>
</div>
<div class="scroll">
	<div>
		<button id="top" class="button"><i class="bi bi-chevron-up"></i></button>
		<button id="bottom" class="button"><i class="bi bi-chevron-down"></i></button>
	</div>
</div>
<div class="fixedbox">
	<div>
		<div class="fixedcart">
			<div>
				<span>CART</span>
				<div class="cartcnt">
					<a href="/camping/mypage/cart">${cartCnt}</a>
				</div>
			</div>
		</div>
		<div class="fixedcon">
			<div class="nofixed">
				<i class="bi bi-emoji-smile"></i>
				<span>오늘 조회한</span>
				<span>상품이 없습니다!</span>
			</div>
			<c:if test="${fn:length(objects)-1 >= 0}">
				<div class="fixedtext">
					<span>최근 본 상품</span>
				</div>
				<c:forEach var="i" begin="0" end="${fn:length(objects)-1}">
					<div onclick="getDetail('${objects[i].camping_name}')" class="fixedlist">
						<img src="${objects[i].camping_image}" alt="오류" />
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
	    	<div class="modal-body">
	 			<div class="modal-title" id="exampleModalLongTitle"><span id="modalText"></span></div>
			</div>
			<div class="modal-footer" id="modal-footer">
	    		<button type="button" class="btn btn-secondary" id="close"></button>
	   	    	<button type="button" class="btn btn-primary" id="login">로그인 페이지 이동</button>
	    	    <button type="button" class="btn btn-primary" id="cartIns">장바구니 페이지 이동</button>
	    	    <button type="button" class="btn btn-primary" id="shoping">계속 쇼핑하기</button>
	    	</div>
		</div>
	</div>
</div>