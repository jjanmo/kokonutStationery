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
				<span>${stationery}</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_living.do">
				<span class="category_name">리빙</span>&ensp;
				<span>${living}</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_travel.do">
				<span class="category_name">여행</span>&ensp;
				<span>${travel}</span>
			</a>&emsp;&ensp;
			<a href="/kokonutStationery/goods/category_collabo.do">
				<span class="category_name">콜라보레이션</span>&ensp;
				<span>${collabo}</span>
			</a>
		</div>
		<div id="sort_area">
			<a id="sort_name" href="/kokonutStationery/goods/category_stationery.do?sort=name">
				<span class="sort_subject">이름순</span>
			</a>
			<span class="dot">·</span>
			<a id="sort_desc" href="/kokonutStationery/goods/category_stationery.do?sort=price_desc">
				<span class="sort_subject">높은가격순</span>
			</a>
			<span class="dot">·</span>
			<a class="sort_asc" href="/kokonutStationery/goods/category_stationery.do?sort=price_asc">
				<span class="sort_subject">낮은가격순</span>
			</a>
		</div>
	</div>
</div>

<!-- 상품 리스트 -->
<div class="contents_area">
	<div class="product_list">
		<!-- 상품 한개(반복) -->
		<c:forEach var="list" items="${list}">
			<div class="product">
				<a href="/kokonutStationery/goods/goods_view.do?productCode=${list.productCode}"><div class="product_img" 
								 style="background-image: url(<c:url value='../image/thumb/${list.thumbImg}' />); 
								 		background-size: 100%;">
				</div></a>
				<div class="product_contents">
					<div class="product_name_div">
						<a href="/kokonutStationery/goods/goods_view.do?productCode=${list.productCode}"><span class="product_name"><c:out value="${list.productName}"/></span></a>
					</div>
					<div class="product_price_div">
					
						<c:if test="${list.discount==1}">
							<div class="product_status status_sale"></div>
							<span class="original_price"><c:out value="${list.originalPrice}"/></span>&nbsp;
						</c:if>
						
						<c:if test="${list.best==1}">
							<div class="product_status status_best"></div>
						</c:if>
						
						<c:if test="${list.newP==1}">
							<div class="product_status status_new"></div>
						</c:if>

				  		<a href="/kokonutStationery/goods/goods_view.do?productCode=${list.productCode}"><span class="product_price"><c:out value="${list.discountPrice}"/></span></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>

