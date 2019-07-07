<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}
#product_info th{
	width: 154px;
    height: 35px;
    text-align: center;
    font-weight: 500;
    background-color: #f5f4f4;
    padding: 9px 9px 7px;
}

#product_info td{
	width: 80%;
    padding-left: 10px;
}
.regist_reset{
	min-width: 140px;
    padding: 0 30px;
    font-size: 16px;
    font-weight: bold;
    line-height: 40px;
    cursor: pointer;
}

#registBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
    font-weight:normal;
}

#registResetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
    font-weight:normal;
}

.inputText{
	height: 27px;
	padding-left: 5px;
}
.inputImg{
	border: none;
	width: 100px;
    height: 20px;
    background-color: #f5f4f4;
    font-size: 16px;
    padding: 0;    
}
#productName{
	width: 300px;
}

#originalPrice{
	width: 85px;
	height: 18px;
	text-align: right;
	padding-right: 5px;
}

#origin{
	width: 150px;
}

#manufacturer{
	width: 150px;
}

.qty{
	width: 50px;
	text-align: right;
	padding-right: 5px;
}


#optionContent{
	width: 200px;
	height: 30px;
	text-align: left;
	padding-left: 5px;
}
#addOptionContent{
	width: 200px;
	height: 30px;
	text-align: left;
	padding-left: 5px;
}
.span{
	border:1px solid #bbb; 
	width: 100px; 
	height: 35px; 
	text-align: center; 
	font-weight: 500; 
	background-color: #f5f4f4; 
	padding: 9px 9px 7px;
	vertical-align: middle;
}
.modifyImg{
	width: 34px;
	height: 34px;
	vertical-align: middle;
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	/* transition: all 0.3s ease-in-out; */   /* 부드러운 모션을 위해 추가*/
}

#thumbImgModify:hover {
	border: 0.1px solid black;	
	transform: scale(10);
	-webkit-transform: scale(10);
	-moz-transform: scale(10);
	-ms-transform: scale(10);
	-o-transform: scale(10);
}
#detailedImgModify:hover {
	border: 0.1px solid black;
	transform: translateY(-200px) scaleX(10) scaleY(20);
	-webkit-transform: translateY(-200px) scaleX(10) scaleY(20);
	-moz-transform: translateY(-200px) scaleX(10) scaleY(20);
	-ms-transform: translateY(-200px) scaleX(10) scaleY(20);
	-o-transform: translateY(-200px) scaleX(10) scaleY(20);
}
</style>
</head>
<body>
<form id="productModifyForm" method="post" enctype="multipart/form-data" 
	action="/kokonutStationery/admin/productModify.do">
<input type="hidden" name="productCode" value="${goodsDTO.productCode}">
<div id="main_wrap" align="left" style="width: 1000px; margin: 0 auto;">

	<div>
		<h1 style="font-weight:normal;">상품수정</h1>
	</div>
	<div id="product_info">
		<table id="product_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>상 품 명</th>
				<td>
					<input type="text" id="productName" class="inputText" name="productName" value="${goodsDTO.productName }">
				</td>
			</tr>
			<tr>
				<th>상 품 가 격</th>
				<td>
					<input type="number" id="originalPrice" name="originalPrice" min="0" value="${goodsDTO.originalPrice }"> KRW
				</td>
			</tr>
			<tr>
				<th>원 산 지</th>
				<td>
					<input type="text" id="origin" class="inputText" name="origin" value="${goodsDTO.origin }">
				</td>
			</tr>
			<tr>
				<th>제 조 사</th>
				<td>
					<input type="text" id="manufacturer" class="inputText" name="manufacturer" value="${goodsDTO.manufacturer }">
				</td>
			</tr>
			<tr>
				<th>총 재 고 량</th>
				<td id="qty_tr">
					<input type="number" id="totalQty" class="inputText qty" name="totalQty" value="${goodsDTO.totalQty }" readonly> 개
					&nbsp;
					<span class="span">
						잔 여 수 량 
					</span>
					&nbsp;	
					<input type="number" id="stockQty" class="inputText qty" name="stockQty" value="${goodsDTO.stockQty }" readonly> 개
					&nbsp;
					<span class="span">
						재 고 추 가 
					</span>
					&nbsp;
					<input type="number" id="addQty" class="inputText qty" name="addQty" value="0"> 개
					&nbsp;
					<span style="color: #aaaaaa; font-size: 12px; display:inline-block; vertical-align: middle;">
						- 옵션이 존재할 경우 재고 추가는 옵션 항목에서 추가해주세요.
					</span>
				</td>
			</tr>
			<tr>
				<th>카 테 고 리 선 택</th>
				<td>				
					<input type="checkbox" id="stationery" name="stationery" value="${goodsDTO.stationery}">문구
					&nbsp; &nbsp;
					<input type="checkbox" id="living" name="living" value="${goodsDTO.living}">리빙
					&nbsp; &nbsp;
					<input type="checkbox" id="travel" name="travel" value="${goodsDTO.travel}">여행
					&nbsp; &nbsp;
					<input type="checkbox" id="collabo" name="collabo" value="${goodsDTO.collabo}">콜라보레이션
				</td>
			</tr>
			<tr>
				<th>프 로 모 션</th>
				<td>
					<input type="checkbox" id="newP" name="newP" value="${goodsDTO.newP }">신상품
					&nbsp; &nbsp;
					<input type="checkbox" id="best" name="best" value="${goodsDTO.best }">잘나가요
					&nbsp; &nbsp;
					<input type="checkbox" id="discount" name="discount" value="${goodsDTO.discount }">깜짝세일
					&nbsp; &nbsp;
					<div id="discountDiv" style="display: inline-block;">
						<span class="span">
							할 인 가 격 
						</span>
						&nbsp;
						<input type="number" class="inputText" name="discountPrice" min="0" value="${goodsDTO.discountPrice }"> KRW
						<span style="color: #aaaaaa; font-size: 12px;">
							- 미입력시 기본 상품가격으로 입력됩니다.
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>판 매 상 태</th>
				<td>
					<input type="radio" name="saleStatus" id="soldOut" value="0"> 품절 
					<input type="radio" name="saleStatus" id="sale" value="1"> 판매중 
					<input type="radio" name="saleStatus" id="stopSale" value="2"> 판매중지 
					<input type="hidden" id="saleStatus" value="${goodsDTO.saleStatus}">
				</td>
			</tr>
			<tr>
				<th>썸 네 일  이 미 지</th>
				<td>
					<input type="file" id="thumbImg" name="thumbFile" style="width:200px;">
					<span style="color: #aaaaaa; font-size: 12px;">
							- 파일 미업로드시 기존 이미지가 유지됩니다.
					</span>
					&nbsp;
					<span class="span">
						기존 이미지 : <input type="text" class="inputImg" name="thumbImg" value="${goodsDTO.thumbImg}" readonly>
					</span>
					&nbsp;
					<img class="modifyImg" id="thumbImgModify" src="/kokonutStationery/image/thumb/${goodsDTO.thumbImg}">
				</td>
			</tr>
			<tr>
				<th>상 품 상 세 설 명</th>
				<td>
					<input type="file" id="detailedImg" name="detailedFile" style="width:200px;">
					<span style="color: #aaaaaa; font-size: 12px;">
							- 파일 미업로드시 기존 이미지가 유지됩니다.
					</span>
					&nbsp;
					<span class="span">
						기존 이미지 : <input type="text" class="inputImg" name="detailedImg" value="${goodsDTO.detailedImg}" readonly>
					</span>
					&nbsp;
					<img class="modifyImg" id="detailedImgModify" src="/kokonutStationery/image/detailed/${goodsDTO.detailedImg}">
				</td>
			</tr>
			
			<tr>
				<th>옵  션</th>
				<td>
					<input type="radio" name="productOption" id="check_option" value="1" > 있음
					<input type="radio" name="productOption" id="none_option" value="0" > 없음   
					<input type="button" id="add_optionBtn" value="옵션 추가"/>
					<input type="hidden" id="productOption" value="${goodsDTO.productOption}">
				</td>
			</tr>		
				
		</table>
		<div align="center" style="margin-top: 50px;">
			<input type="button" class="regist_reset" id="registBtn" value="상품 수정">
			<input type="button" class="regist_reset" id="registResetBtn" value="취소">
		</div>
	</div>
</div>
</form>
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	//옵션 기능 시작*********
	$('#add_optionBtn').hide();
	//옵션 체크여부
	if($('#productOption').val()==1){
		$('#check_option').prop('checked', true);
		$('#add_optionBtn').show();
		//옵션이 있을경우 위쪽 재고추가기능 막기
		$('#addQty').prop('readonly', true);
	}else{
		$('#none_option').prop('checked', true);
	}
	//옵션버튼 하이드쇼 기능
	$('#check_option').click(function(){
		$('#add_optionBtn').show();
	});
	
	//기존옵션 불러오기
	$.ajax({
		type : 'post',
		url : '/kokonutStationery/admin/getProductOption.do',
		data : {'productCode' : '${goodsDTO.productCode}'},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('#productModifyForm').append($('<input/>',{
					type : 'hidden',
					name : 'optionCode',
					value : items.optionCode
				}));
	
				$('#product_info_table').append($('<tr/>'
				).append($('<th/>', {
					text : "기존 옵션"
					}).append('&nbsp;').append($('<input/>', {
						type : 'button',
						class : 'optionDeleteBtn',
						id : items.optionCode+'_optionDeleteBtn',
						value : '옵션 삭제'
				}))).append($('<td/>', {
					text : "옵션 내용 ",
					}).append($('<input/>', {
						type : 'text',
						id   : 'optionContent',
						name : 'optionContent',
						value : items.optionContent
					})).append('&nbsp;').append($('<span/>', {
						text : "총재고량  ",
						class : "span"
					})).append('&nbsp;').append($('<input/>', {
						type : 'number',
						id   : 'subTotalQty',
						name : 'subTotalQty',
						class : 'inputText qty',
						value : items.subTotalQty,
						readonly : 'true'
					})).append($('<span/>', {
						text : " 개  "
					})).append($('<span/>', {
						text : "  잔여수량  ",
						class : "span"
					})).append('&nbsp;').append($('<input/>', {
						type : 'number',
						id   : 'subStockQty',
						name : 'subStockQty',
						class : 'inputText qty',
						value : items.subStockQty,
						readonly : 'true'
					})).append($('<span/>', {
						text : " 개 "
					})).append($('<span/>', {
						text : "재고추가",
						class : "span"
					})).append('&nbsp;').append($('<input/>', {
						type : 'number',
						id   : 'addSubQty',
						name : 'addSubQty',
						class : 'inputText qty',
						value : '0'
					})).append($('<span/>', {
						text : " 개"
					}))
				))
				
				
				
				$('#'+items.optionCode+'_optionDeleteBtn').click(function(){
					if(confirm(items.optionCode+'번 옵션을 삭제하시겠습니까?')){
						$.ajax({
							type : 'post',
							url : '/kokonutStationery/admin/selectedOptionDelete.do',
							data : 'optionCode=' + items.optionCode,
							dataType : 'text',
							success : function(data){
								//alert(data);
								if(data==1){
									alert(items.optionCode+"번 옵션 삭제 완료!");
									location.reload();									
								}else{
									alert('삭제 실패...');
								}
							}
						}); 
					}
				})
				
			});
			//삭제로인해 기존옵션이 모두 없어지면 옵션 없음에 체크
			if($('input[name=optionContent]').length==0){
				//alert($('input[name=optionContent]').length);
				$('#none_option').prop('checked', true);
			}			
		}
	});	
	
	//옵션 추가 기능
	$('#none_option').click(function(){
		$('#add_optionBtn').hide();
	});
	$('#add_optionBtn').click(function(){
		$('#product_info_table').append($('<tr/>'
		).append($('<th/>', {
			text : "추가 옵션"
		})).append($('<td/>', {
			text : "옵션 내용 ",
			}).append($('<input/>', {
				type : 'text',
				id   : 'addOptionContent',
				name : 'addOptionContent'
			})).append($('<span/>', {
				text : "  입고수량  "
			})).append($('<input/>', {
				type : 'number',
				id   : 'addSubTotalQty',
				name : 'addSubTotalQty',
				class : 'inputText qty',
				value : '0'
			})).append($('<span/>', {
				text : " 개"
			}))
		));		
	});
	//옵션기능 끝*******
});
</script>
<script>
//창 닫기
$('#registResetBtn').click(function(){
   window.close();
});

//카테고리 체크 여부
if($('#stationery').val()==1)
	$('#stationery').prop('checked', true);
else
	$('#stationery').prop('value', '1');
if($('#living').val()==1)
	$('#living').prop('checked', true);
else
	$('#lving').prop('value', '1');
if($('#travel').val()==1)
	$('#travel').prop('checked', true);
else
	$('#travel').prop('value', '1');
if($('#collabo').val()==1)
	$('#collabo').prop('checked', true);
else
	$('#collbao').prop('value', '1');
if($('#newP').val()==1)
	$('#newP').prop('checked', true);
else
	$('#discount').prop('value', '1');
if($('#best').val()==1)
	$('#best').prop('checked', true);
else
	$('#best').prop('value', '1');
if($('#discount').val()==1)
	$('#discount').prop('checked', true);
else
	$('#discount').prop('value', '1');


//깜짝세일 기능 -- 깜짝세일이 체크되어있으면 보여주고 아니면 안보여주고
$('#discountDiv').show();
if($('#discount').is(':checked')==false){
	$('#discountDiv').hide();	
}
$('#discount').click(function(){
	$('#discountDiv').toggle();
});

//판매상태 기능
if($('#saleStatus').val()==0){
	$('#soldOut').prop('checked', true);
}else if($('#saleStatus').val()==1){
	$('#sale').prop('checked', true);
}else if($('#saleStatus').val()==2){
	$('#stopSale').prop('checked', true);
}
//썸네일 이미지 확대 관련
$('#thumbImgModify').hover(function(){
	$('#detailedImgModify').hide();
}, function(){
	$('#detailedImgModify').show();
});

//유효성검사
$('#registBtn').click(function(){
	if($('#productName').val()=='')
		alert('상품명을 입력해주세요');
	else if($('#originalPrice').val()=='')
		alert('상품가격을 입력해주세요');
	else if($('#origin').val()=='')
		alert('원산지를 입력해주세요');
	else if($('#manufaturer').val()=='')
		alert('제조사를 입력해주세요');
	else if($('#totalQty').val()=='')
		alert('입고수량을 입력해주세요');
	else if($('#discountPrice').val()=='')
		alert('할인가격을 입력해주세요')
	else if($('#optionContent').val()=='')
		alert("옵션 내용을 입력해주세요");
	else if($('#subTotalQty').val()=='')
		alert("옵션 수량을 입력해주세요");
	else{
		$('#productModifyForm').submit();
	}
});

</script>

</html>