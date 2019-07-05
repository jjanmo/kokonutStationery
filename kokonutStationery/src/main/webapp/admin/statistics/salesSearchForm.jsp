<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family:'Hanna', sans-serif;}

.sales_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.sales_search td{
	width: 700px;
	padding-left: 10px;
}

#sales_searchBtn{
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

#salesSeach_list th{
	height: 53px;
	font-weight: 500;
}

.sales_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

#sales_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#sales_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#salesSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}
.sales_search input{
	padding-left: 10px;
}
#salesTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#salesTable select{
	width: 80px;
	height: 27px;
}

.inputText{
	height: 23px;
	padding-left: 5px;
}
</style>
</head>
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="sales_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="sales_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">상세매출</h1>
		</div>
		<div id="sales_search_div"></div>
		
		<form id="salesSearchForm">
			<div class="sales_search" align="left">
				<table border="1" id="salesTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select id="searchKategorie">
								<option value="product">상품별</option>
								<option value="userID">고객 ID</option>	
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
					<input type="button" id="sales_searchBtn" class="sales_btn_group" value="검 색">
					<input type="reset" id="sales_resetBtn" class="sales_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<div id="salesSeach_list" align="left" style="margin-top: 50px;">
			<table border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 165px;">상품코드</th>
					<th style="width: 180px;">상품이미지</th>
					<th style="width: 400px;">상품명</th>
					<th style="width: 200px;">주문자</th>
					<th style="width: 200px;">주문일</th>
					<th style="width: 185px;">총매출</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->
</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

/* 숫자탭 컴마 추가 */
function addComma(num) {
 var regexp = /\B(?=(\d{3})+(?!\d))/g;
 return num.toString().replace(regexp, ',');
}

$(document).ready(function(){
	/* 페이지 로딩 시 전체 상품별 총 매출액 */
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/salesList.do',
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index,items){
				
			});
		}
	});//ajax
});

/* 검색 시 리스트 생성 */
$('#sales_searchBtn').click(function(){
	$('#sales_search_div').empty();
	
	alert('서치클릭');
	if($('#dateText1').val()!=''||$('#dateText2').val()!=''){
		if($('#dateText1').val().length!=8 || $('#dateText2').val().length!=8){
			$('#sales_search_div').text('기간을 형식에 맞춰 입력해 주세요').css('color', 'red').css('font-weight', '10pt');		
			return;
		}
	}
	

	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/salesList.do',
		data : {'kategorie' : $('#searchKategorie').val(),
				'searchText' : $('#searchText').val(),
				'dateText1' : $('#dateText1').val(),
				'dateText2' : $('#dateText2').val()},
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index,items){
				
			});
		}
	});//ajax
});

</script>

</html>