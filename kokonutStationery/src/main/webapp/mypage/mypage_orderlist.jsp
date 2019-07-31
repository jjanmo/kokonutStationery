<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>

 <!-- mypage right contents -->
 <div class="content">
   <div class="content_title">
   <input type="hidden" id="userId" value="${memId}">
   <input type="hidden" id="pg" name="pg" value="${pg }">
     주문내역 · 배송조회
   </div>
 
   <div id="mypage_table_wrap" style="width:810px;">
   	<table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="gubun">구분</th>
        <th id="orderDate">주문일시</th>
        <th id="orderCode">주문번호</th>
        <th id="paymentType">결제방법</th>
        <th id="order_totalPayment">주문금액</th>
        <th id="crPayment">취소환불금액</th>
        <th id="orderState">주문상태</th>
        <th id="delivery">교환/환불</th>
        <th id="orderview"></th>
      </tr>

    </table>

   <div class="pageDiv">
   </div>
   
 	</div>
 </div><!-- content -->

</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var userId = $('#userId').val();
	var pg = $('#pg').val();
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/order/mypage_orderlist.do',
		data : { 'userId' : userId,
				 'pg' : pg},
		dataType : 'json',
		success : function(data){
			if(data!=null){
				$.each(data.list, function(index, items){
					if(items.paymentType==1)
						var paymentType = '신용카드';
					else if(items.paymentType==2)
						var paymentType = '핸드폰 결제';
					
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
					else if(items.orderState==9)
						var orderState = '수령확인';
					
					
					
					$('.mypage_table').append($('<tr>',{
						id : 'mypage_table_content_'+index,
						class : 'mypage_table_content review_content' 
					
						}).append($('<td/>',{//구분
							text : '일반'
						
						})).append($('<td/>',{//주문일시
							text : items.orderDate,
							style : "width:100px;"
							
						})).append($('<td/>',{//주문번호
							}).append($('<a/>',{
								id : 'mypage_orderCode',
								class : items.orderCode,
								text : items.orderCode,
								href : '../mypage/mypage_orderview.do?orderCode='+items.orderCode//상세 하게 되면 상세페이지 띄울 것
								
							})).append($('<a/>',{
								href : '../mypage/mypage_orderview.do?orderCode='+items.orderCode
								
								}).append($('<div/>',{
									text : '상세보기', 
									style : 'cursor:pointer; color:gray; margin: 3px auto 0 auto; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;'
						
						})))).append($('<td/>',{//결제방법
							text : paymentType
						
						})).append($('<td/>',{//주문금액
							text : AddComma(items.totalPayment) 
						
						})).append($('<td/>',{//취소금액
							text : AddComma(items.crPayment)
						
						})).append($('<td/>',{//주문상태
							class : items.orderCode+"_orderState",
							text : orderState,
							style : "color:#2ac1bc;"
							 
							}).append($('<div/>',{ //주문취소버튼
								value : items.orderCode,
								class : items.orderCode+"_cancelBtn",
								text : '주문취소',
								style : 'cursor:pointer; color:gray; margin: 3px auto 0 auto; display:none; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;'
							
							})).append($('<div/>',{ // 배송확인버튼
								class : items.orderCode+"_deliveryCheckBtn",
								text : '배송조회',
								/* class : items.orderCode+"_changeBtn",
								text : '교환', */
								style : 'cursor:pointer; color:gray; margin: 3px auto 0 auto; display:none; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;'
								
							})).append($('<div/>',{ // 수령확인 버튼
								class : items.orderCode+"_receiptBtn",
								text : '수령확인',
								/* class : items.orderCode+"_refundBtn",
								text : '환불', */
								style : 'cursor:pointer; color:gray; margin: 3px auto 0 auto; display:none; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;'
								
						}))).append($('<td/>',{//교환/환불칸
								class : items.orderCode+"_delivery"
							//주문상태 배송 완료 시 교환/환불 뜨게
							}).append($('<div/>',{
								class:items.orderCode+"_refundChangeBtn",
								text : '교환/환불', 
								style : 'cursor:pointer; color:gray; margin: auto; display:none; width:80px; height:25px; line-height:25px; text-align:center; border:1px solid gray;'
				
						}))));
					
					//주문접수/배송준비 상태 시 주문취소 버튼 활성화
					if(orderState=='주문접수'){
						$('.'+items.orderCode+'_cancelBtn').css('display','block');
					}else if(orderState=='배송준비'){
						$('.'+items.orderCode+'_cancelBtn').css('display','block');
					}else if(orderState=='배송중'){
						$('.'+items.orderCode+'_deliveryCheckBtn').css('display','block');
					}
					//배송완료 상태 시 환불, 교환 버튼 활성화
					if(orderState=='배송완료'){
						$('.'+items.orderCode+'_receiptBtn').css('display','block');
						$('.'+items.orderCode+'_refundChangeBtn').css('display','block');
					}
					
					
					//주문취소버튼 클릭 시
					$('.'+items.orderCode+'_cancelBtn').click(function(){
						var result = confirm("정말 주문취소 하시겠습니까?");
						if(result){ // 확인일 시
							//alert(items.orderCode);
							$.ajax({
								type :'post',
								url : '../order/orderCancel.do',
								data : {'orderCode' : items.orderCode,
										'crPayment' : items.totalPayment,
										'x_totalPayment' : $('#x_totalPayment').val(),
										'x_userPoint' : $('#x_userPoint').val(),
										'userId' : '${memId}'},
								success : function(data){}//success
							});//ajax - 주문취소
							alert("주문취소가 완료되었습니다!");
							location.href="../mypage/mypage_orderlist.do";
						}
					});
					
					
					
					//교환/환불버튼 클릭시
					$('.'+items.orderCode+'_refundChangeBtn').click(function(){
						var result = confirm("정말 교환/환불을 신청하시겠습니까?");
						if(result){ // 확인일 시
							//orderCode가져가야한다
							window.open("/kokonutStationery/order/orderRefundChange.do?orderCode="+items.orderCode, "_blank", "width=800, height=600");
						}
					});
					
					/* //교환접수버튼 클릭 시
					$('.'+items.orderCode+'_changeBtn').click(function(){
						var result = confirm("정말 교환접수 하시겠습니까?");
						if(result){ // 확인일 시
							//alert(items.orderCode);
							$.ajax({
								type : 'post',
								url : '../order/orderChange.do',
								data : {'orderCode' : items.orderCode},
								success : function(data){}//success
							});//ajax - 교환접수
							alert("교환접수가 완료되었습니다!");
							location.href="../mypage/mypage_orderlist.do";
						}
					});
					
					//환불접수버튼 클릭 시
					$('.'+items.orderCode+'_refundBtn').click(function(){
						var result = confirm("정말 환불접수 하시겠습니까?");
						if(result){ // 확인일 시
							//alert(items.orderCode);
							$.ajax({
								type : 'post',
								url : '../order/orderRefund.do',
								data : {'orderCode' : items.orderCode},
								success : function(data){}//success
							});//ajax - 환불접수
							alert("환불접수가 완료되었습니다!");
							location.href="../mypage/mypage_orderlist.do";
						}
					}); */
					
					//수령확인버튼 클릭 시
					$('.'+items.orderCode+'_receiptBtn').click(function(){
						var result = confirm("정말 수령확인 하시겠습니까?");
						if(result){ // 확인일 시
							//alert(items.orderCode);
							$.ajax({
								type : 'post',
								url : '../order/orderReceipt.do',
								data : {'orderCode' : items.orderCode},
								success : function(data){}//success
							});//ajax - 환불접수
							alert("수령확인되었습니다!");
							location.href="../mypage/mypage_orderlist.do";
						}
					});
				
				});//each
				
				//페이징
				$('.pageDiv').html(	data.orderManagerPaging.pagingHTML);
				
			}//if(data!=null)
		}//success
		
	});//ajax
	
});//ready
/* 페이징 링크 */
function orderManagerPaging(pg){
	location.href="/kokonutStationery/order/mypage_orderlist.do?pg="+pg;
}
//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}
</script>


</html>