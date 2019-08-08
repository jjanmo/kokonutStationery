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
	height : 70px;
}
.kokonutOrder_img{
	width: 90%;
	vertical-align: middle;
	
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	position:relative;
}
.kokonutOrder_img:hover{
	border: 0.1px solid black;	
	transform: scaleX(5) scaleY(5);
	-webkit-transform: scaleX(5) scaleY(5);
	-moz-transform: scaleX(5) scaleY(5);
	-ms-transform: scaleX(5) scaleY(5);
	-o-transform: scaleX(5) scaleY(5);
	z-index: 1;
}
.kokonutOrder_PrdName{
	padding-left : 10px;
}
.userRequestBtn{
	border: 1px solid #1b87d4;
	background-color: #fff;
	cursor: pointer;
	color: #1b87d4;
	font-size: 10px;
	font-weight: normal;
}
.userRequestBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
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
        <th width="100">교환/환불</th>
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
		<div style="border: 1px solid; margin: 10px 0;"></div>
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
		var totalPrice = 0;
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
				var orderState = '주문완료';
			
			/* else if(items.orderState==6)
				var orderState = '교환완료';
			else if(items.orderState==7)
				var orderState = '환불접수';
			else if(items.orderState==8)
				var orderState = '환불완료';	
			else if(items.orderState==9)
				var orderState = '수령확인'; */
			
			if(items.exchange==1)
				var erState = '교환접수';
			else if(items.exchange==2)
				var erState = '교환완료';
			else if(items.refund==1)
				var erState = '환불접수';
			else if(items.refund==2)
				var erState = '환불완료';	
				
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
					src : '/kokonutStationery/image/thumb/' + items.thumbImg
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
					class : 'userRequestBtn',
					value : '주문취소'
				})).append($('<input/>',{
					type : 'button',
					value : '구매확정',
					id : 'receipt_ok' + index,
					class : 'userRequestBtn'
			}))).append($('<td/>', {
				align : 'center',
				text: erState
				}).append($('<input/>', {
					type : 'button',
					id : 'exchangeRefundBtn' + index,
					class : 'userRequestBtn',
					value : '교환/환불'
				}))).appendTo($('#kokonutOrder_table'));
			
			//옵션없는 상품은 옵션 숨기기
			if(items.optionContent==null){
				$('#kokonut_optionContent'+index).hide();
			}
			//수령확인 버튼 배송완료시에만 출력
			if(items.orderState!=4){
				$('#receipt_ok'+index).hide();
				$('#exchangeRefundBtn' + index).hide();
				
			}else{
				$('#receipt_ok'+index).show();
				$('#exchangeRefundBtn' + index).show();
				
			}
			//주문접수, 배송준비기간에 주문취소 가능하게 설정
			if(items.orderState==1 || items.orderState==2){
				$('#cancelBtn' + index).show();
			}else{
				$('#cancelBtn' + index).hide();
			}
			//교환 / 환불요청 버튼 배송완료때만 보이게 설정
			//주문상태 변경
			$('#cancelBtn' + index).click(function(){//주문취소
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/order/kokonutOrderStateChange.do',
					data : {'orderCode' : items.orderCode,
							'crPayment' : items.totalPrice
							},
					dataType : 'text',
					success : function(data){
						if(data=='success'){
							alert("주문이 취소되었습니다.");
						}
					}
				});
			});
			$('#exchangeRefundBtn' + index).click(function(){//교환
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/order/kokonutOrderExchange.do',
					data : {'orderCode' : items.orderCode
							},
					dataType : 'text',
					success : function(data){
						if(data=='success'){
							alert("교환요청되었습니다.");
						}
					}
				});
			});
			$('#refundBtn' + index).click(function(){//환불
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/order/kokonutOrderRefund.do',
					data : {'orderCode' : items.orderCode
							},
					dataType : 'text',
					success : function(data){
						if(data=='success'){
							alert("환불요청되었습니다.");
						}
					}
				});
			})
			$('#receipt_ok' + index).click(function(){//수령확인
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/order/kokonutOrderOk.do',
					data : {'orderCode' : items.orderCode
							},
					dataType : 'text',
					success : function(data){
						if(data=='success'){
							alert("수령확인되었습니다.");
						}
					}
				});
			});
			//총 합 금액
			
			if(items.orderState==0){
				totalPrice = 0;
			}else{
				totalPrice += items.totalPrice;	
			}						
			
		});
		$('#totalPrice').text(totalPrice+' 원');
		var deliveryF = 2500;
		if(totalPrice>=30000||totalPrice<=0){
			deliveryF = 0;
		}
		$('#deliveryF').text(deliveryF + ' 원');
		$('#totalPayment').text(totalPrice+deliveryF + ' 원');
	}
})

</script>
</html>