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
			<c:set var="cnt" value="${cnt+1}" />
			<input type="hidden" id="productCode${cnt}" value="${list.productCode}">
			<input type="hidden" id="productOption${cnt}" value="${list.productOption}">
			<input type="hidden" id="optionContent${cnt}" value="${list.optionContent}">
			
			<tr id="wishlist_middle">
				<td id="wishilist_checkbox">
					<input type="checkbox" name="wishCheckbox" class="checkbox${cnt}">
				</td>
				
				<td id="wishlist_img">
					<a href="/kokonutStationery/goods/goods_view.do?productCode=${list.productCode}">
						<img src="../image/thumb/${list.thumbImg}" style="width: 70px; height: 86px; float: left;">
					</a>
					<a href="/kokonutStationery/goods/goods_view.do?productCode=${list.productCode}">
						<div style="float: left;">
							&emsp;${list.productName}<br>
							<c:if test="${list.productOption==1}">
								<font style="font-weight:normal; font-size:12px; color:#666; line-height:23px;">
									&emsp;[&nbsp;${list.optionContent}&nbsp;]
								</font>
							</c:if>
						</div>
					</a>
	
				</td>
				
				<td id="wishlist_savepoint">
					<fmt:formatNumber value="${list.discountPrice/10}" pattern="###"/>원
				</td>
				
				<td id="wishlist_price">
					<fmt:formatNumber value="${list.discountPrice}" pattern="##,###"/>원
				</td>
				
				<td id="wishlist_storedate">
					<fmt:formatDate value="${list.logdate}" pattern="yyyy.MM.dd"/>
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
//전체 선택/해제
$('#wishlist_select').click(function(){
	if($('#wishlist_select').hasClass('checkedAll')) {
		$('input[name=wishCheckbox]').prop('checked', false);
		$('#wishlist_select').removeClass('checkedAll');
		
	} else {
		$('input[name=wishCheckbox]').prop('checked', true);
		$('#wishlist_select').addClass('checkedAll');
	}
	
});

//선택 삭제
$('#wishlistDeleteBtn').click(function(){
	var productCode = '';
	var optionContent = '';
	
	for(var i=1; i<=$('input[name=wishCheckbox]').length; i++) {
		if($('.checkbox'+i).is(':checked')) {
			productCode = $('#productCode'+i).val();
			
			if($('#productOption'+i).val()==0) { //옵션이 없을 때
				optionContent = 'none';
			} else { //옵션이 있을 때
				optionContent = $('#optionContent'+i).val();
			}
			
			$.ajax({
				type: 'post',
				url: '/kokonutStationery/mypage/deleteWishList.do',
				data: {'userId': '${memId}', 
					   'productCode' : productCode,
					   'optionContent' : optionContent}
			});
		} //if; 체크 유무 확인
	} //for
	
	//새로고침
	location.href='/kokonutStationery/mypage/mypage_wishlist.do';
});
</script>

