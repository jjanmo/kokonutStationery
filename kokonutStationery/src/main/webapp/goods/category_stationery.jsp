<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/goods_list.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/goods_list.js"></script>

<!-- 배너 -->
<div class="bnr_area">
	<div class="bnr_img_wrap category_stationery">
		<img src="../image/category_stationery.png" alt="stationery" width="100%" >
	</div>
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
			<a id="sort_name" href="/baemin/goods/goods_list.do?category=5">
				<span class="sort_subject">이름순</span>
			</a>
			<span class="dot">·</span>
			<a id="sort_desc" href="/baemin/goods/goods_list.do?category=6">
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
		<div class="product">
			<div class="product_img">
				<img class="product_img" src="../image/masking_tape.jpg">
			</div>
			<div class="product_contents">
				<div class="product_name_div">
					<span class="product_name">서디페. 마스킹 테이프</span>
				</div>
				<div class="product_price_div">
					<div class="product_status status_new"></div>
				 	<span class="product_price">6,000</span>
				</div>
			</div>
		</div>
	</div>
</div>


