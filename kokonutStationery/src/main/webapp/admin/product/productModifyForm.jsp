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

#totalQty{
	width: 70px;
	text-align: right;
	padding-right: 5px;
}

#optionContent{
	width: 200px;
	height: 30px;
	text-align: left;
	padding-left: 5px;
}
#subTotalQty{
	width: 80px;
	height: 30px;
	text-align: right;
	padding-right: 5px;
}

</style>
</head>
<body>
<form id="productRegistForm" method="post" enctype="multipart/form-data" 
	action="/kokonutStationery/admin/productRegist.do">
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
					<input type="text" id="originalPrice" name="originalPrice" value="${goodsDTO.originalPrice }"> KRW
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
				<th>입 고 수 량</th>
				<td>
					<input type="text" id="totalQty" class="inputText" name="totalQty" value="${goodsDTO.totalQty }"> 개
				</td>
			</tr>
			<tr>
				<th>카 테 고 리 선 택</th>
				<td>
					<input type="hidden" id="productDTOstationery" value="${goodsDTO.stationery}">
					<input type="hidden" id="productDTOLiving" value="${goodsDTO.living}">
					<input type="hidden" id="productDTOTravel" value="${goodsDTO.travel}">
					<input type="hidden" id="productDTOCollabo" value="${goodsDTO.collabo}">
					<select style="height: 22px;" id="categories" name="categories">
							<option>-카테고리 선택-</option>
							<option id="stationery" value="stationery">문구</option>
							<option id="living" value="living">리빙</option>
							<option id="travel" value="travel">여행</option>
							<option id="collabo" value="collabo">콜라보레이션</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>썸 네 일  이 미 지</th>
				<td>
					<input type="file" id="thumbImg" name="thumbFile"> 
				</td>
			</tr>
			<tr>
				<th>상 품 상 세 설 명</th>
				<td>
					<input type="file" id="detailedImg" name="detailedFile"> 
				</td>
			</tr>
			
			<tr>
				<th>옵  션</th>
				<td>
					<input type="radio" name="productOption" id="check_option" value="1" > 있음
					<input type="radio" name="productOption" id="none_option" value="0" checked> 없음   
					<input type="button" id="add_optionBtn" value="옵션 추가"/>
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
	if($('#productDTOstationery').val()!=0)
		$('#stationery').attr('name','asd');
});
/*
$('#registResetBtn').click(function(){
   window.close();
});

$('#add_optionBtn').click(function(){
	$('#product_info_table').append($('<tr/>'
	).append($('<th/>', {
		text : "추가 옵션"
	})).append($('<td/>', {
		text : "옵션 내용 ",
		}).append($('<input/>', {
			type : 'text',
			id   : 'optionContent',
			name : 'optionContent'
		})).append($('<span/>', {
			text : "  입고수량  "
		})).append($('<input/>', {
			type : 'text',
			id   : 'subTotalQty',
			name : 'subTotalQty'
		})).append($('<span/>', {
			text : " 개"
		}))
	));		
});

$('#registBtn').click(function(){
	if($('#categories').val()=='-카테고리 선택-')
		alert('카테고리를 선택해주세요!');
	else if($('#productName').val()=='')
		alert('상품명을 입력해주세요');
	else if($('#originalPrice').val()=='')
		alert('상품가격을 입력해주세요');
	else if($('#origin').val()=='')
		alert('원산지를 입력해주세요');
	else if($('#thumbImg').val()=='')
		alert('썸네일 이미지를 삽입해주세요');
	else if($('#detailedImg').val()=='')
		alert('상품상세이미지를 삽입해주세요');
	else{
		$('#productRegistForm').submit();
	}
});
*/
</script>

</html>