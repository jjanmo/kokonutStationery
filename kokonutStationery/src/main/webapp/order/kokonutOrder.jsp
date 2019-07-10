<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문조회</title>
<style type="text/css">
.content {
  width: 95%;
  height: 100%;
  float: right;
  margin: 0 20px 0 20px;
}
.content_title {
  font-size: 22px;
  font-weight: 700;
  text-align: left;
  color: #222;
}
#kokonutOrder_th{
    height: 50px;
    background-color: #f6f6f6;
}
#kokonutOrder_table {
  width: 100%;
  margin-top: 20px;
  font-size: 12px;
  color: #999;
  border-spacing: 0;
  border-collapse: collapse;
  border-top: 1px solid #999;
  border-spacing: 0; 
  line-height: 1.5; 
  margin-top: 10px;
}
.kokonutOrder_content{
	border-bottom: 1px solid #ebebeb;
	text-align: center;
	font-size: 13px;
	color: #222;
	height: 90px;
}
.kokonutOrder_tr{
	border-bottom : 1px solid #eee;
	color : black;
	height : 50px;
}
.kokonutOrder_img{
	width: 100%;
}
.kokonutOrder_PrdName{
	padding-left : 10px;
}
.receiptBtn{
	border: 1px solid #1b87d4;
	background-color: #fff;
	cursor: pointer;
	color: #1b87d4;
	font-size: 14px;
	font-weight: normal;
}
.receiptBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}
.cancelBtn{
	font-size : 10px;
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
 <div class="content">
    <div class="content_title">
      주문내역 · 배송조회
    </div>
    <table id="kokonutOrder_table">
      <tr id="kokonutOrder_th">
        <th width="200">주문일시</th>
        <th width="120">주문번호</th>
        <th width="70">이미지</th>
        <th width="300">상품이름</th>
        <th width="100">결제방법</th>
        <th width="140">주문금액</th>
        <th width="140">취소금액</th>
        <th width="100">주문상태</th>
        <th width="100">수령확인</th>
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
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$.ajax({
	type : 'post',
	url : '/kokonutStationery/order/getKokonutOrder.do',
	data : {'userName' : '${userName}',
			'orderCode' : '${orderCode}'
			},
	dataType : 'json',
	success : function(data){
		//alert(JSON.stringify(data));
		$.each(data.list, function(index, items){
			//결제방법
			if(items.paymentType==0)
				var paymentType = '신용카드';
			else if(items.paymentType==1)
				var paymentType = '핸드폰 결제';
			//주문상태
			if(items.orderState==0)
				var orderState = '주문취소';
			else if(items.orderState==1)
				var orderState = '주문접수';
			else if(items.orderState==2)
				var orderState = '배송준비';
			else if(items.orderState==3)
				var orderState = '배송중';
			else if(items.orderState==4)
				var orderState = '배송완료';
			else if(items.orderState==5)
				var orderState = '교환접수';
			else if(items.orderState==6)
				var orderState = '교환완료';
			else if(items.orderState==7)
				var orderState = '환불접수';
			else if(items.orderState==8)
				var orderState = '환불완료';	
						
			$('<tr/>',{
				class : 'kokonutOrder_tr'
			}).append($('<td/>', {
				align : 'center',
				text : items.orderDate
			})).append($('<td/>', {
				align : 'center',
				text : items.orderCode
			})).append($('<td/>', {
				align : 'center',
				value : items.thumbImg
				}).append($('<img/>', {
					class : 'kokonutOrder_img',
					src : '/kokonutStationery/image/thumbImg/' + items.thumbImg
			}))).append($('<td/>', {
				align : 'left',
				class : 'kokonutOrder_PrdName',
				text : items.productName
				}).append('<br>').append($('<span/>',{
					id : 'kokonut_optionContent' + index,
					text : items.optionContent
			}))).append($('<td/>', {				
				align : 'center',
				text : paymentType
			})).append($('<td/>', {
				align : 'center',
				text : items.totalPrice + ' 원'
			})).append($('<td/>', {
				align : 'center',
				text : items.cancelAmount + ' 원'
			})).append($('<td/>', {
				align : 'center',
				text : orderState
				}).append($('<input/>', {
					type : 'button',
					id : 'cancelBtn' + index,
					class : 'cancelBtn',
					value : '주문취소'
			}))).append($('<td/>', {
				align : 'center'
				}).append($('<input/>',{
					type : 'button',
					value : '수령확인',
					id : 'receipt_ok' + index,
					class : 'receiptBtn'
			}))).appendTo($('#kokonutOrder_table'));
			
			//옵션없는 상품은 옵션 숨기기
			if(items.optionContent==null){
				$('#kokonut_optionContent'+index).hide();
			}
			//수령확인 버튼 배송완료시에만 출력
			if(items.orderState!=4){
				$('#receipt_ok'+index).hide();
			}else{
				$('#receipt_ok'+index).show();
			}
			//주문접수, 배송준비기간에 주문취소 가능하게 설정
			if(items.orderState==1 || items.orderState==2){
				$('#cancelBtn' + index).show();
			}else{
				$('#cancelBtn' + index).hide();
			}
		});
	}
})

</script>
</html>