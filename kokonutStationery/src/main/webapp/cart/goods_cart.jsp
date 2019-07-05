<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="../css/goods_cart.css" rel="stylesheet">

<!-- sub_Wa start -->
<div class="sub_Wa">
	<!-- indiv start -->
	<div class="indiv" style="margin: 135px 10px 0 20px;">
		<div class="cart_title">장바구니</div>
		<form name="CartForm" method="post">
			<input type="hidden" name="mode" value="modItem">
			
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="cartTable" style="margin-top: 15px;">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="">
					<col width="12%">
					<col width="10%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				
				<tr>
					<th class="cart_select" style="cursor: pointer; border-top: 1px solid #999;" >선택</th>
					<th class="goodsInfo" colspan="2" style="text-align: left;">상품정보</th>
					<th class="sellPrice">판매가</th>
					<th class="sellQty">수량</th>
					<th class="sellDelivery">배송비</th>
					<th class="Total">합계</th>
				</tr>

				<c:set var="total" value="0" />
				<c:if test="${list.size()!=0}"> 
					<c:forEach var="cartDTO" items="${list }">
					<c:set var="total" value="${total + cartDTO.discountPrice * cartDTO.productQty }" />
					<c:set var="cnt" value="${cnt+1}" />
					<input type="hidden" id="productCode${cnt}" value="${cartDTO.productCode}">
					<input type="hidden" id="productName${cnt}" value="${cartDTO.productName}">
					<input type="hidden" id="productOption${cnt}" value="${cartDTO.productOption}">
					<input type="hidden" id="thumbImg${cnt}" value="${cartDTO.thumbImg}">
					<input type="hidden" id="discountPrice${cnt}" value="${cartDTO.discountPrice}">
					<input type="hidden" id="optionContent${cnt}" value="${cartDTO.optionContent}">

						<tr>
							<td id="cart_checkbox" style="vertical-align: top; padding: 30px 17px;">
								<input type="checkbox" name="cartCheckbox" class="checkbox${cnt}" checked>
							</td>

							<td style="vertical-align: top; padding: 30px 17px;">
								<a href="" style="margin-bottom: 0;">
								<img src="../image/thumb/${cartDTO.thumbImg }" width="70px" onerror=""></a>
							</td>

							<td class="orderOption" style="text-align: left; vertical-align: top; padding: 30px 0;">
								<div class="thumbImg">${cartDTO.productName}</div>
							
								<!-- 선택옵션 내용 시작 -->
								<c:if test="${cartDTO.productOption==1}">
									<font style="font-weight:normal; font-size:12px; color:#666; line-height:23px; margin: 0 -104px 0;">
										&emsp;[&nbsp;${cartDTO.optionContent}&nbsp;]
									</font>
									<a href="goods_cart_edit.jsp" data-width="600" data-height="400" class="popup" 
									   style="margin-bottom: 0px; margin-top: 13px;">
										<li class="optionButton" style="margin: 26px 0 0;">선택옵션수정</li>
									</a>
								</c:if>
								
								<c:if test="${cartDTO.productOption==0 }">
									<a href="goods_cart_edit.jsp" data-width="600" data-height="400" class="popup" 
									   style="margin-bottom: 0px; margin-top: 13px;">
										<li class="optionButton">선택옵션수정</li>
									</a>
								</c:if>
								<!-- 선택옵션 내용 끝 -->
							</td>

							<td class="price"><f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice }" />원</td>
							
							<td style="vertical-align: top; padding: 22px 0 30px 0;">
								<table cellpadding="0" cellspacing="0" border="0" style="margin: 0 auto;">
									<tr>
										<td style="padding: 0; height: 0px; border: 0">
											<div style="float: left;">
												<input type="text" name="productQty" id="productQty" step="1" min="1" max="0" size="2" 
													   value="${cartDTO.productQty }" class="line" 
													   style="border: 1px solid #DDD; width: 40px; text-align: right; 
													   		  height: 38px; padding-right: 5px; font-weight: 500;"/>
											</div>
											<div style="float: left; padding-left: 3px;">
												<div style="padding: 1px 0 3px 0;">
													<img id="up" src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png" 
														 style="cursor: pointer; width: 14px;">
												</div>
												<div>
													<img id="down" src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png" 
														 style="cursor: pointer; width: 14px;">
												</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td style="padding: 10px 0 0 0; height: 0px; border: 0">
											<input type="submit" value="수정" class="sub-button-xs" 
												   style="text-align: center; font-weight: bold; width: 65px; height: 30px; 
												   		  line-height: 30px; padding: 0; float: right; font-weight: 500;">
										</td>
									</tr>
								</table>
							</td>
							
							<td rowspan="1" style="text-align: center; background: #fff; color: #333; padding-top: 30px; 
												   vertical-align: top; border-left: 1px solid #ebebeb; border-right: 1px solid #ebebeb;">
								<div id="deliveryState">기본배송</div>
							</td>
							
							<td style="vertical-align: top; color: #333; text-align: right; padding: 30px 0; font-weight: 700; padding-right: 20px;">
								<f:formatNumber pattern="###,###,###" value="${cartDTO.discountPrice * cartDTO.productQty }" />원
							</td>	
						</tr>
					</c:forEach>
				</c:if>
					
				<!-- 상품합계 부분 시작 -->
				<tr>
					<td colspan="10" style="padding: 30px 0;">
						<table width="100%" cellpadding="0" cellspacing="0" class="totalPriceArea">
							<tr class="totalPrice" style="padding-right: 0px;">
								<td style="border: none;">
									<font style="color: #333; font-weight: 500;">
										상품합계금액 (배송비 별도)
									</font>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<font style="font-family: 'Montserrat', sans-serif; font-size: 24px; color: #2ac1bc; font-weight: 700;">
										<c:if test="${list.size()==0}">
											0
										</c:if>
										<c:if test="${list.size()!=0}">
											<f:formatNumber pattern="###,###,###" value="${total}"/>
										</c:if>
									</font>
									<font style="font-size: 15px; color: #2ac1bc; font-weight: 700;">
										원
									</font>
								</td>
							</tr>
						</table>		
					</td>
				</tr>
				<!-- 상품합계 부분 끝 -->					
			</table>
		</form>


		<!-- 버튼 부분 -->
		<!-- 장바구니 리스트가 없을 때 -->
		<c:if test="${list.size()==0}"> 
			<div class="cart_button">
				<div class="none_previous subButton-xs" style="width: 140px; margin: 31px 0px -60px 260px;">
					이전으로
				</div>
				<div class="none_allDelete subButton-xs" style="width: 140px; margin: 0px 469px 0 412px;">
					비우기
				</div>
				<div class="shopContinue main-button-s" style="width: 140px; margin: -59px 564px 0px;">
					쇼핑계속하기
				</div>
			</div>
		</c:if>
		
		<!-- 장바구니 리스트가 있을 때 -->
		<c:if test="${list.size()!=0}"> 
			<table width="100%" cellpadding="0" cellspacing="0" border="0" class="order_btn" style="padding: 30px 0 0 0;">
				<tr>
					<td>
						<div>
							<div class="previous" style="width: 140px; display: inline-block;">
								<a href=""><li class="subButton subButton-xs">이전으로</li></a>
							</div>
							<div class="selectDelete" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="" onfocus="blur()"><li class="subButton subButton-xs">선택 삭제</li></a>
							</div>
							<div class="allDelete" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#"><li class="subButton subButton-xs">비우기</li></a>
							</div>
							<div class="" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#" ><li class="subButton subButton-xs">쇼핑 계속하기</li></a>
							</div>
							<div class="selectLike" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#" ><li class="subButton subButton-xs">선택 찜하기</li></a>
							</div>
							<div class="selectOrder" style="width: 140px; display: inline-block; padding-left: 5px;">
								<a href="#"><li class="main-button-s">선택 주문하기</li></a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
	<!-- indiv end -->
</div>
<!-- sub_Wa end -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
//체크박스
/* function checkAll(){
	var check = document.getElementsByName("check");
	if(document.getElementById("all").checked) {
		for(i=0; i<check.length; i++){
			check[i].checked = true;
		}
	} else {
		for(i=0; i<check.length; i++) {
			check[i].checked = false;
		}
	}
}; */

$('.cart_select').click(function() {
	if($('.cart_select').hasClass('checkedAll')) {
		$('input[name=cartCheckbox]').prop('checked', false);
		$('.cart_select').removeClass('checkedAll');
				
	} else {
		$('input[name=cartCheckbox]').prop('checked', true);
		$('.cart_select').addClass('checkedAll');
	}	
});


//팝업창
$(function(){
	$('.popup').click(function(event){
		var href = $(this).attr('href');
		var width = $(this).attr('data-width');
		var height = $(this).attr('data-height');
				   
		//팝업창 생성
		window.open(href,'popup','width=350, height=500');
		
		//기본이벤트 제거
		event.preventDefault();
	}); 
});


//수량 변경
var qty = $('#productQty').val();

$('#up').click(function() {
	qty++;
	$('#productQty').val(qty);
});
   
$('#down').click(function(){
	if(qty > 1) {
		qty--;
		$('#productQty').val(qty);
	}
});
   
   
//장바구니 삭제
$('.selectDelete').click(function(){
	var productCode = '';
	var optionContent = '';
	
	alert("삭제");
	for(var i=1; i<=$('input[name=cartCheckbox]').length; i++) {
		if($('.checkbox'+i).is(':checked')) {
			productCode = $('#productCode'+i).val();
		
			if($('#productOption'+i).val()==0) { //옵션이 없을 때
				optionContent = 'none';
			} else { //옵션이 있을 때
				optionContent = $('#optionContent'+i).val();
			}
					
			$.ajax({
				type: 'post',
				url: '/kokonutStationery/cart/deleteCart.do',
				data: {'userId': '${memId}', 
					   'productCode' : productCode,
					   'optionContent' : optionContent}
			});
		} //if; 체크 유무 확인
	} //for
	
	//새로고침
	location.href='/kokonutStationery/cart/goods_cart.do';
});


//선택 찜하기
$('.selectLike').click(function(){
	var productCode = '';
	var productName = '';
	var productOption = '';
	var thumbImg = '';
	var discountPrice = '';
	var optionContent = '';
	
	//선택된 것을 확인
	for(var i=1; i<=$('input[name=cartCheckbox]').length; i++) {
		if($('.checkbox'+i).is(':checked')) {
			productCode = $('#productCode'+i).val();
			productName = $('#productName'+i).val();
			productOption = $('#productOption'+i).val();
			thumbImg = $('#thumbImg'+i).val();
			discountPrice = $('#discountPrice'+i).val();

			if($('#productOption'+i).val()==0) { //옵션이 없을 때
				optionContent = 'none';
			} else { //옵션이 있을 때
				optionContent = $('#optionContent'+i).val();
			}
			
			$.ajax({	
				type: 'post',
				url: '/kokonutStationery/mypage/setWishList.do',
				data: {'userId': '${memId}',
					   'productCode': productCode,
					   'productName': productName,
					   'productOption': productOption,
					   'thumbImg': thumbImg,
					   'discountPrice': discountPrice,
					   'optionContent': optionContent},
				success: function(){
					location.href='/kokonutStationery/mypage/mypage_wishlist.do';
				}
			});
		} //if; 체크 유무 확인
	} //for
});

</script>






