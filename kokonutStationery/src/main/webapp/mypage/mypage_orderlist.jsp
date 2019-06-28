<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
  <!-- mypage right contents -->
  <div class="content">
    <div class="content_title">
      주문내역 · 배송조회
    </div>
    <table class="mypage_table">
      <tr id="mypage_table_top">
        <th id="rownum">번호</th>
        <th id="gubun">구분</th>
        <th id="order_date">주문일시</th>
        <th id="order_code">주문번호</th>
        <th id="payment">결제방법</th>
        <th id="paytot">주문금액</th>
        <th id="cancel">취소금액</th>
        <th id="order_status">주문상태</th>
        <th id="delivery">수령확인</th>
        <th id="orderview"></th>
      </tr>
      <tr class="mypage_table_content orderlist_content">
        <td>2</td>
        <td>일반</td>
        <td>2019.06.23 16:03:38</td>
        <td>1561273407461</td>
        <td>신용카드</td>
        <td>16,500</td>
        <td>0</td>
        <td><span class="color_2ac1bc">결제시도</span></td>
        <td></td>
        <td>
          <li class="white_btn orderview_btn">보기</li>
        </td>
      </tr>
      <tr class="mypage_table_content orderlist_content">
        <td>1</td>
        <td>일반</td>
        <td>2019.06.23 15:55:49</td>
        <td>1561272814338</td>
        <td>신용카드</td>
        <td>16,500</td>
        <td>0</td>
        <td><span class="color_2ac1bc">결제시도</span></td>
        <td></td>
        <td>
          <li class="white_btn orderview_btn">보기</li>
        </td>
      </tr>
    </table>

    <div class="pageDiv">
      1
    </div>
  </div>
<!--</div>  -->
</body>
</html>
