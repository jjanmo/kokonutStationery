<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.product_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.product_search td{
	width: 700px;
	padding-left: 10px;
}


.product_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

#product_searchBtn{
	
	color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#product_resetBtn{
	
  	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}



#productRegistBtn{
	width: 100px;
	height: 35px;
    padding: 0 20px;
    font-size: 14px;
	font-weight: normal;
    cursor: pointer;
	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
   	float: right;
}
#productRegistBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}
#productDeleteBtn{
	width: 100px;
	height: 35px;
    padding: 0 20px;
    font-size: 14px;
	font-weight: normal;
    cursor: pointer;
	color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
   	float: right;
}
#productDeleteBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}
#productText{
	width: 300px;
}

#productSeach_list th{
	background-color: #f5f4f4;
	font-weight: 500;
	height: 53px;
}



.product_search select{
	height: 27px;
}
#productSearchWord{
	height: 23px;
	padding-left: 5px;
}
.priceText{
	width: 85px;
	height: 18px;
	text-align: right;
	padding-right: 5px;
}

#productPagingDiv{
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
#productA:link{
	color: black;
} 
#productA:hover{
	color: #1b87d4;
	text-decoration: underline;
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
<input type="hidden" id="deleteCheck" value="${deleteCheck }">
<input type="hidden" class="deleteCheck" value="0">
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" name="pg" value="1">
<div id="mainContent_wrap">
	<div id="product_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="product_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">상품관리</h1>
			<div id="product_searchDiv"></div>
		</div>
		
		<form name="product_searchForm" method="post">
		<div class="product_search" align="left">
			<table border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th>상 품 분 류</th>
					<td>
						<select id="kategorie">
							<option>-카테고리 선택-</option>
							<option value="stationery">문구</option>
							<option value="living">리빙</option>
							<option value="travel">여행</option>
							<option value="collabo">콜라보레이션</option>
						</select>
					</td>
				</tr>

				<tr>
					<th>상 품 검 색</th>
					<td>
						<select id="productKeyword">
							<option value="productName">상품명</option>
							<option value="productCode">상품코드</option>
							<option value="manufacturer">제조사</option>
						</select>
						<input type="text" id="productSearchWord">
					</td>
				</tr>
				
				<tr>
					<th>판 매 가</th>
					<td>
						<input type="text" id="lowPrice" class="priceText" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> KRW ~ 
						<input type="text" id="highPrice" class="priceText" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> KRW
					</td>
				</tr>
			</table>
			<div style="margin-top: 15px" align="center">
				<input type="button" id="product_searchBtn" class="product_btn_group" value="검 색">
				<input type="reset" id="product_resetBtn" class="product_btn_group" value="초기화">
			</div>
			<div>
            	<input type="button" id="productRegistBtn" value="상 품 등 록">
         	</div>
         	<div style="float: left;">
           		<input type="button" id="productDeleteBtn" value="선 택 삭 제">
         	</div>
         	
         	
		</div>
	    </form>
	    
	    <form id="checkDeleteForm" method="post" 
	    action="productDelete.do">   			
		<div id="productSeach_list" align="left" style="margin-top: 50px;">
			<table id="productSearch_Table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox" id="check_all">
					</th>
					<th style="width: 100px;">상품코드</th>
					<th style="width: 336px;">상품명</th>
					<th style="width: 134px;">상품원가</th>
					<th style="width: 134px;">세일가격</th>
					<th style="width: 134px;">총 수량</th>
					<th style="width: 134px;">잔여 수량</th>
					<th style="width: 134px;">총 판매량</th>
					<th style="width: 100px;">등록일</th>
				</tr>
			</table>
			<br>
			<div id="productPagingDiv"></div>
			<br><br><br><br>
						
			
		</div>
		</form>      
		
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
	    <div id="open_confirmModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="confirmClose_Modal" style="float:right;">
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
				<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
                <p style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
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

/* 모달 창 닫기 */
$('#confirmClose_Modal').click(function(){
	$('#open_confirmModal').hide();
});

$('.close_Modal').click(function(){
	$('#open_nonCheckModal').hide();
	$('#open_deleteSuccessModal').hide();
});

/* 상품 선택 삭제 */
$('#productDeleteBtn').click(function(){
	var count = $('.check:checked').length;
	if(count==0){
		$('#open_nonCheckModal').show();
	}else{
		$('#open_confirmModal').show();
		$("#confirmOK_Modal").off().on('click', function(){
			$('#checkDeleteForm').submit();
		});
	}

});

/* 체크박스 전체 선택/해제 */
	$('#check_all').click(function(){
		if($('#check_all').is(":checked"))
			$('.check').prop('checked', true);
		else
			$('.check').prop('checked', false);
	});


/* 상품검색 인풋텍스트 정규식 */
function isValidName(name){
    let regx = /^[0-9]*$/;
    return !regx.test(name); 
}

/* 페이징 함수 */
function productPaging(pg){
	location.href="/kokonutStationery/admin/productList.do?pg="+pg;
}
function productSearchPaging(pg){
	$('input[name=pg]').val(pg);
	$('#product_searchBtn').trigger('click', 'trigger');
}

/* 상품등록 버튼 */
$('#productRegistBtn').click(function(){
   window.open('/kokonutStationery/admin/productRegistForm.do','','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
});


$(document).ready(function(){

	
 	/* 페이지 로딩 시 전체 상품목록 */
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/getProductList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index,items){
				$('<tr/>').append($('<td/>',{
					align : 'center'
				}).css('height', '31px'
					).append($('<input/>',{
						type : 'checkbox',
						value : items.productCode,
						name : 'check',
						class : 'check'
				}))).append($('<td/>',{
					align : 'center',
					text : items.productCode
				})).append($('<td/>').css('padding-left', '5px').append($('<a/>',{
					href : 'javascript:void(0)',
					id : 'productA',
					text : items.productName,
					class : items.productCode
				}))).append($('<td/>',{
					align : 'center',
					text : addComma(items.originalPrice)
				})).append($('<td/>',{
					align : 'center',
					text : addComma(items.discountPrice)
				})).append($('<td/>',{
					align : 'center',
					text : addComma(items.totalQty)
				})).append($('<td/>',{
					align : 'center',
					text : addComma(items.stockQty)
				})).append($('<td/>', {
					align : 'center',
					text : addComma(items.saleQty) + '개'
				})).append($('<td/>',{
					align : 'center',
					text : items.regDate
				})).appendTo($('#productSearch_Table'));
			});
			$('#productPagingDiv').html(data.productPaging.pagingHTML);
		}
	});//ajax

});
/* 상품 링크 클릭 시 수정 폼 */
$('#productSearch_Table').on('click', '#productA',function(){
	window.open('/kokonutStationery/admin/productModifyForm.do?productCode='+$(this).attr('class'),'','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
});

/* 상품 서치버튼 */
$('#product_searchBtn').click(function(event,str){
	$('#product_searchDiv').empty();
	
	/* 상품검색 키워드가 productCode일 시 숫자만 입력 가능 */
	if($('#productKeyword').val()=='productCode'){
		var regexp = /^[0-9]*$/
			v = $('#productSearchWord').val();
			if( !regexp.test(v) ) {
				$('#product_searchDiv').text('상품코드는 숫자만 입력해주세요').css('color', 'red').css('font-weight', '10pt')
				return;
			}
	}

	if(( $('#lowPrice').val()!=''&& $('#highPrice').val()!='')
		|| $('#kategorie').val()!='-카테고리 선택-'
		|| $('#productSearchWord').val()!=''){
		
			$('#productSearch_Table tr:not(:first)').empty();
			$.ajax({
				type : 'POST',
				url : '/kokonutStationery/admin/productSearch.do',
				data : {'pg' : $('input[name=pg]').val(),
						'kategorie' : $('#kategorie').val(),
						'productKeyword' : $('#productKeyword').val(),
						'productSearchWord' : $('#productSearchWord').val(),
						'lowPrice' : $('#lowPrice').val(),
						'highPrice' : $('#highPrice').val()
						},
				dataType : 'json',
				success : function(data){
					if(data.list==''){
						$('#product_searchDiv').text('일치하는 검색결과가 없습니다').css('color', 'red').css('font-weight', '10pt')
						return;
					}else{
						$.each(data.list, function(index,items){
							$('<tr/>').append($('<td/>',{
								align : 'center',
							}).css('height', '31px'
									).append($('<input/>',{
										type : 'checkbox',
										value : items.productCode,
										name : 'check',
										class : 'check'
							}))).append($('<td/>',{
								align : 'center',
								text : items.productCode
							})).append($('<td/>').css('padding-left', '5px').append($('<a/>',{
								href : 'javascript:void(0)',
								id : 'productA',
								text : items.productName,
								class : items.productCode
							}))).append($('<td/>',{
								align : 'center',
								text : addComma(items.originalPrice)
							})).append($('<td/>',{
								align : 'center',
								text : addComma(items.discountPrice)
							})).append($('<td/>',{
								align : 'center',
								text : addComma(items.totalQty)
							})).append($('<td/>',{
								align : 'center',
								text : addComma(items.stockQty)
							})).append($('<td/>', {
								align : 'center',
								text : addComma(items.saleQty) + '개'
							})).append($('<td/>',{
								align : 'center',
								text : items.regDate
							})).appendTo($('#productSearch_Table'));
						});
						$('#productPagingDiv').html(data.productPaging.pagingHTML);
					}
				}
			});//ajax
	}//if문
	else{
		$('#product_searchDiv').text('검색항목을 입력해주세요').css('color', 'red').css('font-weight', '10pt')
	}
	
	if(str!='trigger') {
		$('input[name=pg]').val(1);
	}
});
</script>

</html>