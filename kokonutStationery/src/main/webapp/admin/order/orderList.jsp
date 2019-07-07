<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.order_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.order_search td{
	width: 700px;
	padding-left: 10px;
}

#searchBtn{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
	color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#orderSeach_list th{
	height: 53px;
	font-weight: 500;
}

.order_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

#order_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#order_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#orderSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}
.oreder_search input{
	padding-left: 10px;
}
#orderTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#orderTable select{
	width: 80px;
	height: 27px;
}

.inputText{
	height: 23px;
	padding-left: 5px;
}
.orderList_tr{
	background-color: #fff;
}
.orderList_tr:hover{
	background-color: #eef;
	cursor: pointer;
	color : #1b87d4;
	text-decoration-line: underline;
}
</style>
</head>
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="order_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">주문관리</h1>
		</div>
		
		<form id="orderSearchForm">
			<div class="order_search" align="left">
				<table border="1" id="orderTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select>
								<option value="#">주문번호</option>
								<option value="#">주문자명</option>
								<option value="#">주문자 ID</option>
								<option value="#">주문자 휴대전화</option>	
							</select>
							<input type="text" id="" class="inputText" style="width: 250px;">
						</td>
					</tr>
					
					<tr>
						<th>기  간</th>
						<td>
							<input type="text" class="inputText" style="width: 120px;"> ~
							<input type="text" class="inputText" style="width: 120px;">
						</td>
					</tr>
					
					<tr>
						<th>상  품</th>
						<td>
							<select>
								<option value="#">상품명</option>
								<option value="#">상품코드</option>
								<option value="#">제조사</option>
							</select>
							<input type="text" class="inputText" style="width: 300px;">
						</td>
					</tr>
				</table>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="order_searchBtn" class="order_btn_group" value="검 색">
					<input type="reset" id="order_resetBtn" class="order_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<table id="orderList_table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 120px;">주문일</th>
					<th style="width: 130px;">주문번호</th>
					<th style="width: 170px;">주문자</th>
					<th style="width: 360px;">상품명</th>
					<th style="width: 160px;">결제 금액</th>
					<th style="width: 120px;">결제방법</th>
					<th style="width: 120px;">주문상태</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	//주문 리스트 출력
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/getOrderList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
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
				
				$('<tr/>', {
					class : 'orderList_tr'
				}).append($('<td/>',{
					align : 'center'
					}).append($('<input/>', {
						type : 'checkbox',
						value : items.orderCode,
						name : 'check',
						class : 'check'
				}))).append($('<td/>', {
					align : 'center',
					text : items.orderDate
				})).append($('<td/>', {
					align : 'center',
					text : items.orderCode
				})).append($('<td/>', {
					align : 'center',
					text : items.userName + '(' + items.userId + ')'
				})).append($('<td/>', {
					text : '상품 이름'
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'right',
					text : items.totalPayment + '원'
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'center',
					text : paymentType
				})).append($('<td/>', {
					align : 'center',
					text : orderState
				})).appendTo($('#orderList_table'));
				
				//주문확인 페이지 이동
				$('.orderList_tr').click(function(){
					window.open('/kokonutStationery/admin/orderView.do?orderCode='+items.orderCode+'&userName='+items.userName+'&userId='+items.userId+'&orderDate='+items.orderDate
							,'','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
				});			
			});
		}		
	});
});
</script>
</html>