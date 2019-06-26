<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
</style> -->
<link rel="stylesheet" type="text/css" href="../css/goods_list.css">
</head>
<body>
<!-- 배너 -->
<div class="bnr_area">
	<div class="bnr_img_wrap category_dc"></div>
</div>

<!-- 깜짝세일 카운트다운 부분 -->
<div id="count">
	<ul id="countDown">
		<li><span class="days">00</span><p>일</p></li>
		<li class="seperator">일</li>
	  	<li><span class="hours">00</span><p>시간</p></li>
		<li class="seperator">시간</li>
		<li><span class="minutes">00</span><p>분</p></li>
		<li class="seperator">분</li>
		<li><span class="seconds">00</span><p>초</p></li>
		<li class="seperator">초</li>
	</ul>
</div>
<!-- 카운트다운 끝! -->

<!-- 상품 리스트 -->
<div class="contents_area no_cate_bar">
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
          <span class="product_price">6,000</span>
        </div>
      </div>
    </div>
	</div>
</div>

</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js" ></script>
<script src="../js/jquery.countdown.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/goods_list.js"></script>
<script>
//카운트다운 영역
jQuery('#countDown').countdown({
	date: '06/20/2019 23:59:59',
	offset: 9,
	day: 'Day',
	days: 'Days'
});
</script>
</html>


