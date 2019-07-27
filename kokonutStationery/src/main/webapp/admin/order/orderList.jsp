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
#order_selectDiv{
	width: 100%;
	padding-bottom: 10px;
	overflow: auto;
}

.orderListBtn{
	width: 100px;
	height: 35px;
    padding: 0 20px;
    font-size: 14px;
	font-weight: normal;
    cursor: pointer;
	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}
.orderListBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}

#order_state{
	width: 150px;
	height: 35px;
    padding: 0 5px;
    font-size: 14px;
	font-weight: normal;
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

#orderManagerPagingDiv{
	width: 1000px;
	float: left;
	text-align: center;
}

#paging{
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#currentPaging{
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
	/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    max-width: 100%; /* Could be more or less, depending on screen size */     
     width: auto; display: table;                   
}

.modalDiv{
	width:185px;
	cursor:pointer;
	background-color:#DDDDDD;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	margin: 0 15px 0 15px;
}
</style>
</head>
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">	
	<div id="order_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">주문관리</h1>
			<div id="order_search_div"></div>
		</div>
		
		<form id="orderSearchForm">
			<div class="order_search" align="left">
				<table border="1" id="orderTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select id="searchCategorie">
								<option value="orderCode">주문번호</option>
								<option value="userName">주문자명</option>
								<option value="userId">주문자 ID</option>
							</select>
							<input type="text" id="searchText" class="inputText" style="width: 250px;">
						</td>
					</tr>
					
					<tr>
						<th>기  간</th>
						<td>
							<input type="text" id="dateText1" class="inputText" style="width: 120px;" placeholder="ex)20190705" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> ~
							<input type="text" id="dateText2" class="inputText" style="width: 120px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</td>
					</tr>
					
				</table>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="order_searchBtn" class="order_btn_group" value="검 색">
					<input type="reset" id="order_resetBtn" class="order_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<form name="orderList_actionForm">
		<input type="hidden" id="pg" name="pg" value="${pg }">
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<div id="order_selectDiv">
				<input type="button" class="orderListBtn" value="선택 삭제" onclick="orderAction('delete')"/>
				<div style="float: right;">				
					<select id="order_state" name="orderState">
						<option>주문상태 선택</option>
						<option value="0">주문취소</option>
						<option value="1">주문접수</option>
						<option value="2">배송준비</option>
						<option value="3">배송중</option>
						<option value="4">배송완료</option>
						<option value="6">교환완료</option>
						<option value="8">환불완료</option>
					</select>				
					&nbsp;
					<input type="button" class="orderListBtn" value="선택 갱신" onclick="orderAction('change')"/>
				</div>
			</div>
			<table id="orderList_table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox" id="check_all">
					</th>	
					<th style="width: 120px;">주문일</th>
					<th style="width: 130px;">주문번호</th>
					<th style="width: 170px;">주문자</th>
					<th style="width: 360px;">상품이름</th>
					<th style="width: 160px;">결제 금액</th>
					<th style="width: 120px;">결제방법</th>
					<th style="width: 120px;">주문상태</th>
				</tr>
			</table>
			<br>
			<div id="orderManagerPagingDiv"></div>
			<br><br><br><br>
		</div>
		</form>
		<!-- 선택 갱신 시 확인&취소 / Modal -->
	    <div id="open_changeConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문상태 갱신</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">선택된 주문의 주문상태를 갱신하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="changeConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="changeConfirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
  		<!--End Modal-->
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
	    <div id="open_deleteConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="deleteConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="deleteConfirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
  		<!--End Modal-->
  		
		<!-- 체크박스 선택 X / Modal -->
		<div id="open_nonCheckModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">	
				<p style="text-align: center;"><span style="font-size: 14pt;"><b><span id="noneCheck_modal" style="font-size: 24pt;"></span></b></span></p>
                <p id="stateNoneSelect" style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
                <p><br /></p>
            	<div class="close_Modal" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
               		<span class="pop_bt" style="font-size: 13pt;" >
                   	 	 닫기
                	</span>
            	</div>
     		</div>
		</div>
    	 <!--End Modal-->
		
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/* 숫자탭 컴마 추가 */
function addComma(num) {
 var regexp = /\B(?=(\d{3})+(?!\d))/g;
 return num.toString().replace(regexp, ',');
}

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
				else if(items.orderState==9)
					var orderState = '수령확인';
				
				//상품이름 외 x건 출력
				var orderProductName="";
				var orderProductAmount = 0;
				
				//주문취소시 결제금액 0원
				var totalPayment;
				if(orderState == '주문취소'){
					totalPayment = 0;
				}else{
					totalPayment = items.totalPayment;
				}
				
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/admin/getOrderProduct.do',
					data : {'orderCode' : items.orderCode},
					dataType : 'json',
					success : function(pData){
						//alert(JSON.stringify(pData));
						
						$.each(pData.pName, function(pIndex, pItems){
							if(orderProductAmount==0){
								orderProductName = pItems.productName;
								orderProductAmount++;
							}else{
								orderProductAmount++;
							}
							
							
						});
						$('.order_product'+index).append($('<span/>', {
							text : orderProductName + ' 포함 ' + orderProductAmount + ' 건'
						}));
						
					}
				});
				//alert(orderProductName);
				$('<tr/>', {
					class : 'orderList_tr'
				}).append($('<td/>',{
					align : 'center',
					onclick : 'event.cancelBubble=true' //이 칸만 이벤트 적용 x
					}).append($('<input/>', {
						type : 'checkbox',
						value : items.orderCode,
						name : 'check',
						class : 'check '
				})).css('cursor', 'auto')).append($('<td/>', {
					align : 'center',
					text : items.orderDate
				})).append($('<td/>', {
					align : 'center',
					id : 'order_code',
					text : items.orderCode
				})).append($('<td/>', {
					align : 'center',
					text : items.userName + '(' + items.userId + ')'
				})).append($('<td/>', {
					class : 'order_product'+index
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'right',
					id : 'totalPayment_td',
					text : totalPayment + '원'
				}).css('padding', '0 5px')).append($('<td/>', {
					align : 'center',
					text : paymentType
				})).append($('<td/>', {
					align : 'center',
					text : orderState
				})).appendTo($('#orderList_table'));
				
				
				
				//주문확인 페이지 이동
				$('.orderList_tr').click(function(){
					window.open('/kokonutStationery/admin/orderView.do?orderCode='+items.orderCode+'&userId='+items.userId+'&orderDate='+items.orderDate
							,'','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
				});			
			});
			//페이징 생성
			$('#orderManagerPagingDiv').html(data.orderManagerPaging.pagingHTML);
		}		
	});
	
	//체크박스 전체 선택
	$('#check_all').click(function(){
		if($('#check_all').is(':checked'))
			$('.check').prop('checked', true);
		else
			$('.check').prop('checked', false);
	});
	/* 모달선택 창 닫기 */
	$('#changeConfirmClose_Modal').click(function(){
		$('#open_changeConfirmModal').hide();
	});

	/* 모달삭제 창 닫기 */
	$('#deleteConfirmClose_Modal').click(function(){
		$('#open_deleteConfirmModal').hide();
	});

	$('.close_Modal').click(function(){
		$('#open_nonCheckModal').hide();
		$('#open_deleteSuccessModal').hide();
	});
});


/* 검색 시 리스트 생성 */
$('#order_searchBtn').click(function(){
	$('#order_search_div').empty();
	
	if($('#searchText').val()=='' && $('#dateText1').val()=='' 
								  && $('#dateText2').val()==''){
		$('#order_search_div').text('검색 항목을 입력해 주세요').css('color', 'red').css('font-weight', '10pt');		
		return;
	}
	if($('#dateText1').val()!=''||$('#dateText2').val()!=''){
		if($('#dateText1').val().length!=8 || $('#dateText2').val().length!=8){
			$('#order_search_div').text('기간을 형식에 맞춰 입력해 주세요').css('color', 'red').css('font-weight', '10pt');		
			return;
		}
	}
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/orderSearchList.do',
		data : {'pg' : $('#pg').val(),
				'categorie' : $('#searchCategorie').val(),
				'searchText' : $('#searchText').val(),
				'dateText1' : $('#dateText1').val(),
				'dateText2' : $('#dateText2').val()},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
										
			if(data.list==null || data.list[0]==null || data.list[1]==null){
				$('#order_search_div').text('일치하는 항목이 없습니다').css('color', 'red').css('font-weight', '10pt');		
				return;	
			}
			
			$('#orderList_table tr:gt(0)').remove();
			
			$.each(data.list, function(index,items){
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
				
				//상품이름 외 x건 출력
				var orderProductName="";
				var orderProductAmount = 0;
				
				$.ajax({
					type : 'post',
					url : '/kokonutStationery/admin/getOrderProduct.do',
					data : {'orderCode' : items.orderCode},
					dataType : 'json',
					success : function(pData){
						//alert(JSON.stringify(pData));
						
						$.each(pData.pName, function(pIndex, pItems){
							if(orderProductAmount==0){
								orderProductName = pItems.productName;
								orderProductAmount++;
							}else{
								orderProductAmount++;
							}
							
							
						});
						$('.order_product'+index).append($('<span/>', {
							text : orderProductName + ' 포함 ' + orderProductAmount + ' 건'
						}));
						
					}
				});
				
				$('<tr/>',{
					class : 'orderList_tr'
				}).append($('<td/>',{
					align : 'center',
					onclick : 'event.cancelBubble=true'
				}).append($('<input/>',{ //체크박스
					type : 'checkbox',
					value : items.orderCode,
					name : 'check',
					class : 'check'
					
				}))).append($('<td/>',{ // 주문일
					align : 'center',
					text : items.orderDate
					
				})).append($('<td/>',{ // 주문번호
					align : 'center',
					id : 'order_code',
					text : items.orderCode
					
				})).append($('<td/>',{ // 주문자명(주문자Id)
					align : 'center',
					text : items.userName + '(' + items.userId + ')'
				
				})).append($('<td/>',{ // 결제 금액
					class : 'order_product' + index
				}).css('padding','0 5px')).append($('<td/>',{
					align : 'right',
					text : items.totalPayment + '원'
					
				}).css('padding','0 5px')).append($('<td/>',{ // 결제방법
					align : 'center',
					text : paymentType
					
				})).append($('<td/>',{ // 주문 상태
					align : 'center',
					text : orderState
				})).appendTo($('#orderList_table'));
				
				//주문확인 페이지 이동
				$('.orderList_tr').click(function(){
					window.open('/kokonutStationery/admin/orderView.do?orderCode='+items.orderCode+'&userName='+items.userName+'&userId='+items.userId+'&orderDate='+items.orderDate
							,'','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
				});	
				
			});//each
			$('#orderManagerPagingDiv').html(data.orderManagerPaging.pagingHTML);
			$('#pg').val(1);
		}//success
	});//ajax
});//order_searchBtn : 상품 검색 리스트 끝



/* 페이징 링크 */
function orderManagerPaging(pg){
	location.href="/kokonutStationery/admin/orderList.do?pg="+pg;
}

function orderSearchPaging(pg){
	$('#pg').val(pg);
	$('#order_searchBtn').trigger('click');
}

/* 초기화 버튼 클릭 시 */
$('#order_resetBtn').click(function(){
	 location.href="/kokonutStationery/admin/orderList.do";
});

//선택갱신 선택 삭제
function orderAction(action){
	var count = $('.check:checked').length;

	if(action=='change'){
		if(count==0){
			$('#noneCheck_modal').html('주문상태 갱신');
			$('#open_nonCheckModal').show();
		}else{
			if($('#order_state').val()=='주문상태 선택'){
				$('#noneCheck_modal').html('주문상태 갱신');
				$('#stateNoneSelect').html('갱신하실 주문상태를 선택해주세요.');
				$('#open_nonCheckModal').show();
			}
			else{
				$('#open_changeConfirmModal').show();
				$("#changeConfirmOK_Modal").off().on('click', function(){
					document.orderList_actionForm.method='post';
					document.orderList_actionForm.action='/kokonutStationery/admin/selectedOrderStateChange.do';
					document.orderList_actionForm.submit();
				});
			}
		}
	}else if(action=='delete'){
		if(count==0){
			$('#noneCheck_modal').html('주문내역 삭제');
			$('#open_nonCheckModal').show();
		}else{
			$('#open_deleteConfirmModal').show();
			$("#deleteConfirmOK_Modal").off().on('click', function(){
				document.orderList_actionForm.method='post';
				document.orderList_actionForm.action='/kokonutStationery/admin/selectedOrderDelete.do';
				document.orderList_actionForm.submit();
			});
		}
	}
}
</script>
</html>