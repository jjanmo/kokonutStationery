<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="../css/goods_list.css">

<!-- 배너 -->
<div class="bnr_area">
	<div class="bnr_img_wrap category_stationery"></div>
</div>

<!-- 카테고리바 -->
<div id="contents_bar">
	<div id="container">
		<div id="category_area">
			<a href="/kokonutStationery/goods/category_stationery.do">
				<span class="category_name selected">문구</span>&ensp;
				<span>50</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_living.do">
				<span class="category_name">리빙</span>&ensp;
				<span>39</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_travel.do">
				<span class="category_name">여행</span>&ensp;
				<span>12</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_collabo.do">
				<span class="category_name">콜라보레이션</span>&ensp;
				<span>29</span>
			</a>
		</div>
		<div id="sort_area">
			<a id="sort_name" href="#">
				<span class="sort_subject">이름순</span>
			</a>
			<span class="dot">·</span>
			<a id="sort_desc" href="#">
				<span class="sort_subject">높은가격순</span>
			</a>
			<span class="dot">·</span>
			<a class="sort_asc" href="#">
				<span class="sort_subject">낮은가격순</span>
			</a>
		</div>
	</div>
</div>

<!-- 상품 리스트 -->
<div class="contents_area">
	<div class="product_list">
		<!-- 상품 한개(반복) -->
		<!-- <div class="product">
			<div class="product_img" 
				 style="background-image: url(http://store.baemin.com/shop/data/goods/1552366615385s0.jpg); 
				 		background-size: 100%;">
			</div>
			<div class="product_contents">
				<div class="product_name_div">
					<span class="product_name">서디페. 마스킹 테이프</span>
				</div>
				<div class="product_price_div">
					<div class="product_status status_new"></div>
					<span class="original_price">10,000</span>
				  	<span class="product_price">6,000</span>
				</div>
			</div>
		</div> -->
		
		<c:forEach var="list" items="${list}">
			<div class="product">
				<div class="product_img" 
					 style="background-image: url('<c:out value="${list.thumbImg}"/>'); background-size: 100%;">
				</div>
				<div class="product_contents">
					<div class="product_name_div">
						<span class="product_name"><c:out value="${list.productName}"/></span>
					</div>
					<div class="product_price_div">
						<div class="product_status status_new"></div>
						<span class="original_price"><c:out value="${list.originalPrice}"/></span>
				  		<span class="product_price"><c:out value="${list.discountPrice}"/></span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/goods_list.js"></script>

