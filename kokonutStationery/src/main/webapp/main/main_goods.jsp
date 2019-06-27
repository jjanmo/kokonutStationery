<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
/* 
<!-- 카운트다운 부분 -->
#count{width:100%; background:#ffffff;}
 ul#countDown {
     width:500px; height:125px;
     list-style: none;
     text-align: center;
     margin:auto;
   }
   ul#countDown li { float:left;}

  ul#countDown li span {
     font-size: 65px;
     font-weight: 300;
     line-height: 80px;
     color:#fbba13;
     font-family:"맑은 고딕",arial, san-serif;
   }
   ul#countDown li.seperator {
     font-size: 55px;
     line-height: 70px;
     vertical-align: top; margin:0 30px;
     color:#fbba13;
   }
   ul#countDown li p {
     color: #000000;
     font-size: 11px;
     font-family:"맑은 고딕",arial, san-serif;
   }
<!-- 카운트다운 끝 -->
 */
#contents_area {
  width: 100%;
  height: 100%;
}

.product_list {
  width: 1000px;
  height: 100%;
  margin: 0 auto;
}

.product {
  width: 225px;
  height: 380px;
  padding: 10px 10px 20px;
  margin: 0 auto;
  display: inline-block;
}

.product_img {
  width: 100%;
  height: 270px;
  margin: 0 auto;
}

.product_contents {
  width: 100%;
  height: 55px;
  padding: 13px 0px 40px;
  font-size: 13px;
  font-weight: bold;
}

.product_name_div {
  padding-bottom: 3px;
  margin-bottom: 10px;
}

.product_price_div {
  text-align: right;
  text-decoration: underline;
}


</style>
<!-- 
깜짝세일 카운트다운 부분
<div id="count">
	<ul id="countDown">
		<li><span class="days">00</span><p>DAY</p></li>
		<li class="seperator">:</li>
	  	<li><span class="hours">00</span><p>HOURS</p></li>
		<li class="seperator">:</li>
		<li><span class="minutes">00</span><p>MINS</p></li>
		<li class="seperator">:</li>
		<li><span class="seconds">00</span><p>SECONDS</p></li>
	</ul>
</div>
카운트다운 끝!
 -->
<div id="contents_area">
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

