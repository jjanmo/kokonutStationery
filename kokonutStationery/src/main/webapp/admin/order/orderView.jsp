<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세 페이지</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}
#orderView_info_table th{
	height: 30px;
	background-color: #f5f4f4;
}
#orderView_info_table td{
	height: 60px;
	padding: 0 5px;
}
.thumbImg{
	width: 100%;
	height: 90%;
	vertical-align: middle;
	
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	position:relative;
}
.thumbImg:hover{
	border: 0.1px solid black;	
	transform: scaleX(4) scaleY(5);
	-webkit-transform: scaleX(4) scaleY(5);
	-moz-transform: scaleX(4) scaleY(5);
	-ms-transform: scaleX(4) scaleY(5);
	-o-transform: scaleX(4) scaleY(5);
	z-index: 1;
}
.order_optionContent{
	font-size: 12px;
	color: #ccc;
}

#receiver_inform{
	border: 1px solid #d9dadc;
	width: 450px;
	height: 150px;
	background-color: #f5f4f4;
	font-size: 15px;
	line-height: 20px;
	float: left;
	padding: 20px;
	margin: 20px 0;
}

#order_totalPayment{
	border: 1px solid #d9dadc;
	width: 450px;
	height: 150px;
	background-color: #f5f4f4;
	text-align: right;
	font-size: 30px;
	line-height: 40px;
	float: right;
	padding: 20px;
	margin: 20px 0;
}
</style>
</head>
<body>
<form action="">
<input type="hidden" id="orderCode" value="${orderCode}">
<div id="main_wrap" style="width: 1000px; margin: 0 auto;">
	<div><h1 style="font-weight: normal;">주문상세</h1></div>
	<div style="width: 100%; margin-top: 10px; display: inline-block;"> 		
		<span style="width: 200px; float: left;">주문번호 : ${orderCode} </span>
		<span style="width: 230px; float: left;">주문자 : ${userDTO.userName}(${userDTO.userId })</span>
		<span style="float: left;">주문상태 : </span>&nbsp;
		<select id="order_state" style="width:100px; height: 20px; padding: 1px;">
			<option value="0">주문취소</option>
			<option value="1">주문접수</option>
			<option value="2">배송준비</option>
			<option value="3">배송중</option>
			<option value="4">배송완료</option>
			<option value="5">교환접수</option>
			<option value="6">교환완료</option>
			<option value="7">환불접수</option>
			<option value="8">환불완료</option>
			<option value="9">수령확인</option>
		</select>
		<input type="button" id="order_state_change" value="주문상태 갱신">
		<span style="width: 190px; float: right;">주문일 : ${orderDate }</span>
	</div>
	<div id="order_info" style="overflow: auto;">
		<table id="orderView_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 10px;">
			<tr>
				<th width="100">상품코드</th>
				<th width="100">상품이미지</th>
				<th width="500">상품이름</th>
				<th width="100">판매가</th>
				<th width="80">수량</th>
				<th width="120">합계</th>
				<th width="150">교환/환불요청</th>
			</tr>
		</table>	
		<div id="receiver_inform">
			<div style="font-size: 30px;">배송지 정보</div><br>
			<div>받으실분 : ${userDTO.receiverName}</div>
			<div>우편번호 : ${userDTO.receiverZipcode }</div>
			<div>상세주소 : ${userDTO.receiverAddr1} ${userDTO.receiverAddr2}</div>
			<div>연락처 : ${userDTO.receiverPhone1}-${userDTO.receiverPhone2}-${userDTO.receiverPhone3 }</div>
			<div>남기실말씀 : ${userDTO.deliveryMsg}</div>
		</div>
		<div id="order_totalPayment">
			<span>상품 합계 금액 : </span><span id="totalPrice" style="width: 170px;"></span><br>
			<span>배송비 : </span><span id="deliveryF" style="width: 170px;"></span><br>
			<div style="border: 2px solid; margin: 10px 0;"></div>
			결제 금액 : <span id="totalPayment" style="width: 170px;"></span>
		</div>
	</div>
</div>
</form>
</body>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	var userRequest;
	
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/orderViewList.do',
		data : {'orderCode' : $('#orderCode').val()},
		dataType : 'json',
		success : function(data){
			var totalPrice = 0; // 합ㄱ{금액}
			var orderState = 0; // 주문상태
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				
				//교환/환불요청				
				if(items.cancel==1)
					userRequest = "주문취소";
				else if(items.exchange==1)
					userRequest = "교환요청";
				else if(items.refund==1)
					userRequest = "환불요청";
				else if(items.orderState==9)
					userRequest = "수령확인";
				else
					userRequest = "요청없음";			
				
				$('<tr/>').append($('<td/>', {
					align : 'center',
					text : items.productCode
				})).append($('<td/>').append($('<img/>', {
					src : '/kokonutStationery/image/thumb/'+items.thumbImg,
					id : 'thumbImg'+index,
					class : 'thumbImg'
				}))).append($('<td/>', {
					align : 'left',
					text : items.productName
				}).append($('<br>')).append($('<span/>', {
					id : 'order_optionContent'+index,
					class : 'order_optionContent',
					text : '['+items.optionContent+']'
				}))).append($('<td/>', {
					align : 'right',
					text : items.discountPrice + ' 원'				
				})).append($('<td/>', {
					align : 'right',
					text : items.purchaseQty 
				})).append($('<td/>', {
					align : 'right',
					text : items.totalPrice + ' 원'
				})).append($('<td/>', {
					align : 'center',
					text : userRequest
				})).appendTo($('#orderView_info_table'));
				
				//옵션없는 상품은 옵션 숨기기
				if(items.productOption==0){
					$('#order_optionContent'+index).hide();
				}
				//합계금액 산정	
				if(userRequest == "주문취소"){
					totalPrice = 0;
				}else{
					totalPrice += items.totalPrice;
				}
				//주문상태 일괄적용
				orderState = items.orderState;
			});
			
			$('#totalPrice').append(totalPrice+' 원');
			var deliveryF = 2500;
			if(totalPrice>=30000||totalPrice<=0){
				deliveryF = 0;
			}
			$('#deliveryF').append(deliveryF + ' 원');
			$('#totalPayment').append(totalPrice+deliveryF + ' 원');
			
			$('#order_state').prop('value', orderState);
		}
	});
	$('#order_state_change').click(function(){
		//alert($('#order_state').val());
		if(userRequest == '주문취소'){
			alert('이미 주문취소된 상품입니다.');
		}else if(userRequest == '수령확인'){
			alert('이미 수령확인된 상품입니다.');
		}else {
			$.ajax({
				type : 'post',
				url : '/kokonutStationery/admin/orderStateChange.do',
				data : 'orderState='+$('#order_state').val()+'&orderCode='+$('#orderCode').val(),
				success : function(result){
					if(result=="success"){
						alert("주문상태가 갱신되었습니다.");
						location.reload();	
					}else
						alert("주문상태 갱신에 실패하였습니다.");
				}
			});
		}
	})
});
</script>
</html>