<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
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

.minusImg {
	width: 20px;
	vertical-align: middle;
	cursor: pointer;
}

</style>
</head>
<body>
<form id="productRegistForm" method="post" enctype="multipart/form-data" 
	action="/kokonutStationery/admin/productRegist.do">
<div id="main_wrap" align="left" style="width: 1000px; margin: 0 auto;">

	<div>
		<h1 style="font-weight:normal;">상품등록</h1>
	</div>
	<div id="product_info">
		<table id="product_info_table" border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>상 품 명</th>
				<td>
					<input type="text" id="productName" class="inputText" name="productName" >
				</td>
			</tr>
			<tr>
				<th>상 품 가 격</th>
				<td>
					<input type="number" id="originalPrice" name="originalPrice" min="0" > KRW
				</td>
			</tr>
			<tr>
				<th>원 산 지</th>
				<td>
					<input type="text" id="origin" class="inputText" name="origin" >
				</td>
			</tr>
			<tr>
				<th>제 조 사</th>
				<td>
					<input type="text" id="manufacturer" class="inputText" name="manufacturer" >
				</td>
			</tr>
			<tr>
				<th>입 고 수 량</th>
				<td>
					<input type="number" id="totalQty" class="inputText" name="totalQty" min="0" value="0"> 개
					&nbsp;&nbsp;
					<span style="color: #aaaaaa; font-size: 12px; display:inline-block; vertical-align: middle;">
						- 옵션을 추가하실 경우 옵션 수량의 합이 자동으로 입고수량으로 측정됩니다.<br>
						- 미입력시 기본값 0이 입력됩니다.
					</span>				
				</td>
			</tr>
			<tr>
				<th>카 테 고 리 선 택</th>
				<td id="categories_td">
					<input type="checkbox" name="stationery" value="1">문구
					&nbsp; &nbsp;
					<input type="checkbox" name="living" value="1">리빙
					&nbsp; &nbsp;
					<input type="checkbox" name="travel" value="1">여행
					&nbsp; &nbsp;
					<input type="checkbox" name="collabo" value="1">콜라보레이션
				</td>
			</tr>
			<tr>
				<th>프 로 모 션</th>
				<td>
					<input type="checkbox" name="best" value="1">잘나가요
					&nbsp; &nbsp;
					<input type="checkbox" id="discount" name="discount" value="1">깜짝세일
					&nbsp; &nbsp;
					<div id="discountDiv" style="display: inline-block;">
						<span style="border:1px solid #d9dadc; width: 154px; height: 35px; text-align: center; 
						font-weight: 500; background-color: #f5f4f4; padding: 9px 9px 7px;">
							할인가격 
						</span>
						&nbsp;
						<input type="number" class="inputText" name="discountPrice" min="0" value="0"> KRW
						<span style="color: #aaaaaa; font-size: 12px;">
							- 미입력시 기본 상품가격으로 입력됩니다.
						</span>
					</div>
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
			<input type="button" class="regist_reset" id="registBtn" value="상품 등록">
			<input type="button" class="regist_reset" id="registResetBtn" value="취소">
		</div>
	</div>
</div>
</form>
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//창닫기
$('#registResetBtn').click(function(){
   window.close();
});

//깜짝세일 기능
$('#discountDiv').hide();
$('#discount').click(function(){
	$('#discountDiv').toggle();
});

//옵션버튼 기능
$('#add_optionBtn').hide();
$('#check_option').click(function(){
	$('#add_optionBtn').show();
});
$('#none_option').click(function(){
	$('#add_optionBtn').hide();
});
//옵션 추가
var cnt = 0;
$('#add_optionBtn').click(function(){	
	cnt++;
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
			type : 'number',
			id   : 'subTotalQty',
			name : 'subTotalQty',
			value : '0',
			min : '0'
		})).append($('<span/>', {
			text : " 개"
		}).append('&nbsp;').append('&nbsp;')).append($('<img/>',{
			src : '/kokonutStationery/image/minus.png',
			id : 'minusImg' + cnt,
			class : 'minusImg'
		}))
	));	
	//추가옵션 삭제
	$('.minusImg').click(function(){
		$(this).parent().parent().remove();
	});
});


//유효성 검사
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
	else if($('#thumbImg').val()=='')
		alert('썸네일 이미지를 삽입해주세요');
	else if($('#detailedImg').val()=='')
		alert('상품상세이미지를 삽입해주세요');
	else if($('#optionContent').val()=='')
		alert("옵션 내용을 입력해주세요");
	else if($('#subTotalQty').val()=='')
		alert("옵션 수량을 입력해주세요");
	else{
		$('#productRegistForm').submit();
	}
});
</script>
</html>