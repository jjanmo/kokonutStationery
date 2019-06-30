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

#deliveryFee{
	width: 85px;
	height: 18px;
	text-align: right;
	padding-right: 5px;
}

</style>
</head>
<body>
<div id="main_wrap" align="left" style="width: 1000px; margin: 0 auto;">

	<div>
		<h1 style="font-weight:normal;">상품등록</h1>
	</div>
	<div id="product_info">
		<table border="1" style="width:100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5; margin-top: 50px;">
			<tr>
				<th>상 품 명</th>
				<td>
					<input type="text" id="productName" class="inputText">
				</td>
			</tr>
			<tr>
				<th>상 품 가 격</th>
				<td>
					<input type="text" id="originalPrice"> KRW
				</td>
			</tr>
			<tr>
				<th>원 산 지</th>
				<td>
					<input type="text" id="origin" class="inputText">
				</td>
			</tr>
			<tr>
				<th>제 조 사</th>
				<td>
					<input type="text" id="manufacturer" class="inputText">
				</td>
			</tr>
			<tr>
				<th>입 고 수 량</th>
				<td>
					<input type="text" id="totalQty" class="inputText"> 개
				</td>
			</tr>
			<tr>
				<th>카 테 고 리 선 택</th>
				<td>
					<select style="height: 22px;">
							<option>-카테고리 선택-</option>
							<option value="stationery">문구</option>
							<option value="living">리빙</option>
							<option value="travel">여행</option>
							<option value="collabo">콜라보레이션</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>썸 네 일  이 미 지</th>
				<td>
					<input type="file" id="thumbImg"> 
				</td>
			</tr>
			<tr>
				<th>상 품 상 세 설 명</th>
				<td>
					<input type="file" id="detailedImg"> 
				</td>
			</tr>
			
			<tr>
				<th>옵  션</th>
				<td>
					<input type="radio" name="option" value="1"> 있음
					<input type="radio" name="option" value="0" checked> 없음
				</td>
			</tr>		
			
			<tr>
				<th>배 송 료</th>
				<td>
					<input type="text" id="deliveryFee"> KRW
				</td>
			</tr>	
		</table>
		<div align="center" style="margin-top: 50px;">
			<input type="button" class="regist_reset" id="registBtn" value="상품 등록">
			<input type="button" class="regist_reset" id="registResetBtn" value="취소">
		</div>
	</div>
</div>
</body>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$('#registResetBtn').click(function(){
   window.close();
});
</script>

</html>