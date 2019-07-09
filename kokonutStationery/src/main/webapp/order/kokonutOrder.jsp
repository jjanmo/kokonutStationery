<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문조회</title>
<style type="text/css">
.content {
  width: 95%;
  height: 100%;
  float: right;
  margin: 0 20px 0 20px;
}
.content_title {
  font-size: 22px;
  font-weight: 700;
  text-align: left;
  color: #222;
}
#kokonutOrder_th{
    height: 50px;
    background-color: #f6f6f6;
}
.kokonutOrder_table {
  width: 100%;
  margin-top: 10px;
  font-size: 12px;
  color: #999;
  border-spacing: 0;
  border-collapse: collapse;
  border-top: 1px solid #999;
}
.kokonutOrder_content{
	border-bottom: 1px solid #ebebeb;
	text-align: center;
	font-size: 13px;
	color: #222;
	height: 90px;
}
</style>
</head>
<body>
 <div class="content">
    <div class="content_title">
      주문내역 · 배송조회
    </div>
    <table class="kokonutOrder_table">
      <tr id="kokonutOrder_th">
        <th id="order_date">주문일시</th>
        <th id="order_code">주문번호</th>
        <th id="payment">결제방법</th>
        <th id="paytot">주문금액</th>
        <th id="cancel">취소금액</th>
        <th id="order_status">주문상태</th>
        <th id="delivery">수령확인</th>
      </tr>
      <tr class="kokonutOrder_content">
        <td>2019.06.23 16:03:38</td>
        <td>1561273407461</td>
        <td>신용카드</td>
        <td>16,500</td>
        <td>0</td>
        <td><span class="color_2ac1bc">결제시도</span></td>
        <td></td>
      </tr>
    </table>
  </div>
</body>
</html>