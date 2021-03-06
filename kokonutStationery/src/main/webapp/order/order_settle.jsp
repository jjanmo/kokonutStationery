<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/order.css">    

<div class="indiv2" style="width:1000px; margin-top:135px;" ><!-- Start indiv -->
	<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
		결제하기
	</div>
	<!-- 주문상세내역 -->
	<table width="100%" cellpadding="0" cellspacing="0" border="0" class="table_tit_style02" style="margin-top: 15px;">
		
		<thead>
			<tr>
				<th colspan="2" style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: left; padding-left: 15px; font-weight:500;">상품정보</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:50px;">판매가</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; font-weight:500;">수량</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:20px; font-weight:500;">합계</th>
			</tr>
		</thead>
		<tbody id="tbody">		
					
		</tbody>
		
		<tfoot id="tfooter">
			<tr>
				<td colspan="10" style="padding: 30px 0;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="total_price_area">
						<tbody>
							<tr class="total_price" style="padding-right: 0px;">
								<td>
									<font style="color:#333;font-weight:500;">상품합계금액 (배송비 별도)</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<font id="totalPurchase" style="font-family:'Montserrat', sans-serif; font-size:24px; color:#2ac1bc; font-weight:700;"></font>
									<font style="font-size:15px;color:#2ac1bc;font-weight:700;">원</font>									
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
	
	
	
		<div style="margin: 30px 0 0 0;">
			<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문정보확인</h5>
		</div>
		
		<!-- 주문자 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
			style="background-color: #fff; margin-bottom:20px; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr>
			    <td class="box_tit" style="font-size: 15px; color: #333; font-weight:700;">주문자정보</td>
			</tr>
			<tr>
				<td>
				  	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
						<tbody>
						    <tr>
						      <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">주문자 이름:</td>
						      <td id="userName" class="box_sub_tit" style=" font-size: 13px; color: #666; padding-top: 5px; "></td>
						    </tr>
				   
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666;">주문자 핸드폰 :</td>
								<td id="userPhone" class="box_sub_tit" style="font-size: 13px;color: #666; padding-top: 5px; "></td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666;">이메일 :</td>
					            <td id="userEmail" class="box_sub_tit" style=" font-size: 13px; color: #666;" ></td>
				          	</tr>
			           </tbody>
			        </table>
					
				</td>
			</tr>
		
		</table>
	
		<!-- 배송 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">배송정보</td>
			</tr>
			<tr>
			      <td>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          <tbody>
				          <tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">받는 분 이름:</td>
				            <td id="receiverName" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				          </tr>
				          
				           <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">핸드폰번호 :</td>
				            <td id="receiverPhone" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				          </tr>
				          
				          <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">우편번호 :</td>
				            <td id="receiverZipcode" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				            
				          </tr>
				          <tr>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">주소 : </td>
				            <td id="receiverAddr" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				          </tr>
				          <tr>
				          	<td class="box_sub_tit" style="font-size: 13px; color: #666:">남기고 싶은말 : </td>
				          	<td id="deliveryMsg" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				          </tr>
			          	</tbody>
			          </table>
			  
			      </td>
			</tr>
		</table>
	
		
		<!-- 결제 금액 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			   <td style="font-size: 15px; color: #333; font-weight:700;">결제금액</td>
			</tr>
			
		    <tr>
		      <td>	    
		        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
		        	<tbody>
			        	<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">총 주문 금액 : </td>
				            <td>
				            <span id="totalAmount" class="box_sub_tit" style="font-size: 13px; color: #666;"></span>
				            <span style="font-size: 13px; color: #666;">원</span>
				            </td>
				          </tr>
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">배송비 : </td>
				            <td>
				            <span id="del1">+</span>
				            <span id="deliveryFee" class="box_sub_tit" style="font-size: 13px; color: #666;"></span>
				            <span id="del2">원</span>
				            </td>
				        </tr>
						
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">사용한 포인트 : </td>
				            <td>
							<span id="usePoint" class="box_sub_tit" style="font-size: 13px; color: #666;">${usePoint}</span>
				            <span style="font-size: 13px; color: #666;">원</span>
				            <input type="hidden" id="totalPoint">
							</td>
				       </tr>
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제금액 : </td>
				            <td>
				            <span id="totalPayment1" class="box_sub_tit" style="font-size: 13px; color: #666;"></span>
				            <span style="font-size: 13px; color: #666;">원</span>
				            <input type="hidden" id="x_totalPayment">
				            </td>
				       </tr>		        
		        	</tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	
		<!-- 결제 수단 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 10px 40px; border: 1px solid #ddd;">
		    <tbody>
			    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">결제수단</td>
			    </tr>
			    <tr>
			      <td>
			    
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          
			          <tbody>
				          <tr>
				           <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제방법 :</td>
				            <td id="paymentType" class="box_sub_tit" style="font-size: 13px; color: #666;"></td>
				          </tr>
				          <tr>
				          	<td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제금액 :</td>
				          	<td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
					            <span id="totalPayment2" style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
					            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;"></span>
					            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
				            </td>
				          </tr>
		       	 	  </tbody>
		        	</table>
		          </td>
				</tr>
			</tbody>		
		</table>
		
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tbody>
			    <tr class="box_tit" style="align:center;">
				    <td>
					    <input type="radio" name="payAgree" value="yes">
						<label style="font-size:13px; font-weight:700;  color:#333;"><b>주문할 상품의 구매조건을 확인하였으며, 결제진행에 동의합니다.</b></label>
					</td>
			     
			    </tr>
		    </tbody>
		</table>
		
		<!-- 취소 / 다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            <div style="width: 180px; display: inline-block;">
			            	<div id="order_backBtn" class="sub-button-s" onclick="javascript:history.back()" 
							style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">뒤로</div>			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="button" id="payBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="결제하기">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
		</table>

</div>
<!-- indiv 끝 -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
var totalP = 0;	
var prdArray = new Array();
var prdQtyArray = new Array();
var prdOption = new Array();

	//order 뿌리기
	$.ajax({
		type: 'POST',
		async: false,
		url: '/kokonutStationery/order/getOrder.do',
		dataType: 'json',
		success: function(data){
			//alert("데이터출력");
			$.each(data.list, function(index, item) {
				$('<tr/>').append($('<td/>',{
					style: "vertical-align: middle; padding: 30px 0;"
					}).append($('<a/>',{
						href : "#",
						style : "margin-bottom:0;"		
						}).append($('<img>',{
							src : '../image/thumb/'+ item.thumbImg,
							width : "70"
				})))).append($('<td>',{
					class : 'order_option',
					style : "text-align:left;vertical-align: middle; padding: 30px 0;"
					}).append($('<div/>',{
						text : item.productName,
						style : "color: #222; font-weight: 700; font-size: 14px;",
					})).append($('<div>', {
						class : 'optionDiv1'+index,
						text : '선택옵션 : ',
					})).append($('<div/>',{
						class : 'optionDiv2'+index,
						text : item.optionContent +'/'
				}))).append($('<td>',{
					text : item.discountPrice,
					style : "color: #222; vertical-align: middle; padding: 30px 50px 30px 0; text-align:right;"
					}).append($('<span/>',{
						text : '원'
				}))).append($('<td/>',{
					style : "vertical-align: middle; padding: 22px 0 30px 0;"
					}).append($('<div/>',{
						style : "padding-top: 8px; vertical-align: middle; color:#222;",
						text : item.purchaseQty,
						}).append($('<span>',{
							text : '개'
				})))).append($('<td>',{
					class : 'totalPrice',
					tyle : "vertical-align: middle; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;",
					text : item.discountPrice * item.purchaseQty 
					}).append($('<span/>', {
						text : '원'
				}))).appendTo($('#tbody'));
				
				if(item.productOption == 0){
					$('.optionDiv1'+index).css('display','none');
					$('.optionDiv2'+index).css('display','none');
				}
				totalP += (item.discountPrice * item.purchaseQty);
				paymentType = item.paymentType;
				
				//재고 배열				
				prdArray[index] = item.productCode;
				prdQtyArray[index] = item.purchaseQty;
				prdOption[index] = item.optionContent;
				
			});//each
		}//success
	});//ajax order
	
	$('#totalPurchase').text(totalP);
		
	$.ajax({
		type: 'POST',
		url: '/kokonutStationery/order/getOrderUserInfo.do',
		dataType: 'json',
		success: function(data){
			$('#userName').text(data.userDTO.userName);
			var userPhone = data.userDTO.userPhone1 + '-' + data.userDTO.userPhone2 + '-' + data.userDTO.userPhone3;
			$('#userPhone').text(userPhone);
			$('#userEmail').text(data.userDTO.userEmail);
			$('#receiverName').text(data.userDTO.receiverName);
			var receiverPhone = data.userDTO.receiverPhone1 + '-' + data.userDTO.receiverPhone2 + '-' + data.userDTO.receiverPhone3;
			$('#receiverPhone').text(receiverPhone);			
			$('#receiverZipcode').text(data.userDTO.receiverZipcode);
			if(data.userDTO.receiverAddr2 != null){
				var addr = data.userDTO.receiverAddr1 + " " + data.userDTO.receiverAddr2;
			}
			else if(data.userDTO.receiverAddr2 == null){
				var addr = data.userDTO.receiverAddr1;
			}
			$('#receiverAddr').text(addr);
			$('#deliveryMsg').text(data.userDTO.deliveryMsg);
			$('#totalPoint').val(data.userDTO.userPoint); //tbl_user의 totalPoint 값
			$('#x_totalPayment').val(data.userDTO.totalPayment); //tbl_user의 totalPayment 값
		}
	});
	
	//총주문금액
	$('#totalAmount').text(AddComma(totalP));
	
	//포인트
	var point =	$('#usePoint').text(); //사용한포인트
	
	
	//배송비 및 총 결제 금액
	var totalPayment = 0;
	if(totalP >= 30000) { //배송비 없음
		$('#del1').text("+ ")
		$('#del2').text(" 원(조건부 무료)")
		$('#deliveryFee').text("0");
		totalPayment = totalP - point;
		$('#totalPayment1').text(AddComma(totalPayment));
		$('#totalPayment2').text(AddComma(totalPayment));
		
	}
	else { //배송비 2500원
		$('#del1').text("")
		$('#del2').text("")
		$('#deliveryFee').text(AddComma(2500));
		totalPayment = totalP - point + 2500;
		$('#totalPayment1').text(AddComma(totalPayment));
		$('#totalPayment2').text(AddComma(totalPayment));
	}
		
	//결제수단
	if(paymentType == 0){
		$('#paymentType').text("신용카드");
	}
	else {
		$('#paymentType').text("핸드폰");
	}


	$('#payBtn').click(function(){
		var payAgreeVal = $('input[name="payAgree"]:checked').val();
		
		if(payAgreeVal!='yes'){
			alert("구매 내용에 동의하셔야 결제가 가능합니다.");
		}
		
		else{
			
			var paymentType = $('#paymentType').text();
			var pt = 0;
			if(paymentType == "카드결제"){
				pt = 0;
			}
			else{
				pt = 1;
			} 
						
			//orderlist생성
			var totalProductPayment = stringNumberToInt($('#totalAmount').text());	//총주문금액
			var totalPayment = stringNumberToInt($('#totalPayment1').text());		//총결제금액
			var deliveryFee = stringNumberToInt($('#deliveryFee').text());
			//회원
			if('${kokonutId}' == ''){
				$.ajax({
					type : 'POST',
					url  : '/kokonutStationery/order/insertOrderlist.do',
					data : { 'userId' 				: '${memId}',
							 'userName' 		 	: '${memName}',
							 'totalProductPayment' 	: totalProductPayment,
							 'paymentType' 			: pt, 
							 'deliveryFee' 			: deliveryFee,
							 'totalPayment' 		: totalPayment,
							 'usePoint'				: point,
							 /* 'savePoint'			: totalProductPayment/10, */
							 'totalPoint'			: $('#totalPoint').val(),
							 'x_totalPayment'		: $('#x_totalPayment').val(),
							 'members'				: 1 },
					dataType: 'text',
					success: function(data){
						if(data == "success"){
							//alert("orderlist 생성 및 order 수정 완료");
							alert("상품 구매가 완료되었습니다.")
						}
						else{
							//alert("orderlist 생성  실패 및 order 수정 ");
						}
					}
					
				});//ajax orderlist생성/order수정			
			}//if 회원
			
			//비회원
			else if('${memId}' == ''){
				$.ajax({
					type : 'POST',
					url  : '/kokonutStationery/order/insertOrderlist.do',
					data : { 'userId' 				: '${kokonutId}',
							 'userName' 		 	: $('#userName').text(),
							 'totalProductPayment' 	: totalProductPayment,
							 'paymentType' 			: 1, 
							 'deliveryFee' 			: deliveryFee,
							 'totalPayment' 		: totalPayment,
							 'members'				: 0 },
					dataType: 'text',
					success: function(data){
							if(data>=0){							
								alert("상품 구매가 완료되었습니다. " + " 주문번호 : " + data);
							}else if(data == "success"){
								//alert("orderlist 생성 및 order 수정 완료");
								alert("상품 구매가 완료되었습니다. ");
							}else{
								//alert("orderlist 생성  실패 및 order 수정 ");
							}
						}
				});
			}//else if 비회원
			
			//선택주문상품 장바구니에서 삭제
			var checkedValueStr = '${checkedValueStr}';
			var cartCodeArray = checkedValueStr.split(",");
			//alert(cartCodeArray.length);
			
			for(i=0; i<cartCodeArray.length-1; i++) {
				$.ajax({
					type: 'POST',
					url: '/kokonutStationery/cart/deleteCartAfterPay.do',
					data: {'cartCode': cartCodeArray[i]}
				});
			}
			
			
			for(var i=0; i<prdArray.length; i++){
				//alert(prdArray[i] + '//' + prdOption[i]);
				$.ajax({
					type : 'POST',
					url : '/kokonutStationery/order/reduceSaleProduct.do',
					data : { 'productCode' : prdArray[i],
							 'purchaseQty' : prdQtyArray[i],
							 'optionContent' : prdOption[i]
							},
					dataType : 'text',
					success : function(data){
						if(data == "success"){
							//alert("상품 재고 수정완료");
						}
						else{
							//alert("상품 재고 수정실패 ");
						}
					}
				}); 
			}//for
			location.href="/kokonutStationery/main/index.do";
		}//else		
	});//결제버튼
});

$('#order_backBtn').click(function(){
	//회원
	if('${kokonutId}' == ''){
		$.ajax({
			type : 'get',
			url : '/kokonutStationery/order/orderCancel.do',
			data : {'userId' : '${memId}'},
			dataType : 'text',
			success : function(data){
				if(data=='success'){
					//alert("확인");
					window.history.back();
				}
			}
		});
	}
	//비회원
	else if('${memId}' == ''){
		$.ajax({
			type : 'get',
			url : '/kokonutStationery/order/orderCancel.do',
			data : {'userId' : '${kokonutId}'},
			dataType : 'text',
			success : function(data){
				if(data=='success'){
					//alert("확인");
					window.history.back();
				}
			}
			
		});
	}
});


//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

</script>