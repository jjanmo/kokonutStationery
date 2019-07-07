<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.order_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.order_search td{
	width: 700px;
	padding-left: 10px;
}

#searchBtn{
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

#orderSeach_list th{
	height: 53px;
	font-weight: 500;
}

.order_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

#order_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#order_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#orderSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}
.oreder_search input{
	padding-left: 10px;
}
#orderTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#orderTable select{
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
	<div id="order_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">주문관리</h1>
		</div>
		
		<form id="orderSearchForm">
			<div class="order_search" align="left">
				<table border="1" id="orderTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select>
								<option value="#">주문번호</option>
								<option value="#">주문자명</option>
								<option value="#">주문자 ID</option>
								<option value="#">주문자 휴대전화</option>	
							</select>
							<input type="text" id="" class="inputText" style="width: 250px;">
						</td>
					</tr>
					
					<tr>
						<th>기  간</th>
						<td>
							<input type="text" class="inputText" style="width: 120px;"> ~
							<input type="text" class="inputText" style="width: 120px;">
						</td>
					</tr>
					
					<tr>
						<th>상  품</th>
						<td>
							<select>
								<option value="#">상품명</option>
								<option value="#">상품코드</option>
								<option value="#">제조사</option>
							</select>
							<input type="text" class="inputText" style="width: 300px;">
						</td>
					</tr>
				</table>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="order_searchBtn" class="order_btn_group" value="검 색">
					<input type="reset" id="order_resetBtn" class="order_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<table border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 200px;">주문일</th>
					<th style="width: 200px;">주문번호</th>
					<th style="width: 140px;">주문자</th>
					<th style="width: 360px;">상품명</th>
					<th style="width: 160px;">결제 금액</th>
					<th style="width: 160px;">결제상태</th>
					<th style="width: 160px;">배송상태</th>
					<th style="width: 140px;">취소</th>
					<th style="width: 140px;">교환</th>
					<th style="width: 140px;">반품</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
.order_search th{
	width: 154px;
	height: 35px;
	text-align: center;
	font-weight: 500;
	background-color: #f5f4f4;
	padding: 9px 9px 7px;
}

.order_search td{
	width: 700px;
	padding-left: 10px;
}

#searchBtn{
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

#orderSeach_list th{
	height: 53px;
	font-weight: 500;
}

.order_btn_group{
	min-width: 140px;
    padding: 0 30px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
    cursor: pointer;
}

#order_searchBtn{
    color: #fff;
    border: 1px solid transparent;
    background-color: #1b87d4;
}

#order_resetBtn{
    color: #1b87d4;
    border: 1px solid #1b87d4;
    background-color: #fff;
}

#orderSeach_list th{
	font-weight: 500;
    background-color: #f5f4f4;
}
.oreder_search input{
	padding-left: 10px;
}
#orderTable{
	 width:100%;
	 border: 1px solid #d9dadc; 
	 border-spacing: 0; 
	 line-height: 1.5;
}
#orderTable select{
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
	<div id="order_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">주문관리</h1>
		</div>
		
		<form id="orderSearchForm">
			<div class="order_search" align="left">
				<table border="1" id="orderTable">
					<tr>
						<th>검 색 어</th>
						<td>
							<select>
								<option value="#">주문번호</option>
								<option value="#">주문자명</option>
								<option value="#">주문자 ID</option>
								<option value="#">주문자 휴대전화</option>	
							</select>
							<input type="text" id="" class="inputText" style="width: 250px;">
						</td>
					</tr>
					
					<tr>
						<th>기  간</th>
						<td>
							<input type="text" class="inputText" style="width: 120px;"> ~
							<input type="text" class="inputText" style="width: 120px;">
						</td>
					</tr>
					
					<tr>
						<th>상  품</th>
						<td>
							<select>
								<option value="#">상품명</option>
								<option value="#">상품코드</option>
								<option value="#">제조사</option>
							</select>
							<input type="text" class="inputText" style="width: 300px;">
						</td>
					</tr>
				</table>
				<div style="margin-top: 15px" align="center">
					<input type="button" id="order_searchBtn" class="order_btn_group" value="검 색">
					<input type="reset" id="order_resetBtn" class="order_btn_group" value="초기화">
				</div>
			</div>
		</form>
		
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<table border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox">
					</th>
					<th style="width: 200px;">주문일</th>
					<th style="width: 200px;">주문번호</th>
					<th style="width: 140px;">주문자</th>
					<th style="width: 360px;">상품명</th>
					<th style="width: 160px;">결제 금액</th>
					<th style="width: 160px;">결제상태</th>
					<th style="width: 160px;">배송상태</th>
					<th style="width: 140px;">취소</th>
					<th style="width: 140px;">교환</th>
					<th style="width: 140px;">반품</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->

</body>
>>>>>>> refs/heads/jjanmo
</html>