<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/mypage_wishlist.css">

<div class="wishlist_content">
	<div class="wishlist_title">찜목록</div>
	
	<table class="wishlist_table">
		<colgroup>
			<col width="8%">
			<col>
			<col width="10%">
			<col width="14%">
			<col width="16%">
		</colgroup>
		
		<tr id="wishlist_top">
			<th id="wishlist_select" class="" style="cursor: pointer;">선택</th>
			<th id="wishlist_info">상품정보</th>
			<th id="savepoint">적립금</th>
			<th id="">판매가</th>
			<th id="">보관일</th>
		</tr>
		
		<c:forEach var="list" items="${list}">
		<tr id="wishlist_middle">
			<td id="wishilist_checkbox">
				<input type="checkbox" name="wishCheckbox" class="checkbox">
			</td>
			
			<td id="wishlist_img">
				<a href="">
					<img src="../image/thumb/${list.thumbImg }" style="width: 70px; height: 86px; float: left;">
				</a>
				<a href="">
					<div style="float: left;">
						&emsp;${list.productName }<br>
						<c:if test="${list.productOption==1 }">
							<font style="font-weight:normal; font-size:12px; color:#666; line-height:23px;">
								&emsp;[&nbsp;${list.optionContent }&nbsp;]
							</font>
						</c:if>
					</div>
				</a>

			</td>
			
			<td id="wishlist_savepoint">
				<fmt:formatNumber value="${list.discountPrice/10 }" pattern="###"/>원
			</td>
			
			<td id="wishlist_price">
				<fmt:formatNumber value="${list.discountPrice }" pattern="##,###"/>원
			</td>
			
			<td id="wishlist_storedate">
				<fmt:formatDate value="${list.logdate }" pattern="yyyy.MM.dd"/>
			</td>
		</tr>
		</c:forEach>
	</table>

	<div class="pageDiv">1</div>
	<br>
	<div class="wishlist_button">
		<div class="delete_button white_btn" id="wishlistDeleteBtn">선택 삭제</div>
		<div class="putcart_button black_btn" id="cartBtn">장바구니 담기</div>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//전체 선택 해제
$('#wishlist_select').click(function(){
	if($('#wishlist_select').hasClass('checkedAll')) {
		$('.checkbox').prop('checked', false);
		$('#wishlist_select').removeClass('checkedAll');
	} else {
		$('.checkbox').prop('checked', true);
		$('#wishlist_select').addClass('checkedAll');
	}
});

//선택 삭제
$('#wishlistDeleteBtn').click(function(){
	
});
</script>

