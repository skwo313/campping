<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>CampPing</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/object.css">
<script type="text/javascript">
	$(document).ready(function(){
		var keyword = "${keyword}";
		if(keyword=="") {
			$("#searchRst").hide();
		}
		$("#new").click(function() {
			var sort = "Newest"
			if(keyword=="") {
				location.href="/camping/object?sort="+sort;				
			} else {
				location.href="/camping/object?sort="+sort+"&keyword="+keyword;								
			}
		});
		$("#max").click(function() {
			var sort = "Max";
			if(keyword=="") {
				location.href="/camping/object?sort="+sort;				
			} else {
				location.href="/camping/object?sort="+sort+"&keyword="+keyword;
			}
		});
		$("#min").click(function() {
			var sort = "Min";
			if(keyword=="") {
				location.href="/camping/object?sort="+sort;
			} else {
				location.href="/camping/object?sort="+sort+"&keyword="+keyword;
			}
		});
		var objects = "${fn:length(objects)}";
		$(".nofixed").hide();
		if(objects < 1) {
			$(".nofixed").show();
		}
	});
	
	function getDetail(name) {
		name = encodeURIComponent(name);
		location.href="/camping/object/detail?name="+name;
	}
</script>
<div>
	<div class="logoimg">
		<img alt="로고 오류" src="${pageContext.request.contextPath}/img/logo.png">
	</div>
	<nav class="categorybox">
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
	</nav>
	<div class="path">
		<div class="link">
			<i class="bi bi-house-door-fill"></i>
			<span>&nbsp;</span><a href="/camping/">HOME</a><span>&nbsp;</span>
			<i class="fas fa-angle-right"></i>
			<span>&nbsp;</span><a href="/camping/object">캠핑용품</a><span>&nbsp;</span>
			<i class="fas fa-angle-right"></i>
			<span>&nbsp;</span><a href="/camping/object">텐트</a><span>&nbsp;</span>
		</div>
		<div class="ssbox">
			<div class="sortbox">
				<span class="sort" id="new">최신순</span>
				<span>&nbsp;|&nbsp;</span>
				<span class="sort" id="min">낮은 가격순</span>
				<span>&nbsp;|&nbsp;</span>
				<span class="sort" id="max">높은 가격순</span>
			</div>
			<div>
				<form class="input-group" id="search">
					<input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="상품명을 입력하세요."/>
					<button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-search"></i></button>
				</form>
			</div>
		</div>
		<div id="searchRst">
			<i class="fas fa-search"></i><span>&nbsp;</span><span class="textbold">${keyword}</span><span>&nbsp;검색결과 :&nbsp;</span><span class="textbold">${searchCnt}</span><span>건</span>
		</div>
		<div class="objectbox">
			<c:forEach var="object" items="${objlist}">
				<div onclick="getDetail('${object.camping_name}')">
					<table class="object">
							<tr><td><img src="${object.camping_image}" alt="오류"/></td></tr>
							<tr><td>${object.camping_name}</td></tr>
							<tr><td><fmt:formatNumber value="${object.camping_price}" pattern="#,###"/>원</td></tr>
					</table>
				</div>
	    	</c:forEach>
		</div>
		<div class="paging">		
			<c:if test="${paging.startPage != 1}">
				<c:choose>
					<c:when test="${!empty keyword && sort!=null}"><a href="/camping/object?sort=${sort}&keyword=${keyword}&nowPage=${paging.startPage-1}">&lt;</a></c:when>
					<c:when test="${!empty keyword}"><a href="/camping/object?keyword=${keyword}&nowPage=${paging.startPage-1}">&lt;</a></c:when>
					<c:when test="${sort!=null}"><a href="/camping/object?sort=${sort}&nowPage=${paging.startPage-1}">&lt;</a></c:when>
					<c:otherwise><a href="/camping/object?nowPage=${paging.startPage-1}">&lt;</a></c:otherwise>
				</c:choose>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>&nbsp;${p}&nbsp;</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<c:choose>
							<c:when test="${!empty keyword && sort!=null}"><a href="/camping/object?sort=${sort}&keyword=${keyword}&nowPage=${p}">&nbsp;${p}&nbsp;</a></c:when>
							<c:when test="${!empty keyword}"><a href="/camping/object?keyword=${keyword}&nowPage=${p}">&nbsp;${p}&nbsp;</a></c:when>
							<c:when test="${sort!=null}"><a href="/camping/object?sort=${sort}&nowPage=${p}">&nbsp;${p}&nbsp;</a></c:when>
							<c:otherwise><a href="/camping/object?nowPage=${p}">&nbsp;${p}&nbsp;</a></c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<c:choose>
					<c:when test="${!empty keyword && sort!=null}"><a href="/camping/object?sort=${sort}&keyword=${keyword}&nowPage=${paging.endPage+1}">&gt;</a></c:when>
					<c:when test="${!empty keyword}"><a href="/camping/object?keyword=${keyword}&nowPage=${paging.endPage+1}">&gt;</a></c:when>
					<c:when test="${sort!=null}"><a href="/camping/object?sort=${sort}&nowPage=${paging.endPage+1}">&gt;</a></c:when>
					<c:otherwise><a href="/camping/object?&nowPage=${paging.endPage+1}">&gt;</a></c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>
</div>
<div class="fixedbox">
	<div>
		<div class="fixedcart">
			<div>
				<span>CART</span>
				<div class="cartcnt">
					<span>${cartCnt}</span>
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