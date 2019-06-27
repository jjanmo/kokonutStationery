<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="../css/goods_list.css">

<!-- 배너 -->
<div class="bnr_area">
	<div class="bnr_img_wrap category_dc"></div>
</div>

<!-- 깜짝세일 카운트다운 부분 -->
<br><br>
<div id="count">
	<ul id="countDown">
		<li><span class="days">00</span></li>
		<li class="seperator">일</li>
	  	<li><span class="hours">00</span></li>
		<li class="seperator">시간</li>
		<li><span class="minutes">00</span></li>
		<li class="seperator">분</li>
		<li><span class="seconds">00</span></li>
		<li class="seperator">초</li>
	</ul>
</div>
<!-- 카운트다운 끝! -->

<!-- 상품 리스트 -->
<div class="contents_area no_cate_bar">
	<div class="product_list">
    <!-- 상품 한개(반복) -->
		<c:forEach var="list" items="${list}">
			<div class="product">
				<div class="product_img" 
					 style="background-image: url(<c:out value="${list.thumbImg}"/>); background-size: 100%;">
				</div>
				<div class="product_contents">
					<div class="product_name_div">
						<span class="product_name"><c:out value="${list.productName}"/></span>
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

				  		<span class="product_price"><c:out value="${list.discountPrice}"/></span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js" ></script>
<script src="../js/jquery.countdown.min.js" type="text/javascript"></script>
<script type="text/javascript">
//카운트다운 영역
jQuery('#countDown').countdown({
	date: '07/10/2019 23:59:59',
	offset: 9,
	day: 'Day',
	days: 'Days'
});
</script>
