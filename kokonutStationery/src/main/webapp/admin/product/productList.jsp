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

#searchBtn{
	
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

#productText{
	width: 300px;
}

#productSeach_list th{
	background-color: #f5f4f4;
	font-weight: 500;
	height: 53px;
}

#productRegistBtn:hover{
   background-color:#1b87d4;
   color:#ffffff;
}

.product_search select{
	height: 27px;
}
#productText{
	height: 23px;
	padding-left: 5px;
}
.priceText{
	width: 85px;
	height: 18px;
	text-align: right;
	padding-right: 5px;
}

</style>
</head>
<body>
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">
	<div id="product_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="product_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">상품관리</h1>
		</div>
		<div class="product_search" align="left">
			<table border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th>상 품 분 류</th>
					<td>
						<select>
							<option>-카테고리 선택-</option>
							<option value="#">문구</option>
							<option value="#">리빙</option>
							<option value="#">여행</option>
							<option value="#">콜라보레이션</option>
						</select>
					</td>
				</tr>

				<tr>
					<th>상 품 검 색</th>
					<td>
						<select>
							<option value="#">-상품명-</option>
							<option value="#">-상품코드-</option>
							<option value="#">-상품번호-</option>
						</select>
						<input type="text" id="productText">
					</td>
				</tr>
				
				<tr>
					<th>판 매 가</th>
					<td>
						<input type="text" class="priceText"> KRW ~ 
						<input type="text" class="priceText"> KRW
					</td>
				</tr>
			</table>
			<div style="margin-top: 15px" align="center">
				<input type="button" id="searchBtn" class="product_btn_group" value="검 색">
				<input type="reset" id="product_resetBtn" class="product_btn_group" value="초기화">
			</div>
			<div>
            	<input type="button" id="productRegistBtn" value="상 품 등 록">
         	</div>
		</div>
		
		
		<div id="productSeach_list" align="left" style="margin-top: 50px;">
			<table border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 200px;">상품코드</th>
					<th style="width: 336px;">상품명</th>
					<th style="width: 134px;">상품원가</th>
					<th style="width: 134px;">세일가격</th>
					<th style="width: 88px;">재 고</th>
					<th style="width: 100px;">등록일</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$('#productRegistBtn').click(function(){
   window.open('/kokonutStationery/admin/productRegistForm.do','','width=1100, height=750, left=200, resizable=no, toolbar=no','true');
});
</script>

</html>