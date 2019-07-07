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
.sales_search inputText{
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
</style>
</head>
<body>
<input type="hidden" id="pg" value="${pg }">
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="sales_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="sales_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal; margin-bottom: 0;">상세매출</h1>
			<div id="sales_search_div"></div>
		</div>
	
		
		<form id="salesSearchForm">
			<div class="sales_search" align="left">
				<table border="1" id="salesTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select id="searchKategorie">
								<option value="productName">상품명</option>
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
		
		<div id="salesSeach_list" style="margin-top: 50px;  margin-bottom: 100px;">
			<table id="sales_search_table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 165px;">주문번호<br>(상품코드)</th>
					<th style="width: 180px;">상품이미지</th>
					<th style="width: 400px;">상품명</th>
					<th style="width: 200px;">주문자</th>
					<th style="width: 200px;">주문일</th>
					<th style="width: 185px;">매출액</th>
				</tr>
			</table>
			<br>
			<div align="center" id="statisticsPagingDiv"></div>
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

/* 페이징 함수 */
function statisticsPaging(pg){
	location.href="/kokonutStationery/admin/salesSearchForm.do?pg="+pg;
}
function statisticsSearchPaging(pg){
	$('#pg').val(pg);
	$('#sales_searchBtn').trigger('click');
}

/* 초기화 버튼 클릭 시 */
 $('#sales_resetBtn').click(function(){
	 location.href="salesSearchForm.do";
 });

$(document).ready(function(){
	/* 페이지 로딩 시 전체 상품별 총 매출액 */
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/salesList.do',
		data : {'pg' : $('#pg').val()},
		dataType : 'json',
		success : function(data){
			$('#sales_search_table tr:not(:first)').empty();
			$.each(data.list, function(index,items){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.orderCode
				}).append($('<br/>')).append($('<span/>').text("("+items.productCode+")")
				)).append($('<td/>',{
					align : 'center'
				}).append($('<img/>',{
					src : '../image/thumb/'+ items.thumbImg
				}).css('width','65px').css('padding-top','5px')
				)).append($('<td/>',{
					align : 'center',
					text : items.productName
				})).append($('<td/>',{
					align : 'center',
					text : items.userName+"("+items.userId+")"
				})).append($('<td/>',{
					align : 'center',
					text : items.orderDate
				})).append($('<td/>',{
					align : 'center',
					text : items.discountPrice
				})).appendTo($('#sales_search_table'));
			});//each
			$('#statisticsPagingDiv').html(data.statisticsPaging.pagingHTML);
			$('#pg').val(1);
		}//success
	});//ajax
});

/* 검색 시 리스트 생성 */
$('#sales_searchBtn').click(function(){
	$('#sales_search_div').empty();
	
	if($('#searchText').val()=='' && $('#dateText1').val()=='' 
								  && $('#dateText2').val()==''){
		$('#sales_search_div').text('검색 항목을 입력해 주세요').css('color', 'red').css('font-weight', '10pt');		
		return;
	}
	if($('#dateText1').val()!=''||$('#dateText2').val()!=''){
		if($('#dateText1').val().length!=8 || $('#dateText2').val().length!=8){
			$('#sales_search_div').text('기간을 형식에 맞춰 입력해 주세요').css('color', 'red').css('font-weight', '10pt');		
			return;
		}
	}
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/salesSearchList.do',
		data : {'pg' : $('#pg').val(),
				'kategorie' : $('#searchKategorie').val(),
				'searchText' : $('#searchText').val(),
				'dateText1' : $('#dateText1').val(),
				'dateText2' : $('#dateText2').val()},
		dataType : 'json',
		success : function(data){
			if(data.list==null||data.list[0]==null){
				$('#sales_search_div').text('일치하는 항목이 없습니다').css('color', 'red').css('font-weight', '10pt');		
				return;
			}
			$('#sales_search_table tr:not(:first)').empty();
			$.each(data.list, function(index,items){
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.orderCode
				}).append($('<br/>')).append($('<span/>').text("("+items.productCode+")")
				)).append($('<td/>',{
					align : 'center'
				}).append($('<img/>',{
					src : '../image/thumb/'+ items.thumbImg
				}).css('width','65px').css('padding-top','5px')
				)).append($('<td/>',{
					align : 'center',
					text : items.productName
				})).append($('<td/>',{
					align : 'center',
					text : items.userName+"("+items.userId+")"
				})).append($('<td/>',{
					align : 'center',
					text : items.orderDate
				})).append($('<td/>',{
					align : 'center',
					text : items.discountPrice
				})).appendTo($('#sales_search_table'));
			});//each
			$('#statisticsPagingDiv').html(data.statisticsPaging.pagingHTML);
			$('#pg').val(1);
		}//success
	});//ajax
});

</script>

</html>