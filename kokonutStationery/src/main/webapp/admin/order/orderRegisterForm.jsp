<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문등록</title>
<style>
.subTitble{
	font-size : 27px;
	margin : 30px 0 0 0;
}

.orderSubTitle{
	font-size : 20px;
	margin : 25px 0 15px 0;
}

select{
	height : 30px;
	outline : none;
	font-size : 18px;
	margin : 10px 0 10px 0;
	width : 100px;
}

input{
	outline : none;
	height : 26px;
}
.searchInput{
	font-size : 18px;
}

.searchBtn{
	font-size : 18px;
	width: 50px;
	height : 30px
}

table th{
	height: 35px;
	font-size : 20px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}
td{
	height: 30px;
	font-size:18px;
}

#orderDiv{
	border : 2px solid powderblue;
	margin-top : 10px;
	padding : 0 30px 20px 30px;
}

.orderTitle{
	width : 180px;
}

#ordererInfoTable{
	font-size : 18px;
	background-color : #fff; 
	margin-bottom : 20px; 
	padding: 10px 30px 20px 40px; 
	border: 1px solid #ddd;
}

#deliveryInfoTable{
	font-size : 18px;
	margin-bottom:20px;
	background-color: #fff; 
	padding: 10px 30px 20px 40px; 
	border: 1px solid #ddd;
}

#paymentInfoTable{
	margin-bottom:20px; 
	background-color: #fff; 
	padding: 10px 30px 20px 40px; 
	border: 1px solid #ddd;"
}
.pointTr{
	line-height : 40px;
}

#paymentTypeTable{
	margin-bottom:10px; 
	background-color: #fff; 
	padding: 10px 30px 20px 40px; 
	border: 1px solid #ddd;"
}

.orderBtn{
	text-align : center;
	width: 100px;
    line-height: 30px;
    padding: 0 30px;
    font-size: 20px;
    cursor: pointer;
}

#allResetBtn{
	font-size : 18px;
	width: 85px;
	height : 26px
}

#productTableResetBtn{
	font-size : 18px;
	width: 50px;
	height : 26px
}

#deliveryInfoResetBtn{
	font-size : 18px;
	width: 50px;
	height : 26px
}

#daumCheckPost{
	text-align:center; 
	width: 100px; 
	height: 30px;
	font-size: 16px; 
	display:inline-block; 
	background-color:powderblue;
	vertical-align: middle;
	cursor : pointer;
	border-radius : 20px 20px 20px 20px;
	line-height : 30px;
}
</style>
</head>
<body>

<div id="mainWrapper">
	<div id="orderManagerTitle" style="margin-bottom: 20px;">
		<h1 id="orderManager" style="font-weight:normal; display:inline-block;cursor:pointer;">주문관리</h1>
		&ensp;&ensp;
		<h1 id="orderRegister" style="font-weight:normal; display:inline-block;cursor:pointer;">주문등록</h1>
	</div>

<div class="subTitble">상품정보검색</div>
<div id="productInfoDiv">
	<div id="productSearchDiv">
		<select id="searchProductOption">
			<option value="">구분</option>
			<option value="productName">상품이름</option>
			<option value="productCode">상품코드</option>
			<option value="category">카테고리</option>
		</select>&nbsp;
		<input type="text" class="searchInput" id="searchProductKeyword">&nbsp;
		<button type="button" id="productSearchBtn" class="searchBtn">검색</button>&nbsp;
		<div id="searchProductResult" style="display:inline-block;"></div>
	</div>

	<div id="productTableDiv">
		<table id="productTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0;">
			<tr>
				<th style="width: 8%;">상품코드</th>
				<th style="width: 24%;">상품명</th>
				<th style="width: 20%;">옵션</th>
				<th style="width: 9%;">원가</th>
				<th style="width: 10%;">판매가</th>
				<th style="width: 6%;">수량</th>
				<th style="width: 8%;">재고</th>
				<th style="width: 10%;">합계</th>
				<th style="width: 5%;">추가</th>
			</tr>
		</table>
	</div>
</div>

<div class="subTitble">회원정보검색</div>
<div id="userInfoDiv">
	<div id="userSearchDiv">
		<select id="searchUserOption">
			<option value="">구분</option>
			<option value="userName">이름</option>
			<option value="userId">아이디</option>
			<option value="userEmail">이메일</option>
		</select>&nbsp;
		<input type="text" class="searchInput" id="searchUserKeyword">&nbsp;
		<button type="button" id="userSearchBtn" class="searchBtn">검색</button>&nbsp;
		<div id="searchUserResult" style="display:inline-block;"></div>
	</div>

	<div id="userTableDiv">
		<table id="userTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0;" >
			<tr>
				<th style="width: 7%;">아이디</th>
				<th style="width: 7%;">주문자</th>
				<th style="width: 13%; line-height:15px;">핸드폰<br><span style="font-size:12px">(주문자)</span></th>
				<th style="width: 13%;">이메일</th>
				<th style="width: 8%;">받으실 분</th>
				<th style="width: 8%;">우편번호</th>
				<th style="width: 26%; line-height:15px;">받으실 곳<br><span style="font-size:12px">(배송지)</span></th>
				<th style="width: 13%; line-height:15px;">핸드폰<br><span style="font-size:12px">(받으시는 분)</span></th>
				<th style="width: 7%;">추가</th>
			</tr>
		</table>
	</div>
</div>

<form>
<div class="subTitble" style="display : inline-block;">주문서</div>&nbsp;&nbsp;
<button type="button" id="allResetBtn">전체초기화</button>
<div id="orderDiv">
	<!-- 주문상품정보 -->
	<div>
		<div class="orderSubTitle" style="display : inline-block;">주문상품정보</div>&nbsp;&nbsp;
		<button type="button" id="productTableResetBtn">초기화</button>&nbsp;&nbsp;
		<div id="resetResultDiv" style="display : inline-block;"></div>
		<table id="orderedProductTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0;">
			<tr>
				<th style="width: 10%;">상품코드</th>
				<th style="width: 25%;">상품명</th>
				<th style="width: 22%;">옵션</th>
				<th style="width: 10%;">판매가</th>
				<th style="width: 10%;">수량</th>
				<th style="width: 10%;">합계</th>
				<th style="width: 5%;">삭제</th>
			</tr>
		</table>
	</div>
	
	<!-- 주문자 정보 -->
	<div>
		<div class="orderSubTitle">주문자정보</div>
		<input type="hidden" id="userId" value="">	
		<table id="ordererInfoTable" width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
				  	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
						<tbody>
						    <tr>
						      <td class="orderTitle" style="width:150px; color: #666; padding : 5px 0;">주문하시는분 </td>
						      <td style="padding : 5px 0;">
						            <input type="text" name="userName" id="userName" value="" style="width:240px;" readonly>
						      </td>
						    </tr>
							<tr>
								<td class="orderTitle" style="color: #666;">주문자 핸드폰 </td>
								<td style="padding:5px 0;">
								   <input type="text" name="userPhone1" id="userPhone1" size="3" maxlength="3" style="width:60px;" readonly>
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone2" id="userPhone2" size="4" maxlength="4" style="width:60px;" readonly>
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone3" id="userPhone3" size="4" maxlength="4" style="width:60px;" readonly>
								</td>
							</tr>
							<tr>
					            <td class="orderTitle" style="padding:5px 0; color: #666;">이메일 </td>
					            <td style="padding:5px 0">
					              <input type="text" name="userEmail" id="userEmail" value="" style="width:240px;" readonly>
					            </td>
				          	</tr>
		             	</tbody>
		        	 </table>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 배송 정보 -->
	<div>
		<div class="orderSubTitle" style="display:inline-block;">배송정보</div>&nbsp;&nbsp;
		<button type="button" id="deliveryInfoResetBtn">초기화</button>&nbsp;&nbsp;
		<div id="deliveryResetDiv" style="display:inline-block;"></div>
		<table id="deliveryInfoTable" width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
		      <td>
		        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:5px;">
		          <tbody>
			         <tr>
			            <td class="orderTitle" style="color: #666; padding: 5px 0 5px 0;">받으실 분 </td>
			            <td style="padding: 5px 0 5px 0;">
			              <input type="text" name="receiverName" id="receiverName" value="" style="width:240px;">
			            </td>
			          </tr>
			          <tr>
			            <td class="orderTitle" style="color: #666;">받으실 곳 </td>
			            <td style="padding:5px 0">
			              <input type="text" name="receiverZipcode" id="receiverZipcode" size="5" style="width:125px;" placeholder=" 우편번호">
			              &nbsp;
			              <div id="daumCheckPost" onclick="daumCheckPost()">우편번호 검색</div>
			            </td>
			            
			          </tr>
			          <tr>
			            <td style="color: #666;"></td>
			            <td style="padding:5px 0">
			              <input type="text" name="receiverAddr1" id="receiverAddr1" 
			              style="width:400px;" placeholder=" 도로명 주소">
			            </td>
			          </tr>
			          <tr>
			            <td style="color: #666; font-weight:normal;"></td>
			            <td style="padding:5px 0">
			              <input type="text" name="receiverAddr2" id="receiverAddr2" style=" width:400px;" placeholder=" 세부주소">
			            </td>
			          </tr>
					  <tr>
			            <td class="orderTitle" style="color: #666; font-weight:normal;">핸드폰번호 :</td>
			            <td style="padding:5px 0">
			              <input type="text" name="receiverPhone1" id="receiverPhone1" size="3" maxlength="3" style="width:60px;">
			               &nbsp;-&nbsp;
			              <input type="text" name="receiverPhone2" id="receiverPhone2" size="4" maxlength="4" style="width:60px;">
			               &nbsp;-&nbsp;
			              <input type="text" name="receiverPhone3" id="receiverPhone3" size="4" maxlength="4" style="width:60px;">
			            </td>
			          </tr>
			          <tr>
			            <td class="orderTitle" style="color: #666;">남기실 말씀 </td>
			            <td style="padding:5px 0">
			              <input type="text" name="deliveryMsg" id="deliveryMsg" style="width:400px; color: #333; ">
			            </td>
			          </tr>
				          	 
			          <tr>
			            <td class="orderTitle" style="color: #666;">배송선택 </td>
			            <td style="padding:5px 0;color: #333;">
			              <input type="radio" name="deliveryOption" value="0" style="height: 14px; border-color: #fff;" checked > 기본배송
			            </td>
			          </tr>
		          	</tbody>
		          </table>
		      </td>
			</tr>
		</table>
	</div>
		
	<!-- 결제 금액 -->
	<div>
		<div class="orderSubTitle">결제금액</div>	
		<table id="paymentInfoTable" width="100%" cellpadding="0" cellspacing="0" border="0">
		    <tr>
		      <td>	    
		        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
		        	<tbody>
			        	<tr>
				            <td class="orderTitle" style="width:150px; color: #666; font-weight:normal; padding-top: 10px;">상품합계금액</td>
				            <td style="color: #666; padding-top: 10px;">
				            	<span id="goodsPrice">0</span><span id="paper_goodsprice" style="color:#333;"> 원</span>
				            </td>  
			          	</tr>
						<tr>
							<td class="orderTitle" style="color: #666; padding: 15px 0 5px 0;">배송비 </td>
							<td style="color: #333; padding: 15px 0 5px 0;">
								<div>+ <span id="deliveryFee" style="color:#333;">0</span><span> 원</span></div>
								
							</td>
						</tr>
						
						<tr id="pointTr">
						  <td class="orderTitle" valign="top" style="color: #666; padding: 15px 0 5px 0;">포인트 사용 </td>
						  <td style="color: #333;">
							<table cellpadding="0" cellspacing="0">
								<tbody>
								  <tr class="pointTr">
								    <td align="left" style="color: #333; width:150px;">사용가능 포인트</td>
									<td>
									<input type="text" id="totalPoint" name="coupon" size="15" value="0" readonly
									style="text-align:right;"> 원
									</td>								
								  </tr>
								  <tr class="pointTr">
								  	<td align="left" style="color: #333; width:150px;">사용 할 포인트</td>
									<td>
										<input type="text" id="usingPoint" name="usingPoint" size="15" value="0" 
										style="text-align:right;" onchange="paymentCalculator()"> 원
										&nbsp;&nbsp;<span id="pointResult"></span>
									</td>	
								  </tr>
								  <tr class="pointTr">
								  	<td align="left" style="color: #333; width:150px;">사용 후 남은 포인트</td>
									<td>
										<input type="text" id="remainingPoint" name="coupon" size="15" value="0" readonly 
										style="text-align:right;"> 원
									</td>	
								  </tr>
			              		</tbody>
			               </table>
			            </td>
		   		      </tr>
			          <tr>
			            <td class="orderTitle" style="color: #666; padding-top: 10px;">총 결제금액 </td>
			            <td style="color: #333; padding: 15px 0 5px 0;">
				            <span id="totalP" style="width:146px; text-align:right; color:#2ac1bc; font-weight:700; 
				            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;">0</span>
				            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
			            </td>
			          </tr>
		        	</tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	</div>
	
	<!-- 결제 수단 -->
	<div>
		<div class="orderSubTitle">결제수단</div>	
		<table id="paymentTypeTable" width="100%" cellpadding="0" cellspacing="0" border="0">
		    <tbody>
			    <tr>
			      <td>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          <tbody>
				          <tr>
				            <td class="orderTitle" style="width:150px; color: #666; padding: 15px 0 5px 0;">일반결제 </td>
				            <td style="color: #333; padding: 15px 0 5px 0;">
				              <input type="radio" name="payType" value="0" style="height: 14px; border-color: #fff;" checked> 신용카드&emsp;&emsp;
				              <input type="radio" name="payType" value="1" style="height: 14px; border-color: #fff;"> 핸드폰
				            </td>
				          </tr>
		       	 	  </tbody>
		        	</table>
		          </td>
				</tr>
			</tbody>		
		</table>
	</div>
		
	<div id="btnDiv" align="center" style="margin-top:20px;">
		<button type="button" class="orderBtn" id="orderRegBtn">등록</button>
		<button type="button" class="orderBtn" id="orderResetBtn">취소</button>
	</div>
	<div id="regResultDiv" style="text-align:center; margin-top:10px;"></div>

</div>
</form>
</div>

</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

//(헤더)주문관리 클릭
$('#orderManager').click(function(){
	location.href = "/kokonutStationery/admin/orderList.do";
});

//(헤더)주문등록 클릭
$('#orderRegister').click(function(){
	location.href = "/kokonutStationery/admin/orderRegister.do";
});



//상품정보 검색
$('#productSearchBtn').click(function(){
	//검색결과 초기화
	$('#productTable tr:gt(0)').remove();

	var searchOption = $('#searchProductOption option:selected').val();
	var searchKeyword = $('#searchProductKeyword').val();
	//alert(searchOption);
	//alert(searchKeyword);
	$('#searchProductResult').text('');
	
	if(searchOption == ''){
		alert("검색 옵션을 선택하세요");
	}
	else if(searchKeyword == '' && !confirm('검색키워드가 비어있으면 전체상품이 출력됩니다')){
		return;
	}
	else{
		$.ajax({
			type : 'POST',
			url  : '/kokonutStationery/admin/searchProductInRegOrder.do',
			data : {'searchOption'	: searchOption,
					'searchKeyword' : searchKeyword	},
			dataType : 'json',
			success : function(data){
				if(data.list == ''){
					$('#searchProductResult').text('찾으시는 검색 결과 없습니다').css('color','tomato').css('font-size','16px');
				}
				else {
					//alert(JSON.stringify(data));
					
					$.each(data.list, function(index, item){
						$('<tr/>').append($('<td/>',{
									align : 'center',
									text : item.productCode,
									id : 'productCode'+item.productCode
							
								})).append($('<td/>',{
									align : 'center',
									text : item.productName,
									id : 'productName'+item.productCode
									
								})).append($('<td/>',{ //옵션
									align : 'center',
									id : 'option'+item.productCode
								
								})).append($('<td/>',{
									align : 'center',
									text : item.originalPrice
									
									}).append($('<span/>',{
										text : ' 원'
								
								}))).append($('<td/>',{
									align : 'center',
									text : item.discountPrice,
									id : 'discountPrice'+item.productCode
									
									}).append($('<span/>',{
										text : ' 원'
								
								}))).append($('<td/>',{//구매수량
									align : 'center'
									
									
									}).append($('<input/>',{
										class : 'inputNumber',
										id : 'inputNumber'+item.productCode,
										type : 'number',
										min : '0',
										value : '0',
										style : 'text-align : center; font-size : 14px; width : 40px; height : 20px;'
									})).append($('<span/>',{
										text : ' 개'
										
								}))).append($('<td/>',{
									align : 'center',
									text : item.stockQty
									
									}).append($('<span>',{
										text : ' 개'
										
								}))).append($('<td/>',{
									align : 'center',
									text : '0 원',
									class : 'totalProductPayment', 
									id : 'totalProductPayment'+item.productCode 
										
									
								})).append($('<td/>',{
									align : 'center'
									
									}).append($('<img/>',{
										src   : '../image/add-button.png',
										class : 'addProductBtn',
										id : 'addProductBtn'+item.productCode,
										style : 'cursor : pointer; width : 20px; height : 20px; vertical-align : middle;'
										
								}))).appendTo($('#productTable'));
								
														
								if(item.productOption == 0){
									$('#option'+item.productCode).text('옵션없음');
								}
								
								else {
									$('<select/>',{
										id : 'selectBox'+item.productCode,
										style : 'width:230px; height:21px; margin:0;'
									}).appendTo($('#option'+item.productCode));
									
									$.ajax({
										type : 'POST',
										url  : '/kokonutStationery/admin/getOptionContent.do',
										data : {'productCode' : item.productCode},
										dataType : 'json',
										success : function(data){
											//alert(JSON.stringify(data));
															
											$.each(data.list, function(index, option){
												$('<option/>',{
													text : option.optionContent,
													value : option.optionContent
													
												}).appendTo($('#selectBox'+item.productCode));
											})//each
											
										}//success
									});//ajax
									
								}//else
								
					});//each
				}
			}//success
		});//ajax
	}//else
});//click function

//상품개수증감버튼
$(document).on('change','.inputNumber', function(){
	var num = $(this).val()*1;
	var productCode = $(this).attr('id').substring(11);
	var productLength = $(this).parent().prev().text().length;
	var price = $(this).parent().prev().text().substring(0,productLength-2)*1;
	var stockLength = $(this).parent().next().text().length;
	var stock = $(this).parent().next().text().substring(0,stockLength-2)*1
	
	var totalProductPayment = num * price;
	$('#totalProductPayment'+productCode).text(totalProductPayment+' 원');
	
	if(num > stock){
		alert("재고를 초과하였습니다.");
		$(this).val(0);
		$('#totalProductPayment'+productCode).text('0 원');
	}
});

//상품추가버튼 클릭 : 주문서로 상품정보 추가
$(document).on('click','.addProductBtn', function(){
	var productCode = $(this).attr('id').substring(13); 	//상품코드
	var productName = $('#productName'+productCode).text();	//상품이름
	var optionContent = $('#selectBox'+productCode+' option:selected').val();	//선택한옵션내용
	var discountPrice = $('#discountPrice'+productCode).text();					//판매가
	var inputNumber =  $('#inputNumber'+productCode).val();						//판매수량
	var totalProductPayment = $('#totalProductPayment'+productCode).text();		//총판매금액
	
	//결과메세지 초기화
	$('#searchProductResult').text('');
	
	//옵션내용
	if(optionContent == null){
		optionContent = '옵션없음';
	}
	
	//alert(productCode+'/'+productName+'/'+optionContent+'/'+discountPrice+'/'+inputNumber+'/'+totalProductPayment);
	if(inputNumber == 0){
		alert("수량을 입력하세요")
	}
	
	else{
		$('<tr/>').append($('<td/>',{
			align : 'center',
			class : 'productCode',
			text : productCode
			
		})).append($('<td/>',{
			align : 'center',
			class : 'productName',
			text : productName
			
		})).append($('<td/>',{
			align : 'center',
			class : 'optionContent',
			text : optionContent				

		})).append($('<td/>',{
			align : 'center',
			class : 'discountPrice',
			text : discountPrice
			
		})).append($('<td/>',{
			align : 'center',
			class : 'purchaseQty',
			text : inputNumber + ' 개'
			
		})).append($('<td/>',{
			align : 'center',
			class : 'totalPrice',
			text : totalProductPayment
			
		})).append($('<td/>',{
			align : 'center',
			
			}).append($('<img/>',{
				src   : '../image/remove-button.png',
				class : 'removeProductBtn',
				id : 'removeProductBtn'+productCode,
				style : 'cursor : pointer; width : 20px; height : 20px; vertical-align : middle;'
		}))).appendTo($('#orderedProductTable'));
		
		paymentCalculator();
		
		//결과메세지출력
		var randomColor =  '#'+Math.round(Math.random()*0xFFFFFF).toString(16);
		$('#searchProductResult').text('상품이 주문서에 추가되었습니다').css('color',randomColor).css('font-size','16px');
	}
	
	//초기화
	$('#selectBox'+productCode).find('option:first').attr('selected','selected');
	$('#inputNumber'+productCode).val(0);
	$(this).parent().prev().text('0 원');
	
	setTimeout(function() {
		$('#searchProductResult').text('')	
	}, 2000);
});

//주문서에서 개별상품제거버튼
$(document).on('click','.removeProductBtn',function(){
	//alert($(this).parent().parent().prop('tagName'));
	var tr = $(this).parent().parent();
	tr.remove();

	paymentCalculator();
});


//회원정보 검색
$('#userSearchBtn').click(function(){
	//검색결과 초기화
	$('#userTable tr:gt(0)').remove();
	
	var searchOption = $('#searchUserOption option:selected').val();
	var searchKeyword = $('#searchUserKeyword').val();
	//alert(searchOption);
	//alert(searchKeyword);
	$('#searchUserResult').text('');
	
	if(searchOption == ''){
		alert("검색 옵션을 선택하세요");
	}
	else if(searchKeyword == '' && !confirm('검색키워드가 비어있으면 회원이 전체가 출력됩니다')){
		return;
	}
	else{
		$.ajax({
			type : 'POST',
			url  : '/kokonutStationery/admin/searchUserInRegOrder.do',
			data : {'searchOption'	: searchOption,
					'searchKeyword' : searchKeyword	},
			dataType : 'json',
			success : function(data){
				if(data.list == ''){
					$('#searchUserResult').text('찾으시는 검색 결과 없습니다').css('color','tomato').css('font-size','16px');
				}
				else{
				
					//alert(JSON.stringify(data));
					$.each(data.list, function(index, item){
						$('<tr>').append($('<input/>',{
							type : 'hidden',
							id :'userPoint'+item.userId,
							value : item.userPoint
						})).append($('<input/>',{
							type : 'hidden',
							id : 'deliveryMsg'+item.userId,
							value : item.deliveryMsg
						})).append($('<td/>',{
							align : 'center',
							text : item.userId,
							id : 'userId'+ item.userId
							
						})).append($('<td/>',{
							align : 'center',
							text : item.userName,
							id : 'userName'+item.userId
							
						})).append($('<td/>',{
							align : 'center',
							text : item.userPhone1 + ' - ' + item.userPhone2 + ' - ' + item.userPhone3,
							id : 'userPhone'+item.userId
						})).append($('<td/>',{
							align : 'center',
							text : item.userEmail,
							id : 'userEmail'+item.userId
							
						})).append($('<td/>',{
							align : 'center',
							text : item.receiverName,
							id : 'receiverName'+item.userId
							
						})).append($('<td/>',{
							align : 'center',
							text : item.receiverZipcode,
							id : 'receiverZipcode'+item.userId
							
						})).append($('<td/>',{
							text : item.receiverAddr1 + '/' + item.receiverAddr2,
							id : 'receiverAddr'+item.userId
							
						})).append($('<td/>',{
							align : 'center',
							text : item.receiverPhone1 + ' - ' + item.receiverPhone2 + ' - ' + item.receiverPhone3,
							id : 'receiverPhone'+item.userId
							
						})).append($('<td/>',{
							align : 'center'
							
							}).append($('<img/>',{
								src   : '../image/add-button.png',
								class : 'addUserBtn',
								id : item.userId,
								style : 'cursor : pointer; width : 20px; height : 20px; vertical-align : middle;'
							
						}))).appendTo($('#userTable'));
						
					});//each
				}
			}//success
		});//ajax
	}//else
		
});//click function

//회원정보추가버튼
$(document).on('click','.addUserBtn', function(){
	var userId = $(this).attr('id');
	var userName = $('#userName'+userId).text();
	var userPhone = $('#userPhone'+userId).text().split('-');
	var userEmail = $('#userEmail'+userId).text();
	var receiverName = $('#receiverName'+userId).text();
	var receiverZipcode = $('#receiverZipcode'+userId).text();
	var receiverAddr = $('#receiverAddr'+userId).text().split('/');
	var receiverPhone = $('#receiverPhone'+userId).text().split('-');
	var userPoint = $('#userPoint'+userId).val();
	var deliveryMsg = $('#deliveryMsg'+userId).val();
	
	//random color
	var randomColor =  '#'+Math.round(Math.random()*0xFFFFFF).toString(16);
	if($('#userName').val() != ''){
		$('#searchUserResult').text('회원정보가 주문서에 이미 추가된 상태입니다').css('color',randomColor).css('font-size','16px');
	}
	
	else{
		$('#userId').val(userId);
		
		//주문자정보 및 배송정보
		$('#userName').val(userName);
		$('#userPhone1').val(userPhone[0]);
		$('#userPhone2').val(userPhone[1]);
		$('#userPhone3').val(userPhone[2]);
		$('#userEmail').val(userEmail);
		$('#receiverName').val(receiverName);
		$('#receiverZipcode').val(receiverZipcode);
		$('#receiverAddr1').val(receiverAddr[0]);
		$('#receiverAddr2').val(receiverAddr[1]);
		$('#receiverPhone1').val(receiverPhone[0].trim());
		$('#receiverPhone2').val(receiverPhone[1].trim());
		$('#receiverPhone3').val(receiverPhone[2].trim());
		$('#deliveryMsg').val(deliveryMsg);
		
		//포인트
		$('#totalPoint').val(userPoint);
		$('#remainingPoint').val(userPoint);
		
		//결과메세지출력
		$('#searchUserResult').text('회원정보가 주문서에 추가되었습니다').css('color',randomColor).css('font-size','16px');
	
		
		
		setTimeout(function(){
			$('#searchUserResult').text('');
		}, 2000); 
	}
});


//결제금액정보계 및 포인트정보계산 포함
function paymentCalculator(){
	
	//변수 및 값 가져오기
	var totalPoint = $('#totalPoint').val()*1;
	var usingPoint = $('#usingPoint').val()*1;
	
	var goodsTotalPrice = 0;	 //총 상품금액
	var totalPayment = 0;		 //총 결제금액	
	$('.totalPrice').each(function(index){
		var length = $(this).text().length;
		var price = ($(this).text().substring(0,length-2))*1;
		goodsTotalPrice += price;
	});
	$('#goodsPrice').text(goodsTotalPrice);
	
	//배송비
	if(goodsTotalPrice >= 30000){
		$('#deliveryFee').text(0);
		totalPayment = goodsTotalPrice;
	}
	else{
		$('#deliveryFee').text(2500);
		totalPayment = goodsTotalPrice + 2500;
	}
	//alert(totalPayment);
	//초기화
	$('#pointResult').text('');
	$('#remainingPoint').text(totalPoint);
	$('#totalP').text(totalPayment);
	
	//포인트 유효성검사
	if(isNaN(usingPoint)){
		$('#pointResult').text('숫자를 입력하세요').css('color', 'red').css('font-size','18px');
		$('#usingPoint').val(0);
	}
	else if(usingPoint > 0 && usingPoint < 1000){
		$('#pointResult').text('1000원 이상부터 사용가능합니다').css('color', 'pink').css('font-size','18px');
		$('#usingPoint').val(0);
	}
	
	else if(totalPoint < usingPoint){
		$('#pointResult').text('사용가능 포인트를 초과하여 사용할 수 없습니다').css('color', 'tomato').css('font-size','18px');
		$('#usingPoint').val(0);
	}
	else if(totalPayment < usingPoint){
		$('#pointResult').text('결제금액을 초과하여 사용할 수 없습니다').css('color', 'tomato').css('font-size','18px');
		$('#usingPoint').val(0);
	}
	else{
		var remainingPoint = totalPoint - usingPoint;
		$('#remainingPoint').val(remainingPoint); 
		if(usingPoint != 0){
			$('#pointResult').text('포인트가 적용되었습니다').css('color', 'skyblue').css('font-size','18px');
		}

		totalPayment = totalPayment - usingPoint;
		$('#totalP').text(totalPayment);			//총결제금액 
		
		setTimeout(function(){
			$('#pointResult').text('');
		}, 3000); 
	}
}

//주문서 전체리셋버튼
$('#allResetBtn').click(function(){
	$('#userName').val('');
	$('#userPhone1').val('');
	$('#userPhone2').val('');
	$('#userPhone3').val('');
	$('#userEmail').val('');
	
	$('#totalPoint').val(0);
	$('#usingPoint').val(0);
	$('#remainingPoint').val(0);
	
	$('#productTableResetBtn').trigger('click');
	$('#deliveryInfoResetBtn').trigger('click');
});

//주문서에서 주문상품정보초기화버튼
$('#productTableResetBtn').on('click',function(){
	var trLength = $('#orderedProductTable tr').length-1;
	//alert(trLength);
	
	if(trLength == 0){
		$('#resetResultDiv').text('주문상품테이블이 이미 초기화된 상태입니다').css('color','tomato').css('font-size','16px');
	}
	else {
		$('#orderedProductTable tr:gt(0)').remove()
		$('#resetResultDiv').text('주문상품테이블이 초기화되었습니다').css('color','tomato').css('font-size','16px');
		$('#goodsPrice').text(0);
		$('#deliveryFee').text(0);
		$('#totalP').text(0);
	
	}
	setTimeout(function() {
		$('#resetResultDiv').text('')	
	}, 2000);
});

//주문서에서 배송정보 초기화버튼
$('#deliveryInfoResetBtn').click(function(){
	
	if($('#receiverName').val() == '' && $('#receiverAddr1').val() == '' && $('#receiverPhone2').val() == '' ){
		$('#deliveryResetDiv').text('배송정보가 이미 초기화된 상태입니다').css('color','tomato').css('font-size','16px');
	}
	else{
		$('#receiverName').val('');
		$('#receiverZipcode').val('');
		$('#receiverAddr1').val('');
		$('#receiverAddr2').val('');
		$('#receiverPhone1').val('');
		$('#receiverPhone2').val('');
		$('#receiverPhone3').val('');
		
		$('#deliveryResetDiv').text('배송정보가 초기화되었습니다').css('color','tomato').css('font-size','16px');
	}
	
	setTimeout(function() {
		$('#deliveryResetDiv').text('')	
	}, 2000);

});

//취소버튼 클릭
$('#orderResetBtn').click(function(){
	$('#allResetBtn').trigger('click');
});

//등록버튼 클릭
$('#orderRegBtn').click(function(){
		
	//주문 등록 유효성검사
	if(	$('#userName').val() == '' || $('#userPhone1').val() == '' ||  $('#userPhone2').val() == ''
		|| $('#userPhone3').val() == '' || $('#userEmail').val() == ''){
		$('#regResultDiv').text('주문자 정보를 입력하세요').css('color','red').css('font-size','19px');
	}
		
	else if($('#receiverName').val() == ''){
		$('#regResultDiv').text('받으실 분의 이름을 입력하세요').css('color','red').css('font-size','19px');
	}
	
	else if($('#receiverZipcode').val() == '' || $('#receiverAddr1').val() == '' || $('#receiverAddr2').val() == ''){
		$('#regResultDiv').text('배송지를 입력하세요').css('color','red').css('font-size','19px');
	}
	
	else if($('#receiverPhone1').val() == '' || $('#receiverPhone2').val() == '' || $('#receiverPhone3').val() == ''){
		$('#regResultDiv').text('받으실 분의 핸드폰 번호를 입력하세요').css('color','red').css('font-size','19px');
	}
		
	else{
		//db로 보냄
		//tbl_orderlist 생성	: 1개
			
		$.ajax({
			type : 'POST',
			url : '/kokonutStationery/admin/setOrderlistInManagerOrder.do',
			data : {'userId' 		: $('#userId').val(),
					'userName' 		: $('#userName').val(),
					'paymentType' 	: $('input[name="payType"]:checked').val()*1,
					'totalProductPayment' : $('#goodsPrice').text()*1,  //총주문금액(상품합계금액)
					'totalPayment' 	: $('#totalP').text()*1,		    //총결제금액
					'deliveryFee'	: $('#deliveryFee').text()*1 },
			dataType : 'text',
			success : function(data){
				if(data == "success"){
					alert("success sending orderlistInfo : before updating orderState");
				}
				else {
					alert("failure");
				}
			}
		});
		
		
		//tbl_order 생성 	: 상품수만큼
		var productCode = new Array();
		$('.productCode').each(function(index){
			productCode.push($('.productCode')[index].innerHTML*1);
		});
		//alert(productCode);
		
		var productName = new Array();
		$('.productName').each(function(index){
			productName.push($('.productName')[index].innerHTML);
		});
		//alert(productName);
		
		var optionContent = new Array();
		var productOption = new Array();
		$('.optionContent').each(function(index){
			//alert($('.optionContent')[index].innerHTML);
			if($('.optionContent')[index].innerHTML == '옵션없음'){
				optionContent.push('');
				productOption.push(0);
			}
			else {
				optionContent.push($('.optionContent')[index].innerHTML);
				productOption.push(1);
			}
		});
		//alert(optionContent);
		//alert(productOption);
		
		var discountPrice = new Array();
		$('.discountPrice').each(function(index){
			var length = $('.discountPrice')[index].innerHTML.length;
			discountPrice.push($('.discountPrice')[index].innerHTML.substring(0,length-2)*1);
		});
		//alert(discountPrice);
		
		var purchaseQty = new Array();
		$('.purchaseQty').each(function(index){
			var length = $('.purchaseQty')[index].innerHTML.length;
			purchaseQty.push($('.purchaseQty')[index].innerHTML.substring(0,length-2)*1);
		});
		//alert(purchaseQty);
		
		for(var i = 0; i<productCode.length; i++){
			$.ajax({
				type : 'POST',
				url  : '/kokonutStationery/admin/setOrderInManagerOrder.do',
				data : {'userId' 		: $('#userId').val(),
						'userName' 		: $('#userName').val(),
						'productCode' 	: productCode[i],
						'productName'	: productName[i],
						'discountPrice' : discountPrice[i],
						'purchaseQty' 	: purchaseQty[i],
						'paymentType' 	: $('input[name="payType"]:checked').val()*1,
						'totalPayment' 	: $('#totalP').text()*1,
						'productOption' : productOption[i],
						'optionContent' : optionContent[i] },
				dataType : 'text',
				success : function(data){
					if(data == "success"){
						//alert("success sending orderInfo");
					}
					else {
						//alert("failure1");
					}
	
				}
			});//ajax
		}//for
		
		//tbl_product : update stock
		for(var i = 0; i<productCode.length; i++){
			$.ajax({
				type : 'POST',
				url : '/kokonutStationery/admin/changeStockInManagerOrder.do',
				data : {'productCode' : productCode[i],
						'purchaseQty' : purchaseQty[i],
						'productOption' : productOption[i]*1,
						'optionContent' : optionContent[i] },
				dataType : 'text',
				success : function(data){
					if(data == 'success'){
						//alert("success changing stock");
					}
					else {
						//alert("failure2");
					}
				}
			});//ajax
		}//for
			
		//tbl_point 생성 : 1개  
		var usePoint = $('#usingPoint').val()*1;
		if(usePoint != 0){
			$.ajax({
				type : 'POST',
				url : '/kokonutStationery/admin/setPointInfoInManagerOrder.do',
				data : {'userId'   : $('#userId').val(),
						'usePoint' : usePoint },
				dataType : 'text',
				success : function(data){
					if(data == 'success'){
						//alert("success inserting pointInfo");
					}
					else {
						//alert("failure3");
					}
					
				}
			});//ajax
		}//if
		
		//tbl_user : userPoint + 배송정보수정 + 총구매액 수정 : update	
		//tbl_orderlist orderState 변경 7 -> 1 : update
		$.ajax({
			type : 'POST',
			url  : '/kokonutStationery/admin/changeUserInfo.do',
			data : {'userId' : $('#userId').val(),
					'userPoint' : $('#remainingPoint').val(),
					'receiverName' : $('#receiverName').val(),
					'receiverZipcode' : $('#receiverZipcode').val(),
					'receiverAddr1' : $('#receiverAddr1').val(),
					'receiverAddr2' : $('#receiverAddr2').val(),
					'receiverPhone1': $('#receiverPhone1').val(),
					'receiverPhone2': $('#receiverPhone2').val(),
					'receiverPhone3': $('#receiverPhone3').val(),
					'deliveryMsg'	: $('#deliveryMsg').val(),
					'totalPayment'	: $('#totalP').text()*1	},
			dataType : 'text',
			success : function(data){
				if(data == 'success'){
					//alert("success changing userInfo");
				}
				else {
					//alert("failure4");
				}
			}
		});//ajax
	
		$('#regResultDiv').text('주문이 등록되었습니다').css('color','red').css('font-size','19px');
		//전체초기화
		$('#allResetBtn').trigger('click');
		
		
	}//else	

	setTimeout(function(){
		$('#regResultDiv').text('');			
	}, 2000);
	
});

//다음 주소 API
function daumCheckPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
       
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
         	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	addr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                	addr += (addr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                                 
            } else {
                document.getElementById("receiverAddr1").value = '';
            }
          
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('receiverZipcode').value = data.zonecode;
            document.getElementById("receiverAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("receiverAddr2").focus();
        }
    }).open();
}
</script>
</html>