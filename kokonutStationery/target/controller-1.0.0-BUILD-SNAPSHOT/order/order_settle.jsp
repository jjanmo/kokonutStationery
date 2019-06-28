<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="../css/order.css">    

<div class="indiv" ><!-- Start indiv -->
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
		<tbody>		
			<tr>
				<td style="vertical-align:top; padding: 30px 0;">
					<a href="#" style="margin-bottom:0;"><img src="" width="70"></a>
				</td>
			
				<td class="ta_l order_option" style="text-align:left;vertical-align:top; padding: 30px 0;">
					<div style="color: #222; font-weight: 700; font-size: 14px;">2080 X 배달의민족. 이빨청춘 치약</div>						
				</td>
				<td style="color: #222; vertical-align:top; padding: 30px 50px 30px 0; text-align:right;">3,500원
				</td>
				<td style="vertical-align:top; padding: 22px 0 30px 0;">
					<div style="padding-top: 8px; vertical-align: top; color:#222;">1개</div>
				</td>
			
				<td style="vertical-align:top; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;">3,500원</td>
			</tr>			
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="10" style="padding: 30px 0;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="total_price_area">
						<tbody>
							<tr class="total_price" style="padding-right: 0px;">
								<td>
									<font style="color:#333;font-weight:500;">상품합계금액 (배송비 별도)</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<font style="font-family:'Montserrat', sans-serif; font-size:24px; color:#2ac1bc; font-weight:700;">15,500</font>
									<font style="font-size:15px;color:#2ac1bc;font-weight:700;">원</font>									
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<form id="orderForm" method="post" action="../order/order_settle" onsubmit="return chkOrderSettle();">		
	
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
						      <td class="box_sub_tit" style=" font-size: 13px; color: #666; padding-top: 5px; ">ㅁㅁㅁ </td>
						    </tr>
				   
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666;">주문자 핸드폰 :</td>
								<td class="box_sub_tit" style="font-size: 13px;color: #666; padding-top: 5px; ">ㅁㅁㅁ-ㅁㅁㅁ-ㅁㅁㅁ</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666;">이메일 :</td>
					            <td class="box_sub_tit" style=" font-size: 13px; color: #666;" >ㅁㅁ@ㅁㅁ.ㅁㅁ</td>
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
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ</td>
				          </tr>
				          
				           <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">핸드폰번호 :</td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ-ㅁㅁㅁ-ㅁㅁㅁ</td>
				          </tr>
				          
				          <tr>
				             <td class="box_sub_tit" style="font-size: 13px; color: #666;">우편번호 :</td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁㅁㅁ</td>
				            
				          </tr>
				          <tr>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">주소 : </td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">어디어디</td>
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
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ</td>
				          </tr>
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">배송비 : </td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ</td>
				        </tr>
						
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">회원할인 : </td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ</td>
				       </tr>
						<tr>
				            <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제금액 : </td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">ㅁㅁㅁ</td>
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
				           <td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">카드결제 :</td>
				            <td class="box_sub_tit" style="font-size: 13px; color: #666;">결제방법내용</td>
				          </tr>
				          <tr>
				          	<td class="box_sub_tit" style="width:150px; height:38px; font-size: 13px; color: #666; padding-top: 5px;">결제금액 :</td>
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
			            	<div onclick="javascript:history.go(-1);" class="sub-button-s" 
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
		
	</form>
</div>
<!-- indiv 끝 -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>
<script>
$(document).ready(function(){
	
	$('#payBtn').click(function(){
		
		var payAgreeVal = $('input[name="payAgree"]:checked').val();
		
		if(payAgreeVal!='yes'){
			alert("구매 내용에 동의하셔야 결제가 가능합니다.");
			return false;
		}else{
			alert("결제완료~");
			location.href="../main/index";
		}
	});
	
});
</script>