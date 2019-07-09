<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/goods_view.css?alert">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_view.js?alert"></script>

<input type="hidden" id="goodsDTO" value="${goodsDTO}">
	<div id="main">

		<!-- 전체 div -->
		<div id="goodsView_area">
			<!-- 상품 소개 페이지 -->
			<div id="goods_main">
				<div id="goods_image">
					<img src="../image/thumb/${goodsDTO.thumbImg }" width="400">
				</div>
				<div id="goods_subject">
					<div>
						<b name="productName" style="font-size: 20pt; font-weight: 700;">${goodsDTO.productName}</b>
					</div>
					<div style="padding: 17px;"></div>
					<div>
						<div class="items">판매가격</div>
						<div class="item_contents" name="discountPrice"
							style="font-size: 15px; font-weight: 700;">
							<del id="originalPrice" style="font-size: 13px; font-weight: 400; color: #999999;">${goodsDTO.originalPrice}</del>
							${goodsDTO.discountPrice}원
						</div>
					</div>
					<div>
						<div class="items">원산지</div>
						<div class="item_contents" name="origin">${goodsDTO.origin}</div>
					</div>
					<div>
						<div class="items">제조사</div>
						<div class="item_contents" name="manufacturer">${goodsDTO.manufacturer}</div>
					</div>

					<div id="optionDiv" style="margin-top: 3px; display: none;">
						<div class="items" style="padding: 5px 0;">종류</div>
						<select id="optionBox" class="item_contents_select" name="option">
							<option>옵션을 선택하세요</option>
						</select>
					</div>
					
					<!-- 옵션 div 추가-->
					<div class="option_wrap"></div>
										
					<!-- 수량 선택 div -->
					<div id="noOptionDiv" style="margin-top: 3px; display: none;">
						<div class="items" style="padding: 5px 0;">구매수량</div>
						<div class="item_contents">
							<div style="float: left;">
								<input type="text" name="productQty" id="productQty" step="1"
									min="1" max="0" size="2" value="1"
									style="border: 1px solid #DDD; width: 47px; text-align: center; height: 42px; padding-right: 5px; font-weight: 500;" />
							</div>

							<div style="float: left; padding-left: 3px;">
								<div style="padding: 1px 0 3px 0;">
									<img id="up"
										src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png"
										style="cursor: pointer; width: 14px; margin: 3px 2px;">
								</div>
								<div>
									<img id="down"
										src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png"
										style="cursor: pointer; width: 14px; margin: 3px 2px;">
								</div>
							</div>
							<div
								style="padding-left: 5px; line-height: 38px; margin: 10px 0;">개</div>
						</div>
					</div>
									
					<!-- 총 합계금액 div -->
					<div id="totalPriceDiv">
					총 금액&ensp;:&ensp;<span id="priceSpan" style="font-size: 22px; color: #333; font-weight: 600;">${goodsDTO.discountPrice}</span>
					<span>&ensp;원</span>
					</div>
					
				</div>

				<div id="goods_buttons">
					<div id="orderBtn" class="main_button">구매하기</div>
					<div id="cartBtn" class="sub_button" style="border-right: none; float: left;">장바구니</div>
					<div id="wishlistBtn" class="sub_button" style="float: right;">찜하기</div>
				</div>
				<div style="width: 100%; height: 60px; display: inline-block;"></div>
			</div>
			<div style="width: 100%; height: 60px;"></div>
			<!-- 상품 소개 페이지 끝 -->

			<!-- 배송 안내 및 교환/환불 안내  -->
			<div id="goods_content">
				<img src="../image/detailed/${goodsDTO.detailedImg }" name="detailedImg" />
			</div>
			<div id="goods_content">
				<div id="goods_information">
					<div id="delivery_information">
						<div class="information_subject">배송 관련 안내</div>
						<div class="information_contents">
							- 당일 오후 2시 결제건에 한해 당일발송됩니다.<br> - CJ대한통운 택배로 발송됩니다."<br>
							- 배송비는 2,500원입니다. (3만원 이상 구매시 무료배송)<br> - 더 자세한 내용은 공지사항의
							'배송안내' 를 참고 하시기 바랍니다. <a href=""
								style="color: #2AC1BC; text-decoration: underline;">배송안내
								보러가기</a><br>
						</div>
					</div>
					<div style="padding: 10px;"></div>
					<div id="exchange_information">
						<div class="information_subject">교환 및 환불 안내</div>
						<div class="information_contents">
							- 상품수령일로부터 7일 이내에 반품/교환/취소가 가능합니다.<br> - 상품의 하자 및 오배송 등의 사유로
							교환, 환불진행시 배송비용은 배민문방구에서 부담합니다.<br> - 단순변심으로 인한 교환, 반품을 하실 경우
							반송비용은 고객님께서 부담하셔야 합니다.<br> - 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이
							불가합니다.<br> - 교환, 환불 신청은 1:1 문의게시판에 남기거나, 고객센터(1670-9902)로
							전화주세요.<br>
						</div>
					</div>
				</div>
			</div>

			<!--상품후기 -->
			<div id="goodsReviewDiv">
				<div class="userPage_div">
					<p>후기</p>
				</div>
				<div id="reviewList">
					
					
				</div>
				
				<div class="userPage_paging"></div>
				<div class="userPage_buttons">
					<a href="/kokonutStationery/review/goods_review.do">
						<li id="review_list_btn" class="userPage_sub_button">목록</li>
					</a>
						<li id="review_regist_btn" class="userPage_main_button">작성</li>
				</div>
				<div class="userPage_paging_num">
				</div>


			</div>
			<!--상품문의 -->
			<div id="goodsQnaDiv">
				<div class="userPage_div">
					<p>문의</p>
				</div>
				
				<div id="qnaList">
					
					
				</div>
				
				<div class="userPage_paging"></div>
					<div class="userPage_buttons">
						<a href="/kokonutStationery/qna/goods_qna.do">
							<li id="qna_list_btn" class="userPage_sub_button">목록</li>
						</a>
						<li id="qna_regist_btn" class="userPage_main_button">작성</li>
					</div>
					<div class="userPage_paging_num">
						<!-- <b></b> -->
					</div> 
			</div>
			
		</div>
	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var userId = "${memId}";
var option = ${goodsDTO.productOption};
var productQty = $('#productQty').val();
var productCode = ${goodsDTO.productCode};
var originalPrice = ${goodsDTO.originalPrice};
var discountPrice = ${goodsDTO.discountPrice};
var showDiv = 0;

//alert("productCode : "+ productCode);

//구매하기(주문하기)버튼 클릭 이벤트 : order.jsp이동
$('#orderBtn').click(function(){
	var orderProductQty = $('#productQty').val();
	if(option == 0){ //옵션이 없는 경우
		if(userId==""){
			if(confirm("로그인하지 않으셨습니다. 비회원으로 진행하시겠습니까?")){
				location.href="/kokonutStationery/order/orderNoOption.do?productCode="+productCode
				+"&productQty="+productQty;
			}
		}else{
			location.href="/kokonutStationery/order/orderNoOption.do?productCode="+productCode
																	+"&productQty="+orderProductQty;
		}													
	}
	else { //옵션이 있는 경우
		if(selArray.length == 0){
			alert("종류 선택하세요");
		}
		else{
			//옵션마다 선택된 수량
			var qtyArray = $('.option_productQty');
			for(i = 0; i <qtyArray.length; i++){
				var ct = qtyArray[i].value;
				ct = ct*1;
				productQtyArray.push(ct);
			}
			if(userId==""){
				if(confirm("로그인하지 않으셨습니다. 비회원으로 진행하시겠습니까?")){
					location.href="/kokonutStationery/order/orderOption.do?productCode="+productCode
																+"&selArray="+selArray
																+"&productQtyArray="+productQtyArray;
				}
			}else{
				location.href="/kokonutStationery/order/orderOption.do?productCode="+productCode
																		+"&selArray="+selArray
																		+"&productQtyArray="+productQtyArray;
			}												
		}	
	}
});

//문의 작성 페이지 띄우기
$('#qna_regist_btn').click(function(){
	window.open("/kokonutStationery/qna/goods_qna_register.do?productCode="+productCode, "_blank", "left=320, width=890, height=750");
});

//후기 작성 페이지 띄우기
$('#review_regist_btn').click(function(){
	window.open("/kokonutStationery/review/goods_review_register.do?productCode="+productCode, "_blank", "left=320, width=890, height=750");
});

//옵션 tag 생성 및 옵션 div 생성
$(function() {

	//alert(option);
	//세일상품과 세일아닌상품 가격표시
	if(originalPrice == discountPrice){
		$('#originalPrice').css('display','none');
	}

	//옵션이 없을때
	if (option == 0) {
		$('#noOptionDiv').css('display', 'block');
		$('#totalPriceDiv').css('display','block');
	}

	//옵션이 있을때
	else { //option == 1
		$('#optionDiv').css('display', 'block');

		//옵션 출력
		$.ajax({
			type : 'get',
			url : '/kokonutStationery/goods/getOption.do',
			data : {'productCode' : productCode},
			dataType : 'json',
			success : function(data) {
				$.each(data.list, function(index, item) {
					//$('select').append($('<option>' + item.optionContent + '</option>'));
					$('select').append($('<option>',{
						class:item.optionCode,
						text:item.optionContent
					}));
				});
			}
		});
		
	}//else

});

//옵션내용을 배열로 담은 것
var selArray =  new Array();
//옵션에대한 상품의 수를 배열로 담은 것 
var productQtyArray = new Array();

var notOption = $('#optionBox option:eq(0)').val();
var sel = $('#optionBox option:selected').val();

$('#optionBox').change(function(){
	var length = $('#optionBox option').length - 1 ; //option의 개수
	var sel = $('#optionBox option:selected').val();
	//var optionCode = $('#optionBox option:selected').attr('class');
	
	if(showDiv == 0){ //옵션이 있을때 합계금액이 떠오르게 하는것
		$('#totalPriceDiv').css('display','block');
		showDiv++;
	}
	
	if(sel == notOption){ //"옵션을 선택하세요" 를 선택
		return;
	} 
	
	else {//'제대로된' 옵션을 선택한 경우
		if(selArray.length == length ){//옵션을 모두 한번씩 다 선택한 경우
		   alert("이미 추가된 옵션입니다.");
		   return;
		}
		if(selArray.length == 0 ) {//옵션을 처음 선택한 경우
		    selArray.push(sel);
		    createDiv(sel);
		    
		  	//옵션div가 생성될때 총합변화	
			changeTotalPrice();		
		    return;
		}
		var cnt = 0;
	    for(i=0;i<selArray.length; i++){
	      if(selArray[i] == sel){
            alert("이미 추가된 옵션입니다.");
            break;
          }
	      cnt++;
	    }
		if(cnt == selArray.length){
	        selArray.push(sel);
	        createDiv(sel);
	    }
	} //else
	
	//옵션div가 생성될때 총합변화	
	changeTotalPrice();	
	
}); //function

var optionCnt = 0;
function createDiv(sel){
	$('.option_wrap').append($('<div/>',{
	  class : 'option_selectedDiv',
	  id : optionCnt
	}));
	
	$('#'+optionCnt).append($('<div/>',{
	  text : sel,
	  id : 'option_contentDiv'
	}));
	$('#'+optionCnt).append($('<div/>',{ 
	  id : 'inputDiv' + optionCnt
	}).css('float','left'));
	
	$('#inputDiv'+ optionCnt).append($('<input>',{
	  type : 'text',
	  class : 'option_productQty',
	  id : 'option_productQty'+ optionCnt,
	  step : '1',
	  min : '1',
	  max : '0',
	  size :'2',
	  value : '1'}));
	/* 
	//옵션코드
	$('#inputDiv'+ optionCnt).append($('<input>',{
	  type : 'hidden',
	  class : 'optionCode',
	  id : 'optionCode'+ optionCnt,
	  value : optionCode})); */
	
	$('#'+optionCnt).append($('<div/>',{
	  id : 'updownDiv'+ optionCnt,
	  style : "float: left; padding-left: 3px;"
	}).append($('<div/>',{
	  style : "padding: 10px 0 3px 0;"
	}).append($('<img>',{
	  id : 'up'+optionCnt,
	  class : 'up',
	  src : 'http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png',
	  style : "cursor: pointer; width: 14px; margin: 3px 2px;"
	}))));
	
	$('#updownDiv'+optionCnt).append($('<div>').append($('<img>',{
	  id :'down'+optionCnt,
	  class : 'down',
	  src : 'http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png',
	  style : 'cursor: pointer; width: 14px; margin: 3px 2px;'
	})));
	
	$('#'+optionCnt).append($('<div/>',{
	  id : 'priceDiv' +optionCnt,
	  style : 'float: left; margin: 22px 0 22px 25px;'
	}).append($('<span/>',{
		id : 'priceSpan'+optionCnt,
	  style: 'font-size: 13px; color: #444; font-weight: 500;',
	  text : discountPrice
	})));
	
	$('#priceDiv'+optionCnt).append($('<span/>',{
		text : '원'
	}));
	
	$('#'+optionCnt).append($('<img>',{
	  class : 'close',
	  id : optionCnt,
	  src : 'http://store.baemin.com/shop/data/exskin/btn_multioption_del.png',
	  style : 'cursor: pointer; float: right; margin: 25px 20px 25px 15px; width: 15px; height: 14px;'
	}));
	optionCnt++;
}

//옵션div가 생성될때 총합변화	
function changeTotalPrice(){
	var total1 = 0;
	//alert('optionCnt : ' + optionCnt);
	for(i=0; i<optionCnt; i++){
		var num = $('#priceSpan'+i).text()*1
		total1 += num;
	}
	$('#priceSpan').text(total1);
}


//option div 지우기
$(document).on('click','.close', function(){
	var number = $(this).attr('id');
	var text = $('#'+number).children().first().text();
	//alert(text);
	//옵션div가 지워질때 총합변화
	var total2 = $('#priceSpan').text();
	var pp = $('#priceSpan'+number).text()*1;
	total2 -= pp;
	$('#priceSpan').text(total2);
	
	//div삭제
	$('#'+ number).remove();
	
	//배열안에서 그에 맞는 옵션을 지워줘야함
	selArray.splice(selArray.indexOf(text),1);
	
	
/* 	if(selArray.length == 0){
		$('#totalPriceDiv').css('display','none');
		$('#priceSpan').text(0);
		showDiv = 0;
	} */
	
	//optionCnt초기화
	if(selArray.length == 0){
		optionCnt = 0;
	}
});

//옵션있을때 
////숫자가 아닌경우  유효성검사 필요
$(document).on('focusout','.option_productQty',function() {
	
	var idText = $(this).attr('id');	
	
	var optionNum = idText.charAt(idText.length-1); 
	//alert(optionNum);
	
	//옵션코드값
	var optionContent = $(this).parent().siblings('#option_contentDiv').text();
	//alert(optionContent);
	//옵션한개의 가격
	var OnepriceSpan = $(this).parent().siblings('#priceDiv'+optionNum).children('#priceSpan'+optionNum);
	
	var input = $('#option_productQty'+optionNum).val();
	
	if (isNaN(input)==true) {
		alert("구매 수량은 숫자만 가능합니다.");
		$('#option_productQty'+optionNum).val("1");
		OnepriceSpan.text(discountPrice*1);
		
	}else if(isNaN(input)==false){
		$('#option_productQty'+optionNum).val(input);
		//OnepriceSpan.text(discountPrice*input);		
		checkOptionStock(optionContent,productCode,$('#option_productQty'+ optionNum),OnepriceSpan);
	}
	//토탈가격
	var total = 0;
	for(i=0; i<selArray.length; i++){
		var num = $('#priceSpan'+i).text()*1
		total += num;
	}
	$('#priceSpan').text(total);
});

//수량 변경 : 증가
$(document).on('click','.up', function() {
	var idText = $(this).attr('id');
	var optionNum = idText.charAt(idText.length-1); 
	var option_productQty = $('#option_productQty'+ optionNum).val();
	option_productQty++;
	$('#option_productQty'+ optionNum).val(option_productQty);
	$('#priceSpan'+ optionNum).text(discountPrice * option_productQty);
	
	//옵션코드값
	var optionContent = $(this).parent().parent().siblings('#option_contentDiv').text();
	//alert(optionContent);
	//옵션한개의 가격
	var OnepriceSpan = $(this).parent().siblings('#priceDiv'+optionNum).children('#priceSpan'+optionNum);
	checkOptionStock(optionContent,productCode,$('#option_productQty'+ optionNum),OnepriceSpan);
	
	/* var total = 0;
	for(i=0; i<selArray.length; i++){
		var num = $('#priceSpan'+i).text()*1
		total += num;
	}
	$('#priceSpan').text(total); */
}); 

//수량 변경 : 감소   
$(document).on('click','.down', function() {
	var idText = $(this).attr('id');
	var optionNum = idText.charAt(idText.length-1); 
	var option_productQty = $('#option_productQty'+ optionNum).val();
	if (option_productQty > 1) {
		option_productQty--;
		$('#option_productQty'+ optionNum).val(option_productQty);
		$('#priceSpan'+ optionNum).text(discountPrice * option_productQty);
		var total = $('#priceSpan').text()*1;
		//alert(total);
		total -= discountPrice;
		$('#priceSpan').text(total);
	}
});

//옵션있는 상품 재고파악 
function checkOptionStock(optionContent,productCode,input,OnepriceSpan){
	$.ajax({
		type:'POST',
		url:'../admin/checkOptionStock.do',
		data:{'optionContent':optionContent,
			'productCode':productCode,
			'input':input.val()},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			if(data.result=='ok'){
				//개별가격입력
				OnepriceSpan.text(discountPrice*input.val());	
				
			}else if(data.result=='fail'){
				alert("${goodsDTO.productName} 상품의 잔여 재고는 "+data.stock+"개입니다");
				input.val(1);
				OnepriceSpan.text(discountPrice*1);	
			}
			//토탈가격
			var total = 0;
			for(i=0; i<selArray.length; i++){
				var num = $('#priceSpan'+i).text()*1
				total += num;
			}
			$('#priceSpan').text(total);
		}
	});
	
}

//---------------------
//옵션없을때
//숫자가 아닌경우  유효성검사 필요
$('#productQty').focusout(function() {
	var input = $('#productQty').val();
	
	if (isNaN(input)==true) {
		alert("구매 수량은 숫자만 가능합니다.");
		$('#productQty').val("1");
		$('#priceSpan').text(discountPrice*1);
	}else if(isNaN(input)==false){
		$('#productQty').val(input);
		checkStock(productCode,$('#productQty'));
				
	}
	
});

//수량 변경 : 증가
$('#up').click(function() {
	var input = $('#productQty').val();
	input++;
	$('#productQty').val(input);
	//$('#priceSpan').text(discountPrice*input);
	checkStock(productCode,$('#productQty'));
}); 

//수량 변경 : 감소   
$('#down').click(function() {
	var input = $('#productQty').val();
	if (input > 1) {
		input--;
		$('#productQty').val(input);
		$('#priceSpan').text(discountPrice * input);
		//checkStock(productCode,input);
	}
});

//옵션없는 상품 재고파악 
function checkStock(productCode,input){
	$.ajax({
		type:'POST',
		url:'../admin/checkStock.do',
		data:{'productCode':productCode,
			'input':input.val()},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			if(data.result=='ok'){
				$('#priceSpan').text(discountPrice*input.val());
				
			}else if(data.result=='fail'){
				alert("${goodsDTO.productName} 상품의 잔여 재고는 "+data.stock+"개입니다");
				input.val(1);
				$('#priceSpan').text(discountPrice*1);
			}
		}
	});
	
}

//장바구니 추가
$('#cartBtn').click(function(){
	//alert("cart");
	if(option==0) { //옵션이 없을 때
		$.ajax({	
			type: 'post',
			url: '/kokonutStationery/cart/goods_cart_insert.do',
			data: {'userId': '${memId}',
				   'userEmail' : '${memEmail}',
				   'productCode': '${goodsDTO.productCode}',
				   'productName': '${goodsDTO.productName}',
				   'productOption': '${goodsDTO.productOption}',
				   'thumbImg': '${goodsDTO.thumbImg}',
				   'discountPrice': '${goodsDTO.discountPrice}',
				   'productQty' : $('#productQty').val(),
				   'optionContent': 'none'
				   }
		}); //ajax
	} else { //옵션이 있을 때
		for(var i=0; i<selArray.length; i++) {
			$.ajax({	
				type: 'post',
				url: '/kokonutStationery/cart/goods_cart_insert.do',
				data: {'userId': '${memId}',
					   'userEmail' : '${memEmail}',
					   'productCode': '${goodsDTO.productCode}',
					   'productName': '${goodsDTO.productName}',
					   'productOption': '${goodsDTO.productOption}',
					   'thumbImg': '${goodsDTO.thumbImg}',
					   'discountPrice': '${goodsDTO.discountPrice}',
					   'productQty' : $('#productQty').val(),
					   'optionContent': selArray[i]
					   }
			}); //ajax
		} //for
	} //if~else
	//페이지 이동
	location.href = "/kokonutStationery/cart/goods_cart.do";
});

//찜목록
$('#wishlistBtn').click(function(){
	if('${memId}'=='') {
		alert('로그인하셔야 본 서비스를 이용하실 수 있습니다.');
		location.href='/kokonutStationery/user/loginForm.do';
	} else {
		if(option==0) { //옵션이 없을 때
			$.ajax({	
				type: 'post',
				url: '/kokonutStationery/mypage/setWishList.do',
				data: {'userId': '${memId}',
					   'productCode': '${goodsDTO.productCode}',
					   'productName': '${goodsDTO.productName}',
					   'productOption': '${goodsDTO.productOption}',
					   'thumbImg': '${goodsDTO.thumbImg}',
					   'discountPrice': '${goodsDTO.discountPrice}',
					   'optionContent': 'none'
					   },
				success: function(){
					location.href='/kokonutStationery/mypage/mypage_wishlist.do';
				}
			}); //ajax
		} else { //옵션이 있을 때
			if(selArray.length==0) {
				alert('종류 선택하세요.');
				return;
			} else {
				for(var i=0; i<selArray.length; i++) {
					$.ajax({	
						type: 'post',
						url: '/kokonutStationery/mypage/setWishList.do',
						data: {'userId': '${memId}',
							   'productCode': '${goodsDTO.productCode}',
							   'productName': '${goodsDTO.productName}',
							   'productOption': '${goodsDTO.productOption}',
							   'thumbImg': '${goodsDTO.thumbImg}',
							   'discountPrice': '${goodsDTO.discountPrice}',
							   'optionContent': selArray[i]
							   },
						success: function(){
							location.href='/kokonutStationery/mypage/mypage_wishlist.do';
						}
					}); //ajax
				} //for	
			} //if~else
		} //if~else
	} //if~else
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//상품 문의 리스트 띄우기
	$.ajax({
		type:'post',
		url:'../qna/goods_qnaList.do',
		data:{'productCode':productCode},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){
				$.each(data.list, function(index, item) {
					//////////////////질문///////////////////					
					if(item.admin==0){
						
						//제목틀생성
						$('#qnaList').append($('<div/>',{
							class: 'userPage_area',
							id : 'qna_'+index
							
							}).append($('<div/>',{
								id:'qnaSubject_'+index,
								class:'userPage_subject'
								
								}).append($('<span/>',{
									
									style:'color: #a0a0a0; font-weight: 700;',
									text:'질문 : '
									
								}))));
						 
						//제목이름
						$('#qnaSubject_'+index).append(item.qnaboardSubject);						
						
						//작성자
						$('#qna_'+index).append($('<div/>',{
							class:'userPage_name',
							text:item.userId
							
						}));
						
						//날짜
						$('#qna_'+index).append($('<div/>',{
							class:'userPage_date',
							text:item.regDate
							
						}));
						
						//내용
						$('#qnaList').append($('<div/>',{
							class:'userPage_content',
							id:'qna_'+index+'_content',
							style:'white-space: pre-wrap;',
							text:item.qnaboardContent
						}));
								
						//비밀글일때 
						if(item.secret==1){
							//잠금이미지 추가
							$('#qnaSubject_'+index).append($('<img>',{
								src:'../image/private_lock.gif'
							}));
							
							//비밀글일때 내용안보이게
							$('#qna_'+index+'_content').addClass('userPage_private_lock');
							$('#qna_'+index+'_content').text("비밀글입니다");
							
						}else if(item.secret==0){
							if(item.admin!=1){
								
							//삭제버튼
							$('#qna_'+index+'_content').append($('<input/>',{
								type:'button',
								onclick:'qnaDelete('+item.qnaboardCode+')',
								class:'qna_content_btn',
								id:'qna_delete_btn',
								style:'visibility:hidden;',
								value:'삭제'
							}));
							//수정버튼
							$('#qna_'+index+'_content').append($('<input/>',{
								type:'button',
								onclick:'qnaModify('+item.qnaboardCode+')',
								class:'qna_content_btn',
								id:'qna_modify_btn',
								style:'visibility:hidden;',
								value:'수정'
							}));
							
							}//if admin!=1
						}
						
					}else if(item.admin==1){						
						//////////////////답변///////////////////
						
						//제목틀
						$('#qnaList').append($('<div/>',{
							class: 'userPage_area',
							id : 'qna_'+index
							
							}).append($('<div/>',{
								id:'qnaSubject_'+index,
								class:'userPage_subject'
								
								}).append($('<span/>',{
									
									style:'color: #2AC1BC; font-weight: 700; padding-left:15px;',
									text:'답변 : '
									
								}))));
						
						//제목이름
						$('#qnaSubject_'+index).append(item.qnaboardSubject);						
						
						//작성자
						$('#qna_'+index).append($('<div/>',{
							class:'userPage_name',	
						}).append($('<img/>',{ // 관리자 이미지
							src : '../image/admin.gif'
						})));
						
						//날짜
						$('#qna_'+index).append($('<div/>',{
							class:'userPage_date',
							text:item.regDate
							
						}));
						
						//내용
						$('#qnaList').append($('<div/>',{
							class:'userPage_content',
							id:'qna_'+index+'_content',
							style:'white-space: pre-wrap;',
							text:item.qnaboardContent
						}));
						
						
						//비밀글일때 
						if(item.secret==1){
							//잠금이미지 추가
							$('#qnaSubject_'+index).append($('<img>',{
								src:'../image/private_lock.gif'
							}));
							
							//비밀글일때 내용안보이게
							$('#qna_'+index+'_content').addClass('userPage_private_lock');
							$('#qna_'+index+'_content').text("비밀글입니다");
						}
						
						
					}//관리자답변if
					
					//답변내용숨기기
					$('#qna_'+index+'_content').hide();
					//답변내용클릭시 보이게
					$('#qna_'+index).on('click', function(){
						
						$('#qna_'+index+'_content').slideToggle(function(){
							
							//var userId= $(this).parent().children('#qna_'+index).children('.userPage_name').text();
							var userId=item.userId;							
							var thisText = $(this).text();
							var thisContent = $(this);
							
							if(item.secret==0){
								//비밀글아닐때
								$.ajax({
									type:'get',
									url:'../user/checkSecret.do',
									data:{'userId':userId},
									success:function(data){
										//alert(data+" 내용은="+thisText);
										if(data=="ok"){
											thisContent.removeClass("userPage_private_lock");
											thisContent.children('input').css('visibility','visible');
											//thisContent.html(item.qnaboardContent);											
										}
									}									
								});								
							}else if(item.secret==1){
								var qnaboardCode = item.qnaboardCode;
								//비밀글일때
								$.ajax({
									type:'get',
									url:'../user/checkSecret.do',
									data:{'userId':userId},
									success:function(data){
										//alert(data+" 내용은="+thisText);
										if(data=="ok"){
											thisContent.removeClass("userPage_private_lock");
											thisContent.html(item.qnaboardContent);
											
											if(item.admin!=1){
											//삭제버튼
											$('#qna_'+index+'_content').append($('<input/>',{
												type:'button',
												onclick:'qnaDelete('+qnaboardCode+')',
												class:'qna_content_btn',
												id:'qna_delete_btn',
												value:'삭제'
											}));
											//수정버튼
											$('#qna_'+index+'_content').append($('<input/>',{
												type:'button',
												onclick:'qnaModify('+qnaboardCode+')',
												class:'qna_content_btn',
												id:'qna_modify_btn',
												value:'수정'
											}));
											}//if admin!=1
										}
									}
									
								});
																
								
							}//if문
							
							
						});//toggle
						
					});//내용이벤트
					

					
					//후기 문의 게시물 hover 이벤트
					$('.userPage_area').hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
				});//for문
				/*
				//페이징
				$('.qnaPage_paging_num').append($('<div/>',{
					html : data.qnaboardPaging.pagingHTML
				}));
				*/
			}//if - data문
			
		}//success
	});//ajax
	//상품문의 띄우기 끝
	
	
	//상품 후기 리스트 띄우기
	$.ajax({
		type:'post',
		url:'../review/goods_reviewList.do',
		data:{'productCode':productCode},
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			
			if(data!=null){
				$.each(data.list, function(index, item) {
					//////////////////후기///////////////////					
					
					//제목틀생성
					$('#reviewList').append($('<div/>',{
						class: 'userPage_area',
						id : 'review_'+index
						
						}).append($('<div/>',{
							id:'reviewSubject_'+index,
							class:'userPage_subject'
							})));
					 
					//제목이름
					$('#reviewSubject_'+index).append(item.reviewboardSubject);						
					
					//작성자
					$('#review_'+index).append($('<div/>',{
						class:'userPage_name',
						text:item.userId
						
					}));
					
					//날짜
					$('#review_'+index).append($('<div/>',{
						class:'userPage_date',
						text:item.regDate
						
					}));
					
					//내용
					$('#reviewList').append($('<div/>',{
						class:'userPage_content',
						id:'review_'+index+'_content',
						style:'white-space: pre-wrap;',
						text:item.reviewboardContent
					}));
							
					//삭제버튼
					$('#review_'+index+'_content').append($('<input/>',{
						type:'button',
						onclick:'reviewDelete('+item.reviewboardCode+')',
						class:'review_content_btn',
						id:'review_delete_btn',
						value:'삭제',
						style : 'display:none;'
					}));
					//수정버튼
					$('#review_'+index+'_content').append($('<input/>',{
						type:'button',
						onclick:'reviewModify('+item.reviewboardCode+')',
						class:'review_content_btn',
						id:'review_modify_btn',
						value:'수정',
						style : 'display:none;'
					}));
					
					
					//답변내용숨기기
					$('#review_'+index+'_content').hide();
					//답변내용클릭시 보이게
					$('#review_'+index).on('click', function(){
						if(userId==item.userId){
							$('.review_content_btn').css('display','block');
						}
						$('#review_'+index+'_content').slideToggle(function(){
						});//toggle		
					});//내용이벤트
					
					//후기 문의 게시물 hover 이벤트
					$('.userPage_area').hover(function(){
						$(this).css("background-color", "#f6f6f6");
					},function(){
						$(this).css("background-color", "#ffffff");
					});	
					
				});//each문
			}//if - data문 !=null			
		}//success
	});//ajax
	//상품 후기 띄우기 끝
	
});//document

function qnaModify(qnaboardCode){
	window.open("../qna/goods_qna_modify.do?qnaboardCode="+qnaboardCode, "_blank", "width=890, height=750");
}
function qnaDelete(qnaboardCode){
	if (confirm("문의를 삭제하시겠습니까??") == true){//확인
		var qnaboardCode = qnaboardCode;
		$.ajax({
			type:'post',
			url:'../qna/qnaboardDelete.do',
			data:{'qnaboardCode':qnaboardCode},
			success:function(){
				alert("삭제를 완료했습니다!");
				location.href="../goods/goods_view.do?productCode="+productCode;
			}
		});
	 }else{   //취소
	     return false;
	 }
}

function reviewModify(reviewboardCode){
	window.open("../review/goods_review_modify.do?reviewboardCode="+reviewboardCode, "_blank", "width=890, height=750");
}
function reviewDelete(reviewboardCode){
	if (confirm("후기를 삭제하시겠습니까??") == true){//확인
		var reviewboardCode = reviewboardCode;
		$.ajax({
			type:'post',
			url:'../review/reviewboardDelete.do',
			data:{'reviewboardCode':reviewboardCode},
			success:function(){
				alert("삭제를 완료했습니다!");
				location.href="../goods/goods_view.do?productCode="+productCode;
			}
		});
	 }else{   //취소
	     return false;
	 }
}


</script>
