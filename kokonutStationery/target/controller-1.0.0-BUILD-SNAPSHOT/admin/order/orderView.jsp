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
#order_state{
	width: 100%;
	background-color: #f5f4f4;
	margin-top: 20px;
	padding: 20px 0 20px 0;
}
#order_state_table{
	width:80%; 
	height: 80%;
	border: 1px solid #d9dadc; 
	border-spacing: 0; 
	line-height: 1.5;
	text-align: center;
	
	background-color: #fff;
	margin: 0 auto;
}
#order_paymentType{
	border: 1px solid #d9dadc;
	width: 450px;
	height: 200px;
	background-color: #f5f4f4;
	float: left;
	padding: 20px;
	margin: 20px 0;
}

#order_totalPayment{
	border: 1px solid #d9dadc;
	width: 450px;
	height: 200px;
	background-color: #f5f4f4;
	text-align: right;
	font-size: 40px;
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
		<span style="width: 250px; float: left;">주문자 : ${userName}(${userId })</span>
		<span style="width: 127px; float: right;">주문일 : ${orderDate }</span>
	</div>
	<div id="order_info">
		<table id="orderView_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 10px;">
			<tr>
				<th width="100">상품코드</th>
				<th width="100">상품이미지</th>
				<th width="500">상품이름</th>
				<th width="100">판매가</th>
				<th width="80">수량</th>
				<th width="120">합계</th>
			</tr>
		</table>
		
		<div id="order_state">
			<table id="order_state_table" border="1">
				<tr>
					<td><input type="radio" name="order_state_radio" value="1"> 주문접수</td>
					<td><input type="radio" name="order_state_radio" value="2"> 배송준비</td>
					<td><input type="radio" name="order_state_radio" value="3"> 배송중</td>
					<td><input type="radio" name="order_state_radio" value="4"> 배송완료</td>
					<td><input type="radio" name="order_state_radio" value="9"> 주문완료</td>
				</tr>				
			</table>
		</div>
		<div id="order_paymentType">
			
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
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/orderViewList.do',
		data : {'orderCode' : $('#orderCode').val()},
		dataType : 'json',
		success : function(data){
			var totalPrice = 0; // 합ㄱ{금액}
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
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
				})).appendTo($('#orderView_info_table'));
				//옵션없는 상품은 옵션 숨기기
				if(items.productOption==0){
					$('#order_optionContent'+index).hide();
				}
				//합계금액 산정				
				totalPrice += items.totalPrice;
			});
			
			$('#totalPrice').append(totalPrice+' 원');
			var deliveryF = 2500;
			if(totalPrice>=30000){
				deliveryF = 0;
			}
			$('#deliveryF').append(deliveryF + ' 원');
			$('#totalPayment').append(totalPrice+deliveryF + ' 원');
		}
	}); 
});
</script>
</html>