<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<link rel="stylesheet" type="text/css" href="../css/order.css">    

<div class="indiv"><!-- Start indiv -->
	<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
		주문하기
	</div>
	
	<div style="margin: 30px 0 0 0;">
		<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문상세내역</h5>
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
		<!-- 제품상세내역 -->
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
									<font id ="totalPrice" style="font-family:'Montserrat', sans-serif; font-size:24px; color:#2ac1bc; font-weight:700;"></font>
									<font style="font-size:15px;color:#2ac1bc;font-weight:700;">원</font>									
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<form id="orderForm" method="post" action="/kokonutStationery/order/order_settle.do" onsubmit="return chkOrder();">
		<c:if test="${memId == null }" >
		<!-- 개인정보취급방침 -->
		<div id="agreementDiv" style="position:relative; visibility:visible;">
					<!-- 회원 시 style="position:absolute; visibility:hidden;" -->
			
			<div style="margin: 50px 0 0 0; border:none;">
				<h5 class="join_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">개인정보취급방침</h5>
			</div>
			
			<div class="join_agreement" style=" text-align:center; position:relative;">
				<!-- 개인정보보호를 위한 이용자 동의사항 -->
				<div align="right" style="height:26px; position:absolute; top:-28px; right:0;" class="private_info">
					개인정보보호를 위한 이용자 동의사항 (자세한 내용은 <a href="../servicePrivate" style="color:#999"><u>개인정보취급방침</u></a>을 확인하시기 바랍니다)
				</div>
				
				<div class="boxScroll scroll private_textarea" style="width:100%; height:250px; margin:0; padding:25px;">
					
						회사는 회원님께서 회원가입, 상품구매 및 배송 서비스의 원활한 제공을 위해 최소한의 범위 내에서 아래와 같이 개인정보 수집·이용합니다. <br />
						<br />
						(1) 회원 정보의 수집·이용목적, 수집항목, 보유·이용기간은 아래와 같습니다.<br />
						<img src="../image/private_5_1.gif" style="width: 100%;"><br />
						<br />
						(2) 법령에 의하여 수집·이용되는 이용자의 정보는 아래와 같은 수집·이용목적으로 보관합니다.<br />
						<img src="../image/private_6_1.gif" style="width: 100%;"><br />
						<br />
						(3) 이용자가 선택정보에 동의를 거부하더라도 배민문방구 서비스 이용은 가능합니다. <br />
						<br />
						(4) 그 밖의 사항은 ㈜우아한형제들 개인정보처리방침 운영에 따릅니다.
					
				</div>
				
			</div>
		
			<div align="right" style="margin-top:15px; text-align:center;" >
				<input type="radio" name="private1" value="yes">
					<label style="font-size:13px; color:#333;"><b>동의합니다</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="private1" value="no">
					<label style="font-size:13px; color:#333;">동의하지 않습니다</label>
			</div>
		</div>
		</c:if>
	
		<div style="margin: 30px 0 0 0;">
			<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문서 작성</h5>
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
						      <td class="box_sub_tit" style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 5px;">주문하시는분 :</td>
						      <td style="padding-top: 5px;">
						          <input type="text" name="userName" id="userName" value="" 
						         readonly required>
						     </td>
						    </tr>
				   
				          	<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal; padding:10px 0;">주소 :</td>
					            
					            <td style="padding:10px 0; color:#333">	
					            	<!-- 주문자 주소 빈칸 -->	
					            		               
					            </td>
					        </tr>
								 
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">주문자 핸드폰 :</td>
								<td style="padding:5px 0">
								   <input type="text" name="userPhone1" id="userPhone1" value="" size="3" maxlength="3" required label="주문자 핸드폰번호" 
								   style="width:60px;">
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone2" id="userPhone2" value="" size="4" maxlength="4" required label="주문자 핸드폰번호" 
								   style="width:60px;">
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone3" id="userPhone3" value="" size="4" maxlength="4" required label="주문자 핸드폰번호" 
								   style="width:60px;">
								</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">이메일 :</td>
					            <td style="padding:5px 0">
					              <input type="text" name="userEmail" id="userEmail" value="" required
					              style="width:211px;">
					            </td>
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
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">배송지 확인 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding-top: 10px;">
				              <input type="checkbox" id="sameInfo" style="height: 14px;"> 주문고객 정보와 동일합니다
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;padding: 15px 0 5px 0;">받으실분 :</td>
				            <td style="padding: 15px 0 5px 0;">
				              <input type="text" name="receiverName" id="receiverName" value="" required 
				              style="width:205px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">받으실곳 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverZipcode" id="receiverZipcode" size="5" readonly required
								style="width:100px;" >
				              
				              <div class="sub-button-s" onclick="checkPost()"
				              style="text-align:center; width: 112px;height: 42px;position: absolute; margin: -40px 0 0 120px;line-height: 42px; font-size: 12px;" align="absmiddle">우편번호 검색</div>
				            </td>
				            
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr1" id="receiverAddr1" 
				              style="width:400px; " required readonly>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr2" id="receiverAddr2" label="세부주소"
				              style=" width:345px; ">
				              <div style="padding:5px 0 0 1px;font:12px dotum;color:#999;" id="div_road_address_sub"></div>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0"></td>
				          </tr>
						  <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">핸드폰번호 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverPhone1" id="receiverPhone1" size="3" maxlength="3" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				               &nbsp;-&nbsp;
				              <input type="text" name="receiverPhone2" id="receiverPhone2" size="4" maxlength="4" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				               &nbsp;-&nbsp;
				              <input type="text" name="receiverPhone3" id="receiverPhone3" size="4" maxlength="4" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">남기실 말씀 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="deliveryMsg" id="deliveryMsg" 
				              style="border:1px solid #DDD; width:370px; padding-left: 10px; font-size:13px; color: #333; -webkit-appearance:none; border-radius:0;">
				            </td>
				          </tr>
			          
			          	 
				          <tr id="paper_delivery_menu">
				            <td style="font-size: 13px; color: #666; font-weight:normal;">배송선택 :</td>
				            <td style="padding:5px 0; font-size: 13px; color: #333; font-weight:normal;">
				              <input type="radio" name="deliveryOption" value="0" checked style="height: 14px; border-color: #fff;">기본배송
				            </td>
				          </tr>
				          
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal; padding:10px 0;">회원정보 반영 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding:10px 0;">
				            	<input type="checkbox" id="updateMemberInfo" value="y" style="height: 14px;"> 위 내용을 회원정보에 반영합니다. (주소, 핸드폰번호)
				            </td>
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
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">상품합계금액 :</td>
				            <td class="noline" style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">
				              <span id="paper_goodsprice" style="font-weight:normal; color:#333;">가격 원</span>
				            </td>
			          	</tr>
						<tr>
							<td style="font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">배송비 :</td>
							<td class="noline" style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
								<div id="" style="display: block;">+ <span id="paper_delivery" style="font-weight:normal; color:#333;">배송비</span> 원</div>
								
							</td>
						</tr>
						
						<tr>
						  <td valign="top" style="font-size: 13px; color: #666; font-weight:normal; padding: 28px 0 5px 0;">포인트 사용 :</td>
						<td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
						
						<table cellpadding="0" cellspacing="0">
							<tbody>
							  <tr>
							    <td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용가능 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" name="coupon" size="12" readonly
								style="text-align:right;"> 원
							
								</td>								
							  </tr>
							  
							  <tr>
							  	<td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용 할 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" name="coupon" size="12" value="0 " 
								style="text-align:right;"> 원
							
								</td>	
							  </tr>
							  
							  <tr>
							  	<td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용 후 남은 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" name="coupon" size="12" readonly
								style="text-align:right;"> 원
							
								</td>	
							  </tr>
		              		</tbody>
		              </table>
		        
		            </td>
		          </tr>
		          
		          <tr>
		            <td style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">총 결제금액 :</td>
		            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
			            <span style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
			            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;">총 가격</span>
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
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
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">일반결제 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
				              <input type="radio" name="payType" value="credit" style="height: 14px; border-color: #fff;" checked> 신용카드&nbsp;&nbsp;&nbsp;&nbsp;
				              <input type="radio" name="payType" value="phone" style="height: 14px; border-color: #fff;"> 핸드폰&nbsp;&nbsp;&nbsp;&nbsp;
				            </td>
				          </tr>
		       	 	  </tbody>
		        	</table>
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
			            	<div onclick="location.href='../index'" class="sub-button-s" 
							style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">취소</div>			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="submit" id="orderWriteBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="다음">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
		</table>
		
	</form>

</div>



<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>
<script>
$(document).ready(function(){
	
	$('#sameInfo').click(function(){
		
		var userName = $('#userName').val();
		var userPhone1 = $('#userPhone1').val();
		var userPhone2 = $('#userPhone2').val();
		var userPhone3 = $('#userPhone3').val();
		
		if($('#sameInfo').prop('checked')){
			$('#receiverName').val(userName);
			$('#receiverPhone1').val(userPhone1);
			$('#receiverPhone2').val(userPhone2);
			$('#receiverPhone3').val(userPhone3);
		}else{
			$('#receiverName').val('');
			$('#receiverPhone1').val('');
			$('#receiverPhone2').val('');
			$('#receiverPhone3').val('');
		}
	});
	
});

//구매하기버튼 : 상품1개에 대한 구매
$(function(){
	//옵션이 없는 경우
	if(${goodsDTO.productOption} == 0){
		createTabNoOption();
		totalP();		
	}
	//옵션이 있는 경우
	else{
		var optionStr = '${selValue}';
		var optionContent = optionStr.split(",");
		var qtyStr = '${pdQtyValue}';
		var productQty = qtyStr.split(",");
		createTabOption(optionContent, productQty);
		totalP();
	}
});

//제품 1개에 대한 table 생성 : 옵션없음
function createTabNoOption(){
	$('<tr/>').append($('<td/>',{
		style: "vertical-align:top; padding: 30px 0;"
	}).append($('<a/>',{
		href : "#",
		style : "margin-bottom:0;"		
	}).append($('<img>',{
		src : '../image/thumb/'+ '${goodsDTO.thumbImg}',
		width : "70"
	})))).append($('<td>',{
		class : "order_option",
		style : "text-align:left;vertical-align:top; padding: 30px 0;"
	}).append($('<div/>',{
		text : '${goodsDTO.productName}',
		style : "color: #222; font-weight: 700; font-size: 14px;",
	}))).append($('<td>',{
		text : '${goodsDTO.discountPrice}',
		style : "color: #222; vertical-align:top; padding: 30px 50px 30px 0; text-align:right;"
	}).append($('<span/>',{
		text : '원'
	}))).append($('<td/>',{
		style : "vertical-align:top; padding: 22px 0 30px 0;"
	}).append($('<div/>',{
		style : "padding-top: 8px; vertical-align: top; color:#222;",
		text : '${productQty}'
	}).append($('<span>',{
		text : '개'
	})))).append($('<td>',{
		class : 'totalPrice',
		tyle : "vertical-align:top; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;",
		text : '${goodsDTO.discountPrice * productQty}'
	}).append($('<span/>', {
		text : '원'
	}))).appendTo($('#tbody'));
}

//제품 1개에 대한 table 생성 : 옵션있음
function createTabOption(optionContent, productQty){

	for(var i = 0; i< optionContent.length-1; i++ ){
		$('<tr/>').append($('<td/>',{
			style: "vertical-align:top; padding: 30px 0;"
		}).append($('<a/>',{
			href : "#",
			style : "margin-bottom:0;"		
		}).append($('<img>',{
			src : '../image/thumb/'+ '${goodsDTO.thumbImg}',
			width : "70"
		})))).append($('<td>',{
			class : "order_option",
			style : "text-align:left;vertical-align:top; padding: 30px 0;"
		}).append($('<div/>',{
			text : '${goodsDTO.productName}',
			style : "color: #222; font-weight: 700; font-size: 14px;",
		})).append($('<div>', {
			text : '선택옵션 : ',
		})).append($('<div/>',{
			text : optionContent[i] +'/'
		}))).append($('<td>',{
			text : '${goodsDTO.discountPrice}',
			style : "color: #222; vertical-align:top; padding: 30px 50px 30px 0; text-align:right;"
		}).append($('<span/>',{
			text : '원'
		}))).append($('<td/>',{
			style : "vertical-align:top; padding: 22px 0 30px 0;"
		}).append($('<div/>',{
			style : "padding-top: 8px; vertical-align: top; color:#222;",
			text : productQty[i]
		}).append($('<span>',{
			text : '개'
		})))).append($('<td>',{
			class : 'totalPrice',
			tyle : "vertical-align:top; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;",
			text : '${goodsDTO.discountPrice}' * productQty[i]
		}).append($('<span/>', {
			text : '원'
		}))).appendTo($('#tbody'));
	
	}  

}
	
//상품합계금액
function totalP(){
	var totalPriceArray = new Array();
	totalPriceArray = $('.totalPrice');
	var totalP = 0;
	for(var i=0; i<totalPriceArray.length; i++){
		var price = totalPriceArray.eq(i).text();
		price = price.slice(0, price.length-1) * 1;
		totalP += price;
	}
	$('#totalPrice').text(totalP);
}

</script>