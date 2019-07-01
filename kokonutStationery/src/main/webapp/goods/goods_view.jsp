<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOKONUT STATIONERY</title>
<link rel="stylesheet" href="../css/goods_view.css?alert">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_view.js?alert"></script>
</head>
<body>
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
						<select class="item_contents_select" name="option">
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
									style="border: 1px solid #DDD; width: 47px; text-align: center; height: 42px; padding-right: 5px; font-weight: 500;">
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
				</div>

				<div id="goods_buttons">
					<div class="main_button">구매하기</div>
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
				<div>
					<div class="userPage_area" id="review_01">
						<div class="userPage_subject">
							후후후후후 간지 폭발 스티커 감사합니다 &nbsp; <img src="../image/file_icon.png"
								style="width: 18px; height: 18px; vertical-align: middle;">
						</div>
						<div class="userPage_name">uela13**</div>
						<div class="userPage_date">2017.11.10</div>
					</div>
					<br>
					<div class="userPage_content" id="review_01_content">
						<img src="http://store.baemin.com/shop/data/review/RV0000008371"
							style="width: 60%;"> <br>
						<br> 보드 새로 장만하신 분께 선물로 드렸는데<br> 완전 행복해하시네여 +_+<br>
						더 사드릴걸 그랬습니다 껄껄<br>
						<button class="review_reply_btn">답변</button>
						<br>
					</div>
					<div class="userPage_area" id="review_02">
						<div class="userPage_subject">
							<span style="color: #2AC1BC; font-weight: 700;">답변 : </span>[배민문방구]
							답변드립니다.
						</div>
						<div class="userPage_name">admin</div>
						<div class="userPage_date">2017.11.10</div>
					</div>
					<div class="userPage_content" id="review_02_content">
						안녕하세요, 고객님 : )<br> 배민문방구입니다.<br>
						<br> 보드에 쓰실 생각을 하시다니!!!!!<br> 넘나 예쁠 것 같은 것 ///_// 껄껄<br>
						오늘 하루도 재미있고 행복한 하루 보내세요~<br>
						<br> 감사합니다.<br> 배민문방구 드림.<br>
					</div>
					<div class="userPage_paging"></div>
					<div class="userPage_buttons">
						<a href="/kokonutStationery/goods/goods_review.do">
							<li id="review_list_btn" class="userPage_sub_button">목록</li>
						</a>
							<li id="review_regist_btn" class="userPage_main_button">작성</li>
					</div>
					<div class="userPage_paging_num">
						<b>1</b>
					</div>
				</div>

			</div>
			<!--상품문의 -->
			<div id="goodsQnaDiv">
				<div class="userPage_div">
					<p>문의</p>
				</div>
				
				<div>
				<c:forEach var="list" items="${list}">
				
					<div class="userPage_area" id="qna_01">
						<div class="userPage_subject">
							<span style="color: #2AC1BC; font-weight: 700;">질문 : </span>
							${list.qnaboardSubject } 
							<c:if test="${list.secret==1}">
								<img src="../image/private_lock.gif">
							</c:if>
						</div>
						<div class="userPage_name">${list.userId }</div>
						<div class="userPage_date">${list.regDate }</div>
					</div>
					<br>
					<c:if test="${list.secret==1}">
						<div class="userPage_content userPage_private_lock"
							id="qna_01_content">비밀글입니다.
						</div>
					</c:if>
					<c:if test="${list.secret==0}">
						<div class="userPage_content userPage_private_lock"
							id="qna_01_content">${list.qnaboardSubject}
						</div>
					</c:if>
					
					<!-- 
					<div class="userPage_area" id="qna_01">
						<div class="userPage_subject">
							<span style="color: #2AC1BC; font-weight: 700;">질문 : </span>일등석
							스티커 <img src="../image/private_lock.gif">
						</div>
						<div class="userPage_name">ㄱㅈㅇ</div>
						<div class="userPage_date">2017-08-30</div>
					</div>
					<br>
					<div class="userPage_content userPage_private_lock"
						id="qna_01_content">비밀글입니다.
					</div>
					
					<div class="userPage_area" id="qna_02">
						<div class="userPage_subject">
							<span style="color: #2AC1BC; font-weight: 700;">답변 : </span>[배민문방구]
							문의 답변드립니다. <img src="../image/private_lock.gif">
						</div>
						<div class="userPage_name">admin</div>
						<div class="userPage_date">2017-08-30</div>
					</div>
					<div class="userPage_content userPage_private_lock"
						id="qna_02_content">비밀글입니다.
					</div>
					-->
					</c:forEach>
					
					<div class="userPage_paging"></div>
					<div class="userPage_buttons">
						<a href="/kokonutStationery/goods/goods_qna.do">
							<li id="qna_list_btn" class="userPage_sub_button">목록</li>
						</a>
						<li id="qna_regist_btn" class="userPage_main_button">작성</li>
					</div>
					<div class="userPage_paging_num">
						<b>1</b>
					</div> 
				
				</div>
				
				
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var option = ${goodsDTO.productOption};
var productQty = $('#productQty').val();
var productCode = ${goodsDTO.productCode};
var originalPrice = ${goodsDTO.originalPrice};
var discountPrice = ${goodsDTO.discountPrice};

$(document).ready(function(){
	var memId = ${sessionScope.memId};
	
	//문의 작성 페이지 띄우기
	$('#qna_regist_btn').click(function(){
		
		alert(memId);
		window.open("/kokonutStationery/goods/goods_qna_register.do?productCode="+productCode, "_blank", "left=320, width=890, height=750");
		
	});
});

$(function() {
	//세일상품과 세일아닌상품 가격표시
	if(originalPrice == discountPrice){
		$('#originalPrice').css('display','none');
	}

	//옵션이 없을때
	if (option == 0) {
		$('#noOptionDiv').css('display', 'block');
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
					$('select').append($('<option>' + item.optionContent + '</option>'));
				});
			}
		});

		/* 옵션 script 추가중 2019-06-30 */
		var selArray =  new Array();
		var length = $('#optionBox option').length - 1 ;
		var notOption = $('#optionBox option:eq(0)').val();
	
		$('#optionBox').change(function(){
			var sel = $('#optionBox option:selected').val();

			if(sel == notOption){
				return;
			} else {
				for(var array of selArray) {
					if(array==$('#optionBox option:selected').val()) {
						alert("이미 추가된 옵션입니다.");
						break;
					} //if
				} //for
				
				selArray.push(sel);
				
				/*		
			 	<div id="option_selectedDiv">
					<div id="option_contentDiv">
						노트_아 저는 뭐
					</div>
						
					<div style="float: left;">
						<input type="text" name="productQty" id="option_productQty" step="1" min="1" max="0" size="2" value="1">
					</div>
					
					<div style="float: left; padding-left: 3px;">
						<div style="padding: 10px 0 3px 0;">
							<img id="up" src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_up.png"
										 style="cursor: pointer; width: 14px; margin: 3px 2px;">
						</div>
						
						<div>
							<img id="down" src="http://store.baemin.com/shop/data/exskin/btn_multioption_ea_down.png"
										   style="cursor: pointer; width: 14px; margin: 3px 2px;">
						</div>
					</div>
					
					<div style="float: left; margin: 22px 0 22px 25px;">
						<span style="font-size: 13px; color: #444; font-weight: 500;">
							2,500원
						</span>
					</div>
					
					<img src="http://store.baemin.com/shop/data/exskin/btn_multioption_del.png"
						 style="cursor: pointer; float: right; margin: 25px 20px 25px 15px; width: 15px; height: 14px;">
						 
				</div>
				
				<div id="option_totalPriceDiv">
					총 금액&ensp;:&ensp;<span style="font-size: 22px; color: #333; font-weight: 600;">2,500원</span>
				</div>
				*/
				
			} //else
		}); //function
	
	}//else
});

//숫자가 아닌경우  유효성검사 필요
$('#productQty').focusout(function() {
	var input = $('#productQty').val();
	if (isNaN(input)) {
		alert("구매수량은 숫자만 가능합니다");
	}
	$('#productQty').val("1");
});

//수량 변경 : 증가
$('#up').click(function() {
	productQty++;
	$('#productQty').val(productQty);
});

//수량 변경 : 감소   
$('#down').click(function() {
	if (productQty > 1) {
		productQty--;
		$('#productQty').val(productQty);
	}
});

//장바구니페이지
$('#cartBtn').click(function(){
	location.href = "/kokonutStationery/goods/goods_cart.do";
});


</script>
</html>