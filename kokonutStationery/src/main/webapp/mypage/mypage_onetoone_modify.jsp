<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<link href="../css/mypage_onetoone_register.css" rel="stylesheet">
<link rel="stylesheet" href="../css/mypage.css">
</head>

<body>
<div class="onetoone_register_top">
	1:1 문의 작성하기
	<img id="close_btn_img" src="../image/btn_multioption_del_2.png">
</div>

<div class="order_Number_search" style="display:none;">
	<input type="hidden" id="pg" name="pg" value="${pg }">
	<input type="hidden" id="onetooneCode" value="${onetooneDTO.onetooneCode}">
	<p style="margin-top: 30px; font-size: 18px; text-align: center;">
		<strong>문의하실 주문번호를 선택하세요.</strong>
	</p>
	<img id="hide_btn_img" src="../image/btn_multioption_del.png" style="cursor: pointer;">
	
	<table cellspacing="0" id="orderListTable" style="width: 96%; margin: 10px 10px; font-size:12px; font-weight:600;">
		<tr id="table_top">
			<td width="107px">주문번호</td>
			<td width="64px">주문일자</td>
			<td width="280px">상품명</td>
			<td width="52px">수량</td>
			<td width="130px">주문금액</td>
			<td width="15px"></td>
		</tr>
	</table>
	<br>
	<div id="orderCodePagingDiv" align="center"></div>
	<br><br><br><br>
</div>

<form id="onetoone_regForm">
<div class="onetoone_register_center">
	<div id="onetoone_register_mid">
		<table width="110%" cellpadding="5" cellspacing="10" border="0">
			<colgroup>
				<col width="15%" align="right">
			</colgroup>
			<tr>
				<td class="id_text" width="30px">아이디</td>
				<td class="mem_id">
					${memId}
					<input type="hidden" name="userId" value="${memId}">	
				</td>			
			</tr>
		
			<tr>
				<td class="qNa_type">질문유형</td>
				<td><!-- select name 불문명-->
					<select class="qNa_select" id="questionType" name="type">
						<option value="${onetooneDTO.questionType}">상담내용을 선택하세요.</option>
						<option>배송지연/불만</option>
						<option>반품문의</option>
						<option>A/S문의</option>
						<option>환불문의</option>
						<option>주문결제문의</option>
						<option>회원정보문의</option>
						<option>취소문의</option>
						<option>교환문의</option>
						<option>상품정보문의</option>
						<option>기타문의</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<td class="order_number">주문번호</td>
				<td>
					<input class="orderNumber_Input" type="text" name="orderCode" id="orderCode" value="${onetooneDTO.orderCode}">
					<button type="button" class="order_Number_Btn" id="order_Number_Btn" style="text-align: center; font-size: 12px;">
						주문조회
					</button>
				</td>
			</tr>
		
			<tr>
				<td class="email_td">이메일</td>
				<td>
					<input type="text" name="email" class="mem_email"  id="email" >
				</td>
			</tr>
			
			<tr>
				<td class="message_td">문자메시지</td>
				<td>
					<input type="text" name="tel1" class="tel_input" id="tel1">
					-
					<input type="text" name="tel2" class="tel_input" id="tel2">
					-
					<input type="text" name="tel3" class="tel_input" id="tel3">
					
				</td>
			</tr>
			
			<tr>
				<td class="onetoone_register_subject" >제목</td>
				<td>
					<input type="text" name="subject" class="subject_input" id="subject" value="${onetooneDTO.subject}">
				</td>
			</tr>
			
			<tr>
				<td class="onetoone_register_content" >내용</td>
				<td>
					<textarea name="contents" class="content_textarea" id="contents" >${onetooneDTO.contents}</textarea>
				</td>
			</tr>
		</table>
	
		<table width="100%">
		  <tr>
		    <td align="center" style="padding-top:20; width: 590px; height:76px;">
		    <input type="button" class="confirm_btn" value="확인">
		  </td>
		</tr>
		</table>
	</div>
</div>
</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript">
//유효성 검사 후 데이터 전송
$('.confirm_btn').click(function(){
	if($('.qNa_select').val()=='') {
		alert('상담내용을 선택하세요.');
	} else if($('.subject_input').val()=='') {
		alert('제목을 입력하세요.');
	} else if($('.content_textarea').val()=='') {
		alert('내용을 입력하세요.');
	} else {
		$.ajax({
			type: 'POST',
			url: '/kokonutStationery/onetoone/onetoone_modify.do',
			data: {'userId'	   : '${memId}',
				   'userName'  : '${memName}',
				   'userEmail' : $('#email').val(),
				   'questionType' : $('#questionType option:selected').val(),
				   'subject'   : $('#subject').val(),
				   'contents'  : $('#contents').val(),
				   'orderCode' : $('#orderCode').val(),
				   'userPhone' : $('#tel1').val()+$('#tel2').val()+$('#tel3').val(),
				   'onetooneCode' : $('#onetooneCode').val() },
			success: function() {
				alert('수정되었습니다.');
				opener.location.reload();
				window.close();
			}
		});
	}
});


$(function(){
	//주문 리스트 출력
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/onetoone/getOrderList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				
				var orderProductName="";		
				var orderProductAmount = 0; //총 상품 구매 종류 : 이름별
				var totalPurchaseQty = 0; 	//총 구매 상품 수량
				
				$.ajax({
					type : 'post',
					async: false,
					url : '/kokonutStationery/onetoone/getOrderProduct.do',
					data : {'orderCode' : items.orderCode},
					dataType : 'json',
					success : function(pData){
						//alert(JSON.stringify(pData));
						
						$.each(pData.pName, function(pIndex, pItems){
							if(orderProductAmount==0){
								orderProductName = pItems.productName;
								orderProductAmount++;
								totalPurchaseQty += pItems.purchaseQty;

							}
							else{
								orderProductAmount++;
								totalPurchaseQty += pItems.purchaseQty;
							}
						});//each
					}//success
				});
				
				var year = items.orderDate.substr(2,2);
				var month = items.orderDate.substr(5,2);
				var day = items.orderDate.substr(8,2);
				var date = year+"-"+month+"-"+day;
				
				$('<tr/>', {
					class : 'orderList_tr'
					}).append($('<td/>',{
						align : 'center',
						id : 'order_code1',
						text  : items.orderCode
					})).append($('<td/>', {
						align : 'center',
						id : 'order_date',
						text : date
					})).append($('<td/>', {
						align : 'center',
						id : 'product_name'+index, 
						text : orderProductName + ' 포함 ' + orderProductAmount + ' 건'
					})).append($('<td/>', {
						align : 'center',
						id : 'purchaseQty',
						text : totalPurchaseQty
					})).append($('<td/>', {
						align : 'center',
						text : items.totalPayment+' 원'
					})).append($('<td/>',{
						align : 'center'
						}).append($('<input/>',{
							type : 'radio',
							name : 'select',							
							class : 'select',
							id : items.orderCode
							}))).appendTo($('#orderListTable'));
			});//each
			
			//페이징 생성
			$('#orderCodePagingDiv').html(data.orderCodePaging.pagingHTML);
			
		}//success

	});//ajax	
});


//주문조회 라디오버튼 클릭 이벤트
$(document).on('click','.select', function(){
	$('#orderCode').val("");
	var order_code = $(this).attr('id');
	//alert(order_code);
	$('#orderCode').val(order_code);
	$('.order_Number_search').toggle();
});

//주문조회 보이기
$('#order_Number_Btn').click(function(){
	$('.order_Number_search').toggle();
});

//주문조회 없애기
$('#hide_btn_img').click(function(){
	$('.order_Number_search').toggle();
});

</script>
</html>
